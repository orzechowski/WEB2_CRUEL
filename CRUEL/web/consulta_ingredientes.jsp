<%-- 
    Document   : consulta_ingredientes
    Created on : Nov 21, 2015, 5:38:54 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Consulta de Ingredientes</title>
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
        <script>
            $(document).on("click", "#editar", function () {
            var id = $(this).data("id");
            var lista_ingredientes = [];
            <c:forEach var="ingrediente" items="${l_ingredientes}">
                var ingrediente = {};
                ingrediente.nome = "<c:out value="${ingrediente.nome}" />";
                ingrediente.descricao = "<c:out value="${ingrediente.descricao}" />";
                ingrediente.tp_ingrediente = "<c:out value="${ingrediente.tipoIngrediente.descricao}" />";
                lista_ingredientes.push(ingrediente);
            </c:forEach>
            $(".modal-body #nome").val(lista_ingredientes[id].nome);
            $(".modal-body #descricao").val(lista_ingredientes[id].descricao);
            document.getElementById(lista_ingredientes[id].tp_ingrediente).selected = true;
            });
        </script>
        <!-- MODAL EDITAR Ingrediente-->
        <div id="editarIngrediente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Editar Ingredientes</h4>
                    </div>
                    <form class="form-horizontal" method="POST" action="Nutricionista?action=atualizaringrediente">	    				
                        <div class="modal-body">
                            <div class="control-group">
                                <label class="control-label" for="nome">Nome</label>
                                <div class="controls">
                                    <input id="nome" name="nome" class="form-control" required type="text">
                                </div>
                            </div> 				
                            <div class="control-group">
                                <label class="control-label" for="tipoIngrediente">Tipo de Ingrediente</label>
                                <select id="selectbasic" name="selectbasic" class="form-control">
                                    <option id="Arroz" value="1">Arroz</option>
                                    <option id="Feijao" value="2">Feijão</option>
                                    <option id="Salada" value="3">Salada</option>
                                    <option id="Carne" value="4">Carne</option>
                                    <option id="Acompanhamento" value="5">Acompanhamento</option>
                                    <option id="Sobremesa" value="6">Sobremesa</option>
                                </select>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nome">Descrição</label>
                                <div class="controls">
                                    <input id="descricao" name="descricao" class="form-control" required type="text">
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                            <button id="submit" name="submit" class="btn btn-success">Salvar Alterações</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
		<!-- MODAL Remover Ingrediente-->
        <div id="removerIngrediente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <form method="POST" action="Nutricionista?action=ingrediente">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Remover Ingrediente</h4>
                    </div>
                    <div class="modal-body">
                        Tem certeza que deseja remover o Ingrediente?
                    </div>
                    <div class="modal-footer">
			<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerIngrediente"><i class="glyphicon glyphicon-remove"> </i>
			<span>Remover</span>
			</button>
                        <button type="button" class="btn btn-" data-dismiss="modal">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
	<div class="container-fluid tudo"> 
            <div class="row meio">
		<div class="col-md-12 col-lg-12 col-sm-12 conteudo">
                    <section class="panel-consulta">
                        <h1>Ingredientes</h1>
                        <div class="panel-body">
                            <form class="form-inline well" action="Nutricionista?action=buscaingrediente" method="POST">
                                <legend>Filtro de Busca</legend>
                                <fieldset>
                                    <div class="form-group">
                                        <label for="filtroTexto1"> Nome / Tipo: </label>
                                        <input type="text" class="form-control" id="filtroTexto1" name="filtroIngrediente">
                                    </div>
                                    <button type="submit" class="btn btn-default">Buscar</button>
                                </fieldset>
                            </form>
                            <div class="list-content">
                                <ul class="list-group text-center" >
                                    <!-- REPETIR COM A LISTA DE INGREDIENTES -->
                                    <c:forEach var="ingrediente" items="${l_ingredientes}" varStatus="loop" >
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">               
                                            <div class="row">
						<div class="col-md-2 col-lg-2 col-sm-2">
                                                    <h4><span class="label label-success label-sm"><c:out value="${ingrediente.tipoIngrediente.descricao}" /></span></h4>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-3 ingrediente">
                                                    <span><c:out value="${ingrediente.nome}"/></span>
						</div>
						<div class="col-md-4 col-lg-4 col-sm-4 ingrediente">
                                                    <span><c:out value="${ingrediente.descricao}" /></span>
						</div>
						<div class="col-md-3 col-lg-3 col-sm-3 ingrediente">
                                                    <div class="pull-right hidden-phone">
							<button class="btn btn-success btn-sm" id="editar" data-toggle="modal" data-target="#editarIngrediente" data-id="${loop.index}"><i class=" glyphicon glyphicon-pencil"></i>
                                                            <span>Editar</span>
							</button>
							<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerIngrediente"><i class="glyphicon glyphicon-remove"></i>
                                                            <span>Remover</span>
							</button>
                                                    </div>
						</div>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                    <!-- FIM REPETICAO INGREDIENTES -->
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
