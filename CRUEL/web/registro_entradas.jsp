<%-- 
    Document   : registro_entradas
    Created on : Nov 21, 2015, 5:46:23 PM
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
        <%@include file="/WEB-INF/jspf/menu_atendente.jspf" %>
        
        <!-- MODAL EDITAR REGISTRO-->
          <div id="registrarEntrada" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Editar Registro</h4>
                    </div>
                    <div class="modal-body">
                        <h3>Aluno</h3>
                        <span><b>Valor:</b> R$ 1,30</span><br/>
                        <span><b>Entrada:</b> 24/10/2015 12:55:34</span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success">Salvar Alterações</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
          </div>
		<div class="container-fluid tudo"> 
			<div class="row meio">
				<div class=" col-md-12 col-lg-12 col-sm-12 conteudo">
				
                    <section class="panel-consulta">
                        <h1>Registrar Entrada</h1>
                        
                            <div class="row-fluid text-center">
                                <div class="col-md-4">
                                    <div class="well">
                                        <button class="btn btn-success btn-lg" data-toggle="modal" data-target="#registrarEntrada">Aluno</button>
                                    </div>
                                </div> 
                                <div class="col-md-4">
                                    <div class="well">
                                        <button class="btn btn-success btn-lg" data-toggle="modal" data-target="#registrarEntrada">Professor</button>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="well">
                                        <button class="btn btn-success btn-lg" data-toggle="modal" data-target="#registrarEntrada">Servidor</button>
                                    </div>
                                </div>
                                
                                <div class="col-md-4">
                                    <div class="well">
                                        <button class="btn btn-success btn-lg" data-toggle="modal" data-target="#registrarEntrada">Visitante</button>
                                    </div>
                                </div> 
                        
                            </div>

                    </section>
                    
				</div>
			</div>
		</div>
    </body>
</html>
