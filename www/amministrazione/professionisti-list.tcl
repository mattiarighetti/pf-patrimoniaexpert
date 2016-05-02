ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date 3 March 2016
} {
    orderby:optional
}
set page_title "Professionisti"
set context [list [list index "Amministrazione"] $page_title]
template::list::create \
    -name "professionisti" \
    -multirow "professionisti" \
    -actions [list "Aggiungi" professionisti-gest "Aggiungi un nuovo professionista"] \
    -key professionista_id \
    -row_pretty_plural "professionisti" \
    -no_data "Nessun professionista trovato." \
    -page_flush_p t \
    -elements {	
	denominativo {
	    label "Cognome e nome"
	}
	email {
	    label "Email"
	}
	username {
	    label "Username"
	}
	last_modified {
	    label "Ultima modifica"
	}
	professionista_id {
	    label "ID professionista"
	}
	pfspecialist {
	    link_url_col pfawards_url
	    display_template {PFSpecialist}
	    link_html {title "Aggiungi medaglia PFSpecialist"}
	    sub_class narrow
	}
	pending_verification {
	    label "Approvazione"
	}
	competences {
	    link_url_col competences_url
	    display_template {Competenze}
	    link_html {title "Gestisci competenze del professionista"}
	    sub_class narrow
	}
	certificazioni {
	    link_url_col certificazioni_url
	    display_template {Certificazioni}
	    link_html {title "Gestisci certificazioni del professionista"}
	    sub_class narrow
	}
	province {
	    link_url_col province_url
	    display_template {Province}
	    link_html {title "Gestisci l'area di attività geografica del professionista"}
	    sub_class narrow
	}
	view {
	    link_url_col view_url
	    display_template {Vedi scheda}
	    link_html {title "Vedi vetrina professionista"}
	    sub_class narrow
	}
	edit {
	    link_url_col edit_url
	    display_template {<img src="http://patrimoniaexpert.cloudapp.net/shared/images/Edit16.gif" height="16" width="16" border="0">}
	    link_html {title "Modifica professionista."}
	    sub_class narrow
	}
   	delete {
	    link_url_col delete_url 
	    display_template {<img src="http://patrimoniaexpert.cloudapp.net/shared/images/Delete16.gif" height="16" width="16"border="0">}
	    link_html {title "Cancella professionista." onClick "return(confirm('Confermi di voler cancellare il professionista?'));"}
	    sub_class narrow
	}
    } -filters {
	
    } -orderby {
	default_value denominativo
	denominativo {
	    label "Cognome"
	    orderby "p.last_name"
	}
	last_modified {
	    label "Ultima modifica"
	    orderby "pe.last_modified"
	}
    }
db_multirow \
    -extend {
	pfawards_url
	competences_url
	certificazioni_url
	province_url
	view_url
	edit_url
	delete_url
    } professionisti query "SELECT pa.email, pe.last_modified, u.username, p.last_name||' '||p.first_names||' (ID utente:'||p.person_id||')' as denominativo, pe.professionista_id, case when pending_verification is true then 'Approvato' else 'Non approvato' end as pending_verification, '/professionisti/'||pe.permalink as permalink FROM persons p, parties pa, users u, pe_professionisti pe WHERE pa.party_id = p.person_id AND pe.user_id = p.person_id AND u.user_id = p.person_id [template::list::filter_where_clauses -name professionisti -and] [template::list::orderby_clause -name professionisti -orderby]" {
	set pfawards_url [export_vars -base "professionisti-pfawards-list" {professionista_id}]
	set competences_url [export_vars -base "professionisti-competenze-list" {professionista_id}]
	set certificazioni_url [export_vars -base "professionisti-certificazioni-list" {professionista_id}]
	set province_url [export_vars -base "professionisti-province-list" {professionista_id}]
	set view_url $permalink
	set edit_url [export_vars -base "professionisti-gest" {professionista_id}]
	set delete_url [export_vars -base "professionisti-canc" {professionista_id}]
    }
