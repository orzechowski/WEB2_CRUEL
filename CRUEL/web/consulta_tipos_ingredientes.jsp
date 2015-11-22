<%-- 
    Document   : consulta_tipos_ingredientes
    Created on : Nov 21, 2015, 5:39:53 PM
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
        <%@include file="/WEB-INF/jspf/menu_nutricionista.jspf" %>
        
        <!-- MODAL EDITAR Tipo de Ingrediente-->
        <div id="editarTipoIngrediente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Editar Tipo de Ingredientes</h4>
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
		<!-- MODAL remover Tipo de Ingrediente-->
        <div id="removerTipoIngrediente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Remover Tipo de Ingrediente</h4>
                    </div>
                    <div class="modal-body">
                        Tem certeza que deseja remover o Tipo de Ingrediente?
                    </div>
                    <div class="modal-footer">
						<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerTipoIngrediente"><i class="glyphicon glyphicon-remove"></i>
							<span>Remover</span>
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
                        <h1>Tipo de Ingredientes</h1>
                        <div class="panel-body">
                            <div class="list-content">
                                <ul class="list-group">
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span> Carne</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarTipoIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerTipoIngrediente"><i class="glyphicon glyphicon-remove"></i>
													<span>Remover</span>
												</button>
											</div>
                                        </div>
                                    </li>
                <!-- INICIO ITEMS 2-->
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span> Acompanhamento</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarTipoIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerTipoIngrediente"><i class="glyphicon glyphicon-remove"></i>
													<span>Remover</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span> Feijão</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarTipoIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerTipoIngrediente"><i class="glyphicon glyphicon-remove"></i>
													<span>Remover</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span>Arroz</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarTipoIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerTipoIngrediente"><i class="glyphicon glyphicon-remove"></i>
													<span>Remover</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span> Salada</span>
											<div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarTipoIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerTipoIngrediente"><i class="glyphicon glyphicon-remove"></i>
													<span>Remover</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span>Sobremesa</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarTipoIngrediente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#removerTipoIngrediente"><i class="glyphicon glyphicon-remove"></i>
													<span>Remover</span>
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
