ad_page_contract {
    Il programma prevede l'estrazione delle generalità della domanda e della risposta e lascia al professionista di inserire un Errata Corrige riguardo alla sua risposta, una precisazione.
    
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Friday 22 April 2016
    @param risposta_id
} {
    risposta_id:naturalnum
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

#Estrazione generalità domanda e risposta
db_1row query "select testo as risposta, domanda_id from pe_risposte where risposta_id = :risposta_id"
db_1row query "select d.testo as domanda, d.categoria_id, u.username from pe_domande d, pe_investitori i, users u where u.user_id = i.user_id and i.investitore_id = d.investitore_id and d.domanda_id = :domanda_id"

#Prepara form per risposta
ad_form -name "risposta" \
    -mode edit \
    -export {risposta_id} \
    -edit_buttons [list [list "Conferma ed invia la precisazione" new]] \
    -cancel_url "dashboard-professionista-risposte" \
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
	{risposta:text(textarea),optional
	    {label "La tua risposta"}
	    {value $risposta}
	    {html {cols 70 rows 15 wrap soft style "resize:both;"}}
	    {mode display}
	}
	{testo:text(textarea)
	    {label "Precisazione"}
	    {html {cols 70 rows 4 wrap soft style "resize:both;" maxlength 200}}
	    {help_text "Hai al massimo 200 caratteri."}
	}
    } -on_submit {
	#ID ErrataCorrige next val
	set corrige_id [db_string query "select coalesce (max(corrige_id) + trunc(random()*99), trunc(random()*99)) from pe_risposte_erratacorrige"]
	#Inserimento errata corrige
	db_dml query "insert into pe_risposte_erratacorrige (corrige_id, risposta_id, testo, timestamp) values (:corrige_id, :risposta_id, :testo, current_timestamp)"
    } -after_submit {
	ad_returnredirect dashboard-professionista-risposte
	ad_script_abort
    }
