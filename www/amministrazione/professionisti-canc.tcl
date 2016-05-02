ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Friday 12 June 2015
    @cvs-id processing-delete.tcl
} {
    professionista_id:naturalnum
}
with_catch errmsg {
    set user_id [db_string query "select user_id from pe_professionisti where professionista_id = :professionista_id"]
    db_dml query "delete from pe_professionisti_certificazioni where professionista_id = :professionista_id"
    db_dml query "delete from pe_pfspecialist where professionista_id = :professionista_id"
    db_dml query "delete from pe_professionisti_categorie where professionista_id = :professionista_id"
    db_dml query "delete from pe_professionisti_province where professionista_id = :professionista_id"
    db_dml query "delete from pe_professionisti where professionista_id = :professionista_id"
    acs_user::delete -user_id $user_id -permanent
} {
    ad_return_complaint 1 "<b>Attenzione: non è stato possibile cancellare il professionista. &Egrave; possibile che sia già referenziato da altri record.</br>In particolare, l'errore riportato dal database è il seguente.</br></br><code>$errmsg</code>"
}
ad_returnredirect "professionisti-list"
ad_script_abort
