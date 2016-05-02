ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Friday 12 June 2015
    @cvs-id processing-delete.tcl
} {
    news_id:naturalnum
}
with_catch errmsg {
        db_dml query "delete from pe_newsfeed where news_id = :news_id"
} {
    ad_return_complaint 1 "<b>Attenzione: non è stato possibile cancellare l'articolo. &Egrave; possibile che sia già referenziato da altri record.</br>In particolare, l'errore riportato dal database è il seguente.</br></br><code>$errmsg</code>"
}
ad_returnredirect "newsfeed-list"
ad_script_abort
