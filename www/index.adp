<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PatrimoniaExpert</title>
    
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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body <if @user_loggedin@ eq 1>id="logged-in"</if><else>id="page-top"</else>>
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
                <a class="navbar-brand page-scroll" href="#page-top">
                    <img src="images/logo-beta.png" class="img-responsive" alt="">
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <if @user_loggedin@ eq 1>
                <div class="user">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                      <a href="#" class="login-img dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <img src="@user_portrait@" class="img-responsive" alt="">
                        </a>
                      <ul class="dropdown-menu">
			<li><a href="@user_dashlink@"><span class="glyphicon glyphicon-pencil"></span> Modifica</a></li>
                        <li><a href="/logout"><span class="glyphicon glyphicon-off"></span> Esci</a></li>
                      </ul>
                    </li>
                </ul>
            </div>
            </if>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#trova-professionista">Trova professionista</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#cerca-eventi">Cerca eventi</a>
                    </li>
                    <if @user_loggedin@ ne 1>
                    <li>
                        <a href="#" class="launch-modal" data-modal-id="modal-pre-register">
                            <span class="glyphicon glyphicon-user"></span> Registrati
                        </a>
                    </li>
                    <li>
                        <!--ORIGINAL--<a href="#" class="launch-modal" data-modal-id="modal-login">
                            <span class="glyphicon glyphicon-log-in"></span> Login
                        </a>-->
                        <a href="login">
                            <span class="glyphicon glyphicon-log-in"></span> Login
                        </a>
                    </li>
                </if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header style="background-image:url('http://www.patrimoniaexpert.it/images/@backgroundimage@');">
        <div class="header-content">
            <div class="header-content-inner">
                <div class="row">
                    <!--ORIGINAL--<h1><span>PatrimoniaExpert</span></h1>-->
                    <h1>
                        <span>PatrimoniaExpert</span>
                    </h1>
                    <hr>
                    <p>Il primo e unico portale dedicato all'incontro<br>
                    tra offerta e domanda di consulenza qualificata in Italia</p>
                </div>
                <div class="row">
		  <formtemplate id="fast-question">
                  <div class="col-md-8 col-md-offset-2">
                    <div class="input-group">
		      <formwidget id="domanda">
		      <!-- <input type="text" class="form-control" placeholder="Fai subito la tua domanda agli esperti!">-->
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">Invia</button>
                      </span>
		    </div><!-- /input-group -->
                    <a href="#" class="launch-modal domanda-faq" data-modal-id="modal-domanda-faq"><small>Come funziona?</small></a>
		    
		    <br><font color="red"><b><formerror id="domanda"></formerror></b></font>

		  </div><!-- /.col-lg-6 -->
		  
		  </formtemplate>
                </div><!-- /.row -->
            </div>
        </div>
    </header>

    <section class="bg-primary" id="trova-professionista">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Trova il miglior consulente in Italia nella gestione del tuo patrimonio</h2>
                    <h4>Selezionale per area consulenziale di tuo interesse e provincia di attività</h4>
                    <hr class="light">
                </div>
            </div>
            <formtemplate id="ricerca">
            <div class="row search">
				<div class="col-xs-12">
					<p class="blue"><small><strong>I campi con (*) sono obbligatori</strong></small></p>
				</div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="selCompetenza">Area di competenza*</label>
                        <formwidget id="selCompetenza">
                        <!--<select class="form-control" id="selCompetenza">@selCompetenza_options;noquote</select>-->
                    </div>
                </div><!-- /.col-md-4 -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="selProvincia">Provincia*</label>
                        <formwidget id="selProvincia">
                        <!--<select class="form-control" id="selProvincia">@selProvincia_options;noquote</select>-->
                    </div>
                </div><!-- /.col-md-4 -->
                <div class="col-md-4">
					<div class="form-group">
						<label for="form-societa">Società</label>
                        <formwidget id="selSocieta">
						<!--<select class="form-control" id="selSocieta">@selSocieta_options;noquote</select>-->
					</div>
                </div><!-- /.col-md-4 -->
                <div class="col-md-4">
                    <div class="form-group pf-specialist-select">
                        <label for="selSpecialist">Scegli solo tra i PFSpecialist</label>
                        <select class="form-control" id="selSpecialist">
                            <option>No</option>
                            <option>Si</option>
                        </select>
                        <a href="" class="launch-modal" data-modal-id="modal-pfspecialist"><small>Chi sono i PFSpecialist?</small></a>
                    </div>
                </div><!-- /.col-md-4 -->
                <div class="col-md-4">
                    <a class="btn btn-default link-prof-search" href="javascript:{}" onClick="document.getElementById('ricerca').submit();">
                        <span class="glyphicon glyphicon-search"></span> CERCA PROFESSIONISTA
                    </a>
                </div><!-- /.col-md-4 -->      
                <div class="col-md-4">
                    <a href="#" class="launch-modal blue ricerca-avanzata-btn advanced-search" data-modal-id="modal-beta"><span class="glyphicon glyphicon-wrench"></span> RICERCA AVANZATA</a>
                </div><!-- /.col-md-4 -->          
            </div><!-- /.row -->
        </formtemplate>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Ecco le vetrine dei professionisti selezionate per te</h2>
                    <hr class="light">
                </div>
            </div>
            <div class="row no-gutter">
                @vetrine_html;noquote@
            </div>
       </div>
    </section>
