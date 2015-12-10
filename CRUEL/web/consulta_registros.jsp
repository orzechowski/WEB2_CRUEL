    <%-- 
    Document   : consulta_registros
    Created on : Nov 21, 2015, 5:39:34 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Consulta de Atendentes</title>
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
        <c:if test="${l_registro == null}">]
            <jsp:forward page="ServAtendente?action=buscaRegistros" /> 
        </c:if>
        <script>
            $(document).on("click", "#editar", function () {
            var id = $(this).data("id");
            var lista_registros = [];
            <c:forEach var="registro" items="${l_registro}">
                var reg = {};
                reg.cpfColaborador = "<c:out value="${registro.cpfColaborador}" />";
                reg.dtHora = "<c:out value="${registro.dtHora}" />";
                reg.tpCliente = "<c:out value="${registro.tpCliente.descricao}" />";
                lista_registros.push(reg);
            </c:forEach>
            $(".modal-body #cpfColaborador").val(lista_registros[id].cpfColaborador);
            $(".modal-body #dtHora").val(lista_registros[id].dtHora);
            document.getElementById(lista_registros[id].tpCliente).selected = true;
            });
            $(document).on("click", "#excluir", function () {
            var id = $(this).data("id");
            var lista_registros = [];
            <c:forEach var="registro" items="${l_registro}">
                var reg = {};
                reg.dtHora = "<c:out value="${registro.dtHora}" />";
                lista_registros.push(reg);
            </c:forEach>
            $(".modal-body #dtHora").val(lista_registros[id].dtHora);
            });
        </script>   
        <!-- MODAL EDITAR REGISTRO-->
        <div id="editarRegistro" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Editar Ingredientes</h4>
                    </div>
                    <form class="form-horizontal" method="POST" action="Atendente?action=atualizarregistro">	    				
                        <div class="modal-body">
                            <div class="control-group">
                                <label class="control-label" for="nome">CPF Colaborador</label>
                                <div class="controls">
                                    <input id="cpfColaborador" name="cpfColaborador" class="form-control" disabled type="text">
                                </div>
                            </div> 				
                            <div class="control-group">
                                <label class="control-label" for="idTpCliente">Tipo de Cliente</label>
                                <select id="selectbasic" name="selectbasic" class="form-control">
                                    <option id="Professor" value="1">Professor</option>
                                    <option id="Servidor" value="2">Servidor</option>
                                    <option id="Aluno" value="3">Aluno</option>
                                    <option id="Visitante" value="4">Visitante</option>
                                </select>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="dtHora">Data/ Hora</label>
                                <div class="controls">
                                    <input id="dtHora" name="dtHora" class="form-control" disabled type="text">
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
        		<!-- MODAL Remover Registro-->
        <div id="excluirRegistro" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="POST" action="Atendente?action=excluiregistro">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                            <h4 class="modal-title" id="myModalLabel">Remover Registro</h4>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="dtHora" name="dtHora" value="" />
                            Tem certeza que deseja remover o Registro?
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerRegistro"><i class="glyphicon glyphicon-remove"> </i>
                            <span>Remover</span>
                            </button>
                            <button type="button" class="btn btn-" data-dismiss="modal">Cancelar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="container-fluid tudo"> 
            <div class="row meio">
                <div class=" col-md-12 col-lg-12 col-sm-12 conteudo">
                    <section class="panel-consulta">
                        <h1>Registros</h1>
                        <div class="panel-body">
                        <form class="form-inline well">
                            <legend>Filtro de Busca</legend>
                            <fieldset>
                                <div class="form-group">
                                    <label for="filtroCalendario1">Data: </label>
                                    <input type="date" class="form-control" id="filtroCalendario1" placeholder="31/01/2015">
                                </div>
                                <button type="submit" class="btn btn-default">Buscar</button>
                            </fieldset>
                        </form>
                        <div class="list-content">
                            <ul class="list-group">
                                <c:forEach var="r" items="${l_registro}" varStatus="loop">
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span><h3>${r.getTpCliente().descricao}</h3>
                                                <fmt:formatDate value="${r.getDtHora()}" type="both" /> - 
                                                <fmt:formatNumber value="${r.valorCobrado}" type="currency" />
                                            </span>
                                            <div class="pull-right hidden-phone">
                                                <button class="btn btn-success btn-sm" id="editar" data-toggle="modal" data-id="${loop.index}" data-target="#editarRegistro"><i class=" glyphicon glyphicon-pencil"></i>
                                                    <span>Editar</span>
                                                </button>
                                                <button class="btn btn-danger btn-sm" id="excluir" data-toggle="modal" data-id="${loop.index}" data-target="#excluirRegistro"><i class="glyphicon glyphicon-remove"></i>
                                                    <span>Remover</span>
                                                </button>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
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
