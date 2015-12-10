<%-- 
    Document   : index
    Created on : Nov 21, 2015, 5:45:09 PM
    Author     : Allan
--%>

<%@page buffer="10000kb" autoFlush="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Gerente</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/datepicker.css">
        <link rel="stylesheet" href="css/cardapio.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/cardapio.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        
		<div class="container-fluid text-center tudo"> 
                    <div class="row meio">
                        <div class=" col-md-12 col-lg-12 col-sm-12 conteudo ">
                            <div id="cardapio-semana" class="row">
                                <div>
                                    <h3>Cardápio dos Próximos Dias</h3>
                                </div><br>
                                <c:if test="${l_cardapio == null}">
                                    <jsp:forward page="ServGerente?action=buscacardapio"/>
                                </c:if>
                                
                                <!-- INICIO REPETICAO CARDAPIO -->
                                
                                <c:forEach var="cardapio" items="${l_cardapio}">
                                    <c:if test="${cardapio.refeicao == 1}">
                                <table class="list-group">
                                    <tbody>
                                        <tr>
                                            <td class="not-active list-group-item lista-data">
                                                <p class="lista-dia"><c:out value="${cardapio.getDia()}"/></p>
                                                <p class="lista-mes"><c:out value="${cardapio.getMes()}"/></p>
                                            </td>
                                            <td width="45%">
                                                <a class="list-group-item">                                              
                                                    <strong>Almoço</strong>
                                                    <br><c:forEach var="ingrediente" items="${cardapio.listaIngredientes}">
                                                            <c:out value="${ingrediente.nome}"/>,
                                                        </c:forEach>
                                                </a>
                                            </td>
                                        </c:if>
                                            
                                        <c:if test="${cardapio.refeicao == 2}">
                                            <td width="45%">
                                                <a class="list-group-item">
                                                    <strong>Janta</strong>
                                                    <br><c:forEach var="ingrediente" items="${cardapio.listaIngredientes}">
                                                            <c:out value="${ingrediente.nome}"/>,
                                                        </c:forEach>

                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                        </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
		</div>
    </body>
</html>