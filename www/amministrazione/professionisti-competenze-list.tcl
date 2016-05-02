ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date 3 March 2016
} {
    professionista_id:naturalnum
}
set page_title "Competenze"
set context [list [list index "Amministrazione"] [list professionisti-list "Professionisti"] $page_title]
template::list::create \
    -name "competenze" \
    -multirow "competenze" \
    -actions [list "Aggiungi" [export_vars -base "professionisti-competenze-gest" {professionista_id}] "Aggiungi una competenza al professinista"] \
    -row_pretty_plural "competenze" \
    -no_data "Nessuna competenza associata." \
    -elements {	
	denominazione {
	    label "Competenza"
	}
   	delete {
	    link_url_col delete_url 
	    display_template {<img src="/shared/images/Delete16.gif" height="16" width="16"border="0">}
	    link_html {title "Cancella competenza dal professionista." onClick "return(confirm('Confermi di voler dissociare la competenza dal professionista?'));"}
	    sub_class narrow
	}
    } -filters {
	
    } -orderby {
	
    }
db_multirow \
    -extend {
	delete_url
    } competenze query "SELECT c.denominazione, c.categoria_id FROM pe_professionisti_categorie p, pe_categorie c where c.categoria_id = p.categoria_id AND p.professionista_id = :professionista_id ORDER BY c.categoria_id" {
	set delete_url [export_vars -base "professionisti-competenze-canc" {professionista_id categoria_id}]
    }