<section id="cerca-eventi" class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>Iscriviti gratuitamente ai prossimi eventi educational</h2>
                <hr class="light">
            </div>
            <div class="row container">
			
                <div class="col-xs-12">
                    <div class="citta">
                        <h3>Firenze - 07/06/2016</h3>
                    </div>
                </div>
				<div class="col-sm-6 col-md-6 col-xs-12">
					<a target="_blank" href="#">
						<img src="http://images.professionefinanza.com/pfexpo/mifid II-firenze.jpg" class="img-responsive">
					</a>
				</div>
				<div class="col-sm-6 col-md-6 col-xs-12">
					<a target="_blank" href="#">
						<img src="http://images.professionefinanza.com/pfexpo/marella-firenze.jpg" class="img-responsive">
					</a>
				</div>
				<div class="col-sm-6 col-md-6 col-xs-12">
					<div class="event-img">
						<a target="_blank" href="#">
							<img src="http://images.professionefinanza.com/pfexpo/impresa-firenze.jpg" class="img-responsive">
						</a>
					</div>
				</div>
				<div class="col-sm-6 col-md-6 col-xs-12">
					<div class="event-img">
						<a target="_blank" href="#">
							<img src="http://images.professionefinanza.com/pfexpo/bail-in-firenze.jpg" class="img-responsive">
						</a>
					</div>		
				</div>
                <div class="col-xs-12">
                    <div class="citta">
                        <h3>Milano - 08/04/2016</h3>
						<h4 class="blue text-center"><strong>Come proteggere oggi il proprio patrimonio tra Bail-In, volatilità dei mercati e investimenti immobiliari</strong></h4>
						<p class="blue text-center"><small>RELATORI: Fabrizio Vedana - Fabrizio Crespi - Paola Marella</small></p>
						<br>
                    </div>
                </div>
                <div class="col-sm-12 col-md-8 col-md-offset-2">
                    <div>
                        <a href="http://www.salonedelrisparmio.com" target="_blank">
                            <img src="images/salone-del-risparmio.gif" class="img-responsive">  
                        </a>
                    </div>
                </div>
				
            </div>
        </div>
    </section>
    <!-- LUCA -->
    <section id="blog" class="bg-primary">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Dicono Di Noi</h2>
                    <hr class="light">
                </div>
            </div>
	    @newsfeed_html;noquote@
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
                            <ul class="menu-footer list-inline">
                                <li> <a href="chi-siamo.html">Chi siamo</a></li>
                                <li> <a href="contattaci.html">Contattaci</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- MODAL PRE-REGISTRATION -->
