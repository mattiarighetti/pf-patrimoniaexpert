ad_page_contract {
} {
    {domanda_id ""}
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
set investitore_id [db_string query "select investitore_id from pe_investitori where user_id = [ad_conn user_id]"]
if {$domanda_id eq ""} {
    set domanda_id [db_string query "select coalesce(max(domanda_id) + trunc(random()*99), trunc(random()*99)) from pe_domande"]
    db_dml query "insert into pe_domande (domanda_id, investitore_id) values (:domanda_id, :investitore_id)"
}
if {[db_string query "select investitore_id from pe_domande where domanda_id = :domanda_id"] != [db_string query "select investitore_id from pe_investitori where user_id = [ad_conn user_id]"]} {
    ad_return_complaint 1 "La domanda non l'hai fatta tu!"
}
ad_form -name "domanda-form" \
    -export {domanda_id} \
    -form {
	{selCompetenza-professionisti:integer(select),optional
	    {html {class "form-control"}}
	    {options {"" [db_list_of_lists query "select denominazione, categoria_id from pe_categorie order by categoria_id"]}}
	}
	{textarea-domanda:text(textarea)
	    {html {name "textarea-domanda" rows "12" placeholder "Scrivi qui le tua domanda..." class "textarea-domanda form-control"}}
	}
    } -validate {
	{selCompetenza-professionisti
	    {{$selCompetenza-professionisti} ne ""}
	    "Campo obbligatorio"
	}
	{textarea-domanda
	    {{$textarea-domanda} ne ""}
	    "La domanda è vuota"
	}
    } -on_request {
	db_1row query "select testo as \"textarea-domanda\" from pe_domande where domanda_id = :domanda_id"
    } -on_submit {
	set body "NOTIFICA AUTOMATICA DI INSERIMENTO NUOVA DOMANDA\n\n - ID: "
	append body $domanda_id "\n - Categoria: " [db_string query "select denominazione from pe_categorie where categoria_id = ${selCompetenza-professionisti}"] "\n - Testo: " ${textarea-domanda} "\n\nAccedi all'area amministrazione per gestire."
	acs_mail_lite::send -send_immediately -to_addr "info@professionefinanza.com" -from_addr "no-repy@patrimoniaexpert.it" -subject "Notifica amministrazione: nuova domanda" -body $body -mime_type "text/plain"
	acs_mail_lite::send -send_immediately -to_addr "jonathan.figoli@professionefinanza.com" -from_addr "no-repy@patrimoniaexpert.it" -subject "Notifica amministrazione: nuova domanda" -body $body -mime_type "text/plain"
	db_dml query "update pe_domande set testo = '${textarea-domanda}', categoria_id = '${selCompetenza-professionisti}', timestamp = current_timestamp, stato_id = 2 where domanda_id = :domanda_id"
    } -after_submit {
	ad_returnredirect "dashboard-investitore"
	ad_script_abort
    }
