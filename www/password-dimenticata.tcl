ad_page_contract {
    Programma per il recupero della password utente.

    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Thursday 26 May 2016
} {
    {msg ""}
}
if {$msg ne ""} {
    set msg_html "<div class=\"alert alert-success\" role=\"alert\">Ti abbiamo spedito un'email con la nuova password per accedere al tuo profilo.</div>"
} else {
    set msg_html ""
}
ad_form -name recover_pwd \
    -mode edit \
    -form {
	{email:text
	}
    } -validate {
	{email
	    {[db_0or1row query "select * from parties where email ilike :email"]}
	    "Email non presente nel sistema."
	}
    } -on_submit {
	set password [string tolower [string range $email 0 [expr [string first @ $email] -1 ]]]
	append password [db_string query "select trunc(random()*9999)+1"]
	set password [string map {" " ""} $password]
	ad_change_password [db_string query "select party_id from parties where email ilike :email"] $password
	acs_mail_lite::send -to_addr $email -from_addr "no-reply@patrimoniaexpert.it" -mime_type "text/plain" -subject "Recupero password - PatrimoniaExpert" -body "Gentile utente,\n\nAbbiamo ricevuto richiesta di recupero password del suo profilo PatrimoniaExpert. Siamo ad avvistarti che abbiamo provveduto a cambiarti la password, che ora è $password.\n\nNon esitare a contattarci per ulteriore assistenza.\n\nBuona giornata,\nil team di PatrimoniaExpert"
	ad_returnredirect password-dimenticata?msg=ok
    }

    
