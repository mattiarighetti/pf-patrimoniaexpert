ad_page_contract {
    Il programma prevede l'estrazioone della domanda dell'investitore, precedentemente selezionata, e la possibilità di risposta da parte del professionista.
    
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Tuesday 19 April 2016
} {
    domanda_id:naturalnum
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

#Estrazione ID
set professionista_id [db_string query "select professionista_id from pe_professionisti where user_id = [ad_conn user_id]"]

#Estrazione generalità domanda
db_1row query "select d.testo as domanda, d.categoria_id, u.username from pe_domande d, pe_investitori i, users u where u.user_id = i.user_id and i.investitore_id = d.investitore_id and d.domanda_id = :domanda_id"

#Prepara form per risposta
ad_form -name "risposta" \
    -mode edit \
    -export {domanda_id} \
    -edit_buttons [list [list "Conferma ed invia la risposta" new]] \
    -cancel_url "dashboard-professionista-domande" \
    -cancel_label "Chiudi senza salvare" \
    -form {
	{categoria_id:integer(select),optional
	    {label "Categoria"}
	    {value $categoria_id}
	    {mode display}
	    {options {[db_list_of_lists query "select denominazione, categoria_id from pe_categorie order by categoria_id"]}}
	}
	{username:text,optional
	    {label "Username"}
	    {value $username}
	    {mode display}
	}
	{domanda:text(textarea),optional
	    {label "Domanda"}
	    {value $domanda}
	    {html {cols 70 rows 15 wrap soft style "resize:both;"}}
	    {mode display}
	}
	{testo:text(textarea)
	    {label "Risposta"}
	    {html {cols 70 rows 15 wrap soft style "resize:both;"}}
	}
    } -on_submit {
	#ID Risposta next val
	set risposta_id [db_string query "select coalesce (max(risposta_id) + trunc(random()*99), trunc(random()*99)) from pe_risposte"]
	#Inserimento risposta
	db_dml query "insert into pe_risposte (risposta_id, testo, domanda_id, professionista_id, timestamp) values (:risposta_id, :testo, :domanda_id, :professionista_id, current_timestamp)"
    } -after_submit {
	ad_returnredirect dashboard-professionista-domande
	ad_script_abort
    }
