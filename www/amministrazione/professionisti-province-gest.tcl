ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Thursday 19 February 2015
} {
    professionista_id:integer,optional
}
set page_title "Aggiungi provincia"
set context [list [list index "Amministrazione"] [list professionisti-list "Professionisti"] [list [export_vars -base "professionisti-province-list" {professionista_id}]] $page_title]
ad_form -name province \
    -export {professionista_id} \
    -has_edit 1 \
    -form {
	{provincia_id:integer(select)
	    {label "Province"}
	    {options {[db_list_of_lists query "select p.denominazione, p.provincia_id from province p where not exists(select * from pe_professionisti_province pp where pp.provincia_id = p.provincia_id and pp.professionista_id = :professionista_id) order by p.denominazione"]}}
	}
    } -on_submit {
	if {![db_0or1row query "select * from pe_professionisti_province where professionista_id = :professionista_id and provincia_id = :provincia_id"]} {
	    db_dml query "insert into pe_professionisti_province (professionista_id, provincia_id) values (:professionista_id, :provincia_id)"
	} else {
	    ad_return_complaint 1 "Provincia già connessa al professionista."
	}
    } -after_submit {
	ad_returnredirect [export_vars -base "professionisti-province-list" {professionista_id}]
	ad_script_abort
    }
