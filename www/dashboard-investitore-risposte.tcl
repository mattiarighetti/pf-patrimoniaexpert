ad_page_contract {
    Programma per l'estrazione delle risposte per la domanda dell'ID passato.

    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Thursday 21 April 2016
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

set user_portrait [db_string query "select '/images/investitori_portraits/'||immagine from pe_investitori where user_id = [ad_conn user_id] and immagine is not null" -default ""]
if {$user_portrait eq ""} {
    set user_portrait "/images/default/user.jpg"
}
#Estrazione ID
set investitore_id [db_string query "select investitore_id from pe_investitori where user_id = [ad_conn user_id]"]
#Estrazione generalità della domanda
db_1row query "select d.testo as domanda, c.denominazione as categoria, d.timestamp as domanda_tempo from pe_domande d, pe_categorie c where c.categoria_id = d.categoria_id and d.domanda_id = :domanda_id"
#Estrazione risposte
set risposte_html ""
db_foreach query "select risposta_id, substring(testo from 0 for 50)||'...' as snippet, testo, domanda_id, to_char(timestamp, 'DD/MM/YYYY alle HH24:MI') as timestamp, professionista_id from pe_risposte where domanda_id = :domanda_id order by timestamp" {
    #Estrrazione username professionista
    db_1row query "select u.username from users u, pe_professionisti p where p.user_id = u.user_id and p.professionista_id = :professionista_id"
    append risposte_html "<div class=\"panel-group\"><div class=\"panel panel-default\"><div class=\"panel-heading\"><h4 class=\"panel-title\"><a data-toggle=\"collapse\" href=\"#collapse$risposta_id\">$snippet <small> risposta data da <u>$username</u> il $timestamp</small></a></h4></div><div id=\"collapse$risposta_id\" class=\"panel-collapse collapse\"><div class=\"panel-body\">$testo</div>"
    if {[db_0or1row query "select * from pe_risposte_erratacorrige where risposta_id = :risposta_id limit 1"]} {
	set erratacorrige [db_string query "select testo from pe_risposte_erratacorrige where risposta_id = :risposta_id"]
	append risposte_html "<div class=\"panel-footer\"><h4>Rettifica alla risposta:</h4><br>$erratacorrige</div>"
    }
append risposte_html "</div></div></div>"
}
ad_return_template
