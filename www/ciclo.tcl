ad_page_contract {
}
set conta 0
db_foreach query "select user_id, password from pe_tmp" {
    if {[string length $password] > 35} {
	set password [db_string query "select lower(last_name) from persons where person_id = $user_id" -default "pePE"]
	append password [db_string query "select trunc(random()*999)"]
	ad_change_password $user_id [string map {" " "" "'" ""} [string tolower $password]]
	db_dml query "update pe_tmp set password = :password where user_id = :user_id"
	incr conta
    }
}
ns_log notice ciaoooo $conta
ad_returnredirect index
ad_script_abort
