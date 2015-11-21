<%-- 
    Document   : cadastro_tipo_ingrediente
    Created on : Nov 21, 2015, 5:27:12 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Cadastro de Tipo de Ingredientes</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/datepicker.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

		
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/menu_nutricionista.jspf" %>
		<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
		<div class="container-fluid tudo"> 
			<div class="row meio">
				<div class=" col-md-12 col-lg-12 col-sm-12 conteudo">
				
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Tipo de Ingrediente</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" method="POST" action=>
							<fieldset>
								<div class="control-group col-md-12">
								  <label class="control-label" for="nome">Nome do Tipo</label>
								  <div class="controls">
									<input id="nome" name="nome" class="form-control" required type="text" placeholder="Carne">
								  </div>
                                    
                                    <div class="control-group pull-right">
								  <label class="control-label" for="submit"></label>
								  <div class="controls">
									<button id="submit" name="submit" class="btn btn-success">Cadastrar</button>
								  </div>
								</div>
								</div> 
											
								
							</fieldset>	
							</form>
						</div>
					</div>				
				
				</div>
			</div>
		</div>
    </body>
</html>

