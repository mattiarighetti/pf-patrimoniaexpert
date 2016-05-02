ad_page_contract {
} {
    upload_profilo:trim,optional
    upload_profilo.tmpfile:tmpfile,optional
    upload_sfondo:trim,optional
    upload_sfondo.tmpfile:tmpfile,optional
}
#Controllo utenza
if {[ad_conn user_id]} {
    set user_loggedin 1
    set user_portrait "/images/default/user.jpg"
    set user_id [ad_conn user_id]
    set user_dashlink [pe_user_dashboard [pe_user_profoinv $user_id]]
} else {
    ad_returnredirect "/"
    ad_script_abort
}

#Estrazione generalita utente
acs_user::get -user_id [ad_conn user_id] -array user
set nominativo $user(first_names)
append nominativo " " $user(last_name)

set user_portrait [db_string query "select '/images/professionisti_portraits/'||immagine from pe_professionisti where user_id = [ad_conn user_id] and immagine is not null" -default ""]
if {$user_portrait eq ""} {
    set user_portrait "/images/default/user.jpg"
}
set professionista_id [db_string query "select professionista_id from pe_professionisti where user_id = [ad_conn user_id]"]
set permalink [db_string query "select permalink from pe_professionisti where user_id = [ad_conn user_id]"]

ad_form -name vetrina_form \
    -html {enctype "multipart/form-data"} \
    -form {
	{upload_profilo:text(file),optional
	    {label "Foto profilo"}
	    {html {name "pic" accept "image/jpeg"}}
	}
	{upload_sfondo:text(file),optional
	    {label "Foto sfondo"}
	    {html {name "pic" accept "image/jpeg"}}
	}
	{telefono:text,optional
	    {label "Telefono"}
	}
	{cellulare:text,optional
	    {label "Cellulare"}
	}
	{fax:text,optional
	    {label "Fax"}
	}
	{indirizzo:text,optional
	    {label "Indirizzo"}
	}
	{citta:integer(select),optional
	    {label "Comune"}
	    {options {[db_list_of_lists query "select denominazione, comune_id from comuni order by denominazione"]}}
	}
	{societa_id:integer(select),optional
	    {label "Societa"}
	    {options {"" [db_list_of_lists query "select denominazione, societa_id from pe_societa order by denominazione"]}}
	}
	{sitoweb:text,optional
	    {label "Sito web"}
	}
	{facebook:text,optional
	    {label "Facebook"}
	}
	{twitter:text,optional
	    {label "Twitter"}
	}
	{linkedin:text,optional
	    {label "Linkedin"}
	}
	{google:text,optional
	    {label "Google Plus"}
	}
	{aree_competenza:integer(checkbox),multiple
	    {label "Aree di competenza"}
	    {options {[db_list_of_lists query "select denominazione, categoria_id from pe_categorie"]}}
	}
	{certificazioni:integer(checkbox),multiple,optional
	    {label "Certificazioni"}
	    {options {[db_list_of_lists query "select denominazione, certificazione_id from pe_certificazioni"]}}
	}
	{province_att:integer(multiselect),multiple
	    {label "Province di attività"}
	    {options {[db_list_of_lists query "select denominazione, provincia_id from province order by denominazione"]}}
	    {html {size 4}}
	}
	{citazione:text(textarea),optional
	    {label "La citazione in cui mi ritrovo"}
	    {html {rows 2 cols 70}}
	}
	{esperienza:text(textarea),optional
	    {label "Anni di esperienza"}
	    {html {rows 5 cols 70}}
	}
	{clienti:text,optional
	    {label "Numero clienti"}
	}
	{patrimonio_gestito:text,optional
	    {label "Patrimonio in gestione"}
	}
	{attivita:text(textarea),optional
	    {label "La mia attività"}
	    {html {rows 5 cols 70}}
	}
	{esperienze:text(textarea),optional
	    {label "Esperienze professionali"}
	    {html {rows 5 cols 70}}
	}
	{formazione:text(textarea),optional
	    {label "Ultimi corsi di formazione frequentati"}
	    {html {rows 5 cols 70}}
	}
    } -on_request {
	db_1row query "select telefono, cellulare, fax, indirizzo, comune_id as citta, sitoweb, cellulare, facebook, twitter, linkedin, gplus, societa_id, citazione, esperienza, clienti, patrimonio, attivita, esperienze, formazione from pe_professionisti where professionista_id = :professionista_id"
	set aree_competenza [db_list query "select categoria_id from pe_professionisti_categorie where professionista_id = :professionista_id"]
	set province_att [db_list query "select provincia_id from pe_professionisti_province where professionista_id = :professionista_id"]
	set certificazioni [db_list query "select certificazione_id from pe_professionisti_certificazioni where professionista_id = :professionista_id"]
    } -on_submit {
	#Inserimento dati in pe.professionisti
	db_dml query "update pe_professionisti set telefono = :telefono, cellulare = :cellulare, fax = :fax, indirizzo = :indirizzo, comune_id = :citta, sitoweb = :sitoweb, facebook = :facebook, twitter = :twitter, linkedin = :linkedin, gplus = :google, citazione = :citazione, esperienza = :esperienza, clienti = :clienti, patrimonio = :patrimonio_gestito, attivita = :attivita, esperienze = :esperienze, formazione = :formazione where professionista_id = :professionista_id"
	#Inserimento multirow
	db_dml query "delete from pe_professionisti_categorie where professionista_id = :professionista_id"
	foreach categoria_id $aree_competenza {
	    db_dml query "insert into pe_professionisti_categorie (professionista_id, categoria_id) values (:professionista_id, :categoria_id)"
	}
	db_dml query "delete from pe_professionisti_province where professionista_id = :professionista_id"
	foreach provincia_id $province_att {
	    db_dml query "insert into pe_professionisti_province (professionista_id, provincia_id) values (:professionista_id, :provincia_id)"
	}
	db_dml query "delete from pe_professionisti_certificazioni where professionista_id = :professionista_id"
	foreach certificazione_id $certificazioni {
	    db_dml query "insert into pe_professionisti_certificazioni (professionista_id, certificazione_id) values (:professionista_id, :certificazione_id)"
	}

	
	#Controllo permalink
	if {![db_0or1row query "select * from pe_professionisti where permalink is not null and professionista_id = :professionista_id"]} {
	    set permalink [db_string query "select p.last_name from persons p, pe_professionisti pe where pe.professionista_id = :professionista_id and p.person_id = pe.user_id"]
	    append permalink "-" [db_string query "select p.last_name from persons p, pe_professionisti pe where pe.professionista_id = :professionista_id and p.person_id = pe.user_id"]
	    while {[db_0or1row query "select * from pe_professionisti where permalink ilike :permalink limit 1"]} {
		append permalink "-" [db_string query "select trunc(random()*9)"]
	    }
	    db_dml query "update pe_professionisti set permalink = :permalink where professionista_id = :professionista_id"
	} else {
	    set permalink [db_string query "select permalink from pe_professionisti where professionista_id = :professionista_id"]
	}
	
	#Immagine profilo
    	if {[string match *.jpg [string tolower $upload_profilo]] || [string match *png* [string tolower $upload_profilo]] || [string match *.jpeg [string tolower $upload_profilo]]} {
	    set filepath [ns_queryget upload_profilo.tmpfile]
	    #Existing file for upload
	    db_transaction {
		regsub -all {\\} $upload_profilo "<" upload_profilo
		set filename $permalink
		if {[string match *.jpg $upload_profilo] || [string match *.JPG $upload_profilo] || [string match *.jpeg $upload_profilo] || [string match *.JPEG $upload_profilo]} {
		    append filename ".jpg"
		}
		if {[string match *.png $upload_profilo] || [string match *.PNG $upload_profilo]} {
		    append filename ".png"
		}
		ns_rename $filepath /usr/share/openacs/packages/patrimoniaexpert/www/images/professionisti_portraits/$filename
		#Inserimento professionista con foto
		db_dml query "UPDATE pe_professionisti set immagine = :filename where professionista_id = :professionista_id"
	    }
	}
    }
