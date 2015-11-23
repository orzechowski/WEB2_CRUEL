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
        
        <!-- MODAL EDITAR Ingrediente-->
        <div id="editarIngrediente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Editar Ingredientes</h4>
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
		<!-- MODAL Remover Ingrediente-->
        <div id="removerIngrediente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
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
                                        <label for="filtroTexto1"> Nome /${Ingrediente.nome} Tipo: </label>
                                        <input type="text" class="form-control" id="filtroTexto1" name="filtroIngrediente">
                                    </div>
                                    <button type="submit" class="btn btn-default">Buscar</button>
                                </fieldset>
                            </form>
                            <div class="list-content">
                                <ul class="list-group text-center" >
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">
                                   
											<div class="row">
												<div class="col-md-2 col-lg-2 col-sm-2">
													<h4><span class="label label-success label-sm">Carne</span></h4>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3 ingrediente">
													<span>Carne de Panela</span>
												</div>
												<div class="col-md-4 col-lg-4 col-sm-4 ingrediente">
													<span>Carne bovina cozida</span>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3 ingrediente">
													<div class="pull-right hidden-phone">
														<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
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
                <!-- INICIO ITEMS 2-->
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">
											<div class="row">
												<div class="col-md-2 col-lg-2 col-sm-2">
													<h4><span class="label label-success label-sm">Arroz</span></h4>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3 ingrediente">
													<span>Arroz Branco</span>
												</div>
												<div class="col-md-4 col-lg-4 col-sm-4 ingrediente">
													<span>Arroz branco cozido</span>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3">
													<div class="pull-right hidden-phone">
														<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
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
									<li class="list-group-item clearfix">
                                        <div class="task-title">
											<div class="row">
												<div class="col-md-2 col-lg-2 col-sm-2">
													<h4><span class="label label-success">Sobremesa</span></h4>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3 ingrediente">
													<span>Pudim de leite</span>
												</div>
												<div class="col-md-4 col-lg-4 col-sm-4 ingrediente">
													<span>Contém lactose</span>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3">
													<div class="pull-right hidden-phone">
														<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
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
									<li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <div class="row">
												<div class="col-md-2 col-lg-2 col-sm-2">
													<h4><span class="label label-success">Feijão</span></h4>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3 ingrediente">
													<span>Feijão Preto</span>
												</div>
												<div class="col-md-4 col-lg-4 col-sm-4 ingrediente">
													<span>Feijão preto cozido</span>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3">
													<div class="pull-right hidden-phone">
													<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
														<span>Editar</span>
													</button>
													<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerIngrediente"><i class="glyphicon glyphicon-remove"></i>
														<span>Remover</span>
													</button>
												</div>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title">
											<div class="row">
												<div class="col-md-2 col-lg-2 col-sm-2">
													<h4><span class="label label-success">Acompanhamento</span></h4>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3 ingrediente">
													<span>Batata Chips</span>
												</div>
												<div class="col-md-4 col-lg-4 col-sm-4 ingrediente">
													<span>Batata frita tipo chips</span>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3">
													<div class="pull-right hidden-phone">
														<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
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
									<li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <div class="row">
												<div class="col-md-2 col-lg-2 col-sm-2">
													<h4><span class="label label-success">Carne</span></h4>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3 ingrediente">
													<span>Meteoro</span>
												</div>
												<div class="col-md-4 col-lg-4 col-sm-4 ingrediente">
													<span>Bolinho de carne bovina no formato de meteoro</span>
												</div>
												<div class="col-md-3 col-lg-3 col-sm-3">
													<div class="pull-right hidden-phone">
														<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
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
