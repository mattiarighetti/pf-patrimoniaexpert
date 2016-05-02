ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date 3 March 2016
} {
    professionista_id:naturalnum
}
set page_title "Province"
set context [list [list index "Amministrazione"] [list professionisti-list "Professionisti"] $page_title]
template::list::create \
    -name "province" \
    -multirow "province" \
    -actions [list "Aggiungi" [export_vars -base "professionisti-province-gest" {professionista_id}] "Aggiungi una provincia al professinista"] \
    -row_pretty_plural "province" \
    -no_data "Nessuna provincia associata." \
    -elements {	
	denominazione {
	    label "Provincia"
	}
   	delete {
	    link_url_col delete_url 
	    display_template {<img src="/shared/images/Delete16.gif" height="16" width="16"border="0">}
	    link_html {title "Cancella provincia dal professionista." onClick "return(confirm('Confermi di voler dissociare la provincia dal professionista?'));"}
	    sub_class narrow
	}
    } -filters {
    } -orderby {
    }
db_multirow \
    -extend {
	delete_url
    } province query "SELECT p.denominazione, p.provincia_id FROM pe_professionisti_province pp, province p where p.provincia_id = pp.provincia_id AND pp.professionista_id = :professionista_id ORDER BY p.denominazione" {
	set delete_url [export_vars -base "professionisti-provincia-canc" {professionista_id provincia_id}]
    }
