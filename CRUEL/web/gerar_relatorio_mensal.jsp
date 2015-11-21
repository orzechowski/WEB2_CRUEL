<%-- 
    Document   : gerar_relatorio_mensal
    Created on : Nov 21, 2015, 5:45:00 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
				
                    <section class="panel-consulta">
                              <h1>Relatório de Registros Mensal</h1>
                              <div class="panel-body">

                                <form class="form-horizontal well">
                                    <legend>Selecione o mês e o ano desejados:</legend>
                                    <fieldset>

                                    <div class="control-group col-md-6">
                                    <label class="control-label" for="selectAno">Ano:</label>
                                    <select id="selectbasic" name="selectAno" class="form-control">
                                        <option value="1">2015</option>
                                        <option value="2">2014</option>
                                        <option value="3">2013</option>
                                        <option value="4">2012</option>
                                    </select>
                                    </div>
                                    
                                    <div class="control-group col-md-6">
                                    <label class="control-label" for="selectMes">Mês</label>
                                    <select id="selectbasic" name="selectMes" class="form-control">
                                        <option value="1">Janeiro</option>
                                        <option value="2">Fevereiro</option>
                                        <option value="3">Março</option>
                                        <option value="4">Abril</option>
                                        <option value="5">Maio</option>
                                        <option value="6">Junho</option>
                                        <option value="7">Julho</option>
                                        <option value="8">Agosto</option>
                                        <option value="9">Setembro</option>
                                        <option value="10">Outubro</option>
                                        <option value="11">Novembro</option>
                                        <option value="12">Dezembro</option>
                                    </select>
                                    </div>
                                        
                                    <div class="control-group pull-right">
                                      <label class="control-label" for="submit"></label>
                                      <div class="controls">
                                        <button id="submit" name="submit" class="btn btn-success">Gerar Relatório</button>
                                      </div>
                                    </div>    
                                    </fieldset>
                                    
                                </form>
                              </div>
                          </section>
                    
				</div>
			</div>
		</div>
    </body>
</html>
