ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Thursday 19 February 2015
} {
    domanda_id:integer
}
set page_title "Dettaglio"
set buttons [list [list "Salva" edit]]
set context [list [list /amministrazione "PatrimoniaExpert"] [list domande-list "Domande"] $page_title]
ad_form -name domanda \
    -edit_buttons $buttons \
    -method post \
    -has_edit 1 \
    -form {
	domanda_id:key
	{investitore:text,optional
	    {label "Investitore"}
	    {mode "display"}
	}
	{categoria_id:integer(select),optional
	    {label "Categoria"}
	    {options {[db_list_of_lists query "select denominazione, categoria_id from pe_categorie order by categoria_id"]}}
	    {help_text "Cambia categoria se non ritieni che quella scelta sia opportuna."}
	}
	{timestamp:text,optional
	    {label "Timestamp"}
	    {mode "display"}
	}
	{testo:text(textarea),optional
	    {label "Domanda"}
	    {mode "display"}
	}
	{stato_id:integer(select),optional
	    {label "Stato"}
	    {options {[db_list_of_lists query "select descrizione, stato_id from pe_domande_stati order by stato_id"]}}
	}
    } -select_query {
	"SELECT d.domanda_id, d.testo, d.stato_id, d.timestamp, d.categoria_id, p.first_names||' '||p.last_name as investitore FROM pe_domande d, pe_investitori i, persons p WHERE d.investitore_id = i.investitore_id and i.user_id = p.person_id and d.domanda_id = :domanda_id"
    } -new_data {
	# db_dml query "INSERT INTO expo_speakers (speaker_id, nome, cognome, short_cv, partner_id, immagine) VALUES (:speaker_id, :nome, :cognome, :short_cv, :partner_id, 'no-user.jpg')"
    } -edit_data {
	db_dml query "update pe_domande set stato_id = :stato_id and categoria_id = :categoria_id where domanda_id = :domanda_id"
    } -on_submit {
    } -after_submit {
	ad_returnredirect "domande-list"
	ad_script_abort
    }
