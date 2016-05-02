ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Thursday 19 February 2015
} {
    professionista_id:integer,optional
    upload_file:trim,optional
    upload_file.tmpfile:tmpfile,optional
}
if {[ad_form_new_p -key professionista_id]} {
    set page_title "Nuovo professionista"
    set buttons [list [list "Aggiungi" new]]
    set portrait_html ""
} else {
    set page_title "Modifica professionista"
    set buttons [list [list "Modifica" edit]]
    set portrait_html [db_string query "select immagine from pe_professionisti where professionista_id = :professionista_id"]
}
set context [list [list index "Amministrazione"] [list professionisti-list "Professionisti"] $page_title]
ad_form -name professionista \
    -edit_buttons $buttons \
    -has_edit 1 \
    -html {enctype "multipart/form-data"} \
    -form {
	professionista_id:key
	{first_names:text
	    {label "Nome"}
	    {html {size 70 maxlength 100}}
	}
	{last_name:text
	    {label "Cognome"}
	    {html {size 70 maxlength 100}}
	}
	{bio:text(textarea),optional
	    {html {cols 70 rows 10 wrap soft}}
	    {label "Short CV"}
	    
	}
    }
if {[ad_form_new_p -key professionista_id]} {
    ad_form -extend -name professionista -form {
	{provincia_id:integer(select)
	    {label "Provincia"}
	    {options {[db_list_of_lists query "select denominazione, provincia_id from province order by denominazione"]}}
	    {help_text "Se sono più di una, potrai aggiungerle nel pannello Province nella vista elenco."}
	}
	{categoria_id:integer(select)
	    {label "Competenza"}
	    {options {[db_list_of_lists query "select denominazione, categoria_id from pe_categorie"]}}
	    {help_text "Se sono più di una, potrai aggiungerle nel pannello Competenze nella vista elenco."}
	    {after_html "<small><a href=\"competenze-list\" target=\"_blank\">Gestione competenze</a></small>"}
	}
	{certificazione_id:integer(select),optional
	    {label "Certificazione"}
	    {options {"" [db_list_of_lists query "select denominazione, certificazione_id from pe_certificazioni order by denominazione"]}}
	    {help_text "Se sono più di una, potrai aggiungerle nel pannello Certificazioni nella vista elenco."}
	    {after_html "<small><a href=\"certificazioni-list\" target=\"_blank\">Gestione certificazioni</a></small>"}
	}
	{award_id:integer(select),optional
	    {label "PFAwards"}
	    {options {"" [db_list_of_lists query "select anno, award_id from pe_pfawards order by anno desc"]}}
	}
	{aw_cat_id:integer(select),optional
	    {label "Categoria PFAwards"}
	    {options {"" [db_list_of_lists query "select denominazione, categoria_id from pe_categorie order by categoria_id"]}}
	}
	{medaglia_id:integer(select),optional
	    {label "Medaglia PFAwards"}
	    {options {"" [db_list_of_lists query "select descrizione, medaglia_id from pe_pfawards_medaglie order by medaglia_id"]}}
	}
    }
}
ad_form -extend \
    -name professionista \
    -form {
	{email:text
	    {label "Email"}
	}
	{username:text,optional
	    {label "Username"}
	    {help_text "Se lasciato vuoto, verrà autogenerato (es. <code>nome.cognome.5</code>)."}
	}
	{user_id:text,optional
	    {label "ID Utente"}
	    {html {disabled ""}}
	}
	{upload_file:text(file),optional
	    {help_text "Dev'essere quadrata, minimo 650x650 px, se no si vedrà male, e tu NON vuoi che si veda male vero? Se lasci vuoto apparirà la sagoma."}
	    {label "Foto profilo"}
	}
    } -select_query {
	"SELECT pe.professionista_id, u.username, pa.email, p.first_names, p.last_name, p.bio, immagine AS upload_file FROM pe_professionisti pe, persons p, users u, parties pa WHERE pe.user_id = p.person_id and pe.user_id = pa.party_id and pe.user_id = u.user_id and pe.professionista_id = :professionista_id"
    } -validate {
    } -new_data {
	#Creating OpenACS user account
	set user_id [db_nextval acs_object_id_seq]
	if { ([info exists rel_group_id] && $rel_group_id ne "") } {
	    ad_form -extend -name register -form {
		{rel_group_id:integer(hidden),optional}
	    }
	    if { [permission::permission_p -object_id $rel_group_id -privilege "admin"] } {
		ad_form -extend -name register -form {
		    {rel_type:text(select)
			{label "Role"}
			{options {[group::get_rel_types_options -group_id $rel_group_id]}}
		    }
		}
	    } else {
		ad_form -extend -name register -form {
		    {rel_type:text(hidden)
			{value "membership_rel"}
		    }
		}
	    }
	}
	if {$username eq ""} {
	    set username [string tolower $first_names]
	    append username "." [string tolower $last_name] "." [db_string query "select trunc(random()*9)"]
	    set username [string map {" " ""} $username]
	} else {
	    set username [string map {" " ""} [string tolower $username]]
	}
	set password [string tolower $last_name]
	append password [db_string query "select trunc(random()*9999)+1"]
	set password [string map {" " ""} $password]
	array set creation_info [auth::create_user \
				     -user_id $user_id \
				     -username $username \
				     -email $email \
				     -first_names $first_names \
				     -last_name $last_name \
				     -password $password]
	if {$creation_info(creation_status) ne "ok"} {
	    ad_return_complaint 1 "Error: [parray $creation_info]"
	}
	if { $creation_info(creation_status) eq "ok" && ([info exists rel_group_id] && $rel_group_id ne "") } {
	    group::add_member \
		-group_id $rel_group_id \
		-user_id $user_id \
		-rel_type $rel_type
	} 
	#Genera nuovo ID Professionista
	set professionista_id [db_string query "SELECT COALESCE(MAX(professionista_id)+ trunc(random()*99+1),1) FROM pe_professionisti"]
	#Controllo su immagine profilo e inserimento utente OpenACS in professionisti
	if {[string match *.jpg [string tolower $upload_file]] || [string match *png* [string tolower $upload_file]] || [string match *.jpeg [string tolower $upload_file]]} {
	    #Existing file for upload
	    db_transaction {
		regsub -all {\\} $upload_file "<" upload_file
		set filename [string tolower [string map {" " ""} $last_name]]
		append filename "_" [string tolower [string map {" " ""} $first_names]]
		if {[string match *.jpg $upload_file] || [string match *.JPG $upload_file] || [string match *.jpeg $upload_file] || [string match *.JPEG $upload_file]} {
		    append filename ".jpg"
		}
		if {[string match *.png $upload_file] || [string match *.PNG $upload_file]} {
		    append filename ".png"
		}
		ns_rename $filepath /usr/share/openacs/packages/patrimoniaexpert/www/images/professionisti_portraits/$filename
		#Inserimento professionista con foto
		db_dml query "INSERT INTO pe_professionisti (professionista_id, immagine, user_id) VALUES (:professionista_id, :filename, :user_id)"
	    }
	} else {
	    db_dml query "INSERT INTO pe_professionisti (professionista_id, user_id) VALUES (:professionista_id, :user_id)"
	}
	#Inserimento tabella temporanea
	db_dml query "insert into pe_tmp (professionista_id, user_id, first_names, last_name, email, password, username) values (:professionista_id, :user_id, :first_names, :last_name, :email, :password, :username)"
	#Inserisce competenze, certificazioni e province
	if {$certificazione_id ne ""} {
	    db_dml query "insert into pe_professionisti_certificazioni (professionista_id, certificazione_id) values (:professionista_id, :certificazione_id)"
	}
	if {$categoria_id ne ""} {
	    db_dml query "insert into pe_professionisti_categorie (professionista_id, categoria_id) values (:professionista_id, :categoria_id)"
	}
	if {$provincia_id ne ""} {
	    db_dml query "insert into pe_professionisti_province (professionista_id, provincia_id) values (:professionista_id, :provincia_id)"
	}
	#Inserisce PFSpecialist - PFAwards
	if {$award_id ne "" && $aw_cat_id ne ""} {
	    db_dml query "insert into pe_pfspecialist (award_id, professionista_id, categoria_id) values (:award_id, :professionista_id, :aw_cat_id)"
	}
    } -edit_data {
	#Controllo immagine
	if {[string match *.jpg [string tolower $upload_file]] || [string match *png* [string tolower $upload_file]] || [string match *.jpeg [string tolower $upload_file]]} {
	    regsub -all {\\} $upload_file "<" upload_file
	    set filename [string tolower [string map {" " ""} $last_name]]
	    append filename "_" [string tolower [string map {" " ""} $first_names]]
	    if {[string match *.jpg $upload_file] || [string match *.JPG $upload_file] || [string match *.jpeg $upload_file] || [string match *.JPEG $upload_file]} {
		append filename ".jpg"
	    }
	    if {[string match *.png $upload_file] || [string match *.PNG $upload_file]} {
		append filename ".png"
	    }
	    ns_rename $filepath /usr/share/openacs/packages/patrimoniaexpert/www/images/professionisti_portraits/$filename
	    #Update tabella pe_professionisti
	    db_dml query "update pe_professionisti set immagine = :filename where professionista_id = :professionista_id"
	}
	#Esegue update su tabelle di sistema
	acs_user::update -user_id $user_id -username $username
	party::update -party_id $user_id -email $email
	person::update -person_id $user_id -first_names $first_names -last_name $last_name
    } -on_submit {
	set filepath [ns_queryget upload_file.tmpfile]
    } -after_submit {
	ad_returnredirect "professionisti-list?q=$last_name"
	ad_script_abort
    }
