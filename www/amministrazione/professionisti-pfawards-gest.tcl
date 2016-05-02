ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Thursday 19 February 2015
} {
    professionista_id:integer,optional
}
set page_title "PFAwards"
set context [list [list index "Amministrazione"] [list professionisti-list "Professionisti"] [list [export_vars -base "professionisti-pfawards-list" {professionista_id}] $page_title]]
ad_form -name pfawards \
    -export {professionista_id} \
    -has_edit 1 \
    -form {
	{award_id:integer(select)
	    {label "Edizione"}
	    {options {[db_list_of_lists query "select anno, award_id from pe_pfawards"]}}
	}
	{categoria_id:integer(select)
	    {label "Categoria"}
	    {options {[db_list_of_lists query "select denominazione, categoria_id from pe_categorie order by categoria_id"]}}
	}
	{medaglia_id:integer(select)
	    {label "Medaglia"}
	    {options {[db_list_of_lists query "select descrizione, medaglia_id from pe_pfawards_medaglie order by medaglia_id"]}}
	}
    } -on_submit {
	db_dml query "insert into pe_pfspecialist (award_id, professionista_id, categoria_id, medaglia_id) values (:award_id, :professionista_id, :categoria_id, :medaglia_id)"
    } -after_submit {
	ad_returnredirect [export_vars -base "professionisti-pfawards-list" {professionista_id}]
	ad_script_abort
    }
