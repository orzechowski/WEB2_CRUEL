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
        <script>
            $(document).on("click", "#editar", function () {
                var id = $(this).data("id");
                var lista_colaboradores = [];
                <c:forEach var="colaborador" items="${l_colaboradores}">
                    var colaborador = {};
                    colaborador.nome = "<c:out value="${colaborador.nome}" />";
                    colaborador.cpf = "<c:out value="${colaborador.cpf}" />";
                    colaborador.email = "<c:out value="${colaborador.email}" />";
                    colaborador.cargo = "<c:out value="${colaborador.cargo.descricao}" />";
                    colaborador.endereco = "<c:out value="${colaborador.endereco}" />";
                    colaborador.telefone = "<c:out value="${colaborador.telefone}" />";
                    colaborador.crn = "<c:out value="${colaborador.crn}" />";
                    colaborador.ativo = <c:out value="${colaborador.ativo}" />;
                    lista_colaboradores.push(colaborador);
                </c:forEach>
                $(".modal-body #nome").val(lista_colaboradores[id].nome);
                $(".modal-body #cargo").val(lista_colaboradores[id].cargo);
                $(".modal-body #cpf").val(lista_colaboradores[id].cpf);
                $(".modal-body #email").val(lista_colaboradores[id].email);
                $(".modal-body #endereco").val(lista_colaboradores[id].endereco);
                $(".modal-body #telefone").val(lista_colaboradores[id].telefone);
                $(".modal-body #crn").val(lista_colaboradores[id].crn);
            });
            $("#senha").change(function(){
                $("#confirma_senha").val("");
                $("#confirma_div").attr('class', 'control-group has-warning');
                // 
            });

            $("#confirma_senha").change(function(){
                  var pass = $("#senha").val();
                  var conf = $("#confirma_senha").val();
                  if (pass != conf) { alert("Senha nao confere."); }
            });

            </script>
        <div id="editarFuncionario" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Editar Funcionário</h4>
                    </div>
                    <form class="form-horizontal" method="POST" action="ServGerente?action=atualizarfuncionario">
                        <div class="modal-body">
                            <div class="control-group">
                                <label class="control-label" for="cargo">Cargo:</label>
                                <input id="cargo" name="cargo" class="form-control" disabled type="text" value="">
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="nome">Nome Completo</label>
                                <div class="controls">
                                    <input id="nome" name="nome" class="form-control" disabled type="text" value="">
                                </div>
                            </div>   
                            <div class="control-group">
                                <label class="control-label" for="cpf">CPF</label>
                                <div class="controls">
                                    <input id="cpf" name="cpf" class="form-control" disabled type="text" placeholder="000.000.000-00" value="">
                                </div>
                            </div>  
                            <div class="control-group">
                                <label class="control-label" for="email">Email</label>
                                <div class="controls">
                                    <input id="email" name="email" class="form-control" required type="text" value="">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="endereco">Endereço</label>
                                <div class="controls">
                                    <input id="endereco" name="endereco" class="form-control" required type="text" value="">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="senha">Senha</label>
                                <div class="controls">
                                    <input id="senha" name="senha" class="form-control" type="password">
                                </div>
                            </div>
                            <div class="control-group" id="confirma_div">
                                <label class="control-label" for="senha">Confirmação de Senha</label>
                                <div class="controls">
                                    <input id="confirma_senha" name="confirma_senha" class="form-control" type="password">
                                </div>
                            </div> 
                            <div class="control-group">
                                <label class="control-label" for="telefone">Telefone</label>
                                <div class="controls">
                                    <input id="telefone" name="telefone" class="form-control" required type="text" value="">
                                </div>
                            </div> 
                            <div class="control-group" id="crn_div">
                                <label class="control-label" for="crn">CRN</label>
                                <div class="controls">
                                    <input id="crn" name="crn" class="form-control" disabled type="text" value="">
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
	<script type="text/javascript">
                
            $("#senha").change(function(){
                    $("#confirma_senha").val("");
                    $("#confirma_div").attr('class', 'control-group has-warning');
                    // 
            });

            $("#confirma_senha").change(function(){
                  var pass = $("#senha").val();
                  var conf = $("#confirma_senha").val();
                  if (pass != conf) { alert("Senha nao confere."); }
            });
            
        </script>
		<!-- MODAL INATIVAR Funcionario-->
        <script>
            $(document).on("click", "#inativar", function () {
                var id = $(this).data("id");
                var lista_colaboradores = [];
                <c:forEach var="colaborador" items="${l_colaboradores}">
                    var colaborador = {};
                    colaborador.cpf = "<c:out value="${colaborador.cpf}" />";
                    colaborador.a = <c:out value="${colaborador.ativo}" />;
                    colaborador.ativo = !colaborador.a;
                    lista_colaboradores.push(colaborador);
                </c:forEach>
                    
                $(".modal-body #cpfColaborador").val(lista_colaboradores[id].cpf);
                $(".modal-body #ativo").val(lista_colaboradores[id].ativo)
            });
        </script>
        <div id="inativarFuncionario" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Inativar/Ativar Funcionário</h4>
                    </div>
                    <form method="POST" action="ServGerente?action=desativarfuncionario">
                        <div class="modal-body">
                            Tem certeza que deseja desativar/ativar o Funcionário?
                            <input type="hidden" id="cpfColaborador" name="cpfColaborador" value=""/>
                            <input type="hidden" id="ativo" name="ativo" value=""/>
                        </div>
                        <div class="modal-footer">
                        
                            
                            <button class="btn btn-sm" data-toggle="modal" data-target="#inativarGerente"><i class="glyphicon glyphicon-remove"></i>
                                <span>Desativar/Ativar</span>
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
                                    <c:forEach var="colaborador" items="${l_colaboradores}" varStatus="loop" >
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
							<button class="btn btn-success btn-sm" id="editar" data-toggle="modal" data-target="#editarFuncionario" data-id="${loop.index}"><i class=" glyphicon glyphicon-pencil"></i>
                                                            <span>Editar</span>
							</button>
                                                        <c:choose>
                                                            <c:when test="${colaborador.ativo}">
                                                                <button class="btn btn-danger btn-sm" id="inativar" data-toggle="modal" data-target="#inativarFuncionario" data-id="${loop.index}"><i class="glyphicon glyphicon-remove"></i>
                                                                    <span>Inativar</span>
                                                                </button>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <button class="btn btn-success btn-sm" id="inativar" data-toggle="modal" data-target="#inativarFuncionario" data-id="${loop.index}"><i class="glyphicon glyphicon-ok"></i>
                                                                    <span>Ativar</span>
                                                                </button>
                                                            </c:otherwise>
                                                        </c:choose>
							
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
