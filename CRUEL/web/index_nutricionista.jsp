<%-- 
    Document   : index_nutricionista
    Created on : Nov 21, 2015, 5:45:25 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page buffer="10000kb" autoFlush="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Nutricionista</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/datepicker.css">
	<link rel="stylesheet" href="css/calendario.css">
	<link rel="stylesheet" href="css/cardapio.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/moment.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/cardapio.min.js"></script>
        <script src="js/fullcalendar.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <c:if test="${listaIng == null}">
            <jsp:forward page="Nutricionista?action=carregaingrediente" />            
        </c:if>

        <script>
        $(document).ready(function(){
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();

            $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: ''
            },
            dayClick: function(date) {
                var dt = $.fullCalendar.formatDate(date, "MM-dd-yyyy"); // Pega a data clicada.
                var dtopen = $.fullCalendar.formatDate(date, "yyyy-MM-dd"); // Pega a data clicada.                

                $(this).attr("data-toggle", "modal");
                if (!document.getElementById("editarCardapio"+dtopen)) {
                    $("#testvalor").val(dt);
                    $(this).attr("data-target", "#editarCardapio");
                }else{
                    $("#testvalor"+dtopen).val(dt);
                    $(this).attr("data-target", "#editarCardapio"+dtopen);
                }
            },
            editable: true,
            events:[
                <c:forEach var="lst" items="${listaCar}">
                    <c:choose>
                        <c:when test="${lst.refeicao == 1}">
                            {title:'Almoço', start: '${lst.data}'},
                        </c:when>
                        <c:otherwise>
                            {title:'Janta', start: '${lst.data}'},
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
              ]
            });
        }); 
        </script>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
        <%@include file="/WEB-INF/jspf/modal_editar_cardapio.jspf" %>     
        <c:set var="lag" value="" />
        <c:forEach var="b" items="${listaCar}">
            <div id="editarCardapio${b.data}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                            <h4 class="modal-title" id="myModalLabel">Editar Cardápio</h4>
                            <input type="text" id="testvalor${b.data}" value="" /> 
                        </div>
                        <form id="almoco${b.data}" method="POST" action="Nutricionista?action=adicionarCardapio">
                            <div class="modal-almocojanta">
                                <div id="edit-almoco" class="edit-almoco">
                                    <p class="modal-title" id="myModalLabel">Almoço</p>                        
                                        Arroz:
                                        <div  class="btn-group"> 
                                            <select name="almoco_arroz">
                                                <option value="0">Arroz</option>
                                                <c:forEach var="ing" items="${listaIng}">
                                                    <c:if test="${b.getRefeicao() == 1}">
                                                        <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 1}">
                                                            <c:choose>
                                                                <c:when test="${fn:contains(b.getListaIngredientes(), ing.getIdIngrediente())}">
                                                                    <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    <br>
                                    Feijão:
                                    <div class="btn-group"> 
                                        <select name="almoco_feijao">
                                            <option value="0">Feijão</option>
                                            <c:forEach var="ing" items="${listaIng}">
                                                <c:if test="${b.getRefeicao() == 1}">
                                                    <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 2}">
                                                        <c:choose>
                                                            <c:when test="${fn:contains(b.getListaIngredientes(), ing.getIdIngrediente())}">
                                                                <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <br>
                                    Salada:
                                    <div class="btn-group"> 
                                        <select name="almoco_salada">
                                            <option value="0">Salada</option>
                                            <c:forEach var="ing" items="${listaIng}">
                                                <c:if test="${b.getRefeicao() == 1}">
                                                    <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 3}">
                                                        <c:choose>
                                                            <c:when test="${fn:contains(b.getListaIngredientes(), ing.getIdIngrediente())}">
                                                                <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <br>
                                    Carne:
                                    <div class="btn-group"> 
                                        <select name="almoco_carne">
                                            <option value="0">Carne</option>
                                            <c:forEach var="ing" items="${listaIng}">
                                                <c:if test="${b.getRefeicao() == 1}">
                                                    <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 4}">
                                                        <c:choose>
                                                            <c:when test="${fn:contains(b.getListaIngredientes(), ing.getIdIngrediente())}">
                                                                <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div>
                                        Acompanhamento:
                                        <div class="btn-group"> 
                                        <select name="almoco_acompanhamento">
                                            <option value="0">Acompanhamento</option>
                                                <c:forEach var="ing" items="${listaIng}">
                                                    <c:if test="${b.getRefeicao() == 1}">
                                                        <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 5}">
                                                            <c:choose>
                                                                <c:when test="${fn:contains(b.getListaIngredientes(), ing.getIdIngrediente())}">
                                                                    <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    Sobremesa:
                                    <div class="btn-group"> 
                                        <select name="almoco_sobremesa">
                                            <option value="0">Sobremesa</option>
                                            <c:forEach var="ing" items="${listaIng}">
                                                <c:if test="${b.getRefeicao() == 1}">
                                                    <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 6}">
                                                        <c:choose>
                                                            <c:when test="${fn:contains(b.getListaIngredientes(), ing.getIdIngrediente())}">
                                                                <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div id="edit-janta" class="edit-janta">
                                    <p class="modal-title" id="myModalLabel">Janta</p>
                                        Arroz:
                                        <div class="btn-group"> 
                                            <select name="janta_arroz">
                                                <option value="0">Arroz</option>
                                                <c:forEach var="ing" items="${listaIng}">
                                                    <c:if test="${b.getRefeicao() == 2}">
                                                        <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 1}">
                                                            <c:choose>
                                                                <c:when test="${fn:contains(b.getListaIngredientes(), ing.getIdIngrediente())}">
                                                                    <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    <br>
                                    Feijão:
                                    <div class="btn-group"> 
                                        <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Feijão
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="ing" items="${listaIng}">
                                                <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 2}">
                                                    <li id-data="${ing.getIdIngrediente()}"><a href="#"><c:out value="${ing.nome}" /></a></li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <br>
                                    Salada:
                                    <div class="btn-group"> 
                                        <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Salada
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="ing" items="${listaIng}">
                                                <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 3}">
                                                    <li id-data="${ing.getIdIngrediente()}"><a href="#"><c:out value="${ing.nome}" /></a></li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <br>
                                    Carne:
                                    <div class="btn-group"> 
                                        <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Carne
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="ing" items="${listaIng}">
                                                <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 4}">
                                                    <li id-data="${ing.getIdIngrediente()}"><a href="#"><c:out value="${ing.nome}" /></a></li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div>
                                        Acompanhamento:
                                        <div class="btn-group"> 
                                            <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Acompanhamento
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <c:forEach var="ing" items="${listaIng}">
                                                <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 5}">
                                                    <li id-data="${ing.getIdIngrediente()}"><a href="#"><c:out value="${ing.nome}" /></a></li>
                                                </c:if>
                                            </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                    Sobremesa:
                                    <div class="btn-group"> 
                                        <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Sobremesa
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <c:forEach var="ing" items="${listaIng}">
                                                <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 6}">
                                                    <li id-data="${ing.getIdIngrediente()}"><a href="#"><c:out value="${ing.nome}" /></a></li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success">Salvar Alterações</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- FIM MODAL DE EDIÇÃO DO CARDÁPIO -->
        </c:forEach>
        <div class="container-fluid text-center tudo"> 
            <div class="row meio">
                <div class=" col-md-12 col-lg-12 col-sm-12 conteudo ">                                    
                    <hr>
                    <div id="calendar"></div>                                                      
                </div>
            </div>
        </div>
    </body>
</html>