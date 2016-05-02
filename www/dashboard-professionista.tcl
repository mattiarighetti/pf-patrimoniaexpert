ad_page_contract {
    Programma per dashboard professionisti
} {
    upload_profilo:trim,optional
    upload_profilo.tmpfile:tmpfile,optional
    upload_sfondo:trim,optional
    upload_sfondo.tmpfile:tmpfile,optional
}
#Controllo utenza
if {[ad_conn user_id]} {
    set user_loggedin 1
    set user_portrait "/images/default/user.jpg"
    set user_id [ad_conn user_id]
    set user_dashlink [pe_user_dashboard [pe_user_profoinv $user_id]]
} else {
    ad_returnredirect "/"
    ad_script_abort
}
#Estrazione generalita utente
acs_user::get -user_id [ad_conn user_id] -array user
set nominativo $user(first_names)
append nominativo " " $user(last_name)
set user_portrait [db_string query "select '/images/professionisti_portraits/'||immagine from pe_professionisti where user_id = [ad_conn user_id] and immagine is not null" -default ""]
if {$user_portrait eq ""} {
    set user_portrait "/images/default/user.jpg"
}
set permalink [db_string query "select permalink from pe_professionisti where user_id = [ad_conn user_id]"]
ad_return_template

