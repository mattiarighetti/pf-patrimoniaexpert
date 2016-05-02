<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard Professionisti - Vetrina di dettaglio - PatrimoniaExpert</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico">

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">
    <link rel="stylesheet" href="css/cropper.css" type="text/css">
  <link rel="stylesheet" href="css/summernote.css" type="text/css">

    <!-- Creative CSS -->
    <link rel="stylesheet" href="css/creative.css" type="text/css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css" type="text/css">
    <link rel="stylesheet" href="css/sticky-footer.css" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="logged-in">
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
                <a class="navbar-brand page-scroll" href="index">
                  <img src="images/logo-beta.png" class="img-responsive" alt="">
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="user">
                <ul class="nav navbar-nav navbar-right">
                  <li class="dropdown">
                        <a href="#" class="login-img dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                          <img src="@user_portrait@" class="img-responsive" alt="">
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="@user_dashlink@"><span class="glyphicon glyphicon-pencil"></span> Modifica</a></li>
                            <li><a href="logout"><span class="glyphicon glyphicon-off"></span> Esci</a></li>
                        </ul>
                    </li>
                </ul>
      </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right main-menu">
                    <li>
                        <a class="page-scroll" href="/">Trova professionista</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="/">Cerca eventi</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
    </div>
        </div>
        <!-- /.container-fluid -->
    </nav>
    <section id="dashboard" class="section-dashboard-professionisti-vetrina-dettaglio">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-4 col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                      <li><a href="dashboard-professionisti.html">Home</a></li>
                        <!--<li><a href="#risposte-aperte">Risposte aperte</a></li>
                        <li><a href="#risposte-date">Risposte date</a></li>-->
                        <li class="active"><a class="link-menu-vetrina-dettaglio" href="dashboard-professionisti-vetrina-dettaglio.html">Vetrina di dettaglio</a></li>
                        <li><a href="dashboard-professionisti-info-costi.html">Info costi</a></li>
                        <li><a href="dashboard-professionisti-modifica-account.html">Modifica account</a></li>
                    </ul>
                </div>
                <div class="col-xs-offset-4 col-xs-8 col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                  <div class="row">
                      <div class="col-xs-12">
                          <div class="cont-dash">

                              <div id="vetrina-dettaglio">
                                    <div class="col-xs-12">
                                        <h2 class="section-heading">Vetrina di dettaglio</h2>
                                        <p>Qui puoi modificare i tuoi dati visibili nella vetrina di dettaglio:</p>
                                        <formtemplate id="vetrina">
                                            <div class="form-group">
                                                <label for="form-telefono">Telefono</label>
                                                <formwidget id="form-telefono">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-fax">Fax</label>
                                                <formwidget id="form-fax">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-citta">Città</label>
                                                <formwidget id="form-citta">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-indirizzo">Indirizzo</label>
                                                <formwidget id="form-indirizzo">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-sito-web">Sito web</label>
                                                <formwidget id="form-sito-web">
                                            </div>
                                            <hr>
                                            <div class="form-group">
                                              <h4>Social:</h4>
                                                <label for="form-social-facebook">Social Facebook</label>
                                                <formwidget id="form-social-facebook">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-social-twitter">Social Twitter</label>
                                                <formwidget id="form-social-twitter">
                                            </div>  
                                            <div class="form-group">
                                                <label for="form-social-linkedin">Social Linkedin</label>
                                                <formwidget id="form-social-linkedin">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-social-google">Social Google+</label>
                                                <formwidget id="form-social-google">
                                            </div>
                                            <hr>
                                            <div class="cont-check-area-competenza">
                                                <h4>Area di competenza:</h4>
                                                <!--<div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-analisi" id="fancy-checkbox-analisi" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-analisi" class="btn btn-default">
                                                            <span class=""><img src="images/icons/analisi.png" class="img-responsive" alt=""/></span>
                                                            <span><img src="images/icons/analisi-gray.png" class="img-responsive" alt=""/></span>
                                                        </label>
                                                        <label for="fancy-checkbox-analisi" class="btn btn-default active">
                                                            Analisi di mercato
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-cliente" id="fancy-checkbox-cliente" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-cliente" class="btn btn-default">
                                                            <span class=""><img src="images/icons/cliente.png" class="img-responsive" alt=""/></span>
                                                            <span><img src="images/icons/cliente-gray.png" class="img-responsive" alt=""/></span>
                                                        </label>
                                                        <label for="fancy-checkbox-cliente" class="btn btn-default active">
                                                            Comprensione delle esigenze
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-famiglia" id="fancy-checkbox-famiglia" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-famiglia" class="btn btn-default">
                                                            <span class=""><img src="images/icons/famiglia.png" class="img-responsive" alt=""/></span>
                                                            <span><img src="images/icons/famiglia-gray.png" class="img-responsive" alt=""/></span>
                                                        </label>
                                                        <label for="fancy-checkbox-famiglia" class="btn btn-default active">
                                                            Consulenza alla famiglia
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-immobiliare" id="fancy-checkbox-immobiliare" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-immobiliare" class="btn btn-default">
                                                            <span class=""><img src="images/icons/immobiliare.png" class="img-responsive" alt=""/></span>
                                                            <span><img src="images/icons/immobiliare-gray.png" class="img-responsive" alt=""/></span>
                                                        </label>
                                                        <label for="fancy-checkbox-immobiliare" class="btn btn-default active">
                                                            Investimento immobiliare
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-impresa" id="fancy-checkbox-impresa" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-impresa" class="btn btn-default">
                                                            <span class=""><img src="images/icons/impresa.png" class="img-responsive" alt=""/></span>
                                                            <span><img src="images/icons/impresa-gray.png" class="img-responsive" alt=""/></span>
                                                        </label>
                                                        <label for="fancy-checkbox-impresa" class="btn btn-default active">
                                                            Consulenza all'impresa
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-patrimonio" id="fancy-checkbox-patrimonio" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-patrimonio" class="btn btn-default">
                                                            <span class=""><img src="images/icons/patrimonio.png" class="img-responsive" alt=""/></span>
                                                            <span><img src="images/icons/patrimonio-gray.png" class="img-responsive" alt=""/></span>
                                                        </label>
                                                        <label for="fancy-checkbox-patrimonio" class="btn btn-default active">
                                                            Tutela patrimoniale
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-pianificazione" id="fancy-checkbox-pianificazione" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-pianificazione" class="btn btn-default">
                                                            <span class=""><img src="images/icons/pianificazione.png" class="img-responsive" alt=""/></span>
                                                            <span><img src="images/icons/pianificazione-gray.png" class="img-responsive" alt=""/></span>
                                                        </label>
                                                        <label for="fancy-checkbox-pianificazione" class="btn btn-default active">
                                                            Pianificazione successoria
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-portafoglio" id="fancy-checkbox-portafoglio" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-portafoglio" class="btn btn-default">
                                                            <span class=""><img src="images/icons/portafoglio.png" class="img-responsive" alt=""/></span>
                                                            <span><img src="images/icons/portafoglio-gray.png" class="img-responsive" alt=""/></span>
                                                        </label>
                                                        <label for="fancy-checkbox-portafoglio" class="btn btn-default active">
                                                            Costruzione portafoglio
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-previdenza" id="fancy-checkbox-previdenza" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-previdenza" class="btn btn-default">
                                                            <span class=""><img src="images/icons/previdenza.png" class="img-responsive" alt=""/></span>
                                                            <span><img src="images/icons/previdenza-gray.png" class="img-responsive" alt=""/></span>
                                                        </label>
                                                        <label for="fancy-checkbox-previdenza" class="btn btn-default active">
                                                            Consulenza previdenziale
                                                        </label>
                                                    </div>
                                                </div>
                                          </div>-->
                                          <formwidget id="form-competenze">
                                            <hr>
                                            <div class="cont-check-certificazioni">
                                              <h4>Certificazioni PFSpecialist:</h4>
                                                <small>Le certificazioni PFSpecialist non sono inseribili, qualora si avesse certificazioni PFSpecialist inviare una mail a <a href="">info@pfspecialist.com</a></small>
                                                <h4>Altre Certificazioni:</h4>
                                                <!--<div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-pwc" id="fancy-checkbox-pwc" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-pwc" class="btn btn-default">
                                                            <span class="glyphicon glyphicon-ok"></span>
                                                            <span></span>
                                                        </label>
                                                        <label for="fancy-checkbox-pwc" class="btn btn-default active">
                                                            Pwc
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-efp" id="fancy-checkbox-efp" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-efp" class="btn btn-default">
                                                            <span class="glyphicon glyphicon-ok"></span>
                                                            <span></span>
                                                        </label>
                                                        <label for="fancy-checkbox-efp" class="btn btn-default active">
                                                            Efp
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-efa" id="fancy-checkbox-efa" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-efa" class="btn btn-default">
                                                            <span class="glyphicon glyphicon-ok"></span>
                                                            <span></span>
                                                        </label>
                                                        <label for="fancy-checkbox-efa" class="btn btn-default active">
                                                            Efa
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-defs" id="fancy-checkbox-defs" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-defs" class="btn btn-default">
                                                            <span class="glyphicon glyphicon-ok"></span>
                                                            <span></span>
                                                        </label>
                                                        <label for="fancy-checkbox-defs" class="btn btn-default active">
                                                            Defs
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="form-group check-area-competenza">
                                                    <input type="checkbox" name="fancy-checkbox-aipb" id="fancy-checkbox-aipb" autocomplete="off" />
                                                    <div class="btn-group">
                                                        <label for="fancy-checkbox-aipb" class="btn btn-default">
                                                            <span class="glyphicon glyphicon-ok"></span>
                                                            <span></span>
                                                        </label>
                                                        <label for="fancy-checkbox-aipb" class="btn btn-default active">
                                                            Aipb
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>-->
                                            <formwidget id="form-certificazioni">
                                            <hr>
                                            <div class="form-group">
                                                <label for="form-prov-att">Provincia di attività</label>
                                                <formwidget id="form-prov-att">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-citazione">La citazione in cui mi ritrovo</label>
                                                <formwidget id="form-citazione">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-esperienza">Anni di esperienza</label>
                                                <formwidget id="form-esperienza">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-clienti">Numero clienti</label>
                                                <formwidget id="form-clienti">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-patrimonio-gestito">Patrimonio in gestione</label>
                                                <formwidget id="form-patrimonio-gestito">
                                            </div>
                                            <hr>
                                            <h4>La mia attività</h4>
                                            <!--<textarea name="form-mia-attivita" placeholder="Scrivi qui la tua attività..." class="form-mia-attivita form-control" id="form-mia-attivita"></textarea>-->
                                            <!--<p>
                                              <button onclick="edit()" class="btn btn-primary" id="edit">Edit</button>
                        <button onclick="save()" class="btn btn-primary" id="save">Save</button>
                                            </p>-->
                                            <!--<div class="summernote">Hello world</div>-->
                                            <formwidget id="form-attivita"
                                            <hr>
                                            <h4>Esperienze professionali</h4>
                                            <!--<textarea name="form-esperienze-prof" placeholder="Scrivi qui le tue esperienze professionali..." class="form-esperienze-prof form-control" id="form-esperienze-prof"></textarea>-->
                                            <!--<div class="summernote">Hello world</div>-->
                                            <formwidget id="form-esperienze">
                                            <hr>
                                            <h4>Ultimi corsi di formazione frequentati</h4>
                                            <!--<textarea name="form-corsi-prof" placeholder="Scrivi qui i tuoi ultimi corsi di formazione frequentati..." class="form-corsi-prof form-control" id="form-corsi-prof"></textarea>-->
                                            <!--<div class="summernote">Hello world</div>-->
                                            <formwidget id="form-formazione">
                                           <hr>
                                           <button type="submit" class="btn modifica-vetrina">Modifica vetrina di dettaglio</button>
                                      </formtemplate>        
                                    </div>
                              </div>
                                        
                            </div>
                        </div>
                    </div>
                  <!--<div class="row no-gutter">
                      <div class="col-xs-12">
                            <section id="footer">
                                <div class="footer_b">
                                    <div class="container-fluid">
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
                                                        <!--<li> <a href="https://twitter.com/patrimoniaforum"><i class="fa fa-twitter"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>-->
                 </div>
      </div> 
    </div>
    </section>
<!--  <section id="footer">
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
                                <!--<li><a href="#"> <i class="fa fa-linkedin"></i></a></li>--
                                <li> <a href="https://twitter.com/patrimoniaforum"><i class="fa fa-twitter"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>-->
</div>
    
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/jquery.fittext.js"></script>
    <script src="js/wow.min.js"></script>
  <script src="js/login.signup.js"></script>
    <script src="js/cropper.js"></script>
    <script src="js/summernote.js"></script>
  
  <!--[if lt IE 10]>
    <script src="js/placeholder.js"></script>
  <![endif]-->
  
    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>

</body>

</html>
