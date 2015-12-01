<%-- 
    Document   : consulta_funcionarios
    Created on : Nov 30, 2015, 7:02:50 PM
    Author     : orzechowski
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Consulta de Funcionários</title>
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
        <!-- MODAL EDITAR Funcionario-->
        <div id="editarFuncionario" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Editar Funcionário</h4>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                        <button type="button" class="btn btn-success">Salvar Alterações</button>
                    </div>
                </div>
            </div>
        </div>
		<!-- MODAL INATIVAR Funcionario-->
        <div id="inativarFuncionario" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Inativar Funcionário</h4>
                    </div>
                    <div class="modal-body">
                        Tem certeza que deseja desativar o Funcionário?
                    </div>
                    <div class="modal-footer">
			<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarGerente"><i class="glyphicon glyphicon-remove"></i>
                            <span>Desativar</span>
			</button>
                        <button type="button" class="btn btn-" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
	<div class="container-fluid tudo"> 
            <div class="row meio">
		<div class=" col-md-12 col-lg-12 col-sm-12 conteudo">
                    <section class="panel-consulta">
                        <h1>Funcionários</h1>
                        <div class="panel-body">
                            <form class="form-inline well" action="ServGerente?action=buscacolaborador" method="POST">
                                <legend>Filtro de Busca</legend>
                                <fieldset>
                                    <div class="form-group">
                                        <label for="filtroTexto1"> Nome / Email / CPF / CRN: </label>
                                        <input type="text" class="form-control" id="filtroTexto1" name="filtroColaborador" >
                                    </div>
                                    <button type="submit" class="btn btn-default">Buscar</button>
                                </fieldset>
                            </form>
                            <div class="list-content">
                                <ul class="list-group text-center" >
                                    <!-- INICIO REPETICAO FUNCIONARIOS -->
                                    <c:forEach var="colaborador" items="${l_colaboradores}" >
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">               
                                            <div class="row">
						<div class="col-md-2 col-lg-2 col-sm-2">
                                                    <h4><span class="label label-success label-sm"><c:out value="${colaborador.cargo.descricao}" /></span></h4>
						</div>
						<div class="col-md-5 col-lg-5 col-sm-5 ingrediente">
                                                    <span><c:out value="${colaborador.nome}" /></span>
						</div>
						<div class="col-md-2 col-lg-2 col-sm-2 ingrediente">
                                                    <span>
                                                        <c:choose>
                                                            <c:when test="${colaborador.ativo}">
                                                                Ativo
                                                            </c:when>
                                                            <c:otherwise>
                                                                Inativo
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </span>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-3 ingrediente">
                                                    <div class="pull-right hidden-phone">
							<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarFuncionario"><i class=" glyphicon glyphicon-pencil"></i>
                                                            <span>Editar</span>
							</button>
							<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerFuncionario"><i class="glyphicon glyphicon-remove"></i>
                                                            <span>Remover</span>
							</button>
                                                    </div>
						</div>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                <!-- FIM REPETICAO FUNCIONARIOS-->
                                </ul>
                            </div>
                            <div class=" add-task-row">
               <!-- <a class="btn btn-success btn-sm pull-left" href="#">Add New Tasks</a> -->
                                <a class="btn btn-default btn-sm pull-right" href="#">Exibir Mais</a>
                            </div>
                        </div>
                    </section>    
                </div>
            </div>
	</div>
    </body>
</html>