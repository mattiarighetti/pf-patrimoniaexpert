<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Ricerca avanzata - PatrimoniaExpert</title>

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
                    	<a href="login">
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

    <section class="bg-primary" id="ricerca-avanzata">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Ricerca avanzata</h2>
                    <hr class="light">
                </div>
            </div>
	    <formtemplate id="ricerca">
            <div class="row search">
              <div class="col-md-4">
                <div class="form-group">
                  <label for="selCompetenza">Area di competenza</label>
                  <formwidget id="categoria"></formwidget>
                    </div>
                </div><!-- /.col-md-4 -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="selProvincia">Provincia</label>
                        <formwidget id="provincia"></formwidget>
                    </div>
                </div><!-- /.col-md-4 -->
                <div class="col-md-4">
                    <div class="form-group">
						<label for="form-societa">Società</label>
						<formwidget id="societa"></formwidget>
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
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="selStar">Rating Professionisti</label>
                        <select class="form-control" id="selStar">
                            <option>1 stella</option>
                            <option>2 stelle</option>
                            <option>3 stelle</option>
                            <option>4 stelle</option>
                            <option>5 stelle</option>
                        </select>
                    </div>
                </div><!-- /.col-md-4 -->  
                <div class="col-md-4">
                    <div class="form-group pf-specialist-select">
                        <label for="selPwc">Professionisti certificati PwC</label>
                        <select class="form-control" id="selPwc">
                            <option>No</option>
                            <option>Si</option>
                        </select>
                        <a href="" class="launch-modal" data-modal-id="modal-pwc"><small>Certificazione PwC?</small></a>
                    </div>
                </div><!-- /.col-md-4 --> 
                <div class="col-md-4">
                    <div class="form-group pf-specialist-select">
                        <label for="selEfpa">Professionisti certificati EFPA</label>
                        <select class="form-control" id="selPwc">
                            <option>No</option>
                            <option>EFP</option>
                            <option>EFA</option>
                            <option>DEFS</option>
                        </select>
                        <a href="" class="launch-modal" data-modal-id="modal-efpa"><small>Certificazione EFPA?</small></a>
                    </div>
                </div><!-- /.col-md-4 -->  
                <div class="col-md-4">
                    <div class="form-group pf-specialist-select">
                        <label for="selAipb">Professionisti certificati AIPB</label>
                        <select class="form-control" id="selAipb">
                            <option>No</option>
                            <option>Si</option>
                        </select>
                        <a href="" class="launch-modal" data-modal-id="modal-aipb"><small>Certificazione AIPB?</small></a>
                    </div>
                </div><!-- /.col-md-4 -->
                <div class="col-md-4">
                    <div class="form-group pf-specialist-select">
                        <label for="selAnasf">Professionisti iscritti ad associazioni?</label>
                        <select class="form-control" id="selAnasf">
                            <option>No</option>
                            <option>Anasf</option>
                            <option>Nafop</option>
                            <option>Ascosim</option>
                            <option>Anpib</option>
                            <option>Assiom Forex</option>
                        </select>
                        <!--<a href="" class="launch-modal" data-modal-id="modal-anasf"><small>ANASF?</small></a>-->
                    </div>
                </div><!-- /.col-md-4 -->
                <div class="col-md-4">
                    <button class="btn btn-default link-prof-search" type="submit"><span class="glyphicon glyphicon-search"></span> CERCA PROFESSIONISTA</button>
                </div><!-- /.col-md-4 -->              
            </div><!-- /.row -->

        </div>
</formtemplate>
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

<!-- MODAL CHI SONO I PFSPECIALIST -->
<div class="modal fade" id="modal-pfspecialist" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-register-label">Chi sono i PFSpecialist?</h3>
            </div>
            <div class="modal-body">   
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel est sed velit rhoncus pharetra quis eget enim. Mauris in dapibus velit. Cras tempus, est at elementum consectetur, libero eros viverra mi, in cursus justo turpis sit amet eros. Donec vitae felis massa. Duis ut neque et lorem feugiat elementum rhoncus quis massa. Cras in tincidunt lacus, vitae ultricies massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis vel dui at lectus dapibus tempor et scelerisque ligula. Ut hendrerit dictum dui vel dignissim. Suspendisse sit amet neque ut nunc tincidunt posuere nec tristique orci. Pellentesque gravida enim non nisl tempor lobortis. Nulla at lacus sem.</p>    
            </div>
        </div>
    </div>
</div>

<!-- MODAL CERTIFICAZIONE PWC -->
<div class="modal fade" id="modal-pwc" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-register-label">Certificazione PwC</h3>
            </div>
            <div class="modal-body">   
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel est sed velit rhoncus pharetra quis eget enim. Mauris in dapibus velit. Cras tempus, est at elementum consectetur, libero eros viverra mi, in cursus justo turpis sit amet eros. Donec vitae felis massa. Duis ut neque et lorem feugiat elementum rhoncus quis massa. Cras in tincidunt lacus, vitae ultricies massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis vel dui at lectus dapibus tempor et scelerisque ligula. Ut hendrerit dictum dui vel dignissim. Suspendisse sit amet neque ut nunc tincidunt posuere nec tristique orci. Pellentesque gravida enim non nisl tempor lobortis. Nulla at lacus sem.</p>    
            </div>
        </div>
    </div>
</div>

<!-- MODAL EFPA -->
<div class="modal fade" id="modal-efpa" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-register-label">Professionisti accreditati EFPA</h3>
            </div>
            <div class="modal-body"> 
            	<h4>EFP</h4> 
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel est sed velit rhoncus pharetra quis eget enim. Mauris in dapibus velit. Cras tempus, est at elementum consectetur, libero eros viverra mi, in cursus justo turpis sit amet eros. Donec vitae felis massa. Duis ut neque et lorem feugiat elementum rhoncus quis massa.</p>
            	<h4>EFA</h4> 
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel est sed velit rhoncus pharetra quis eget enim. Mauris in dapibus velit. Cras tempus, est at elementum consectetur, libero eros viverra mi, in cursus justo turpis sit amet eros. Donec vitae felis massa. Duis ut neque et lorem feugiat elementum rhoncus quis massa.</p>
            	<h4>DEFS</h4> 
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel est sed velit rhoncus pharetra quis eget enim. Mauris in dapibus velit. Cras tempus, est at elementum consectetur, libero eros viverra mi, in cursus justo turpis sit amet eros. Donec vitae felis massa. Duis ut neque et lorem feugiat elementum rhoncus quis massa.</p>
            </div>
        </div>
    </div>
</div>
>	
<!-- MODAL AIPB -->
<div class="modal fade" id="modal-aipb" tabindex="-1" role="dialog" aria-labelledby="modal-register-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                </button>
                <h3 class="modal-title" id="modal-register-label">Professionisti accreditati AIPB</h3>
            </div>
            <div class="modal-body">   
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel est sed velit rhoncus pharetra quis eget enim. Mauris in dapibus velit. Cras tempus, est at elementum consectetur, libero eros viverra mi, in cursus justo turpis sit amet eros. Donec vitae felis massa. Duis ut neque et lorem feugiat elementum rhoncus quis massa. Cras in tincidunt lacus, vitae ultricies massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis vel dui at lectus dapibus tempor et scelerisque ligula. Ut hendrerit dictum dui vel dignissim. Suspendisse sit amet neque ut nunc tincidunt posuere nec tristique orci. Pellentesque gravida enim non nisl tempor lobortis. Nulla at lacus sem.</p>    
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
	
	<!--[if lt IE 10]>
		<script src="js/placeholder.js"></script>
	<![endif]-->
	
    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>

</body>

</html>
