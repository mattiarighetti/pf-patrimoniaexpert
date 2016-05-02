ad_page_contract {
} {
    professionista_id:naturalnum
}
if {[db_0or1row query "select * from pe_professionisti where professionista_id = :professionista_id and pending_verification is true"]} {
    db_dml query "update pe_professionisti set pending_verification = false where professionista_id = :professionista_id"
} else {
    db_dml query "update pe_professionisti set pending_verification = true where professionista_id = :professionista_id"
}
ad_returnredirect "/amministrazione/professionisti-list"
ad_script_abort
