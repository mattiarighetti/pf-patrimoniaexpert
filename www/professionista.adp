<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dettaglio professionisti - PatrimoniaExpert</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="/font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="/css/animate.min.css" type="text/css">

    <!-- Creative CSS -->
    <link rel="stylesheet" href="/css/creative.css" type="text/css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/css/custom.css" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top">
  <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
        <div class="row no-gutter">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="/">
                    <img src="/images/logo-beta.png" class="img-responsive" alt="">
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="index.html">Trova professionista</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="index.html">Cerca eventi</a>
                    </li>
                    <li>
                        <a href="#" class="launch-modal" data-modal-id="modal-pre-register">
                            <span class="glyphicon glyphicon-user"></span> Registrati
                        </a>
                    </li>
                    <li>
                        <a href="#" class="launch-modal" data-modal-id="modal-login">
                            <span class="glyphicon glyphicon-log-in"></span> Login
                        </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        </div>
        <!-- /.container-fluid -->
    </nav>

    <section class="bg-primary" id="dettaglio-professionisti">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sx-12">
                    <div class="profile-bg">
                        <img src="@cover_image@" class="img-responsive">
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <!--<div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Dettaglio professionista di fiducia</h2>
                    <hr class="light">
                </div>
            </div>-->
            <div class="row cont-dettaglio blue">
                <div class="col-md-3 col-sm-4 col-xs-12">
                    <div class="left-side">
                        <div class="img-professionista text-center">
                            <img src="@profile_image@" class="img-responsive" alt="">
                        </div>
                        <div id="contact-info" class="contact-info collapse">
                            <ul class="list-unstyled">
			      @contact_info_html;noquote@
                            </ul>
                    	</div>	
                    </div>
				</div>
				<div class="col-md-9 col-sm-8 col-xs-12">
                    <div class="info-professionista">
                        <div class="nome-prof">
                            <h3>@nominativo@@verification_bar;noquote@</h3>
                            <ul class="list-unstyled">
                                <li class="professione-societa">
                                    <strong><span class="glyphicon glyphicon-briefcase"></span> Promotore Finanziario @societa_html@</strong>
                                </li>
                            </ul>
                        </div>
                        <div class="more-info">
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <a class="btn" href="#contact-info" data-toggle="collapse"><span class="fa fa-eye"></span> Visualizza i miei contatti</a>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <a href="#" class="btn launch-modal" data-modal-id="modal-chiedimi-contatto"><span class="fa fa-bullhorn"></span> Chiedimi di essere contattato</a>
                                </div>
                                <div class="col-xs-12">
                                    <a href="#" class="btn launch-modal" data-modal-id="modal-consulenza-personalizzata"><span class="fa fa fa-line-chart"></span> Vuoi una consulenza finanziaria personalizzata?</a>
                                </div> 
                            </div>
                        </div>
                        <ul class="list-unstyled">
                            <li class="dettaglio-competenza"><strong><span class="glyphicon glyphicon-pushpin"></span> Area di competenza:</strong>
                                <br>
                                @competenze_html;noquote@
                            </li>
			    @certificazioni_html;noquote@
			    <!--     <div class="col-sm-4 col-xs-12">
                                     <div class="cert-pfspecialist cert-pfspecialist-2015">
                                       <div class="img-pfspecialist-2015">
                                                <a href="#" class="launch-modal" data-modal-id="modal-cert-pfspecialist-2015">
                                                    <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                                                </a>
                                            </div>
                                            <div class="info-pfspecialist info-pfspecialist-2015">
                                                <a href="#" class="launch-modal" data-modal-id="modal-cert-pfspecialist-2015">
                                                    <span class="oro">
                                                    <span class="fa fa-circle"></span> 3
                                                    </span>
                                                    <span class="argento">
                                                        <span class="fa fa-circle"></span> 2
                                                    </span>
                                                    <span class="bronzo">
                                                        <span class="fa fa-circle"></span> 4
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-xs-12">
                                        <div class="cert-pfspecialist cert-pfspecialist-2014">
                                            <div class="img-pfspecialist-2014">
                                                <a href="#" class="launch-modal" data-modal-id="modal-cert-pfspecialist-2014">
                                                    <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                                                </a>
                                            </div>
                                            <div class="info-pfspecialist info-pfspecialist-2014">
                                                <a href="#" class="launch-modal" data-modal-id="modal-cert-pfspecialist-2014">
                                                    <span class="oro">
                                                    <span class="fa fa-circle"></span> 3
                                                    </span>
                                                    <span class="argento">
                                                        <span class="fa fa-circle"></span> 2
                                                    </span>
                                                    <span class="bronzo">
                                                        <span class="fa fa-circle"></span> 4
                                                    </span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>      -->
                            <li>
                              <strong><span class="fa fa-map-o"></span> Province di attività:</strong> @province@
                            </li>
			    @citazione_html;noquote@
			    @esperienza_html;noquote@
                            @clienti_html;noquote@ <!--
                            <li><span class="fa fa-money"></span> <strong>Patrimonio in gestione:</strong> 40 Milioni</li>-->
                        </ul>
                    </div>
                    <div class="descrizione-professionista">
		      <hr>
                      @attivita_html;noquote@
		       @esperienze_html;noquote@
                       @formazione_html;noquote@
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="footer">
        <div class="footer_b">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="footer_bottom">
                            <p class="text-block"> &copy; Copyright reserved to <span>PF Holding srl</span></p>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="footer_mid pull-right">
                            <ul class="social-contact list-inline">
                                <li> <a href="https://facebook.com/patrimoniaexpert"><i class="fa fa-facebook"></i></a></li>
                                <!--<li><a href="#"> <i class="fa fa-linkedin"></i></a></li>-->
                                <li> <a href="https://twitter.com/patrimoniaforum"><i class="fa fa-twitter"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>  

