ad_page_contract {
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Thursday 19 February 2015
} {
    professionista_id:integer,optional
}
set page_title "Aggiungi certificazione"
set context [list [list index "Amministrazione"] [list professionisti-list "Professionisti"] [list [export_vars -base "professionisti-certificazioni-list" {professionista_id}] "Certificazioni" $page_title]]
ad_form -name certificazioni \
    -export {professionista_id} \
    -has_edit 1 \
    -form {
	{certificazione_id:integer(select)
	    {label "Certificazione"}
	    {options {[db_list_of_lists query "select c.denominazione, c.certificazione_id from pe_certificazioni c where not exists(select * from pe_professionisti_certificazioni pc where pc.professionista_id = :professionista_id and c.certificazione_id = pc.certificazione_id)"]}}
	}
    } -on_submit {
	if {![db_0or1row query "select * from pe_professionisti_certificazioni where professionista_id = :professionista_id and certificazione_id = :certificazione_id"]} {
	    db_dml query "insert into pe_professionisti_certificazioni (professionista_id, certificazione_id) values (:professionista_id, :certificazione_id)"
	} else {
	    ad_return_complaint 1 "Certificazione già connessa al professionista."
	}
    } -after_submit {
	ad_returnredirect [export_vars -base "professionisti-certificazioni-list" {professionista_id}]
	ad_script_abort
    }
