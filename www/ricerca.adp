<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Professionisti - PatrimoniaExpert</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">

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
                <a class="navbar-brand page-scroll" href="index">
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
                        <a class="page-scroll" href="http://www.patrimoniaexpert.it/#trova-professionista">Trova professionista</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="http://www.patrimoniaexpert.it/#cerca-eventi">Cerca eventi</a>
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
                        <a href="#" class="launch-modal" data-modal-id="modal-login">
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

    <section class="bg-primary" id="professionisti">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Elenco professionisti individuati</h2>
                    <hr class="light">
                </div>
            </div>
            <div class="row no-gutter">
                @vetrine_html;noquote@
                <!--<div class="col-md-3 col-sm-4">
                    <a href="dettaglio-professionisti.html" class="prof-box">
                        <img src="images/default/user.jpg" class="img-responsive" alt="">
                        <div class="prof-box-caption">
                            <div class="prof-box-caption-content">                                
                            	<div class="prof-name">
                                    Nome professionista
                                </div>
                            	<div class="prof-surname">
                                    Cognome professionista
                                </div>
                                <div class="prof-category text-faded">
                                    Area di competenza
                                    <div class="row">
                                    	<div class="col-xs-4">
                                        	<img src="images/icons/analisi.png" class="img-responsive" alt="">
                                        </div>
                                    	<div class="col-xs-4">
                                        	<img src="images/icons/cliente.png" class="img-responsive" alt="">
                                        </div>
                                    	<div class="col-xs-4">
                                        	<img src="images/icons/famiglia.png" class="img-responsive" alt="">
                                        </div>
                                    	<div class="col-xs-4">
                                        	<img src="images/icons/immobiliare.png" class="img-responsive" alt="">
                                        </div>
                                    	<div class="col-xs-4">
                                        	<img src="images/icons/impresa.png" class="img-responsive" alt="">
                                        </div>
                                    	<div class="col-xs-4">
                                        	<img src="images/icons/patrimonio.png" class="img-responsive" alt="">
                                        </div>
                                    	<div class="col-xs-4">
                                        	<img src="images/icons/pianificazione.png" class="img-responsive" alt="">
                                        </div>
                                    	<div class="col-xs-4">
                                        	<img src="images/icons/previdenza.png" class="img-responsive" alt="">
                                        </div>
                                    	<div class="col-xs-4">
                                        	<img src="images/icons/portafoglio.png" class="img-responsive" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>-->
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


	
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/jquery.fittext.js"></script>
    <script src="js/wow.min.js"></script>
	<script src="js/login.signup.js"></script>
	
	<!--[if lt IE 10]>
		<script src="js/placeholder.js"></script>
	<![endif]-->
	
    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>

</body>

</html>
