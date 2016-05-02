ad_page_contract {
    Il programma permette al professionista di consultare le risposte date alle domande, divise in accordion.
    
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Tuesday 19 April 2016
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
set user_portrait [db_string query "select '/images/investitori_portraits/'||immagine from pe_investitori where user_id = [ad_conn user_id] and immagine is not null" -default ""]
if {$user_portrait eq ""} {
    set user_portrait "/images/default/user.jpg"
}

#Estrazione ID
set investitore_id [db_string query "select investitore_id from pe_investitori where user_id = [ad_conn user_id]"]

#Estrazione domande e risposte
set domande_html "<table class=\"table\"><tr><th>Domanda</th><th>Risposte</th><th>Data</th><th></th></tr>"
db_foreach query "select d.domanda_id, d.testo, to_char(d.timestamp, 'DD/MM/YYYY alle HH24:MI') as timestamp, case when count(*) > 0 then count(*)::text else 'Ancora nessuna risposta.' end as risposte from pe_domande d, pe_risposte r where d.investitore_id = :investitore_id and r.domanda_id = d.domanda_id group by d.domanda_id, d.testo, d.timestamp order by timestamp" {
    append domande_html "<tr><td>$testo</td><td>$risposte</td><td>$timestamp</td><td><a class=\"btn\" href=\"[export_vars -base dashboard-investitore-risposte {domanda_id}]\"><span class=\"glyphicon glyphicon-paperclip\"></span> Vedi le risposte</a></td></tr>"
}
append domande_html "</table>"
ad_return_template
