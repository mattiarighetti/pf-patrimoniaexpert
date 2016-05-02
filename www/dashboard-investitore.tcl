ad_page_contract {
    Programma per dashboard professionisti
} {
    upload_profilo:trim,optional
    upload_profilo.tmpfile:tmpfile,optional
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

set user_portrait [db_string query "select '/images/investitori_portraits/'||immagine from pe_investitori where user_id = [ad_conn user_id] and immagine is not null" -default "/images/default/user.jpg"]

set nome $user(first_names)
set form-cognome $user(last_name)
set form-nickname $user(username)
set form-e-mail $user(email)
set form-cellulare [db_string query "select telefono from pe_investitori where user_id = [ad_conn user_id]" -default ""]
set form-citta [db_string query "select provincia_id from pe_investitori where user_id = [ad_conn user_id]" -default ""]
set form-indirizzo [db_string query "select indirizzo from pe_investitori where user_id = [ad_conn user_id]" -default ""]

#Form per investitore
ad_form -name investitore \
    -has_edit 1 \
    -html {enctype "multipart/form-data"} \
    -form {
	{upload_profilo:text(file)
	    {html {name "pic" accept "image/jpeg"}}
	}
	{form-nome:text
	    {html {name "form-nome" placeholder "Nome*..." class "form-nome form-control"}}
	    {value $nome}
	}
	{form-cognome:text
	    {html {name "form-cognome" placeholder "Cognome*..." class "form-cognome form-control"}}
	}
	{form-nickname:text
	    {html {name "form-nickname" placeholder "Nickname*... nel caso volessi rispondere in modo anonimo alle domande..." class "form-nickname form-control"}}
	}
	{form-e-mail:text
	    {html {name "form-email" placeholder "Email*..." class "form-email form-control"}}
	}
	{form-cellulare:text
	    {html {name "form-cellulare" placeholder "Cellulare*..." class "form-cellulare form-control"}}
	}
	{form-provincia:integer(select)
	    {html {name "form-citta" placeholder "Città..." class "form-provincia form-control"}}
	    {options {"" [db_list_of_lists query "select denominazione, provincia_id from province order by denominazione"]}}
	}
	{form-indirizzo:text
	    {html {name "form-indirizzo" placeholder "Indirizzo..." class "form-indirizzo form-control"}}
	}
	{form-professione:text
		{html {name "form-professione" placeholder "Professione..." class "form-professione form-control"}}
	}
	{form-password-old:text(password),optional
	    {html {name "form-password-old" placeholder "Password Attuale..." class "form-password-old form-control" }}
	}
	{form-password-new-conferma:text(password),optional
	    {html {name "form-password-new-conferma" placeholder "Conferma Nuova Password..." class "form-password-new-conferma form-control"}}
	}
	{form-password-new:text(password),optional
	    {html {name "form-password-new" placeholder "Nuova Password..." class "form-password-new form-control"}}
	}
} -validate {
	{form-nome
	    {[string length ${form-nome}] < 2}
	    "Il campo <strong>nome</strong> è vuoto oppure contiene caratteri errati"
	}
	{form-cognome 
	    {[string length ${form-cognome}] < 2}
	    "Il campo <strong>cognome</strong> è vuoto oppure contiene caratteri errati"
	}
} -on_request {
	set form-nome $user(first_names)
    set form-cognome $user(last_name)
    set form-nickname $user(username)
    set form-e-mail $user(email)
    set form-cellulare [db_string query "select telefono from pe_investitori where user_id = [ad_conn user_id]" -default ""]
    set form-citta [db_string query "select provincia_id from pe_investitori where user_id = [ad_conn user_id]" -default ""]
    set form-indirizzo [db_string query "select indirizzo from pe_investitori where user_id = [ad_conn user_id]" -default ""]
} -on_submit {
	#Estrazione ID Utente
  	set user_id [ad_conn user_id]
  	set investitore_id [db_string query "select investitore_id from pe_investitori where user_id = :user_id"]
	#Aggiorna utente OpenACS
	person::update -person_id $user_id -first_names ${form-nome} -last_name ${form-cognome}
	party::update -party_id $user_id -email ${form-email}
	acs_user::update -user_id $user_id -username ${form-nickname}
	#Rigenerazione permalink
	set permalink [string tolower ${form-nome}]
	append permalink "-" [string tolower ${form-cognome}]
	#Controllo ed eventuale aggiornamento password
	if {${form-password-old} ne ""} {
	    if {${form-password-new} eq ${form-password-new-conferma}} {
		set password_change [auth::password::change -user_id $user_id -old_password ${form-password-old} -new_password ${form-password-new}]
		if {$password_change(password_status) ne "ok"} {
		    ad_return_complaint 1 "Passoword non cambiata"
		}
	    }
	}
	#Aggiornamento dati investitore
	db_dml query "update pe_investitori set telefono = '${form-cellulare}' where investitore_id = $investitore_id"
	

} -after_submit {
	ad_returnredirect "/dashboard-investitore"
        ad_script_abort
}