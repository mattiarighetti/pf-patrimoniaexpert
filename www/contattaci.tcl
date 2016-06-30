ad_page_contract {
    Pagine con form per contatti.

    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Friday 24 June 2016
} {
    {msg ""}
}
if {msg ne ""} {
    set msg_html "<div class=\"alert alert-success\" role=\"alert\">La tua richiesta di contatto è stata correttamente inviata e verrà elaborata al più presto.</div>"
}
ad_form -name "contattaci" \
    -form {
	{nome:text
	    {html {class "form-control" placeholder "Nome e cognome"}}
	}
	{email:text
	    {html {class "form-control" placeholder "Email"}}
	}
	{messaggio:text(textarea)
	    {html {class "form-control textarea-contattaci" placeholder "Messaggio"}}
	}
    } -on_submit {
	set body "========== Messaggio di "
	append body $nome " (" $email ") ==========\n\n" $messaggio
	acs_mail_lite::send -to_addr "info@professionefinanza.com" -from_addr "no-reply@patrimoniaexpert.it" -mime_type "text/plain" -reply_to $email -subject "Nuova richiesta di contatto su PatrimoniaExpert" -body $body
	ad_returnredirect contattaci?msg=ok
    }
