ad_page_contract {
    Programma per il login multidominio.

    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Monday 9 May 2016
} {
    return_url:optional
}
set user_id [ad_conn user_id]
if {![info exists return_url]} {
    set return_url "http://www.patrimoniaexpert.it"
}
ad_returnredirect -allow_complete_url [export_vars -base "http://www.patrimoniameeting.it/login" {user_id return_url}]
ad_script_abort
