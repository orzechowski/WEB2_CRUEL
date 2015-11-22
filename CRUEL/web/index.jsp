<%-- 
    Document   : index
    Created on : Nov 21, 2015, 5:45:09 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Relatório Anual</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/datepicker.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf" %>
		<!-- MODAL DE EDIÇÃO DO CARDÁPIO -->
		<div id="editarCardapio" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;  </button>
						<h4 class="modal-title" id="myModalLabel">Editar Cardápio</h4>
					</div>
					<div class="modal-almocojanta">
						<div id="edit-almoco" class="edit-almoco">
                            <p class="modal-title" id="myModalLabel">Almoço</p>
                            Arroz:
                            <div class="btn-group"> 
                                <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Arroz
                                    <span class="caret"></span  >
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Arroz a Grega</a></li>
                                    <li><a href="#">Arroz com Carneiro</a></li>
                                </ul>
                            </div>
                            <br>
                            Feijão:
                            <div class="btn-group"> 
                                <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Feijão
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Feijão Preto</a></li>
                                    <li><a href="#">Feijão Carioca</a></li>
                                </ul>
                            </div>
                            <br>
                            Salada:
                            <div class="btn-group"> 
                                <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Salada
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Alface</a></li>
                                    <li><a href="#">Tomate com amendoim</a></li>
                                </ul>
                            </div>
                            <br>
                            Carne:
                            <div class="btn-group"> 
                                <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Carne
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Frango Verde</a></li>
                                    <li><a href="#">Bife a Fantasia</a></li>
                                </ul>
                            </div>
                            <div>
                                Acompanhamento:
                                <div class="btn-group"> 
                                    <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Acompanhamento
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Batata Chips</a></li>
                                        <li><a href="#">Farofa</a></li>
                                    </ul>
                                </div>
                            </div>
                            Sobremesa:
                            <div class="btn-group"> 
                                <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Sobremesa
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Sorvete</a></li>
                                    <li><a href="#">Manjar</a></li>
                                </ul>
                            </div>
                        </div>
                        <div id="edit-janta" class="edit-janta">
                            <p class="modal-title" id="myModalLabel">Janta</p>
							Arroz:
                            <div class="btn-group"> 
                                <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Arroz
                                    <span class="caret"></span  >
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Arroz a Grega</a></li>
                                    <li><a href="#">Arroz com Carneiro</a></li>
                                </ul>
                            </div>
                            <br>
                            Feijão:
                            <div class="btn-group"> 
                                <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Feijão
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Feijão Preto</a></li>
                                    <li><a href="#">Feijão Carioca</a></li>
                                </ul>
                            </div>
                            <br>
                            Salada:
                            <div class="btn-group"> 
                                <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Salada
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Alface</a></li>
                                    <li><a href="#">Tomate com amendoim</a></li>
                                </ul>
                            </div>
                            <br>
                            Carne:
                            <div class="btn-group"> 
                                <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Carne
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Frango Verde</a></li>
                                    <li><a href="#">Bife a Fantasia</a></li>
                                </ul>
                            </div>
                            <div>
                                Acompanhamento:
                                <div class="btn-group"> 
                                    <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Acompanhamento
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Batata Chips</a></li>
                                        <li><a href="#">Farofa</a></li>
                                    </ul>
                                </div>
                            </div>
                            Sobremesa:
                            <div class="btn-group"> 
                                <a class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">Sobremesa
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Sorvete</a></li>
                                    <li><a href="#">Manjar</a></li>
                                </ul>
                            </div>
                        </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success">Salvar Alterações</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
					</div>
				</div>
			</div>
		</div>
		<!-- FIM MODAL DE EDIÇÃO DO CARDÁPIO -->
        
		<div class="container-fluid text-center tudo"> 
			<div class="row meio">
				<div class=" col-md-12 col-lg-12 col-sm-12 conteudo ">
					<div id="cardapio-semana" class="row">
						<div>
							<h3>Cardápio da Semana</h3>
						</div>
						<table class="list-group segunda-feira">
							<tr>
								<td rowspan="3" class="not-active list-group-item lista-data">
									<p class="lista-dia">05</p>
									<p class="lista-mes">OUT</p>
								</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-toggle="modal" data-target="#editarCardapio">
									<a href="#alterar_cardapio" class="not-active list-group-item">
										Almoço
										<br>Arroz, Feijão, Batata, Salada, Carne, Sorvete
									</a>
								</td>
							</tr>
							<tr>
								<td></td>
								<td data-toggle="modal" data-target="#editarCardapio">
									<a href="#alterar_cardapio" class="not-active list-group-item">
										Janta
										<br>Arroz, Feijão, Batata, Salada, Carne, Sorvete
									</a>
								</td>
							</tr>
						</table>

						<table class="list-group terca-feira">
							<tr>
								<td rowspan="3" class="lista-data-ativo list-group-item list-group-item-success">
									<p class="lista-dia-ativo">06</p>
									<p class="lista-mes-ativo">OUT</p>
								</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-toggle="modal" data-target="#editarCardapio">
									<a href="#alterar_cardapio" class="dia-ativo list-group-item list-group-item-success">
										Almoço
										<br>Arroz, Feijão, Batata, Salada, Carne, Sorvete
									</a>
								</td>
							</tr>
							<tr>
								<td></td>
								<td data-toggle="modal" data-target="#editarCardapio">
									<a href="#alterar_cardapio" class="dia-ativo list-group-item list-group-item-success">
										Janta
										<br>Arroz, Feijão, Batata, Salada, Carne, Sorvete
									</a>
								</td>
							</tr>
						</table>
						
						<table class="list-group quarta-feira">
							<tr>
								<td rowspan="3" class="not-active list-group-item lista-data">
									<p class="lista-dia">07</p>
									<p class="lista-mes">OUT</p>
								</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-toggle="modal" data-target="#editarCardapio">
									<a href="#alterar_cardapio" class="list-group-item">
										Almoço
										<br>Arroz, Feijão, Batata, Salada, Carne, Sorvete
									</a>
								</td>
							</tr>
							<tr>
								<td></td>
								<td data-toggle="modal" data-target="#editarCardapio">
									<a href="#alterar_cardapio" class="list-group-item">
										Janta
										<br>Arroz, Feijão, Batata, Salada, Carne, Sorvete
									</a>
								</td>
							</tr>
						</table>
						
						<table class="list-group quinta-feira">
							<tr>
								<td rowspan="3" class="not-active list-group-item lista-data">
									<p class="lista-dia">08</p>
									<p class="lista-mes">OUT</p>
								</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-toggle="modal" data-target="#editarCardapio">
									<a href="#alterar_cardapio" class="list-group-item">
										Almoço
										<br>Arroz, Feijão, Batata, Salada, Carne, Sorvete
									</a>
								</td>
							</tr>
							<tr>
								<td></td>
								<td data-toggle="modal" data-target="#editarCardapio">
									<a href="#alterar_cardapio" class="list-group-item">
										Janta
										<br>Arroz, Feijão, Batata, Salada, Carne, Sorvete
									</a>
								</td>
							</tr>
						</table>
						
						<table class="list-group sexta-feira">
							<tr>
								<td rowspan="3" class="not-active list-group-item lista-data">
									<p class="lista-dia">09</p>
									<p class="lista-mes">OUT</p>
								</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-toggle="modal" data-target="#editarCardapio">
									<a href="#alterar_cardapio" class="list-group-item">
										Almoço
										<br>Arroz, Feijão, Batata, Salada, Carne, Sorvete
									</a>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<a href="#alterar_cardapio" class="list-group-item">
										Janta
										<br>Arroz, Feijão, Batata, Salada, Carne, Sorvete
									</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
    </body>
</html>
