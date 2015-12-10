<%-- 
    Document   : cadastro_tipo_cliente
    Created on : Nov 21, 2015, 5:26:58 PM
    Author     : Allan
--%>
<%@page buffer="10000kb" autoFlush="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Cadastro Tipo Cliente</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/index.css">
        <script src="js/jquery.maskedinput.js" type="text/javascript"></script>
        <link rel="stylesheet" href="css/datepicker.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.maskMoney.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

		
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>	
        <script>
            $(document).on("click", "#editar", function () {
                var id = $(this).data("id");
                var lista_tpclientes = [];
                <c:forEach var="tpcliente" items="${l_tpCliente}">
                    var tpcli = {};
                    tpcli.descricao = "<c:out value="${tpcliente.descricao}" />";
                    tpcli.valor = <c:out value="${tpcliente.valor}" />;
                    lista_tpclientes.push(tpcli);
                </c:forEach>
                $(".modal-body #descricao").val(lista_tpclientes[id].descricao);
                var numvalor = lista_tpclientes[id].valor;
                numvalor.toFixed(2);
                $(".modal-body #valor").val(lista_tpclientes[id].valor.toFixed(2));
            });  
            </script>
        <div id="editarTpCliente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Editar Tipo de Cliente</h4>
                    </div>
                    <form class="form-horizontal" method="POST" action="ServGerente?action=atualizarTpCliente">
                        <div class="modal-body">
                            <div class="control-group">
                                <label class="control-label" for="tipo">Tipo</label>
                                <input id="descricao" name="descricao" class="form-control" type="text" value="">
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="valor">Valor - R$</label>
                                <div class="controls">
                                    <input id="valor" name="valor" class="form-control" type="text">
                                    <script type="text/javascript"> $("#valor").maskMoney({showSymbol:true, symbol:"R$", decimal:",", thousands:""});</script>
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
        <div class="container-fluid tudo"> 
            <div class="row meio">
                <div class=" col-md-12 col-lg-12 col-sm-12 conteudo">
                    <h1>Tipos de Clientes</h1>
                    <div class="panel panel-success">
                        <c:if test="${l_tpCliente == null}">
                            <jsp:forward page="ServGerente?action=buscatpcliente" />
                        </c:if>
                        <div class="list-content">
                                <ul class="list-group text-center" >
                                    <!-- INICIO REPETICAO FUNCIONARIOS -->
                                    <c:forEach var="tpCliente" items="${l_tpCliente}" varStatus="loop" >
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">               
                                            <div class="row">
						<div class="col-md-6 col-lg-6 col-sm-6 ingrediente">
                                                    <span><c:out value="${tpCliente.descricao}" /></span>
						</div>
						<div class="col-md-5 col-lg-5 col-sm-5 ingrediente">
                                                    <span>
                                                        <fmt:formatNumber value="${tpCliente.valor}" type="currency" />
                                                    </span>
  						</div>
						<div class="col-md-1 col-lg-1 col-sm-1 ingrediente">
                                                    <div class="pull-right hidden-phone">
							<button class="btn btn-success btn-sm" id="editar" data-toggle="modal" data-target="#editarTpCliente" data-id="${loop.index}"><i class=" glyphicon glyphicon-pencil"></i>
                                                            <span>Editar</span>
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
                    </div>

                </div>
            </div>
        </div>
    </body>
    
</html>
