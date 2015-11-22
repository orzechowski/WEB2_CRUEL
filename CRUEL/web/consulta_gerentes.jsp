<%-- 
    Document   : consulta_gerentes
    Created on : Nov 21, 2015, 5:38:36 PM
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
        <!-- MODAL EDITAR Gerente-->
        <div id="editarGerente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Editar Gerentes</h4>
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
		<!-- MODAL INATIVAR Gerente-->
        <div id="inativarGerente" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Inativar Gerente</h4>
                    </div>
                    <div class="modal-body">
                        Tem certeza que deseja desativar o(a) Gerente?
                    </div>
                    <div class="modal-footer">
						<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarGerente"><i class="glyphicon glyphicon-remove"></i>
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
                        <h1>Gerentes</h1>
                        <div class="panel-body">
                            <form class="form-inline well">
                                <legend>Filtro de Busca</legend>
                                <fieldset>
                                    <div class="form-group">
                                        <label for="filtroTexto1"> Nome / Email / CPF: </label>
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
                                            <span>fulana@ig.com.br</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarGerente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarGerente"><i class="glyphicon glyphicon-remove"></i>
													<span>Inativar</span>
												</button>
											</div>
                                        </div>
                                    </li>
                <!-- INICIO ITEMS 2-->
                                    <li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span> Maria José da Silva ||</span>
                                            <span>332.112.533-25 ||</span>
                                            <span>Rua Fabiano de Oliveira, 22 ||</span>
                                            <span>(41)3333-3245 ||</span>
                                            <span>maria@gmail.com.br</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarGerente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarGerente"><i class="glyphicon glyphicon-remove"></i>
													<span>Inativar</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span> João Senna ||</span>
                                            <span>222.123.234-33 ||</span>
                                            <span>Rua das Flores, 11 ||</span>
                                            <span>(41)2345-3321 ||</span>
                                            <span>joao123@globo.com.br</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarGerente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarGerente"><i class="glyphicon glyphicon-remove"></i>
													<span>Inativar</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span> Olga Maria Espanha ||</span>
                                            <span>666.121.511-22 ||</span>
                                            <span>Rua das Oliveiras, 211 ||</span>
                                            <span>(41)2345-2332 ||</span>
                                            <span>espanha@oi.com.br</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarGerente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarGerente"><i class="glyphicon glyphicon-remove"></i>
													<span>Inativar</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span> Amelia Oliveira ||</span>
                                            <span>072.132.523-46 ||</span>
                                            <span>Rua Matinhos, 2234 ||</span>
                                            <span>(41)9283-2322 ||</span>
                                            <span>a.oliv@globo.com.br</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarGerente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarGerente"><i class="glyphicon glyphicon-remove"></i>
													<span>Inativar</span>
												</button>
											</div>
                                        </div>
                                    </li>
									<li class="list-group-item clearfix">
                                        <div class="task-title">
                                            <span> Fulana de Tal ||</span>
                                            <span>232.123.533-12 ||</span>
                                            <span>Rua Joao da Silva, 23 ||</span>
                                            <span>(41)3333-2222 ||</span>
                                            <span>fulana@ig.com.br</span>
                                            <div class="pull-right hidden-phone">
												<button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarGerente"><i class=" glyphicon glyphicon-pencil"></i>
													<span>Editar</span>
												</button>
												<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#inativarGerente"><i class="glyphicon glyphicon-remove"></i>
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
