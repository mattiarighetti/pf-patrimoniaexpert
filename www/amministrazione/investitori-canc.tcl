ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Friday 24 June 2016
} {
    investitore_id:naturalnum
    {return_url "investitori-list"}
}
with_catch errmsg {
    set user_id [db_string query "select user_id from pe_investitori where investitore_id = :investitore_id"]
    db_dml query "DELETE FROM pe_investitori_categorie WHERE investitore_id = :investitore_id"
    db_dml query "DELETE FROM pe_investitori_consattuale WHERE investitore_id = :investitore_id"
    db_dml query "DELETE FROM pe_investitori WHERE investitore_id = :investitore_id"
    acs_user::delete -user_id $user_id -permanent
} {
    ad_return_complaint 1 "<b>Attenzione: non è stato possibile cancellare il professionista. &Egrave; possibile che sia già referenziato da altri record.</br>In particolare, l'errore riportato dal database è il seguente.</br></br><code>$errmsg</code>"
}
ad_returnredirect $return_url
ad_script_abort
