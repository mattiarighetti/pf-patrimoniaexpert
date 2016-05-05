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
set domande_html "<table class=\"table\"><tr><th>Domanda</th><th>Categoria</th><th>Risposte</th><th>Data</th><th>Stato</th><th></th></tr>"
db_foreach query "select d.domanda_id, 
    d.testo,
    count(risposta_id) as risposte_count,
    case when d.categoria_id is not null then c.denominazione else 'Nessuna categoria assegnata.' end as categoria,
    case when count(risposta_id) > 0 then count(risposta_id)::text else 'Ancora nessuna risposta.' end as risposte, to_char(d.timestamp, 'DD/MM/YYYY alle HH24:MI') as timestamp, 
    case when d.stato_id = 1 then '<span class=\"label label-default\">Bozza</span>' when d.stato_id = 2 then '<span class=\"label label-warning\">In attesa di approvazione</span>' when d.stato_id = 3 then '<span class=\"label label-success\">Aperta</span>' when d.stato_id = 4 then '<span class=\"label label-primary\">Chiusa</span>' when d.stato_id = 5 then '<span class=\"label label-danger\">Non approvata</span>' end as stato 
  from pe_domande d 
    left outer join pe_risposte r on d.domanda_id = r.domanda_id 
    left outer join pe_categorie c on d.categoria_id = c.categoria_id 
where d.investitore_id = :investitore_id 
group by d.domanda_id, c.categoria_id, c.denominazione, r.risposta_id, d.testo, d.timestamp, d.stato_id 
order by d.timestamp desc" {
    # Estraggo conteggio risposte
    append domande_html "<tr><td>$testo <small>(ID: $domanda_id)</small></td><td>$categoria</td><td>$risposte</td><td>$timestamp</td><td>$stato</td><td>"
    if {$risposte_count > 0} {
	append domande_html "<a class=\"btn\" href=\"[export_vars -base dashboard-investitore-risposte {domanda_id}]\"><span class=\"glyphicon glyphicon-paperclip\"></span> Vedi le risposte</a>"
    }
    append domande_html "</td></tr>"
}
append domande_html "</table>"
ad_return_template
