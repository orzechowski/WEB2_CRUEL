<%-- 
    Document   : consulta_nutricionistas
    Created on : Nov 21, 2015, 5:39:22 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%@include file="/WEB-INF/jspf/menu_gerente.jspf" %>
        <div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h1 class="text-center">Login</h1>
					</div>
					<div class="modal-body">
						<form class="form col-md-12 center-block">
							<div class="form-group">
								<input type="text" class="form-control input-lg" placeholder="Email">
							</div>
							<div class="form-group">
								<input type="password" class="form-control input-lg" placeholder="Senha">
							</div>
							<div class="form-group">
								<button class="btn btn-primary btn-lg btn-block">Entrar</button>
								<span class="pull-right"><a href="#">Esqueci minha senha</a></span>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<div class="col-md-12">
							<button class="btn" data-dismiss="modal" aria-hidden="true">Voltar</button>
						</div>	
					</div>
				</div>
			</div>
		</div>
        <!-- MODAL EDITAR NUTRICIONISTA-->
        <div id="editarNutricionista" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Editar Nutricionista</h4>
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
        <!-- MODAL INATIVAR NUTRICIONISTA-->
        <div id="inativarNutricionista" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Inativar Nutricionista</h4>
                    </div>
                    <div class="modal-body">
                        Tem certeza que deseja desativar o(a) nutricionista?
                    </div>
                    <div class="modal-footer">
						<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarNutricionista"><i class="glyphicon glyphicon-remove"></i>
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
                        <h1>Nutricionistas</h1>
                        <div class="panel-body">
                            <form class="form-inline well">
                                <legend>Filtro de Busca</legend>
                                <fieldset>
                                    <div class="form-group">
                                        <label for="filtroTexto1"> Nome / Email / CPF / CRN: </label>
                                        <input type="text" class="form-control" id="filtroTexto1" >
                                    </div>
                                    <button type="submit" class="btn btn-default">Buscar</button>
                                </fieldset>
                            </form>
                            <div class="list-content">
                                <ul class="list-group">
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span> Fulana de Tal ||</span>
                                            <span>232.123.533-12 ||</span>
                                            <span>Rua Joao da Silva, 23 ||</span>
                                            <span>(41)3333-2222 ||</span>
                                            <span>fulana@ig.com.br ||</span>
                                            <span>21334</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarNutricionista"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarNutricionista"><i class="glyphicon glyphicon-remove"></i>
													<span>Inativar</span>
												</button>
											</div>
                                        </div>
                                    </li>
                <!-- INICIO ITEMS 2-->
                                    <li class="list-group-item clearfix">
                                        <div class="task-title lista_nutri">
                                            <span> Maria José da Silva ||</span>
                                            <span>332.112.533-25 ||</span>
                                            <span>Rua Fabiano de Oliveira, 22 ||</span>
                                            <span>(41)3333-3245 ||</span>
                                            <span>maria@gmail.com.br ||</span>
                                            <span>234235</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarNutricionista"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarNutricionista"><i class="glyphicon glyphicon-remove"></i>
													<span>Inativar</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title lista_nutri">
                                            <span> João Senna ||</span>
                                            <span>222.123.234-33 ||</span>
                                            <span>Rua das Flores, 11 ||</span>
                                            <span>(41)2345-3321 ||</span>
                                            <span>joao123@globo.com.br ||</span>
                                            <span>23425</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarNutricionista"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarNutricionista"><i class="glyphicon glyphicon-remove"></i>
													<span>Inativar</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title lista_nutri">
                                            <span> Olga Maria Espanha ||</span>
                                            <span>666.121.511-22 ||</span>
                                            <span>Rua das Oliveiras, 211 ||</span>
                                            <span>(41)2345-2332 ||</span>
                                            <span>espanha@oi.com.br ||</span>
                                            <span>35267</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarNutricionista"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarNutricionista"><i class="glyphicon glyphicon-remove"></i>
													<span>Inativar</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title lista_nutri">
                                            <span> Amelia Oliveira ||</span>
                                            <span>072.132.523-46 ||</span>
                                            <span>Rua Matinhos, 2234 ||</span>
                                            <span>(41)9283-2322 ||</span>
                                            <span>a.oliv@globo.com.br ||</span>
                                            <span>23456</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarNutricionista"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarNutricionista"><i class="glyphicon glyphicon-remove"></i>
													<span>Inativar</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title lista_nutri">
                                            <span> Fulana de Tal ||</span>
                                            <span>232.123.533-12 ||</span>
                                            <span>Rua Joao da Silva, 23 ||</span>
                                            <span>(41)3333-2222 ||</span>
                                            <span>fulana@ig.com.br ||</span>
                                            <span>45431</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarNutricionista"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarNutricionista"><i class="glyphicon glyphicon-remove"></i>
													<span>Inativar</span>
												</button>
											</div>
                                        </div>
                                    </li>

									<!-- FIM ITEMS 2 -->
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
