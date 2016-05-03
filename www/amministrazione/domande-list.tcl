ad_page_contract {
    Programma che elenca e permette la gestione delle domande.
    
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date 23 December 2014
} {
    orderby:optional
    {rows_per_page 50}
}
set page_title "Newsfeed"
set context ""
template::list::create \
    -name domande \
    -multirow domande \
    -elements {
	domanda_id {
	    label "ID"
	}
	categoria {
	    label "Categoria"
	}
	testo {
	    label "Testo"
	}
	timestamp {
	    label "Timestamp"
	}
	investitore {
	    label "Investitore"
	}
	stato {
	    label "Stato"
	}
	view {
	    link_url_col view_url
	    display_template {Vedi}
	    link_html {title "Consulta scheda domanda."}
	    sub_class narrow
	}
   	approve {
	    link_url_col approve_url 
	    display_template {APPROVA}
	    link_html {title "Approva domanda." onClick "return(confirm('Sei davvero sicuro di voler approvare la domanda?'));"}
	    sub_class narrow
	}
	quash {
	    link_url_col quash_url 
	    display_template {REVOCA}
	    link_html {title "Banna domanda." onClick "return(confirm('Sei davvero sicuro di voler disapprovare la domanda?'));"}
	    sub_class narrow
	}
    } -filters {
	rows_per_page {
	    label "Righe per pagine"
	    values {{Venticinque 25} {Cinquanta 50} {Cento 100}}
	    where_clause {1=1}
	    default_value 50
	}
    }
db_multirow \
    -extend {
	view_url
	approve_url
	quash_url
    } domande query "SELECT d.domanda_id, substring(d.testo from 1 for 50) as testo, d.timestamp, c.denominazione as categoria, p.first_names||' '||p.last_name as investitore, s.descrizione as stato from pe_domande d, pe_investitori i, persons p, pe_domande_stati s, pe_categorie c where d.investitore_id = i.investitore_id and i.user_id = p.person_id and d.stato_id = s.stato_id and d.categoria_id = c.categoria_id" {
	set view_url [export_vars -base "domande-gest" {domanda_id}]
	set return_url "/amministrazione/domande-list"
	set stato_id 3
	set approve_url [export_vars -base "/domanda-stato" {domanda_id return_url stato_id}]
	set stato_id 4
	set quash_url [export_vars -base "/domanda-stato" {domanda_id return_url stato_id}]
    }
