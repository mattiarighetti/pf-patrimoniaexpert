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
                <a class="navbar-brand" href="http://patrimoniaexpert.it">
                    <img src="images/logo-beta.png" class="img-responsive" alt="">
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="http://patrimoniaexpert.it/#trova-professionista">Trova professionista</a>
                    </li>
                    <li>
                        <a href="http://patrimoniaexpert.it/#cerca-eventi">Cerca eventi</a>
                    </li>
                    <li>
                        <a href="#" class="launch-modal" data-modal-id="modal-pre-register">
                            <span class="glyphicon glyphicon-user"></span> Sign Up
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
    <section class="signup" style="background:url('http://www.patrimoniaexpert.it/images/@backgroundimage@') no-repeat;background-size:100%;">
    <div class="row">
        <div class="modal" id="modal-pre-register">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="modal-login-label">Login</h3>
                <p>Entra nel mondo PatrimoniaExpert, accedi al tuo account.</p>
            </div>
            <div class="modal-body">
                <formtemplate id="login" role="form" action="" method="post" class="registration-form">
		  <center>
                    <font color="red"><b><formerror id="form-username"></formerror>
                    <formerror id="form-password"></formerror></b></font>
		  </center>
                  <div class="form-group">
                    <label class="sr-only" for="form-username">Username</label>
                    <formwidget id="form-username">
                  </div>
                  <div class="form-group">
                        <label class="sr-only" for="form-password">Password</label>
                        <formwidget id="form-password">
                  </div>
                  <div class="checkbox resta-collegato">
                    <label>
                      <formwidget id="persistent">Resta collegato
                            <br>
                            <small><a href="password-dimenticata.html" target="_blank">Hai dimenticato la password?</a></small>
                    </label>
                  </div>
		  <button class="btn" type="submit">Login!</button>
                </formtemplate>
            </div>
        </div>
    </div>
</div>
</div>
</section>
    
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

