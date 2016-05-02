ad_library {

}

namespace eval pe {}

ad_proc -public pe_user_profoinv {
    user_id
} {
    #Controlla se esiste user_id
    if {![db_0or1row query "select * from users where user_id = :user_id"]} {
	ad_return_complaint 1 "Nella procedura di controllo profilo, è risultato un errore con l'ID Utente."
    }
    
    #Controllo tipo utente
    if {[db_0or1row query "select * from pe_professionisti where user_id = :user_id limit 1"]} {
	return "prof"
    }
    if {[db_0or1row query "select * from pe_investitori where user_id = :user_id limit 1"]} {
	return "inv"
    }
    if {$user_id == 0} {
	return "guest"
    }
    #Se arriva fino a qua, non è ne investitore ne professionista, viene quindi considerato amministratore
    return "admin"
}

ad_proc -public pe_user_dashboard {
    user_type
} {
    #Controllo su user_type passato
    if {$user_type ne "prof" && $user_type ne "inv" && $user_type ne "admin"} {
	ad_return_complaint "Si è verificato un errore nella procedura apertura dashboard. User type non trovato."
    }
    switch $user_type {
	"admin" {
	    return "/amministrazione"
	}
	"prof" {
	    return "/dashboard-professionista"
	}
	"inv" {
	    return "/dashboard-investitore"
	}
    }
}
