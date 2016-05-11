ad_page_contract {

    @author Mattia Righetti
    @creation-date Friday 15 April 2016
} {
}
set page_title "PatrimoniaExpert"
set context ""

#Imposta URL di ritorno
if {![info exists return_url]} {
    set return_url "login-pm"
}

#Controllo su utenza
if {[ad_conn user_id]} {
    ad_returnredirect -allow_complete_url $return_url
    ad_script_abort
}

#FORM: SignUp professionisti

ad_form -name professionisti_signup \
    -export {return_url} \
    -form {
	{nome:text
	    {label "Nome"}
	}
	{cognome:text
	    {label "Cognome"}
	}
	{nickname:text,optional
	    {label "Nickname"}
	}
	{email:text
	    {label "Email"}
	}
	{telefono:text
	    {label "Telefono"}
	}
	{ruolo_id:integer(select)
	    {label "Ruolo professionale"}
	    {options {"" [db_list_of_lists query "select denominazione, ruolo_id from pe_ruoliprof order by ruolo_id"]}}
	}
	{societa_id:integer(select),optional
	    {label "Società"}
	    {options {"" [db_list_of_lists query "select denominazione, societa_id from pe_societa order by denominazione"]}}
	    {help_text "Se la tua società non è presente nella tendina, inseriscila manualmente nel campo sotto."}
	}
	{societa_man:text,optional
	    {label "Società manuale"}
	}
	{competenze:integer(checkbox),multiple
	    {label "Competenze"}
	    {options {[db_list_of_lists query "select denominazione, categoria_id from pe_categorie order by categoria_id"]}}
	}
	{province:integer(multiselect),multiple
	    {html {size 4 multiple ""}}
	    {label "Province di attivita"}
	    {options {[db_list_of_lists query "select denominazione, provincia_id from province order by denominazione"]}}
	    {help_text "Per selezionarne più di una, tieni premuto il tasto ctrl o cmd"}
	}
	{privacy:text(checkbox)
	    {label "Privacy"}
	    {help_text "<a href=\"\">Informativa sulla privacy</a>"}
	    {options {{"Accetto" y}}}
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
	{email
	    {![db_0or1row query "select * from parties where email ilike :email"]}
	    "Email già registrata."
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
	
	# Genera nuovo ID Professionista
	set professionista_id [db_string query "SELECT COALESCE(MAX(professionista_id)+ trunc(random()*99+1),1) FROM pe_professionisti"]
	
	#Genera permalink
	set permalink [string tolower ${nome}]
	append permalink "-" [string tolower ${cognome}]
	
	#Caso di creazione nuova Società!!!
	
	
	#Inserimento profilo professionista...
	db_dml query "insert into pe_professionisti (professionista_id, password, user_id, permalink, telefono, societa_id, ruolo_id) values (:professionista_id, :password, :user_id, :permalink, :telefono, :societa_id, :ruolo_id)"
	foreach competenza_id ${competenze} {
	    db_dml query "insert into pe_professionisti_categorie (professionista_id, categoria_id) values (:professionista_id, :competenza_id)"
	}
	foreach provincia_id ${province} {
	    db_dml query "insert into pe_professionisti_province (professionista_id, provincia_id) values (:professionista_id, :provincia_id)"
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
        ad_returnredirect -allow_complete_url $return_url
        ad_script_abort
    }

    ad_return_template
