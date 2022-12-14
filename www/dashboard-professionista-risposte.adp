<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" href="http://patrimoniaexpert.cloudapp.net/resources/acs-templating/forms.css" type="text/css" media="all">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard Professionisti - Domande - PatrimoniaExpert</title>

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
                        <a class="page-scroll" href="http://www.patrimoniaexpert.it/#trova-professionista">Trova professionista</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="http://www.patrimoniaexpert.it/#cerca-eventi">Cerca eventi</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        </div>
        <!-- /.container-fluid -->
    </nav>

    <section id="dashboard" class="section-dashboard-professionisti-info-costi">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-4 col-sm-3 col-md-2 sidebar">
                  <ul class="nav nav-sidebar">
                    <li><a href="dashboard-professionista">Home</a></li>
                        <!--<li><a href="#risposte-aperte">Risposte aperte</a></li>
                            <li><a href="#risposte-date">Risposte date</a></li>-->
			<li><a href="dashboard-professionista-domande">Domande aperte</a></li>
			<li class="active"><a href="dashboard-professionista-risposte">Storico risposte date</a></li>
                        <li><a class="link-menu-vetrina-dettaglio" href="dashboard-professionista-vetrina">Vetrina di dettaglio</a></li>
                        <li><a href="dashboard-professionista-infocosti">Info costi</a></li>
                        <li><a href="dashboard-professionista-modifica">Modifica account</a></li>
                  </ul>
                </div>
		<div class="col-xs-offset-4 col-xs-8 col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <div class="row">
                        <div class="col-xs-12">
                          <div class="cont-dash">
                            
                                <div id="info-costi">
                                  <div class="col-xs-12">
                                    <h2 class="section-heading">Storico risposte</h2>
                                        <br>
					@risposte_html;noquote@
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
<!--	<section id="footer">
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
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
	
	<!--[if lt IE 10]>
		<script src="js/placeholder.js"></script>
	<![endif]-->
	
    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>

</body>

</html>
