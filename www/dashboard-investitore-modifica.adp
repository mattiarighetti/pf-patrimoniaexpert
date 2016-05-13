<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="http://patrimoniaexpert.cloudapp.net/resources/acs-templating/forms.css" type="text/css" media="all">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard Investitori - Modifica Account - PatrimoniaExpert</title>

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
                        	<img src="images/default/user.jpg" class="img-responsive" alt="">
                            <span class="badge">4</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><span class="glyphicon glyphicon-off"></span> Esci</a></li>
                        </ul>
                    </li>
                </ul>
			</div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right main-menu">
                    <li>
                        <a href="http://patrimoniaexpert.it/#trova-professionista">Trova professionista</a>
                    </li>
                    <li>
                        <a href="http://patrimoniaexpert.it/#cerca-eventi">Cerca eventi</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
		</div>
        </div>
        <!-- /.container-fluid -->
    </nav>

    <section id="dashboard" class="section-dashboard-investitori">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-4 col-sm-3 col-md-2 sidebar">
                    <ul class="nav nav-sidebar">
                    	<li><a href="dashboard-investitore">Home</a></li>
                        <li><a href="domanda.html">Fai una domanda</a></li>
                        <li><a href="dashboard-investitore-domande">Storico domande</a></li>
                        <!--<li><a href="#guarda-risposte" data-toggle="tab">Guarda le risposte</a></li>
                        <li><a href="#rating" data-toggle="tab">Rating</a></li>
                        <li><a href="#e-mail-eventi" data-toggle="tab">E-Mail eventi</a></li>-->
                        <li><a href="ricerca">Cerca Professionista</a></li>
                        <li class="active"><a class="link-menu-modifica-account" href="dashboard-investitore-modifica">Modifica account</a></li>
                    </ul>
                </div>
                <div class="col-xs-offset-4 col-xs-8 col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                	<div class="row">
                    	<div class="col-xs-12">
                        	<div class="cont-dash">
                                
                            	<div id="modifica-account">
                                    <div class="col-xs-12">
                                        <h2 class="section-heading">Modifica Account</h2>
                                        <p>Qui puoi modificare i tuoi dati account:</p>
					<formtemplate id="modifica"></formtemplate>
                                        <!-- <form role="form" action="" method="post" class="modifica-account-investitori-form">
                                          <div class="form-group file-upload">
                                            	<span><strong>Immagine profilo:</strong></span>
                                                <br>
                                                <small>puoi caricare un file di max: 1MB</small>
                                        		<!--<input type="file" name="pic" accept="image/jpeg">--
                                                
                                                 <!-- Cropper User --
                                                  <div class="cropper-user">
                                                    <div class="row">
                                                      <div class="col-md-12">
                                                        <!-- <h3 class="page-header">Demo:</h3> --
                                                        <div class="img-container">
                                                          <img src="images/default/user.jpg" alt="Picture">
                                                        </div>
                                                      </div>
                                                    </div>
                                                    <div class="row">
                                                      <div class="col-md-12 docs-buttons">
                                                        <!-- <h3 class="page-header">Toolbar:</h3> --
                                                        <div class="btn-group">
                                                          <button class="btn btn-primary" data-method="zoom" data-option="0.1" type="button" title="Zoom In">
                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Zoom in">
                                                              <span class="icon icon-zoom-in"></span>
                                                            </span>
                                                          </button>
                                                          <button class="btn btn-primary" data-method="zoom" data-option="-0.1" type="button" title="Zoom Out">
                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Zoom out">
                                                              <span class="icon icon-zoom-out"></span>
                                                            </span>
                                                          </button>
                                                          <button class="btn btn-primary" data-method="rotate" data-option="-45" type="button" title="Rotate Left">
                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Ruota a sinistra">
                                                              <span class="icon icon-rotate-left"></span>
                                                            </span>
                                                          </button>
                                                          <button class="btn btn-primary" data-method="rotate" data-option="45" type="button" title="Rotate Right">
                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Ruota a destra">
                                                              <span class="icon icon-rotate-right"></span>
                                                            </span>
                                                          </button>
                                                        </div>
                                                
                                                        <div class="btn-group">
                                                          <button class="btn btn-primary" data-method="crop" type="button" title="Crop">
                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Ritaglia">
                                                              <span class="icon icon-ok"></span>
                                                            </span>
                                                          </button>
                                                          <button class="btn btn-primary" data-method="clear" type="button" title="Clear">
                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Annulla">
                                                              <span class="icon icon-remove"></span>
                                                            </span>
                                                          </button>
                                                          <button class="btn btn-primary" data-method="reset" type="button" title="Reset">
                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Reset">
                                                              <span class="icon icon-refresh"></span>
                                                            </span>
                                                          </button>
                                                          <label class="btn btn-primary btn-upload" for="inputImage" title="Upload image file">
                                                            <input class="sr-only" id="inputImage" name="file" type="file" accept="image/*">
                                                            <span class="docs-tooltip" data-toggle="tooltip" title="Importa immagine esistente">
                                                              <span class="icon icon-upload"></span>
                                                            </span>
                                                          </label>
                                                        </div>
                                                
                                                        <button class="btn btn-primary" data-method="getCroppedCanvas" type="button" data-option="{ &quot;width&quot;: 650, &quot;height&quot;: 650 }">
                                                          <span class="docs-tooltip">
                                                            Conferma ritaglio
                                                          </span>
                                                        </button>
                                                        
                                                        <!-- Show the cropped image in modal --
                                                        <div class="modal fade docs-cropped" id="getCroppedCanvasModal" aria-hidden="true" aria-labelledby="getCroppedCanvasTitle" role="dialog" tabindex="-1">
                                                          <div class="modal-dialog">
                                                            <div class="modal-content">
                                                              <div class="modal-header">
                                                                <button class="close" data-dismiss="modal" type="button" aria-hidden="true">×</button>
                                                                <h4 class="modal-title" id="getCroppedCanvasTitle">Cropped</h4>
                                                              </div>
                                                              <div class="modal-body">
                                                              </div>
                                                              <!-- <div class="modal-footer">
                                                                <button class="btn btn-primary" data-dismiss="modal" type="button">Close</button>
                                                              </div> --
                                                            </div>
                                                          </div>
                                                        </div><!-- /.modal --
                                                      </div><!-- /.docs-buttons --
                                                    </div>
													
                                                  </div>
                                                
                                                  <!-- Alert --
                                                  <div class="docs-alert"><span class="warning message"></span></div>
                                                  
                                            </div>         
                                            <div class="form-group">
                                                <label for="form-nome">Nome</label>
                                                <input type="text" name="form-nome" placeholder="Nome..." class="form-nome form-control" id="form-nome">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-cognome">Cognome</label>
                                                <input type="text" name="form-cognome" placeholder="Cognome..." class="form-cognome form-control" id="form-cognome">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-nickname">Nickname</label>
                                                <input type="text" name="form-nickname" placeholder="Nickname... nel caso volessi rispondere in modo anonimo alle domande..." class="form-nickname form-control" id="form-nickname">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-e-mail">E-Mail</label>
                                                <input type="text" name="form-e-mail" placeholder="E-Mail..." class="form-e-mail form-control" id="form-e-mail">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-cellulare">Cellulare</label>
                                                <input type="text" name="form-cellulare" placeholder="Cellulare..." class="form-cellulare form-control" id="form-cellulare">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-indirizzo">Indirizzo</label>
                                                <input type="text" name="form-indirizzo" placeholder="Indirizzo..." class="form-indirizzo form-control" id="form-indirizzo">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-provincia">Provincia di residenza</label>
                                                <input type="text" name="form-provincia" placeholder="Provincia di residenza..." class="form-provincia form-control" id="form-provincia">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-professione">Professione</label>
                                                <input type="text" name="form-professione" placeholder="Professione..." class="form-professione form-control" id="form-professione">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-password-old">Password attuale</label>
                                                <input type="text" name="form-password-old" placeholder="Password Attuale..." class="form-password-old form-control" id="form-password-old">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-password-new">Nuova Password</label>
                                                <input type="text" name="form-password-new" placeholder="Nuova Password..." class="form-password-new form-control" id="form-password-new">
                                            </div>
                                            <div class="form-group">
                                                <label for="form-password-new-conferma">Conferma Nuova Password</label>
                                                <input type="text" name="form-password-new-conferma" placeholder="Conferma Nuova Password..." class="form-password-new-conferma form-control" id="form-password-new-conferma">
                                            </div>
                                            <div class="form-group">
                                                <button type="submit" class="btn modifica-account"><span class="glyphicon glyphicon-pencil"></span> Modifica Account</button>
                                                <button type="submit" class="btn elimina-account danger"><span class="glyphicon glyphicon-trash"></span> Elimina Account</button>
                                            </div>
                                   		</form>    -->
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
                                <li> <a href="chi-siamo">Chi siamo</a></li>
                                <li> <a href="contattaci.html">Contattaci</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
