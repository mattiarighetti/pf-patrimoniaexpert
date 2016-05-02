ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date 3 March 2016
} {
    professionista_id:naturalnum
}
set page_title "Certificazioni"
set context [list [list index "Amministrazione"] [list professionisti-list "Professionisti"] $page_title]
template::list::create \
    -name "certificazioni" \
    -multirow "certificazioni" \
    -actions [list "Aggiungi" [export_vars -base "professionisti-certificazioni-gest" {professionista_id}] "Aggiungi una certificazione al professinista"] \
    -row_pretty_plural "certificazioni" \
    -no_data "Nessuna certificazione associata." \
    -elements {	
	denominazione {
	    label "Certificazione"
	}
   	delete {
	    link_url_col delete_url 
	    display_template {<img src="/shared/images/Delete16.gif" height="16" width="16"border="0">}
	    link_html {title "Cancella competenza dal professionista." onClick "return(confirm('Confermi di voler dissociare la certificazione dal professionista?'));"}
	    sub_class narrow
	}
    } -filters {
	
    } -orderby {
	
    }
db_multirow \
    -extend {
	delete_url
    } certificazioni query "SELECT c.denominazione, c.certificazione_id FROM pe_professionisti_certificazioni p, pe_certificazioni c where c.certificazione_id = p.certificazione_id AND p.professionista_id = :professionista_id" {
	set delete_url [export_vars -base "professionisti-certificazioni-canc" {professionista_id certificazione_id}]
    }