<div class="modal fade" id="modal-pre-register" tabindex="-1" role="dialog" aria-labelledby="modal-pre-register-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-pre-register-label">Seleziona il tuo profilo</h3>
                <p><strong>Investitore:</strong><br>
                Sei alla ricerca di una consulenza qualificata per la gestione del tuo patrimonio? Iscriviti come Investitore</p>
                <p><strong>Professionista:</strong><br>
                Sei un consulente qualificato nella gestione del patrimonio? Iscriviti come Professionista e potrai mettere in luce le tue competenze</p>
            </div>
            <div class="modal-body"> 
              <div class="row"> 
                    <ul class="nav nav-pills">
                        <li class="btnInvestitore"><a href="signup-investitori"><span class="fa fa-user"></span> Investitore</a></li>
                        <li class="btnProfessionista"><a href="signup-professionisti"><span class="glyphicon glyphicon-briefcase"></span> Professionista</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane" id="tabInvestitore">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title" id="modal-pre-register-label"><span class="fa fa-user"></span> Iscriviti ora come investitore</h3>
                                    <p>Compila il form sottostante e ottieni l'accesso immediato:<br>
                                    <small><strong>I campi con (*) sono obbligatori</strong></small>
                                    </p>
                                </div>
                                <div class="modal-body">
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabProfessionista">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title" id="modal-pre-register-label"><span class="glyphicon glyphicon-briefcase"></span> Iscriviti ora come professionista finanziario</h3>
                                    <p>Compila il form sottostante e ottieni l'accesso immediato:<br>
                                    <small><strong>I campi con (*) sono obbligatori</strong></small></p>
                                </div>
                                <div class="modal-body">
                                 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- MODAL DOMANDA FAQ -->
<div class="modal fade" id="modal-domanda-faq" tabindex="-1" role="dialog" aria-labelledby="modal-domanda-faq-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-domanda-faq-label">Come funziona?</h3>
            </div>
            <div class="modal-body">   
                <p>La domanda sarà valutata da un nostro moderatore che la girerà a tutti i professionisti esperti nell’area consulenziale di riferimento. Potrai fare questa prima domanda in modo assolutamente gratuito e troverai le varie risposte fornite dai professionisti nella tua area utente personale. Domande e risposte non saranno mai rese pubbliche.</p>    
            </div>
        </div>
    </div>
</div>
<!-- MODAL CHI SONO I PFSPECIALIST -->
<div class="modal fade" id="modal-pfspecialist" tabindex="-1" role="dialog" aria-labelledby="modal-pfspecialist-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-pfspecialist-label">Chi sono i PFSpecialist?</h3>
            </div>
            <div class="modal-body">   
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel est sed velit rhoncus pharetra quis eget enim. Mauris in dapibus velit. Cras tempus, est at elementum consectetur, libero eros viverra mi, in cursus justo turpis sit amet eros. Donec vitae felis massa. Duis ut neque et lorem feugiat elementum rhoncus quis massa. Cras in tincidunt lacus, vitae ultricies massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis vel dui at lectus dapibus tempor et scelerisque ligula. Ut hendrerit dictum dui vel dignissim. Suspendisse sit amet neque ut nunc tincidunt posuere nec tristique orci. Pellentesque gravida enim non nisl tempor lobortis. Nulla at lacus sem.</p>    
            </div>
        </div>
    </div>
</div>

<!-- MODAL BETA -->
<div class="modal fade" id="modal-beta" tabindex="-1" role="dialog" aria-labelledby="modal-beta-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
            </div>
            <div class="modal-body">   
                <p class="text-center">Non ancora disponibile in <strong>VERSIONE <span class="yellow">BETA</span></strong></p>    
            </div>
        </div>
    </div>
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
