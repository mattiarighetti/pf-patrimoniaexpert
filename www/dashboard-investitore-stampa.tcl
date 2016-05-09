ad_page_contract {
    Programma per la stampa PDF della domanda con risposte correlate.
    
    @author Mattia Righetti (mattia.righetti@professionefinanza.com)
    @creation-date Tuesday 26 April 2016
    @param domanda_id
} {
    domanda_id:naturalnum
}
#Estrazione generalità domanda
db_1row query "select testo, investitore_id, categoria_id, to_char(timestamp, 'il DD/MM/YYYY alle HH24:MI') as timestamp from pe_domande where domanda_id = :domanda_id"
set html "<center><img src=\"http://patrimoniaexpert.it/images/logo.png\"></img></center><table width=\"100%\"><tr><td colspan=\"3\"><center><font size=\"18\" face=\"Helvetica\">Riepilogo della domanda</font></center></td></tr><tr><td><font face=\"Georgia\"><b>Posta</b>"
append html $timestamp "</font></td><td><b>Nella categoria</b> " [db_string query "select descrizione from pe_categorie where categoria_id = :categoria_id"] "</td><td><b>Da</b> <i>" [db_string query "select u.username from users u, pe_investitori i where i.user_id = u.user_id and i.investitore_id = :investitore_id"] "</i></td></tr></table><br><table border=\"1\" width=\"100%\"><tr><td><font face=\"Garamond\">" $testo  "</font></td></tr></table><br>"
#Ciclo di estrazione risposte
db_foreach query "select risposta_id, testo, professionista_id, to_char(timestamp, 'DD/MM/YYYY alle HH24:MI') as timestamp from pe_risposte where domanda_id = :domanda_id" {
    set username [db_string query "select u.username from users u, pe_professionisti p where p.user_id = u.user_id and p.professionista_id = :professionista_id"] 
    append html "<font face=\"Helvetica\"><i>Risposta di $username del $timestamp <small>(ID $risposta_id)</small></i><br><p><font face=\"Garamond\">$testo</font></p>"
    #Se vi sono Errata corrige...
    if {[db_0or1row query "select * from pe_risposte_erratacorrige where risposta_id = :risposta_id limit 1"]} {
	set errata [db_string query "select testo from pe_risposte_erratacorrige where risposta_id = :risposta_id"]
	append html "<table border=0><tr><td><small><b>Precisazione</b></small></td><td><p><font face=\"Georgia\">$errata</font></p></td></tr></table>"
    }
    append html "<hr>"
}
append html "</html>"
set filenamehtml "/tmp/temporary.html"
set filenamepdf  "/usr/share/openacs/packages/patrimoniaexpert/www/files/questions/question_"
append filenamepdf $investitore_id "_" $domanda_id ".pdf"
#set link "http://www.pfawards.it/files/exams/exam2_"
#append link $persona_id "_" $esame_id ".pdf"
set file_html [open $filenamehtml w]
puts $file_html $html
close $file_html
with_catch error_msg {
    exec htmldoc --portrait --webpage --header ... --footer ... --quiet --left 1cm --right 1cm --top 1cm --bottom 1cm --fontsize 12 -f $filenamepdf $filenamehtml
} {
    ns_log notice "errore htmldoc  <code>$error_msg </code>"
}
#ns_unlink $filenamehtml
ns_returnfile 200 application/pdf $filenamepdf
ad_script_abort
