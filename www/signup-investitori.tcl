ad_page_contract {
    @author Mattia Righetti
} {
}
set page_title "PatrimoniaExpert"
set context ""

#Controllo su utenza
if {[ad_conn user_id]} {
  ad_returnredirect "index"
  set user_loggedin 1
} else {
    set user_loggedin 0
}

#FORM SignUp investitori
ad_form -name investitori_signup \
    -form {
	{nome:text
	    {label "Nome"}
	}
	{cognome:text
	    {label "Cognome"}
	}
	{nickname:text
		{label "Nickname"}
	}
	{email:text
	    {label "Email"}
	}
	{telefono:text
	    {label "Telefono"}
	}
	{indirizzo:text,optional
	    {label "Indirizzo"}
	}
	{provincia_id:integer(select),optional
	    {label "Provincia di residenza"}
	    {options {[db_list_of_lists query "select denominazione, provincia_id from province order by denominazione"]}}
	}
	{professione:text,optional
	    {label "Professione"}
	}
	{competenze:integer(checkbox),multiple
	    {label "In quale area hai bisogno di consulenza qualificata?"}
	    {options {[db_list_of_lists query "select denominazione, categoria_id from pe_categorie"]}}
	}
	{consulenza:integer(multiselect),multiple
	    {label "A chi ti rivolgi ad oggi per la tua consulenza patrimoniale?"}
	    {options {[db_list_of_lists query "select descrizione, cons_id from pe_consattuale order by cons_id"]}}
	}
	{eta:text,optional
	    {label "Età"}
	}
	{famiglia:text,optional
	    {label "Numero membri nucleo familiare"}
	}
	{immobili:text(radio),optional
	    {label "Immobili di proprietà"}
	    {options {{"Sì" si} {"No" no}}}
	}
	{investi_amministrato:text(radio),optional
	    {label "Investi nel risparmio amministrato (azioni, obbligazioni, titoli di stato)?"}
	    {options {{"Sì" si} {"No" no}}}
	}
	{investi_gestito:text(radio),optional
	    {label "Investi nel risparmio gestito (fondi comuni e gestioni patrimoniali)?"}
	    {options {{"Sì" si} {"No" no}}}
	}
	{investi_altro:text(radio),optional
	    {label "Investi in altri strumenti quotati (certificates, cowered warrant)?"}
	    {options {{"Sì" si} {"No" no}}}
	}
	{patrimonio_complessivo:text,optional
	    {label "Ammontare patrimonio complessivo"}
	}
	{disponibilita_finanziaria:text,optional
	    {label "Disponibilità finanziaria"}
	}
	} -validate {
		{nome
		    {[string length ${nome}] > 2}
			"Il campo <strong>nome</strong> è vuoto oppure contiene caratteri errati"
		}
		{cognome 
		    {[string length ${cognome}] > 2}
			"Il campo <strong>cognome</strong> è vuoto oppure contiene caratteri errati"
		}
    } -on_submit {
	#Create OpenACS User
	set user_id [db_nextval acs_object_id_seq]
	if {${nickname} eq ""} {
	    set ${nickname} [string tolower ${nome}]
	    append ${nickname} "." [string tolower ${cognome}] "." [db_string query "select trunc(random()*9)"]
	    set ${nickname} [string map {" " ""} ${nickname}]
	} else {
	    set ${nickname} [string map {" " ""} [string tolower ${nickname}]]
	}
	set password [string tolower ${cognome}]
	append password [db_string query "select trunc(random()*9999)+1"]
	set password [string map {" " ""} $password]
	array set creation_info [auth::create_user \
				     -user_id $user_id \
				     -username ${nickname} \
				     -email ${email} \
				     -first_names ${nome} \
				     -last_name ${cognome} \
				     -password $password]
	if {$creation_info(creation_status) ne "ok"} {
	    ad_return_complaint 1 "Error: $creation_info(creation_status) <hr> $creation_info(creation_message)"
	} else {
	    ns_log notice ppp $creation_info(creation_status)
	}
	# Genera nuovo ID Investitore
	set investitore_id [db_string query "SELECT COALESCE(MAX(investitore_id)+ trunc(random()*99+1),1) FROM pe_investitori"]
	
	#Inserimento profilo investitore...
	db_dml query "insert into pe_investitori (investitore_id, password, user_id, telefono, indirizzo, provincia_id, professione, eta, famiglia, immobili, investi_amministrato, investi_gestito, investi_altro, patrimonio_complessivo, disponibilita_finanziarie) values (:investitore_id, :password, :user_id, :telefono, :indirizzo, :provincia_id, :professione, :eta, '${famiglia}', :immobili, :investi_amministrato, :investi_gestito, :investi_altro, :patrimonio_complessivo, :disponibilita_finanziaria)"
	foreach cons_id ${consulenza} {
	    db_dml query "insert into pe_investitori_consattuale (investitore_id, cons_id) values (:investitore_id, :cons_id)"
	}
	foreach categoria_id ${competenze} {
	    db_dml query "insert into pe_investitori_categorie (investitore_id, categoria_id) values (:investitore_id, :categoria_id)"
	}
    } -after_submit {
    	#Imposta email
	set nominativo [string totitle ${nome}]
	append nominativo " " [string totitle ${cognome}]
	set subject "Benvenuto in PatrimoniaExpert"
	set body {
	    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	    <html xmlns="http://www.w3.org/1999/xhtml">
	    <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	    <title>[SUBJECT]</title>
	    <style type="text/css">
	    body {
		padding-top: 0 !important;
		padding-bottom: 0 !important;
		padding-top: 0 !important;
		padding-bottom: 0 !important;
		margin: 0 !important;
		width: 100% !important;
		-webkit-text-size-adjust: 100% !important;
		-ms-text-size-adjust: 100% !important;
		-webkit-font-smoothing: antialiased !important;
	    }
	    .tableContent img {
		border: 0 !important;
		display: block !important;
		outline: none !important;
	    }
	    a {
		color: #000;
	    }
	    p, h1 {
		color: #382F2E;
		margin: 0;
	    }
	    div, p, ul, h1 {
		margin: 0;
	    }
	    p {
		font-size: 13px;
		color: #99A1A6;
		line-height: 19px;
	    }
	    h2, h1 {
		color: #444444;
		font-weight: normal;
		font-size: 22px;
		margin: 0;
	    }
	    a.link2 {
		padding: 15px;
		font-size: 13px;
		text-decoration: none;
		background: #2D94DF;
		color: #ffffff;
		border-radius: 6px;
		-moz-border-radius: 6px;
		-webkit-border-radius: 6px;
}
	    .bgBody {
		background: #f6f6f6;
	    }
	    .bgItem {
		background: #2C94E0;
	    }
	    </style>
	    </head>
	    <body paddingwidth="0" paddingheight="0" bgcolor="#d1d3d4" style="padding-top: 0; padding-bottom: 0; padding-top: 0; padding-bottom: 0; background-repeat: repeat; width: 100% !important; -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; -webkit-font-smoothing: antialiased;" offset="0" toppadding="0" leftpadding="0">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tableContent bgBody" align="center" style="font-family:Helvetica, Arial,serif;">
	    
	    <!-- =============================== Header ====================================== -->
	    
	    <tr>
	    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td class="movableContentContainer"><div class="movableContent">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td height="25" colspan="3"></td>
	    </tr>
	    <tr>
	    <td valign="top" colspan="3"><table width="600" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td align="left" valign="middle"><div class="contentEditableContainer contentImageEditable">
	    <div class="contentEditable">
	    <center>
	    <img src="http://www.patrimoniaexpert.it/images/logo.png" alt="Logo" data-default="placeholder" data-max-width="300" width="auto" height="100" />
	    </center>
	    </div>
	    </div></td>
	    </tr>
	    </table></td>
	    </tr>
	    </table>
            </div>
	    <div class="movableContent">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td><table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
	    <tr>
                        <td height="25">&nbsp;</td>
	    </tr>
	    <tr>
	    <td style="border-bottom:3px solid #DDDDDD"></td>
	    </tr>
	    <tr>
	    <td height="10">&nbsp;</td>
	    </tr>
	    </table></td>
	    </tr>
	    </table>
            </div>
	    <div class="movableContent">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td><table width="600" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td colspan="3" height="15"></td>
	    </tr>
                      <tr>
	    <td width="50"></td>
	    <td width="500"><table width="500" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td align="center"><div class="contentEditableContainer contentTextEditable">
	    <div class="contentEditable">
	    <h1 style="font-size:15px; color:#ffff" align="left">Gentile }
	append body $nominativo
	append body {</h1>
	    <h1 style="font-size:15px; color:#ffff" align="left">nel ringraziarti per esserti iscritto al portale <strong>PatrimoniaExpert ti inviamo i tuoi dati d'accesso:</h1>
	    <p style="font-size:15px; color:#ffff" align="left">&nbsp;</p>
	   

	    <p style="font-size:15px; color:#ffff" align="left"><b>Username: }
	append body ${nickname}
	    append body {</p><p style="font-size:15px; color:#ffff" align="left"><b>Email: }
	append body ${email}
	    append body {</p><p style="font-size:15px; color:#ffff" align="left"><b>Password: <code>}
	    append body $password
	    append body {</code>
	    <h1 style="font-size:15px; color:#ffff" align="left">
	    
                                </div></td>
	    </tr>
	    <tr>
	    <td align="center"><div class="contentEditableContainer contentTextEditable">
	    <div class="contentEditable">
                                
	    <!--bo-->
	    
	    <div class="movableContent">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td><table width="200" border="0" cellspacing="0" cellpadding="0" align="center">
	    <tr>
	    <td height="15">&nbsp;</td>
	    </tr>
	    <tr>
	    <td style="border-bottom:1px solid #DDDDDD"></td>
	    </tr>
	    <tr>
	    <td height="15">&nbsp;</td>
	    </tr>
	    </table></td>
	    </tr>
	    </table>
	    </div>
	    <div class="movableContent">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td><table width="200" border="0" cellspacing="0" cellpadding="0" align="center">
	    <tr>
	    <td height="15">&nbsp;</td>
	    </tr>
	    <tr>
	    <td style="border-bottom:1px solid #DDDDDD"></td>
	    </tr>
	    <tr>
	    <td height="15">&nbsp;</td>
	    </tr>
	    </table></td>
	    </tr>
	    </table>
	    </div>
	    <div class="contentEditableContainer contentTextEditable">
	    <div class="contentEditable">
	    <h1> </h1>
	    <h1 style="font-size:15px; color:#ffff">&nbsp;</h1>
	    <p style="font-size:15px; color:#ffff">&nbsp;</p>
	    <p style="font-size:15px; color:#ffff">&nbsp;</p>
	    <h1 style="font-size:15px; color:#F90; font-weight: bold;" align="center"></h1>
	    </p>
	    <!---azzurro--> </h1>
	    <div class="movableContent">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td><table width="600" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td colspan="3" height="10"></td>
	    </tr>
	    <tr>
	    <td width="50"></td>
	    <td width="540"><table width="400" border="0" cellspacing="0" cellpadding="0" align="center"  bgcolor="#FF9900"valign="top">
	    <tr>
	    <td align="center"><div class="contentEditableContainer contentTextEditable">
	    <div class="contentEditable">
	    <h1 style="font-size:20px; color:#FFF; font-weight: bold;">Lo staff di Professione Finanza</h1>
	    </div>
	    </div></td>
	    </tr>
	    <tr>
	    <td align="center"></td>
	    </tr>
	    </table></td>
	    <td width="50"></td>
	    </tr>
	    <tr>
	    <td colspan="3" height="15"></td>
	    </tr>
	    </table></td>
	    </tr>
	    </table>
	    </div>
	    
	    <!--fine azzurro--> 
	    
	    </div>
	    </div></td>
	    </tr>
	    </table></td>
	    <td width="50"></td>
	    </tr>
	    <tr>
	    <td colspan="3" height="18"></td>
	    </tr>
	    </table></td>
	    </tr>
	    </table>
            </div>
	    <div class="movableContent">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td><table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
	    <tr>
	    <td height="10">&nbsp;</td>
	    </tr>
	    <tr>
	    <td style="border-bottom:3px solid #DDDDDD"></td>
	    </tr>
	    <tr>
	    <td height="10">&nbsp;</td>
	    </tr>
	    </table></td>
	    </tr>
	    </table>
            </div>
	    
	    <!--data-->
	    
	    <div class="movableContent">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td><table width="600" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td colspan="3" height="15"></td>
	    </tr>
	    <tr>
	    <td width="50"></td>
	    <td width="500"><table width="549" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td align="center"><div class="contentEditableContainer contentTextEditable">
	    <div class="contentEditable">
	    <h1 style="font-size:36px; color:#27567E"></h1>
	    </div>
	    </div></td>
	    </tr>
	    <tr>
	    <td height="10"></td>
	    </tr>
	    <tr>
	    <td align="center"><div class="contentEditableContainer contentTextEditable">
	    <div class="contentEditable">
	    <h1 style="font-size:32px; color: #F90;"><strong>Ti aspettiamo!</strong> </h1>
	    <p style="font-size:32px; color: #27567E;">&nbsp;</p>
	    
	    <!---azzurro-->
	    <div class="movableContent">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td><table width="600" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="27567E" valign="top">
	    <tr>
	    <td colspan="3" height="20"></td>
	    </tr>
	    <tr>
	    <td width="50"></td>
	    <td width="500"><table width="549" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td align="center"><div class="contentEditableContainer contentTextEditable">
	    <div class="contentEditable">
	    <h1 style="font-size:20px; color:#FFF" ></h1>
	    </div>
	    </div></td>
	    </tr>
	    <tr>
	    <td align="center"></td>
	    </tr>
	    </table></td>
	    <td width="50"></td>
	    </tr>
	    <tr>
	    <td colspan="3" height="15"></td>
	    </tr>
	    </table></td>
	    </tr>
	    </table>
	    </div>
	    
	    <!--fine azzurro--> 
	    </div>
	    </div></td>
	    </tr>
	    </table></td>
	    <td width="50"></td>
	    </tr>
	    <tr>
	    <td colspan="3" height="5"></td>
	    </tr>
	    </table></td>
	    </tr>
	    </table>
            </div>
	    
	    <!--data-->
	    
	    <div class="movableContent">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td><table width="600" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td><table width="600" border="0" cellspacing="0" cellpadding="0" align="center" valign="top">
	    <tr>
	    <td><table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
	    <tr>
	    <td height="10">&nbsp;</td>
	    </tr>
	    <tr>
	    <td style="border-bottom:1px solid #DDDDDD"></td>
	    </tr>
	    <tr>
	    <td height="10">&nbsp;</td>
	    </tr>
	    </table></td>
	    </tr>
	    <tr>
	    <td height="18">&nbsp;</td>
	    </tr>
	    <tr>
	    <td valign="top" align="center"><div class="contentEditableContainer contentImageEditable">
	    <div class="contentEditable"> <img src="footer nuovo logo.png" /> </div>
	    </div></td>
	    </tr>
	    <tr>
	    <td height="28">&nbsp;</td>
	    </tr>
	    <tr>
	    <td valign="top" align="center"></td>
	    </tr>
	    <tr>
	    <td height="28">&nbsp;</td>
	    </tr>
	    </table></td>
	    </tr>
	    </table></td>
	    </tr>
	    </table>
            </div></td>
	    </tr>
	    </table></td>
	    </tr>
	    </table>
	    </body>
	    </html>
	}
	acs_mail_lite::send -to_addr ${email} -from_addr "no-reply@patrimoniaexpert.it" -mime_type "text/html" -subject $subject -body $body
	ad_returnredirect "/"
	ad_script_abort
    }
ad_return_template
