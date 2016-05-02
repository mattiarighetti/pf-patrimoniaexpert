ad_page_contract {
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

ad_form -name vetrina \
    -html {class "modifica-vetrina-dettaglio-form"} \
    -form {
	{form-telefono:text,optional
	    {html {name "form-telefono" placeholder "Telefono..." class "form-telefono form-control"}}
	}
	{form-fax:text,optional
	    {html {name "form-fax" placeholder "Fax..." class "form-fax form-control"}}
	}
	{form-citta:integer(select),optional
	    {html {size 1}}
	    {options {[db_list_of_lists query "select denominazione, comune_id from comuni"]}}
	}
	{form-indirizzo:text,optional
	    {html {name "form-indirizzo" placeholder "Indirizzo..." class "form-indirizzo form-control"}}
	}
	{form-sito-web:text,optional
	    {html {name "form-sito-web" placeholder "Sito web..." class "form-sito-web form-control" id "form-sito-web"}}
	}
	{form-social-facebook:text,optional
	    {html {name "form-social-facebook" placeholder "Link Facebook..." class "form-social-facebook form-control"}}
	}
	{form-social-twitter:text,optional
	    {html {name "form-social-twitter" placeholder "Link Twitter..." class "form-social-twitter form-control"}}
	}
	{form-social-linkedin:text,optional
	    {html {name "form-social-linkedin" placeholder "Link Linkedin..." class "form-social-linkedin form-control"}}
	}
	{form-social-google:text,optional
	    {html {name "form-social-google" placeholder "Link Google+..." class "form-social-google form-control"}}
	}
	{form-competenze:integer(multiselect),multiple
	    {html {size 4}}
	    {options {[db_list_of_lists query "select denominazione, categoria_id from pe_categorie"]}}
	}
	{form-prov-att:integer(multiselect),multiple
	    {html {size 4}}
	    {options {[db_list_of_lists query "select denominazione, provincia_id from province"]}}
	}
	{form-citazione:text,optional
	    {html {name "form-citazione" placeholder "La citazione in cui mi ritrovo..." class "form-citazione form-control"}}
	}
	{form-esperienza:text,optional
	    {html {name "form-esperienza" placeholder "Anni di esperienza..." class "form-esperienza form-control"}}
	}
	{form-clienti:text,optional
	    {html {name "form-clienti" placeholder "Numero clienti..." class "form-clienti form-control"}}
	}
	{form-patrimonio-gestito:text,optional
	    {html {name "form-patrimonio-gestito" placeholder "Patrimonio in gestione..." class "form-patrimonio-gestito form-control"}}
	}
	{form-attivita:text,optional
	    {html {class "summernote"}}
	}
	{form-esperienze:text,optional
	    {html {class "summernote"}}
	}
	{form-formazione:text,optional
	    {html {class "summernote"}}
	}	
	{form-certificazioni:integer(multiselect),optional
	    {html {size 4}}
	    {options {[db_list_of_lists query "select denominazione, certificazione_id from pe_certificazioni"]}}
	}
    } -on_request {
	set professionista_id [db_string query "select professionista_id from pe_professionisti where user_id = [ad_conn user_id]"]
	db_1row query "select telefono as \"form-telefono\", cellulare as \"form-cellulare\", fax as \"form-fax\", sitoweb as \"form-sito-web\", facebook as \"form-social-facebook\", twitter as \"form-social-twitter\", linkedin as \"form-social-linkedin\", gplus as \"form-social-google\", indirizzo as \"form-indirizzo\", comune_id as \"form-citta\" from pe_professionisti where professionista_id = :professionista_id"
    }

ad_return_template
