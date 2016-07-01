<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Contattaci - PatrimoniaExpert</title>

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
                <a class="navbar-brand page-scroll" href="index">
                	<img src="images/logo-beta.png" class="img-responsive" alt="">
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="index">Trova professionista</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="index">Cerca eventi</a>
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

    <section class="bg-primary" id="contattaci">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Contattaci</h2>
                    <hr class="light">
                </div>
            </div>
            <div class="row search blue">
              <div class="col-sm-offset-2 col-sm-8">
                <p>In questa sezione puoi contattarci per qualsiasi richiesta:</p>
		<formtemplate id="contattaci">
                        <div class="form-group">
                            <div class="error-message nome">Il campo <strong>nome</strong> è vuoto oppure contiene caratteri errati</div>
                            <label class="sr-only" for="form-nome">Nome</label>
                            <formwidget id="nome">
                        </div>
                        <div class="form-group">
                          <div class="error-message email">Il campo <strong>e-mail</strong> è vuoto oppure contiene caratteri errati</div>
                          <label class="sr-only" for="form-email">Email</label>
                            <formwidget id="email">
                        </div>
                        <div class="form-group">
                    		<formwidget id="messaggio">
                        </div>
                    	<button class="btn invia-contattaci" type="submit">Invia</button>
                    </formtemplate>
                </div><!-- /.col-md-8 -->            
            </div><!-- /.row -->
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
                            <ul class="menu-footer list-inline">
			      <li> <a href="news">News</a></li>
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