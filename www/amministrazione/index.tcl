ad_page_contract {
}
set page_title "Amministrazione"
set context ""

if {[ad_conn user_id] eq 0} {
ad_returnredirect index
ad_script_abort
}
ad_return_template
