
<!--
NAVBAR HOME
-->
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Relatório Anual</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/datepicker.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                        <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand logo" href="index.jsp"></a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                                <ul class="nav navbar-nav navbar-right">
                                        <li class="active" data-toggle="modal" data-target="#loginModal"><a href="#">Faça login para continuar <span class="sr-only">(current)</span></a></li>
                                </ul>
                        </div>
                </div>
        </nav>
        <div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                        <div class="modal-content">
                                <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                                        <h1 class="text-center">Login</h1>
                                </div>
                                <div class="modal-body">
                                        <form class="form col-md-12 center-block">
                                                <div class="form-group">
                                                        <input type="text" class="form-control input-lg" placeholder="Email">
                                                </div>
                                                <div class="form-group">
                                                        <input type="password" class="form-control input-lg" placeholder="Senha">
                                                </div>
                                                <div class="form-group">
                                                        <button class="btn btn-primary btn-lg btn-block">Entrar</button>
                                                        <span class="pull-right"><a href="#">Esqueci minha senha</a></span>
                                                </div>
                                        </form>
                                </div>
                                <div class="modal-footer">
                                        <div class="col-md-12">
                                                <button class="btn" data-dismiss="modal" aria-hidden="true">Voltar</button>
                                        </div>	
                                </div>
                        </div>
                </div>
        </div>
    </body>
</html>