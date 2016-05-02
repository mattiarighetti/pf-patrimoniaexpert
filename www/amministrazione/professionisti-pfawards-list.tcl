ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date 3 March 2016
} {
    professionista_id:naturalnum
}
set page_title "PFAwards"
set context [list [list index "Amministrazione"] [list professionisti-list "Professionisti"] $page_title]
template::list::create \
    -name "pfawards" \
    -multirow "pfawards" \
    -actions [list "Aggiungi" [export_vars -base "professionisti-pfawards-gest" {professionista_id}] "Aggiungi un award al professinista"] \
    -row_pretty_plural "awards" \
    -no_data "Nessun PFAward associato." \
    -elements {	
	denominazione {
	    label "Edizione PFAwards"
	}
	categoria {
	    label "Categoria"
	}
	medaglia {
	    label "Medaglia"
	}
   	delete {
	    link_url_col delete_url 
	    display_template {<img src="/shared/images/Delete16.gif" height="16" width="16"border="0">}
	    link_html {title "Cancella PFAward dal professionista." onClick "return(confirm('Confermi di voler cancellare il PFAward dal professionista?'));"}
	    sub_class narrow
	}
    } -filters {
	
    } -orderby {
	
    }
db_multirow \
    -extend {
	delete_url
    } pfawards query "SELECT a.anno as denominazione, c.denominazione as categoria, m.descrizione as medaglia, c.categoria_id, a.award_id FROM pe_pfspecialist s, pe_categorie c, pe_pfawards a, pe_pfawards_medaglie m where c.categoria_id = s.categoria_id AND a.award_id = s.award_id AND m.medaglia_id = s.medaglia_id AND s.professionista_id = :professionista_id ORDER BY a.anno desc" {
	set delete_url [export_vars -base "professionisti-pfawards-canc" {professionista_id award_id categoria_id}]
    }
