ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date 23 December 2014
} {
    orderby:optional
}
set page_title "Competenze"
set context ""
template::list::create \
    -name competenze \
    -multirow competenze \
    -actions [list "Aggiungi" [export_vars -base "competenze-gest"] "Aggiungi una nuova competenza/categoria."] \
    -elements {
	denominazione {
	    label "Denominazione"
	}
	categoria_id {
	    label "ID"
	}
	edit {
	    link_url_col edit_url
	    display_template {<img src="http://images.professionefinanza.com/icons/edit.gif" height="12" border="0">}
	    link_html {title "Modifica relatore."}
	    sub_class narrow
	}
   	delete {
	    link_url_col delete_url 
	    display_template {<img src="http://images.professionefinanza.com/icons/delete.gif" height="12" border="0">}
	    link_html {title "Cancella relatore." onClick "return(confirm('Sei davvero sicuro di voler cancellare il relatore?'));"}
	    sub_class narrow
	}
    } 
db_multirow \
    -extend {
	edit_url
	delete_url
    } competenze query "SELECT denominazione, categoria_id from pe_categorie order by categoria_id" {
	set edit_url [export_vars -base "categorie-gest" {categoria_id}]
	set delete_url [export_vars -base "categorie-canc" {categoria_id}]
    }
