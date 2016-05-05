ad_page_contract {
    @author Mattia Righetti
} {
}
set page_title "PatrimoniaExpert"
set context ""

#Imposta immagine background random
set bg_images [list header.jpg header1.jpg header2.jpg header3.jpg header4.jpg]
set backgroundimage [lindex $bg_images [expr {int(rand()*[llength $bg_images])}]]

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

#FORM Domanda veloce
ad_form -name fast-question \
    -form {
	{domanda:text,optional
	    {html {class "form-control" placeholder "Fai subito la tua domanda agli esperti!"}}
	}
    } -validate {
	{domanda
	    {[pe_user_profoinv [ad_conn user_id]] eq "inv"}
	    "Per poter sottoporre una domanda devi prima registrarti."
	}
    } -on_submit {
	#Estrae next domanda_id
	set domanda_id [db_string query "select coalesce(max(domanda_id) + trunc(random()*99), trunc(random()*99)) from pe_domande"]
	set investitore_id [db_string query "select investitore_id from pe_investitori where user_id = [ad_conn user_id]"]
	db_dml query "insert into pe_domande (domanda_id, testo, investitore_id, stato_id) values (:domanda_id, :domanda, :investitore_id, 1, current_timestamp)"
    } -after_submit {
	ad_returnredirect [export_vars -base "domanda" {domanda_id}]
	ad_script_abort
    }

#NEWSFEED
if {[db_0or1row query "select * from pe_newsfeed limit 1"]} {
    db_foreach query "select '<div class=\"row search blue\"><div class=\"col-md-7\"><a target=\"_blank\" href=\"'||link||'\"><img class=\"img-responsive\" src=\"http://www.patrimoniaexpert.it/images/newsfeed_files/'||immagine||'\" alt=\"\"></a></div><div class=\"col-md-5\"><h3>'||titolo||'</h3><h4>'||sottotitolo||'</h4><p>'||testo||'</p><a class=\"btn btn-primary\" href=\"'||link||'\" target=\"_blank\">Leggi tutto <span class=\"glyphicon glyphicon-chevron-right\"></span></a></div></div>' as newsfeed from pe_newsfeed order by news_id desc limit 5" {
	append newsfeed_html $newsfeed
	append newsfeed_html "<hr class=\"light\">"
    }
    set newsfeed_html [string trimright $newsfeed_html "<hr class=\"light\">"]
} else {
    set newsfeed_html ""
}

#Estrazione vetrine dei professionisti
set vetrine_html ""
db_foreach query "select pe.professionista_id, p.first_names, p.last_name, pe.immagine, pe.permalink from pe_professionisti pe, persons p where pe.user_id = p.person_id and pe.pending_verification is true and pe.immagine is not null and char_length(pe.immagine) > 1 order by random() limit 12" {
    #Controllo sull'immagine
    if {$immagine eq ""} {
	set immagine "images/default/user.jpg"
    } else {
	set i "http://www.patrimoniaexpert.it/images/professionisti_portraits/"
	append i $immagine
	set immagine $i
    }
    append vetrine_html "<div class=\"col-md-3 col-sm-4\">\n<a href=\"professionisti/$permalink\" class=\"prof-box\">\n<img src=\"$immagine\" class=\"img-responsive\" alt=\"\">\n<div class=\"prof-box-caption\">\n<div class=\"prof-box-caption-content\">\n<div class=\"prof-name\">$first_names</div>\n<div class=\"prof-surname\">$last_name</div>\n<div class=\"prof-category text-faded\">Area di competenza<div class=\"row\">\n"
    #Estrazione aree di competenza professionista
    db_foreach query "select c.denominazione, 'http://www.patrimoniaexpert.it/images/icons/'||c.round_icon as round_icon from pe_professionisti_categorie pc, pe_categorie c where pc.professionista_id = :professionista_id and c.categoria_id = pc.categoria_id order by c.categoria_id" {
	append vetrine_html "<div class=\"col-xs-4\">\n<img src=\"$round_icon\" class=\"img-responsive\" alt=\"$denominazione\" data-toggle=\"tooltip\" data-placement=\"bottom\" title=\"$denominazione\"></div>\n"
    }
    append vetrine_html "</div>\n</div>\n</div>\n</div>\n</a></div>"
}

#RICERCA
ad_form -name ricerca \
	-form {
		{selCompetenza:integer(select)
			{html {class "form-control"}}
		    {options {"Seleziona..." [db_list_of_lists query "select denominazione, categoria_id from pe_categorie order by categoria_id"]}}
		}
		{selProvincia:integer(select)
			{html {class "form-control"}}
			{options {"Seleziona..." [db_list_of_lists query "select denominazione, provincia_id from province order by denominazione"]}}
		}
		{selSocieta:integer(select),optional
			{html {class "form-control"}}
			{options {"Seleziona..." [db_list_of_lists query "select denominazione, societa_id from pe_societa order by denominazione"]}}
		}
	} -after_submit {
		ad_returnredirect [export_vars -base "ricerca" {selCompetenza selProvincia selSocieta}]
		ad_script_abort
	}

# Estrazione eventi PatrimoniaMeeting per snippet
set meeting_html "<div class=\"row container\">"
db_foreach query "select e.evento_id, e.denominazione, e.descrizione, e.start_time, e.end_time, e.immagine, c.denominazione as luogo, l.denominazione from pm_eventi e, pm_luoghi l, comuni c where e.luogo_id = l.luogo_id and l.comune_id = c.comune_id and e.start_time > current_timestamp order by e.start_time asc limit 6" {
    append meeting_html "<div class=\"col-sm-6 col-md-6 col-xs-12\"><a target=\"_blank\" href=\"http://www.patrimoniameeting.it/evento?evento_id=$evento_id\"><img src=\"http://www.patrimoniameeting.it/images/eventi_files/$immagine\" class=\"img-responsive\"></a><!--<div class=\"citta\"><h3></h3></div>--></div>"
}
append meeting_html "</div>"

ad_return_template
