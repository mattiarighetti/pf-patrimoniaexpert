ad_page_contract {
    Programma per nascondere una domanda a cui il professionista non vuole/sa rispondere.

    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Wednesday 11 May 2016
} {
    domanda_id:naturalnum
    return_url
}
set risposta_id [db_string query "select coalesce(max(risposta_id) + trunc(random()*99), trunc(random()*))) from pe_risposte"]
with_catch errmsg {
    db_dml query "insert into pe_risposte (risposta_id, domanda_id, no_risposta) values (:risposta_id, :domanda_id, true)"
} {
    ad_return_complaint 1 $errmsg
}
ad_returnredirect $return_url
ad_script_abort
