ad_page_contract {
} {
    {professionista_id ""}
    {user_id ""}
}
if {$professionista_id eq "" && $user_id eq ""} {
    ad_return_complaint 1 "No value"
}
if {$user_id eq ""} {
    set user_id [db_string query "select user_id from pe_professionisti where professionista_id = :professionista_id"]
}
if {$professionista_id eq ""} {
    set professionista_id [db_string query "select professionista_id from pe_professionisti where user_id = :user_id"]
}
db_dml query "delete from pe_professionisti_categorie where professionista_id = :professionista_id"
db_dml query "delete from pe_professionisti_province where professionista_id = :professionista_id"
db_dml query "delete from pe_professionisti_certificazioni where professionista_id = :professionista_id"
db_dml query "delete from pe_professionisti where professionista_id = :professionista_id"
acs_user::delete -user_id $user_id -permanent
ad_returnredirect index
ad_script_abort
