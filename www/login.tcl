ad_page_contract {
    @author Mattia Righetti
} {
    return_url:optional
}
set page_title "PatrimoniaExpert"
set context ""


#Imposta immagine background random
set bg_images [list header.jpg header1.jpg header2.jpg header3.jpg header4.jpg]
set backgroundimage [lindex $bg_images [expr {int(rand()*[llength $bg_images])}]]

#Imposta url di ritorno
if {![info exists return_url]} {
#    if {[db_0or1row query "select * from pe_professionisti where user_id = [ad_conn user_id] limit 1"]} {
#	set return_url "http://www.patrimoniaexpert.it/dashboard-professionista"
#    } else {
	set return_url "http://www.patrimoniaexpert.it/"
 #   }
}

#Controllo su utenza
if {[ad_conn user_id]} {
    ns_log notice cald222 [ad_conn user_id]
    set user_id [ad_conn user_id]
    ad_returnredirect -allow_complete_url [export_vars -base "http://www.patrimoniameeting.it/login" {return_url user_id}]
    ad_script_abort
}

#FORM: login
ad_form -name login \
    -mode edit \
    -export {return_url} \
    -form {
	{form-username:text
	    {html {name "form-username" placeholder "Username..." class "form-username form-control"}}
	}
	{form-password:text(password)
	    {html {name "form-password" placeholder "Password..." class "form-password form-control"}}
	}
	{persistent:text(checkbox),optional
	    {options {{"SI" 1}}}
	}
    } -validate {
	{form-username
	    {[db_0or1row query "select * from parties where email ilike '${form-username}' limit 1"] || [db_0or1row query "select * from users where username ilike '${form-username}' limit 1"]}
	    "Username o password non corretti."
	}
    } -on_submit {
	#Take care of persistent login
	if {![info exists $persistent]} {
	    set persistent "f"
	}
	if {[db_0or1row query "select * from users where username ilike '${form-username}'"]} {
	    array set auth_info [auth::authenticate \
				     -username [string trim ${form-username}] \
				     -password ${form-password} \
				     -persistent=[template::util::is_true $persistent]]
	} elseif {[db_0or1row query "select * from parties where email ilike '${email}'"]} {
	    array set auth_info [auth::authenticate \
				     -email [string trim ${form-username}] \
				     -password ${form-password} \
				     -persistent=[template::util::is_true $persistent]]
	}
        # Handle authentication problems
	switch $auth_info(auth_status) {
	    ok {
		# Continue below
	    }
	    bad_password {
		form set_error login form-password $auth_info(auth_message)
		break
	    }
	    default {
		form set_error login form-username $auth_info(auth_message)
		break
	    }
	}
    } -after_submit {
	ad_returnredirect [export_vars -base "login-pm" {return_url}]
	ad_script_abort
    }
