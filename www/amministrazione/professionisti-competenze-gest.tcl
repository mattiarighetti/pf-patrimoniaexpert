ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Thursday 19 February 2015
} {
    professionista_id:integer,optional
}
set page_title "Aggiungi competenza"
set context [list [list index "Amministrazione"] [list professionisti-list "Professionisti"] [list [export_vars -base "professionisti-competenze-list" {professionista_id}] "Competenze" $page_title]]
ad_form -name competenza \
    -export {professionista_id} \
    -has_edit 1 \
    -form {
	{categoria_id:integer(select)
	    {label "Competenza"}
	    {options {[db_list_of_lists query "select c.denominazione, c.categoria_id from pe_categorie c where not exists(select * from pe_professionisti_categorie pc where pc.categoria_id = c.categoria_id and pc.professionista_id = :professionista_id) order by c.categoria_id"]}}
	}
    } -on_submit {
	if {![db_0or1row query "select * from pe_professionisti_categorie where professionista_id = :professionista_id and categoria_id = :categoria_id"]} {
	    db_dml query "insert into pe_professionisti_categorie (professionista_id, categoria_id) values (:professionista_id, :categoria_id)"
	} else {
	    ad_return_complaint 1 "Categoria già connessa al professionista."
	}
    } -after_submit {
	ad_returnredirect [export_vars -base "professionisti-competenze-list" {professionista_id}]
	ad_script_abort
    }
