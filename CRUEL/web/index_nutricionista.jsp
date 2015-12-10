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
        function dismiss_window(nome){
            $("#"+nome).fadeOut();
        }
        
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
                var dt = $.fullCalendar.formatDate(date, "yyyy-MM-dd"); // Pega a data clicada.
                var dtopen = $.fullCalendar.formatDate(date, "dd/MM/yyyy"); // Pega a data clicada.                
                
                if((document.getElementById("editarCardapio"+dt+"-1") === null) && (document.getElementById("editarCardapio"+dt+"-2") === null)){
                    $("#nova_dt_refeicao").val(dtopen);
                    $(this).attr("data-toggle", "modal");
                    $(this).attr("data-target", "#editarCardapio");
                }
            },
            eventClick: function(event, jsEvent, view){
                var dt = $.fullCalendar.formatDate(event.start, "yyyy-MM-dd");

                if (event.title == "Almoço"){
                   $("#editarCardapio"+dt+"-2").fadeOut();
                   $("#editarCardapio"+dt+"-1").fadeIn();
                }else{
                   $("#editarCardapio"+dt+"-1").fadeOut();
                   $("#editarCardapio"+dt+"-2").fadeIn();
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
        <c:forEach var="b" items="${listaCar}" >
            <div id="editarCardapio${b.data}-${b.refeicao}" style="display:none" class="modal">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Editar Cardápio</h4>                
                        </div>
                        <form id="almoco${b.data}-${b.refeicao}" method="POST" action="Nutricionista?action=alterarCardapio">
                            <input type="hidden" name="tp_refeicao" value="${b.refeicao}" />
                            <input type="hidden" name="dt_refeicao" value="${b.data}" />
                            <input type="hidden" name="id_refeicao" value="${b.idCardapio}" />
                            <div class="modal-almocojanta">
                                    <p class="modal-title" id="myModalLabel">
                                        <c:choose>
                                            <c:when test="${b.refeicao == 1}">Almoço</c:when>
                                            <c:otherwise>Janta</c:otherwise>
                                        </c:choose>
                                    </p>                    
                                        Arroz:
                                        <div  class="btn-group"> 
                                            <select name="almoco_arroz">
                                                <option value="0">Arroz</option>
                                                <c:forEach var="ing" items="${listaIng}">
                                                        <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 1}">
                                                            <c:forEach var="blista" items="${b.listaIngredientes}">
                                                                <c:if test="${blista.tipoIngrediente.getIdTipoIngrdiente() == 1}">
                                                                    <c:choose>
                                                                        <c:when test="${blista.getIdIngrediente() == ing.getIdIngrediente()}">
                                                                            <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:if>
                                                            </c:forEach>
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
                                                <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 2}">
                                                    <c:forEach var="blista" items="${b.listaIngredientes}">
                                                        <c:if test="${blista.tipoIngrediente.getIdTipoIngrdiente() == 2}">
                                                            <c:choose>
                                                                <c:when test="${blista.getIdIngrediente() == ing.getIdIngrediente()}">
                                                                    <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:forEach>
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
                                                <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 3}">
                                                    <c:forEach var="blista" items="${b.listaIngredientes}">
                                                        <c:if test="${blista.tipoIngrediente.getIdTipoIngrdiente() == 3}">
                                                            <c:choose>
                                                                <c:when test="${blista.getIdIngrediente() == ing.getIdIngrediente()}">
                                                                    <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:forEach>
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
                                                <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 4}">
                                                    <c:forEach var="blista" items="${b.listaIngredientes}">
                                                        <c:if test="${blista.tipoIngrediente.getIdTipoIngrdiente() == 4}">
                                                            <c:choose>
                                                                <c:when test="${blista.getIdIngrediente() == ing.getIdIngrediente()}">
                                                                    <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:forEach>
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
                                                    <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 5}">
                                                        <c:forEach var="blista" items="${b.listaIngredientes}">
                                                            <c:if test="${blista.tipoIngrediente.getIdTipoIngrdiente() == 5}">
                                                                <c:choose>
                                                                    <c:when test="${blista.getIdIngrediente() == ing.getIdIngrediente()}">
                                                                        <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:if>
                                                        </c:forEach>
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
                                                <c:if test="${ing.tipoIngrediente.getIdTipoIngrdiente() == 6}">
                                                    <c:forEach var="blista" items="${b.listaIngredientes}">
                                                        <c:if test="${blista.tipoIngrediente.getIdTipoIngrdiente() == 6}">
                                                            <c:choose>
                                                                <c:when test="${blista.getIdIngrediente() == ing.getIdIngrediente()}">
                                                                    <option value="${ing.getIdIngrediente()}" selected><c:out value="${ing.nome}" /></option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${ing.getIdIngrediente()}"><c:out value="${ing.nome}" /></option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success">Salvar Alterações</button>
                                <button type="button" class="btn btn-danger" onClick="dismiss_window('editarCardapio${b.data}-${b.refeicao}')">Fechar</button>
                            </div>
                        </form>
                   
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