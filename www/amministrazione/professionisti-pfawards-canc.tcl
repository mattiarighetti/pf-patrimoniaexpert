ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Friday 12 June 2015
    @cvs-id processing-delete.tcl
} {
    professionista_id:naturalnum
    award_id:naturalnum
    categoria_id:naturalnum
}
with_catch errmsg {
    db_dml query "delete from pe_pfspecialist where professionista_id = :professionista_id and categoria_id = :categoria_id and award_id = :award_id"
} {
    ad_return_complaint 1 "<b>Attenzione: non è stato possibile cancellare l'Award. &Egrave; possibile che sia già referenziato da altri record.</br>In particolare, l'errore riportato dal database è il seguente.</br></br><code>$errmsg</code>"
}
ad_returnredirect [export_vars -base "professionisti-pfawards-list" {professionista_id}]
ad_script_abort
