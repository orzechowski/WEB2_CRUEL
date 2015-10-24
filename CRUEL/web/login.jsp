<%-- 
    Document   : login
    Created on : Oct 24, 2015, 11:52:23 AM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><!--<?php echo $nome_sistema; ?>--></title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="css/datepicker.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <a class="navbar-brand logo" href="index.php"></a>
              </div>
              <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                  <li class="active"><a href="#">Faça login para continuar <span class="sr-only">(current)</span></a></li>
                </ul>
              </div>
            </div>
        </nav>
        
        <div class="container">
            <ol class="breadcrumb">
                    <li><a href="index.php"><!--<?php echo $nome_sistema; ?>--></a></li>
                    <li class="active">Login</li>
            </ol>
            <h3>Login</h3>
            <div class="row">

                <div class="col-md-8">

                        <div class="panel panel-primary">

                          <div class="panel-heading">
                          <h3 class="panel-title">Login no Sistema</h3>
                          </div>

                          <div class="panel-body">
                              <form class="form-horizontal" method="POST" action="control/control_login.php">
                                  <div class="control-group">
                                      <label class="control-label" for="usuario">Usuário</label>
                                      <div class="controls">
                                          <input id="usuario" name="usuario" class="form-control" required type="text">
                                      </div>
                                  </div>

                                  <div class="control-group">
                                      <label class="control-label" for="senha">Senha</label>
                                      <div class="controls">
                                          <input id="senha" name="senha" class="form-control" required type="password">
                                      </div>
                                  </div>

                                  <div class="control-group">
                                      <label class="control-label" for="submit"></label>
                                      <div class="controls">
                                          <a href="inscricao.php" class="btn btn-default">Inscreva-se</a>
                                          <button id="submit" name="submit" class="btn btn-success">Entrar</button>
                                      </div>
                                  </div>
                              </form>
                          </div>
                        </div>
                </div>
                <div class="col-md-4">
                        <small>evento promovido por: </small>
                </div>
            </div>
        </div> 
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>
