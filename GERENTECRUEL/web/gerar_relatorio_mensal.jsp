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
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        
		<div class="container-fluid tudo"> 
			<div class="row meio">
				<div class=" col-md-12 col-lg-12 col-sm-12 conteudo">
				
                    <section class="panel-consulta">
                              <h1>Relatório de Registros Mensal</h1>
                              <div class="panel-body">

                                <form class="form-horizontal well" method="POST" action="ServGerente?action=relatorioMensal">
                                    <legend>Selecione o mês e o ano desejados:</legend>
                                    <fieldset>

                                    <div class="control-group col-md-6">
                                    <label class="control-label" for="selectAno">Ano:</label>
                                    <select id="selectbasic" name="selectAno" class="form-control">
                                        <option value="2015">2015</option>
                                        <option value="2014">2014</option>
                                        <option value="2013">2013</option>
                                        <option value="2012">2012</option>
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
