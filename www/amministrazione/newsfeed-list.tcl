ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date 23 December 2014
} {
    orderby:optional
}
set page_title "Newsfeed"
set context ""
template::list::create \
    -name articoli \
    -multirow articoli \
    -actions [list "Nuovo" [export_vars -base "newsfeed-gest"] "Scrivi un nuovo articolo."] \
    -elements {
	titolo {
	    label "Titolo"
	}
	edit {
	    link_url_col edit_url
	    display_template {<img src="http://images.professionefinanza.com/icons/edit.gif" height="12" border="0">}
	    link_html {title "Modifica articolo."}
	    sub_class narrow
	}
   	delete {
	    link_url_col delete_url 
	    display_template {<img src="http://images.professionefinanza.com/icons/delete.gif" height="12" border="0">}
	    link_html {title "Cancella articolo." onClick "return(confirm('Sei davvero sicuro di voler cancellare l&quot;articolo?'));"}
	    sub_class narrow
	}
    } 
db_multirow \
    -extend {
	edit_url
	delete_url
    } articoli query "SELECT titolo, news_id from pe_newsfeed order by news_id desc" {
	set edit_url [export_vars -base "newsfeed-gest" {news_id}]
	set delete_url [export_vars -base "newsfeed-canc" {news_id}]
    }
