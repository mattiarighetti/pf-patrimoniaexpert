ad_page_contract {
} {
    selCompetenza:naturalnum,optional
    selProvincia:naturalnum,optional
    selSocieta:naturalnum,optional
}
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

set vetrine_html ""
set query_part ""
if {[info exists selCompetenza] && $selCompetenza ne ""} {
    append query_part "and exists(select * from pe_professionisti_categorie cc where cc.categoria_id = :selCompetenza and cc.professionista_id = pe.professionista_id) "
}
if {[info exists selProvincia] && $selProvincia ne ""} {
    append query_part "and exists(select * from pe_professionisti_province pp where pp.provincia_id = :selProvincia and pp.professionista_id = pe.professionista_id) "
}
if {[info exists selSocieta] && $selSocieta ne ""} {
    append query_part "and pe.societa_id = :selSocieta"
}
ns_log notice ciaociao $query_part
db_foreach query "select pe.professionista_id, p.first_names, p.last_name, pe.immagine, pe.permalink from pe_professionisti pe, persons p where pe.pending_verification is true and pe.user_id = p.person_id $query_part order by random()" {
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
