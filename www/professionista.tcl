ad_page_contract {
    Programma per l'estrazione dei dati dettaglio professionista.

    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Wednesday 13 April 2016
    @cvs-id 
} {
    professionista_id:integer
}
#Esegue controllo su utenza
if {[pe_user_profoinv [ad_conn user_id]] eq "admin"} {
    if {[db_0or1row query "select * from pe_professionisti where professionista_id = :professionista_id and pending_verification is true"]} {
	set verification_bar "&nbsp;&nbsp;&nbsp;<a class=\"btn btn-default\" href=\"/verification?professionista_id=${professionista_id}\" role=\"button\">Disapprova</a>"
    } else {
	set verification_bar "&nbsp;&nbsp;&nbsp;<a class=\"btn btn-success\" href=\"/verification?professionista_id=${professionista_id}\" role=\"button\">Approva</a>"
    }
} else {
    set verification_bar ""
}

set contact_info_html ""
db_1row query "select pe.first_names||' '||pe.last_name as nominativo, s.denominazione as societa, p.telefono, p.cellulare, p.fax, p.indirizzo, p.immagine, p.copertina, c.denominazione as citta, p.sitoweb, p.facebook, p.twitter, p.linkedin, p.gplus from persons pe, pe_professionisti p left outer join comuni c on p.comune_id = c.comune_id left outer join pe_societa s on s.societa_id = p.societa_id where p.professionista_id = :professionista_id and p.user_id = pe.person_id"
if {$copertina ne ""} {
    set copertina1 "/images/professionisti_backgrounds/"
    append copertina1 $copertina
    set cover_image $copertina1
} else {
    set cover_image "/images/default/profile.jpg"
}
if {$immagine ne ""} {
    set immagine1 "/images/professionisti_portraits/"
    append immagine1 $immagine
    set profile_image $immagine1
} else {
    set profile_image "/images/default/user.jpg"
}
if {$telefono ne ""} {
    append contact_info_html "<li><strong><span class=\"glyphicon glyphicon-phone-alt\"></span> Tel:</strong> ${telefono}</li>"
}
if {$cellulare ne ""} {
    append contact_info_html "<li><strong><span class=\"glyphicon glyphicon-phone\"></span> Cell:</strong> ${cellulare}</li>"
}
if {$fax ne ""} {
    append contact_ino_html "<li><strong><span class=\"glyphicon glyphicon-print\"></span> Fax:</strong> ${fax}</li>"
}
if {$citta ne ""} {
    append contact_info_html "<li><strong><span class=\"glyphicon glyphicon-globe\"></span> Città:</strong> ${citta}</li>"
}
if {$indirizzo ne ""} {
    append contact_info_html "<li><strong><span class=\"glyphicon glyphicon-map-marker\"></span> Indirizzo:</strong> ${indirizzo}</li>"
}
if {$societa ne ""} {
    set societa_html "- "
    append societa_html $societa
} else {
    set societa_html ""
}
if {$sitoweb ne ""} {
    append contact_info_html "<li><strong><span class=\"glyphicon glyphicon-new-window\"></span> Sito web:</strong> ${sitoweb}</li>"
}
if {$facebook ne "" || $twitter ne "" || $linkedin ne "" || $gplus ne ""} {
    append contact_info_html "<li><strong><span class=\"glyphicon glyphicon-comment\"></span> Social:</strong><br><div class=\"dettaglio-social\">"
    if {$facebook ne ""} {
	append contact_info_html "<a href=\"${facebook}\" target=\"_blank\"><span class=\"fa fa-2x fa-facebook-square\"></span></a>"
    }
    if {$twitter ne ""} {
	append contact_info_html "<a href=\"${twitter}\" target=\"_blank\"><span class=\"fa fa-2x fa-twitter-square\"></span></a>"
    }
    if {$linkedin ne ""} {
	append contact_info_html "<a href=\"${linkedin}\" target=\"_blank\"><span class=\"fa fa-2x fa-linkedin-square\"></span></a>"
    }
    if {$gplus ne ""} {
	append contact_info_html "<a href=\"${gplus}\" target=\"_blank\"><span class=\"fa fa-2x fa-google-plus-square\"></span></a>"
    }
    append contact_info_html "</div></li>"
}
#Select competenze
set competenze_html ""
db_foreach query "select c.denominazione, c.round_icon from pe_categorie c, pe_professionisti_categorie p where p.categoria_id= c.categoria_id and p.professionista_id = :professionista_id" {
    append competenze_html "<div class=\"dettaglio-competenza-img\"><img src=\"/images/icons/$round_icon\" class=\"img-responsive\" alt=\"\"> $denominazione</div>"
}
#Select province
set province ""
db_foreach query "select p.denominazione from province p, pe_professionisti_province pe where pe.provincia_id = p.provincia_id and pe.professionista_id = :professionista_id" {
    append province $denominazione " - "
}
set province [string trimright $province " - "]

#Attivita
if {[db_0or1row query "select * from pe_professionisti where professionista_id = :professionista_id and attivita is not null"]} {
    set attivita_html "<div class=\"attivita\"><h3>La mia attività</h3><p>"
    append attivita_html [db_string query "select attivita from pe_professionisti where professionista_id = :professionista_id and attivita is not null"] "</p><hr></div>"
} else {
    set attivita_html ""
}

