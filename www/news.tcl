ad_page_contract {
    Programma per l'estrazione delle news.

    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Friday 13 May 2016
}
set page_title "PatrimoniaExpert"
set context ""

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


if {[db_0or1row query "select * from pe_newsfeed limit 1"]} {
    db_foreach query "select '<div class=\"row search blue\"><div class=\"col-md-7\"><a target=\"_blank\" href=\"'||link||'\"><img class=\"img-responsive\" src=\"http://www.patrimoniaexpert.it/images/newsfeed_files/'||immagine||'\" alt=\"\"></a></div><div class=\"col-md-5\"><h3>'||titolo||'</h3><h4>'||sottotitolo||'</h4><p>'||testo||'</p><a class=\"btn btn-primary\" href=\"'||link||'\" target=\"_blank\">Leggi tutto <span class=\"glyphicon glyphicon-chevron-right\"></span></a></div></div>' as newsfeed from pe_newsfeed order by news_id desc limit 5" {
	append newsfeed_html $newsfeed
	append newsfeed_html "<hr class=\"light\">"
    }
    set newsfeed_html [string trimright $newsfeed_html "<hr class=\"light\">"]
} else {
    set newsfeed_html ""
}
ad_return_template
