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
set professionista_id [db_string query "select professionista_id from pe_professionisti where user_id = [ad_conn user_id]"]
ad_form -name modifica \
    -form {
	{nome:text
		{label "Nome"}
	}
	{cognome:text
		{label "Cognome"}
	}
	{nickname:text
		{label "Nickname"}
	}
	{email:text
		{label "Email"}
	}
	{password_old:text(password),optional
		{label "Password vecchia"}
	}
	{password_new:text(password),optional
		{label "Password nuova"}
	}
	{password_ripeti:text(password),optional
	    {label "Ripeti password nuova"}
	}
    } -on_request {
    	acs_user::get -user_id $user_id -array userinfo
	set nome $userinfo(first_names)
	set cognome $userinfo(last_name)
	set nickname $userinfo(username)
	set email $userinfo(email)
    } -validate {
	{password_old
	    {[ad_check_password $user_id $password_old] || $password_old eq ""}
	    "Password non corretta."
	}
	{password_new
	    {[string length $password_new] > 3 || $password_old eq ""}
	    "Password troppo corta."
	}
	{password_ripeti
	    {$password_new eq $password_ripeti || $password_old eq ""}
	    "Le password non coincidono."
	}
    } -on_submit {
	#Inserimento dati users
	acs_user::update -user_id $user_id -username $nickname
	person::update -person_id $user_id -first_names $nome -last_name $cognome
	party::update -party_id $user_id -email $email
	#se password
	if {$password_old ne ""} {
	    ad_change_password $user_id $password_new
	}
    }