#Esperienze
if {[db_0or1row query "select * from pe_professionisti where professionista_id = :professionista_id and esperienze is not null"]} {
    set esperienze_html "<div class=\"esperienze-prof\">\n<h3>Esperienze professionali</h3><p>"
    append esperienze_html [db_string query "select esperienze from pe_professionisti where professionista_id = :professionista_id and esperienza is not null"] "</p><hr></div>"
} else {
    set esperienze_html ""
}

#Corsi
if {[db_0or1row query "select * from pe_professionisti where professionista_id = :professionista_id and formazione is not null"]} {
    set formazione_html "<div class=\"corsi\">\n<h3>Ultimi corsi di formazione frequentati</h3><p>"
    append formazione_html [db_string query "select formazione from pe_professionisti where professionista_id = :professionista_id and formazione is not null"] "</p><hr></div>"
} else {
    set formazione_html ""
}

#CERTIFICAZIONI
if {[db_0or1row query "select * from pe_professionisti_certificazioni where professionista_id = :professionista_id limit 1"] || [db_0or1row query "select * from pe_pfspecialist where professionista_id = :professionista_id limit 1"]} {
    set certificazioni_html "<li><strong><span class=\"glyphicon glyphicon-ok\"></span> Le mie certificazioni:</strong><br><br><div class=\"row\">"
    #PFAwards 2016
    if {[db_0or1row query "select * from pe_pfspecialist where professionista_id = :professionista_id and award_id = 3 limit 1"]} {
	append certificazioni_html "<div class=\"col-sm-4 col-xs-12\"><div class=\"cert-pfspecialist cert-pfspecialist-2016\"><div class=\"img-pfspecialist-2016\"><a href=\"#\" class=\"launch-modal\" data-modal-id=\"modal-cert-pfspecialist-2016\"><img src=\"/images/loghi-pfspecialist/2016PFSPECIALIST.jpg\" class=\"img-responsive\" alt=\"\"></a></div><div class=\"info-pfspecialist info-pfspecialist-2016\"><a href=\"#\" class=\"launch-modal\" data-modal-id=\"modal-cert-pfspecialist-2016\">"
	db_foreach query "select medaglia_id, count(*) as conta from pe_pfspecialist where professionista_id = :professionista_id and award_id = 3 group by medaglia_id having count(*) > 0" {
	    append certificazioni_html "<div class=\"info-pfspecialist info-pfspecialist-2016\"><a href=\"#\" class=\"launch-modal\" data-modal-id=\"modal-cert-pfspecialist-2016\">"
	    switch $medaglia_id {
		1 - 4 {
		    append certificazioni_html "<span class=\"oro\"><span class=\"fa fa-circle\"></span> " $conta "</span>"
		}
		2 {
		    append certificazioni_html "<span class=\"argento\"><span class=\"fa fa-circle\"></span> " $conta "</span>"
		}
		3 {
		    append certificazioni_html "<span class=\"bronzo\"><span class=\"fa fa-circle\"></span> " $conta "</span>" 
		}
	    }
	}
	append certificazioni_html "</a></div> </div></div>"
    }
    #Altre cert
    if {[db_0or1row query "select * from pe_professionisti_certificazioni where professionista_id = :professionista_id limit 1"]} {
	append certificazioni_html "<div class=\"altre-cert\"><div class=\"row\">"
	db_foreach query "select certificazione_id from pe_professionisti_certificazioni where professionista_id = :professionista_id" {
	    switch certificazione_id {
		1 {
		    append certificazioni_html "<div class=\"col-sm-15 col-xs-12\"><div class=\"img-altre-cert\"><img src=\"/images/loghi-certificazioni-esterne/efpa.jpg\" class=\"img-responsive\" alt=\"\"></div></div>"
		}
		2 {
		    append certificazioni_html "<div class=\"col-sm-15 col-xs-12\"><div class=\"img-altre-cert\"><img src=\"/images/loghi-certificazioni-esterne/pwc.jpg\" class=\"img-responsive\" alt=\"\"></div></div>"
		}
		6 {
		    append certificazioni_html "<div class=\"col-sm-15 col-xs-12\"><div class=\"img-altre-cert\"><img src=\"/images/loghi-certificazioni-esterne/anpib.jpg\" class=\"img-responsive\" alt=\"\"></div></div>"
		}
	    }
	}
	append certificazioni_html "</div></div>"
    }
    append certificazioni_html "<li>"
} else {
    set certificazioni_html ""
}
#clienti
if {[db_0or1row query "select * from pe_professionisti where clienti is not null and professionista_id = :professionista_id limit 1"]} {
    set clienti_html "<li><span class=\"fa fa-users\"></span> <strong>Numero clienti:</strong> "
    append clienti_html [db_string query "select clienti from pe_professionisti where professionista_id = :professionista_id"] "</li>"
} else {
    set clienti_html ""
}

#citazione
if {[db_0or1row query "select * from pe_professionisti where citazione is not null and professionista_id = :professionista_id limit 1"]} {
    set citazione_html "<li><span class=\"fa fa-commenting-o\"></span><strong>La citazione in cui mi ritrovo:</strong> "
    append citazione_html [db_string query "select citazione from pe_professionisti where professionista_id = :professionista_id"] "</li>"
} else {
    set citazione_html ""
}

#anni esperienza
if {[db_0or1row query "select * from pe_professionisti where esperienza is not null and professionista_id = :professionista_id limit 1"]} {
    set esperienza_html "<li><span class=\"fa fa-tasks\"></span><strong>Anni di esperienza:</strong> "
    append esperienza_html [db_string query "select esperienza from pe_professionisti where professionista_id = :professionista_id"] "</li>"
} else {
    set esperienza_html ""
}
ad_return_template
