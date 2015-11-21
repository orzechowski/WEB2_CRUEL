<%-- 
    Document   : consulta_registros
    Created on : Nov 21, 2015, 5:39:34 PM
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
        <!-- MODAL EDITAR REGISTRO-->
          <div id="editarRegistro" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
                        <h4 class="modal-title" id="myModalLabel">Editar Registro</h4>
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
		<div class="container-fluid tudo"> 
			<div class="row meio">
				<div class=" col-md-12 col-lg-12 col-sm-12 conteudo">
				
                    <section class="panel-consulta">
                              <h1>Registros</h1>
                              <div class="panel-body">

                                <form class="form-inline well">
                                    <legend>Filtro de Busca</legend>
                                    <fieldset>

                                    <div class="form-group">
                                        <label for="filtroCalendario1">Data: </label>
                                        <input type="date" class="form-control" id="filtroCalendario1" placeholder="31/01/2015">
                                    </div>
                                    <button type="submit" class="btn btn-default">Buscar</button>
                                    </fieldset>
                                </form>

                                  <div class="list-content">

                                      <ul class="list-group">
                                          <li class="list-group-item clearfix">
                                             <div class="task-title">
                                                  <span class="label label-success">Aluno</span>
                                                  <span>24/10/2015 - 12:35:13</span>
                                                  <div class="pull-right hidden-phone">
                                                      <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarRegistro"><i class=" glyphicon glyphicon-pencil"></i>
                                                          <span>Editar</span>
                                                      </button>
                                                      <button class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-remove"></i>
                                                          <span>Remover</span>
                                                      </button>
                                                  </div>
                                              </div>
                                          </li>
                                          <!-- INICIO ITEMS 2-->
                                          <li class="list-group-item clearfix">
                                             <div class="task-title">
                                                  <span class="label label-success">Professor</span>
                                                  <span>24/10/2015 - 12:37:13</span>
                                                  <div class="pull-right hidden-phone">
                                                      <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarRegistro"><i class=" glyphicon glyphicon-pencil"></i>
                                                          <span>Editar</span>
                                                      </button>
                                                      <button class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-remove"></i>
                                                          <span>Remover</span>
                                                      </button>
                                                  </div>
                                              </div>
                                          </li>
                                          <li class="list-group-item clearfix">
                                             <div class="task-title">
                                                  <span class="label label-success">Servidor</span>
                                                  <span>24/10/2015 - 12:39:44</span>
                                                  <div class="pull-right hidden-phone">
                                                      <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarRegistro"><i class=" glyphicon glyphicon-pencil"></i>
                                                          <span>Editar</span>
                                                      </button>
                                                      <button class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-remove"></i>
                                                          <span>Remover</span>
                                                      </button>
                                                  </div>
                                              </div>
                                          </li>
                                          <li class="list-group-item clearfix">
                                             <div class="task-title">
                                                  <span class="label label-success">Visitante</span>
                                                  <span>24/10/2015 - 12:44:04</span>
                                                  <div class="pull-right hidden-phone">
                                                      <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarRegistro"><i class=" glyphicon glyphicon-pencil"></i>
                                                          <span>Editar</span>
                                                      </button>
                                                      <button class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-remove"></i>
                                                          <span>Remover</span>
                                                      </button>
                                                  </div>
                                              </div>
                                          </li>
                                          <li class="list-group-item clearfix">
                                             <div class="task-title">
                                                  <span class="label label-success">Aluno</span>
                                                  <span>24/10/2015 - 12:55:10</span>
                                                  <div class="pull-right hidden-phone">
                                                      <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#editarRegistro"><i class=" glyphicon glyphicon-pencil"></i>
                                                          <span>Editar</span>
                                                      </button>
                                                      <button class="btn btn-danger btn-sm"><i class="glyphicon glyphicon-remove"></i>
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