<!-- MODAL CHIEDIMI DI ESSERE CONTATTATO -->
<div class="modal fade" id="modal-chiedimi-contatto" tabindex="-1" role="dialog" aria-labelledby="modal-chiedimi-contatto-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-chiedimi-contatto-label">Come vuoi essere contattato?</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-6 col-xs-12">
                    <button type="button" class="btn chiedimi-contatto-btn-mail">Via Mail info@tuamail.it</button>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                    <button type="button" class="btn chiedimi-contatto-btn-tel">Via Telefono 1234567890</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- MODAL CONSULENZA FINANZIARIA -->
<div class="modal fade" id="modal-consulenza-personalizzata" tabindex="-1" role="dialog" aria-labelledby="modal-consulenza-personalizzata-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-consulenza-personalizzata-label">Scrivi la tua domanda per ricevere una consulenza personalizzata</h3>
            </div>
            <div class="modal-body">
                <form role="form" action="" method="post" class="consulenza-personalizzata-form">
                    <div class="form-group">
                        <label class="sr-only" for="form-consulenza-personalizzata">Scrivi qui la tua richiesta di consulenza finanziaria specifica</label>
                        <textarea name="form-consulenza-personalizzata" placeholder="Scrivi qui la tua richiesta di consulenza finanziaria specifica..." class="form-consulenza-personalizzata form-control" id="form-consulenza-personalizzata"></textarea>
                        <small>Inserisci qui la tua richiesta di consulenza finanziaria. Tieni presente che trattandosi di servizio di investimento prima di fornirti risposta il professionista potrebbe richiedrti una parcella di consulenza.</small>            
                    </div>
                    <button type="submit" class="btn">Invia richiesta!</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- MODAL cert-pfspecialist-2016 -->
