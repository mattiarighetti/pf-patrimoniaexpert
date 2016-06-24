ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date 24 June 2016
} {
    {rows_per_page 50}
    {offset 0}
    {q ""}
    orderby:optional
}
set page_title "Investitori"
set context [list [list index "Amministrazione"] $page_title]
set actions [list "Aggiungi" investitori-gest "Aggiungi un nuovo investitore"]
source [ah::package_root -package_key ah-util]/paging-buttons.tcl
template::list::create \
    -name "investitori" \
    -multirow "investitori" \
    -actions $actions \
    -key investitore_id \
    -row_pretty_plural "investitori" \
    -no_data "Nessun investitore trovato." \
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
	investitore_id {
	    label "ID investitore"
	}
	profilo {
	    link_url_col profilo_url
	    display_template {Profilo}
	    link_html {title "Gestisci profilo dell'investitore."}
	    sub_class narrow
	}
	domande {
	    link_url_col domande_url
	    display_template {Domande}
	    link_html {title "Gestisci domande di questo investitore."}
	    sub_class narrow
	}
   	delete {
	    link_url_col delete_url 
	    display_template {<img src="http://patrimoniaexpert.cloudapp.net/shared/images/Delete16.gif" height="16" width="16"border="0">}
	    link_html {title "Cancella profilo investitore." onClick "return(confirm('Confermi di voler eliminare questa utenza?'));"}
	    sub_class narrow
	}
    } -filters {
	q {
	    hide_p 1
	    values {$q $q}
	    where_clause {UPPER(p.first_names||p.last_name) LIKE UPPER ('%$q%')}
	}
	rows_per_page {
	    label "Righe"
	    values {{Cinquanta 50} {Cento 100} {Duecento 200}}
	}
    } -orderby {
	default_value denominativo
	denominativo {
	    label "Cognome"
	    orderby "p.last_name"
	}
    }
db_multirow \
    -extend {
	profilo_url
	domande_url
	delete_url
    } investitori query "SELECT pa.email, u.username, INITCAP(LOWER(p.last_name))||' '||INITCAP(LOWER(p.first_names))||' (ID utente:'||p.person_id||')' as denominativo, i.investitore_id FROM persons p, parties pa, users u, pe_investitori i WHERE pa.party_id = p.person_id AND i.user_id = p.person_id AND u.user_id = p.person_id [template::list::filter_where_clauses -name investitori -and] [template::list::orderby_clause -name investitori -orderby]" {
	set edit_url [export_vars -base "professionisti-gest" {professionista_id}]
	set return_url [ad_return_url -urlencode]
	set delete_url [export_vars -base "investitori-canc" {investitore_id}]
    }
