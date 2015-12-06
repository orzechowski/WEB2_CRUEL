<%-- 
    Document   : cadastro_tipo_cliente
    Created on : Nov 21, 2015, 5:26:58 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Cadastro Tipo Cliente</title>
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
                    <h1>Cadastro de Clientes</h1>
                    <div class="panel panel-success">
                        
                        <!--<div class="panel-heading">
                            <h3 class="panel-title">Cadastro de Clientes</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" method="POST" action="ServGerente?action=addtpcli">
                                <div class="control-group">
                                    <label class="control-label" for="nome">Nome de Registro</label>
                                    <div class="controls">
                                          <input id="nome" name="nome" class="form-control" required type="text">
                                    </div>
                                </div>   
                                <div class="control-group">
                                    <label class="control-label" for="valor">Valor de Entrada</label>
                                    <div class="controls">
                                        <input id="valor" name="valor" class="form-control" required type="text" placeholder="R$ 0,00">
                                    </div>
                                </div>
                                <div class="control-group pull-right">
                                    <label class="control-label" for="submit"></label>
                                    <div class="controls">
                                        <button id="submit" name="submit" class="btn btn-success">Cadastrar</button>
                                    </div>
                                </div>
                            </form>
                        </div> -->
                        <c:if test="${l_tpCliente == null}">
                            <jsp:forward page="ServGerente?action=buscatpcliente" />
                        </c:if>
                        <div class="list-content">
                                <ul class="list-group text-center" >
                                    <!-- INICIO REPETICAO FUNCIONARIOS -->
                                    <c:forEach var="tpCliente" items="${l_tpCliente}" >
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">               
                                            <div class="row">
						<div class="col-md-2 col-lg-2 col-sm-2">
                                                    <c:choose>
                                                        <c:when test="${tpCliente.ativo}">
                                                            <h4><span class="label label-success label-sm">Ativo</span></h4>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <h4><span class="label label-info label-sm">Inativo</span></h4>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    
						</div>
						<div class="col-md-5 col-lg-5 col-sm-5 ingrediente">
                                                    <span><c:out value="${tpCliente.descricao}" /></span>
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
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
