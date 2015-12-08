<%-- 
    Document   : consulta_tipos_ingredientes
    Created on : Nov 21, 2015, 5:39:53 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Consulta de Tipos de Ingredientes</title>
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
                        <h1>Tipo de Ingredientes</h1>
                        <div class="panel-body">
                            <div class="list-content">
                                <ul class="list-group">
                                    <c:if test="${l_tpingredientes == null}">
                                        <jsp:forward page="Nutricionista?action=buscatpingrediente" />
                                    </c:if>
                                    <!-- INICIO REPETICAO TIPO ITENS -->
                                    <c:forEach var="tpingrediente" items="${l_tpingredientes}" varStatus="loop">
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span><c:out value="${tpingrediente.descricao}"/></span>
                                        </div>
                                    </li>
                                    </c:forEach>
									<!-- FIM REPETICAO TIPO ITENS -->
                                </ul>
                            </div>
                        </div>
                    </section>    
		</div>
            </div>
	</div>
    </body>
</html>