<div class="modal fade" id="modal-cert-pfspecialist-2016" tabindex="-1" role="dialog" aria-labelledby="modal-cert-pfspecialist-2016-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-cert-pfspecialist-2016-label">PFAwards 2016</h3>
            </div>
            <div class="modal-body">   
                <div class="cert-pfspecialist-dettaglio">
                    <div id="dettaglio-oro" class="dettaglio-oro">
                        <h4><span class="fa fa-circle"></span> Oro</h4>
                        <div class="row">
                            <div class="col-sm-4 col-xs-6">
                                <img src="images/loghi-pfspecialist/2016/oro/2016Oro_ANALISIDIMERCATO.png" class="img-responsive" alt="">
                            </div>    
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>
                        </div>
                    </div>
                    <div id="dettaglio-argento" class="dettaglio-argento">
                        <h4><span class="fa fa-circle"></span> Argento</h4>
                        <div class="row">
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>    
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                        </div>
                    </div>
                    <div id="dettaglio-bronzo" class="dettaglio-bronzo">
                        <h4><span class="fa fa-circle"></span> Bronzo</h4>
                        <div class="row">
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>    
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- MODAL cert-pfspecialist-2015 -->
<div class="modal fade" id="modal-cert-pfspecialist-2015" tabindex="-1" role="dialog" aria-labelledby="modal-cert-pfspecialist-2015-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-cert-pfspecialist-2015-label">PFAwards 2015</h3>
            </div>
            <div class="modal-body">   
             <div class="cert-pfspecialist-dettaglio">
                   <div id="dettaglio-oro" class="dettaglio-oro">
                        <h4><span class="fa fa-circle"></span> Oro</h4>
                        <div class="row">
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>    
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                        </div>
                    </div>
                    <div id="dettaglio-argento" class="dettaglio-argento">
                        <h4><span class="fa fa-circle"></span> Argento</h4>
                        <div class="row">
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>    
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                        </div>
                    </div>
                    <div id="dettaglio-bronzo" class="dettaglio-bronzo">
                        <h4><span class="fa fa-circle"></span> Bronzo</h4>
                        <div class="row">
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>    
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- MODAL cert-pfspecialist-2014 -->
<div class="modal fade" id="modal-cert-pfspecialist-2014" tabindex="-1" role="dialog" aria-labelledby="modal-cert-pfspecialist-2014-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-cert-pfspecialist-2014-label">PFAwards 2014</h3>
            </div>
            <div class="modal-body">   
                <div class="cert-pfspecialist-dettaglio">
                    <div id="dettaglio-oro" class="dettaglio-oro">
                        <h4><span class="fa fa-circle"></span> Oro</h4>
                        <div class="row">
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>    
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                        </div>
                    </div>
                    <div id="dettaglio-argento" class="dettaglio-argento">
                        <h4><span class="fa fa-circle"></span> Argento</h4>
                        <div class="row">
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>    
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                        </div>
                    </div>
                    <div id="dettaglio-bronzo" class="dettaglio-bronzo">
                        <h4><span class="fa fa-circle"></span> Bronzo</h4>
                        <div class="row">
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>    
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                            <div class="col-sm-4 col-xs-6">
                                <img src="http://placehold.it/400x250" class="img-responsive" alt="">
                            </div>   
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- MODAL BETA dettaglio -->
<div class="modal fade" id="modal-beta" tabindex="-1" role="dialog" aria-labelledby="modal-beta-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="text-center">Benvenuto nella vetrina del Professionista <strong>VERSIONE <span class="yellow">BETA</span></strong></h3>
            </div>
            <div class="modal-body">   
                <p class="text-center">Alla release ufficiale sarai avvisato via E-Mail dell'apertura del servizio e potrai accedere alla tua Vetrina di dettaglio e modificarne ogni aspetto in prima persona.
                <br><br>
Al momento abbiamo inserito alcuni dati in nostro possesso a titolo esemplificativo.</p>    
            </div>
        </div>
    </div>
</div>


    <!-- jQuery -->
    <script src="/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/js/jquery.easing.min.js"></script>
    <script src="/js/jquery.fittext.js"></script>
    <script src="/js/wow.min.js"></script>
    <script src="/js/login.signup.js"></script>
    
    <!--[if lt IE 10]>
        <script src="js/placeholder.js"></script>
    <![endif]-->
    
    <!-- Custom Theme JavaScript -->
    <script src="/js/creative.js"></script>
    
<!--    <script type="text/javascript">
        $(window).load(function(){
            $('#modal-beta').modal('show');
        });
    </script>
-->
</body>

</html>
