ad_page_contract {
    Programma per il cambio dello stato di una domanda.

    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Tuesday 3 May 2016
} {
    domanda_id:naturalnum
    stato_id:naturalnum,optional
    return_url:optional
}
if {![info exists stato_id]} {
    set stato_id 4
}
db_dml query "update pe_domande set stato_id = :stato_id where domanda_id = :domanda_id"
if {[info exists return_url]} {
    ad_returnredirect -allow_complete_url $return_url
} else {
    ad_returnredirect "dashboard-investitore-risposte?domanda_id=$domanda_id"
}
ad_script_abort
