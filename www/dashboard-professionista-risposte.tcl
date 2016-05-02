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
set user_portrait [db_string query "select '/images/professionisti_portraits/'||immagine from pe_professionisti where user_id = [ad_conn user_id] and immagine is not null" -default ""]
if {$user_portrait eq ""} {
    set user_portrait "/images/default/user.jpg"
}

#Estrazione ID
set professionista_id [db_string query "select professionista_id from pe_professionisti where user_id = [ad_conn user_id]"]

#Estrazione domande e risposte
set risposte_html ""
db_foreach query "select risposta_id, testo, domanda_id, to_char(timestamp, 'DD/MM/YYYY alle HH24:MI') as timestamp from pe_risposte where professionista_id = :professionista_id order by timestamp" {
    db_1row query "select d.testo as domanda, c.denominazione, u.username, substring(d.testo from 0 for 50)||'...' as snippet from pe_domande d, pe_investitori i, users u, pe_categorie c where u.user_id = i.user_id and i.investitore_id = d.investitore_id and c.categoria_id = d.categoria_id and d.domanda_id = :domanda_id"
    if {[db_0or1row query "select * from pe_risposte_erratacorrige where risposta_id = :risposta_id limit 1"]} {
	set erratacorrige [db_string query "select testo from pe_risposte_erratacorrige where risposta_id = :risposta_id"]
	append testo "<br><br><div class=\"well well-sm\"><h4>Rettifica alla risposta:</h4><br>$erratacorrige</div>"
    } else {
	append testo "<br><br><code>Vuoi apportare precisazioni alla tua risposta?</code><a class=\"btn pull-right\" href=\"dashboard-professionista-erratacorrige?risposta_id=$risposta_id\"><span class=\"glyphicon glyphicon-screenshot\"></span> Precisa</a><br><br>"
    }
    append risposte_html "<div class=\"panel-group\"><div class=\"panel panel-default\"><div class=\"panel-heading\"><h4 class=\"panel-title\"><a data-toggle=\"collapse\" href=\"#collapse$risposta_id\">$snippet <small> postata da <u>$username</u> nella categoria <b>$denominazione</b> a cui hai risposto il $timestamp</small></a></h4></div><div id=\"collapse$risposta_id\" class=\"panel-collapse collapse\"><div class=\"panel-body\"><strong>$domanda</strong></div><div class=\"panel-footer\">$testo</div></div></div></div>"
}
ad_return_template
