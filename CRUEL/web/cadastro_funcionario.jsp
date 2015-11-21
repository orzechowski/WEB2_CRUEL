<%-- 
    Document   : cadastro_funcionario
    Created on : Nov 21, 2015, 5:25:59 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Cadastro de Funcionário</title>
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
        <%@include file="/WEB-INF/jspf/menu_gerente.jspf" %>
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
							<h3 class="panel-title">Cadastro de Funcionário</h3>
						</div>
						<div class="panel-body">
							<form class="form-horizontal" method="POST" action=>
							
								<div class="control-group">
								  <label class="control-label" for="cargo">Cargo:</label>
								  <select class="controls" id="cargo" name="cargo">
									<option value="Atendente">Atendente</option>
									<option value="Nutricionista">Nutricionista</option>
									<option value="Gerente">Gerente</option>
								  </select>
								</div>
							
								<div class="control-group">
								  <label class="control-label" for="nome">Nome Completo</label>
								  <div class="controls">
									<input id="nome" name="nome" class="form-control" required type="text">
								  </div>
								</div>   
								
								<div class="control-group">
								  <label class="control-label" for="cpf">CPF</label>
								  <div class="controls">
									<input id="cpf" name="cpf" class="form-control" required type="text" placeholder="000.000.000-00">
								  </div>
								</div> 

								<div class="control-group">
								  <label class="control-label" for="senha">Senha</label>
								  <div class="controls">
									<input id="senha" name="senha" class="form-control" required type="password">
								  </div>
								</div>

								<div class="control-group" id="confirma_div">
								  <label class="control-label" for="senha">Confirmação de Senha</label>
								  <div class="controls">
									<input id="confirma_senha" name="confirma_senha" class="form-control" required type="password">
								  </div>
								</div> 
								
								<div class="control-group">
								  <label class="control-label" for="email">Email</label>
								  <div class="controls">
									<input id="email" name="email" class="form-control" required type="text">
								  </div>
								</div>

								<div class="control-group">
								  <label class="control-label" for="endereco">Endereço</label>
								  <div class="controls">
									<input id="endereco" name="endereco" class="form-control" required type="text">
								  </div>
								</div>   
								
								<div class="control-group">
								  <label class="control-label" for="telefone">Telefone</label>
								  <div class="controls">
									<input id="telefone" name="telefone" class="form-control" required type="text">
								  </div>
								</div> 
								
								<div class="control-group" id="crn_div">
								  <label class="control-label" for="crn">CRN</label>
								  <div class="controls">
									<input id="crn" name="crn" class="form-control" disabled type="text">
								  </div>
								</div>             

								<div class="control-group pull-right">
								  <label class="control-label" for="submit"></label>
								  <div class="controls">
									<button id="submit" name="submit" class="btn btn-success">Cadastrar</button>
								  </div>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript">
	
			$(document).ready(function(){
			$('#crn').attr('disabled','disabled');        
			$('select[name="cargo"]').on('change',function(){
			var  nutri = $(this).val();
				if(nutri == "Nutricionista"){           
					$('#crn').removeAttr('disabled');          
				}else{
					$('#crn').attr('disabled','disabled'); 
				}  
			  });
			});
		
		  $("#senha").change(function(){
			  $("#confirma_senha").val("");
			  $("#confirma_div").attr('class', 'control-group has-warning');
			  // 
		  });

		  $("#confirma_senha").change(function(){
			var pass = $("#senha").val();
			var conf = $("#confirma_senha").val();
			if (pass != conf) { alert("Senha n䯠confere."); }
		  });

		  $(document).ready(function() {        
			$('#usuario').keyup(username_check);
		  });       

    </script>
    <script src="view/js/ie10-viewport-bug-workaround.js">
	</script>	
    </body>
    </body>
</html>
