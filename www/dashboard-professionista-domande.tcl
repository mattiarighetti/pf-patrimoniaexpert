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
#Estrazione ID
set professionista_id [db_string query "select professionista_id from pe_professionisti where user_id = [ad_conn user_id]"]
#Estrazione domande per ogni categoria collegata al professionista
set table_html "<table class=\"table\">"
db_foreach query "select categoria_id from pe_professionisti_categorie where professionista_id = :professionista_id order by categoria_id" {
    set categoria [db_string query "select denominazione from pe_categorie where categoria_id = :categoria_id"]
    append table_html "<tr><td colspan=\"3\"><h3>$categoria</h3></td></td></tr><tr><th>Domanda</th><th>Investitore<br>(nickname)</th><th>Risposte</th><th></th></tr>"
    #Estrazione domande della categoria (se ci sono)
    if {[db_0or1row query "select * from pe_domande where categoria_id = :categoria_id and stato_id = 3"]} {
	db_foreach query "select d.domanda_id, substring(d.testo from 0 for 50)||'...' as testo, u.username, case when count(risposta_id) > 0 then count(risposta_id)::text else 'Ancora nessuna risposta.' end as risposte from pe_domande d left outer join pe_risposte r on r.domanda_id = d.domanda_id, users u, pe_investitori i where d.stato_id = 3 and categoria_id = :categoria_id and u.user_id = i.user_id and i.investitore_id = d.investitore_id group by d.domanda_id, d.testo, u.username order by d.timestamp desc, count(risposta_id)" {
	    if {![db_0or1row query "select * from pe_risposte where domanda_id = :domanda_id and professionista_id = :professionista_id"]} {
		append table_html "<tr><td>$testo</td><td>$username</td><td>$risposte</td><td><a class=\"btn\" href=\"dashboard-professionista-risposta?domanda_id=$domanda_id\"><span class=\"glyphicon glyphicon-pencil\"></span> Rispondi</a> <a class=\"btn\" href=\"dashboard-professionista-norisposta?domanda_id=$domanda_id&return_url=dashboard-professionista-domande\"><span class=\"glyphicon glyphicon-ban-circle\"></span> Non voglio rispondere</a></td></tr>"
	    }
	}
    } else {
	append table_html "<tr><td colspan=\"3\">Nessuna domanda aperta per questa categoria.</td></tr>"
    }
}
ad_return_template
