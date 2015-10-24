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
        <title><?php echo $nome_sistema; ?></title>
        <link rel="stylesheet" href="view/css/bootstrap.min.css">
        <link rel="stylesheet" href="view/css/login.css">
        <link rel="stylesheet" href="view/css/datepicker.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
        <ol class="breadcrumb">
  		<li><a href="index.php"><?php echo $nome_sistema; ?></a></li>
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
        	<?php include_once("view/view_facebook.php"); ?>


        </div>
      </div>
      <?php include_once("view/view_creditos.php"); ?>
    </div> 

    <script src="view/js/ie10-viewport-bug-workaround.js"></script>
  </body>
    </body>
</html>
