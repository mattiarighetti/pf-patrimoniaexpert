ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Thursday 19 February 2015
} {
    news_id:integer,optional
    upload_file:trim,optional
    upload_file.tmpfile:tmpfile,optional
}
if {[ad_form_new_p -key news_id]} {
    set page_title "Nuovo articolo"
    set buttons [list [list "Aggiungi" new]]
    set portrait_html ""
} else {
    set page_title "Modifica articolo"
    set buttons [list [list "Modifica" edit]]
    set portrait_html [db_string query "select immagine from pe_newsfeed where news_id = :news_id"]
}
set context [list [list index "Amministrazione"] [list newsfeed-list "Articoli"] $page_title]
ad_form -name articolo \
    -edit_buttons $buttons \
    -has_edit 1 \
    -html {enctype "multipart/form-data"} \
    -form {
	news_id:key
	{titolo:text
	    {label "Titolo"}
	    {html {size 70}}
	}
	{sottotitolo:text
	    {label "Sottotitolo"}
	    {html {size 70}}
	}
	{testo:text(textarea),optional
	    {html {cols 70 rows 10 wrap soft}}
	    {label "Testo"}
	}
	{link:text
	    {label "Link"}
	}
	{upload_file:text(file),optional
	    {help_text "Dev'essere quadrata, minimo 700x300 px, se no si vedrà male, e tu NON vuoi che si veda male vero? Se lasci vuoto apparirà la sagoma."}
	    {label "Foto profilo"}
	}
    } -select_query {
	"SELECT titolo, sottotitolo, link, testo, immagine AS upload_file FROM pe_newsfeed WHERE news_id = :news_id"
    } -validate {
    } -new_data {
	#Genera nuovo ID
	set news_id [db_string query "SELECT COALESCE(MAX(news_id)+ trunc(random()*99+1),1) FROM pe_newsfeed"]
	#Controllo su immagine profilo e inserimento utente OpenACS in professionisti
	if {[string match *.jpg [string tolower $upload_file]] || [string match *png* [string tolower $upload_file]] || [string match *.jpeg [string tolower $upload_file]]} {
	    #Existing file for upload
	    db_transaction {
		regsub -all {\\} $upload_file "<" upload_file
		set filename [string tolower [string map {" " ""} $titolo]]
		set filename [string tolower [string map {" " ""} $filename]]
		if {[string match *.jpg $upload_file] || [string match *.JPG $upload_file] || [string match *.jpeg $upload_file] || [string match *.JPEG $upload_file]} {
		    append filename ".jpg"
		}
		if {[string match *.png $upload_file] || [string match *.PNG $upload_file]} {
		    append filename ".png"
		}
		ns_rename $filepath /usr/share/openacs/packages/patrimoniaexpert/www/images/newsfeed_files/$filename
		#Inserimento professionista con foto
	    }
	} else {
	    set filename ""
	}
	db_dml query "INSERT INTO pe_newsfeed (news_id, titolo, sottotitolo, testo, immagine,link) VALUES (:news_id, :titolo, :sottotitolo, :testo, :filename, :link)"
    } -edit_data {
	#Controllo su immagine profilo e inserimento utente OpenACS in professionisti
	if {[string match *.jpg [string tolower $upload_file]] || [string match *png* [string tolower $upload_file]] || [string match *.jpeg [string tolower $upload_file]]} {
	    #Existing file for upload
	    db_transaction {
		regsub -all {\\} $upload_file "<" upload_file
		set filename [string tolower [string map {" " ""} $titolo]]
		set filename [string tolower [string map {" " ""} $filename]]
		if {[string match *.jpg $upload_file] || [string match *.JPG $upload_file] || [string match *.jpeg $upload_file] || [string match *.JPEG $upload_file]} {
		    append filename ".jpg"
		}
		if {[string match *.png $upload_file] || [string match *.PNG $upload_file]} {
		    append filename ".png"
		}
		ns_rename $filepath /usr/share/openacs/packages/patrimoniaexpert/www/images/newsfeed_files/$filename
		#Inserimento professionista con foto
	    }
	} else {
	    set filename ""
	}
	db_dml query "update pe_newsfeed set titolo = :titolo, sottotitolo = :sottotitolo, testo = :testo, immagine = :filename, link = :link where news_id = :news_id"
    } -on_submit {
	set filepath [ns_queryget upload_file.tmpfile]
    } -after_submit {
	ad_returnredirect "newsfeed-list"
	ad_script_abort
    }
