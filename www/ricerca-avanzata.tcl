ad_page_contract {
    Programma per la ricerca avanzata di un professionista.

    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Friday 27 May 2016
} {
    competenza:naturalnum,optional
    provincia:naturalnum,optional
    societa:naturalnum,optional
}
#Controllo su utenza
if {[ad_conn user_id]} {
    set user_loggedin 1
    set user_dashlink [pe_user_dashboard [pe_user_profoinv [ad_conn user_id]]]
    switch [pe_user_profoinv [ad_conn user_id]] {
    "prof" {
        if {[db_0or1row query "select * from pe_professionisti where user_id = [ad_conn user_id] and immagine is not null limit 1"]} {
        set user_portrait [db_string query "select '/images/professionisti_portraits/'||immagine from pe_professionisti where user_id = [ad_conn user_id]"]
        } else {
        set user_portrait "/images/default/user.jpg"
        }
    }
    "inv" {
        if {[db_0or1row query "select * from pe_investitori where user_id = [ad_conn user_id] and immagine is not null limit 1"]} {
        set user_portrait [db_string query "select '/images/investitori_portraits/'||immagine from pe_investitori where user_id = [ad_conn user_id]"]
        } else {
        set user_portrait "/images/default/user.jpg"
        }
    }
    default {
        set user_portrait "/images/default/user.jpg"
    }
    }
} else {
    set user_loggedin 0
}

#
ad_form -name ricerca \
    -form {
	{categoria:integer(select)
	    {options {[db_list_of_lists query "select denominazione, categoria_id from pe_categorie"]}}
	    {html {class "form-control"}}
	}
	{provincia:integer(select)
	    {options {[db_list_of_lists query "select denominazione, provincia_id from province order by denominazione"]}}
	    {html {class "form-control"}}
	}
	{societa:integer(select)
	    {options {[db_list_of_lists query "select denominazione, societa_id from pe_societa order by denominazione"]}}
	    {html {class "form-control"}}
	}
	
    }


