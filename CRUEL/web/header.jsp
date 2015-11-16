<%-- 
    Document   : header
    Created on : 15/11/2015, 16:51:01
    Author     : vishi_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand logo" href="index.html"></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul id="menu" class="nav navbar-nav navbar-left" >
                <!--<li><a href="index.html">Home </a></li>-->
                <li>
                        <div class="dropdown">
                                <button class="btn btn-link dropdown-toggle" type="button" data-toggle="dropdown">
                                                Home
                                                <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                                <li><a href="./index.html">Geral</a></li>
                                                <li><a href="./index_nutricionista.html">Nutricionistas</a></li>
                                        </ul>
                                </div>
                </li>
                <li>
                        <div class="dropdown">
                                <button class="btn btn-link dropdown-toggle" type="button" data-toggle="dropdown">
                                        Cadastro
                                        <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                        <li><a href="./registro_entradas.html">Registros</a></li>
                                        <li><a href="./cadastro_funcionario.html">Funcionário</a></li>
                                        <li><a href="./cadastro_tipo_cliente.html">Tipo de Cliente</a></li>
                                        <li><a href="./cadastro_ingrediente.html">Ingrediente</a></li>
                                        <li><a href="./cadastro_tipo_ingrediente.html">Tipo de Ingrediente</a></li>
                                </ul>
                        </div>
                </li>
                <li>
                        <div class="dropdown">
                                <button class="btn btn-link dropdown-toggle" type="button" data-toggle="dropdown">
                                        Consultar
                                        <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                        <li><a href="./consulta_registros.html">Registros</a></li>
                                        <li><a href="./consulta_gerentes.html">Gerente</a></li>
                                        <li><a href="./consulta_atendentes.html">Atendentes</a></li>
                                        <li><a href="./consulta_nutricionistas.html">Nutricionistas</a></li>
                                        <li><a href="./consulta_ingredientes.html">Ingrediente</a></li>
                                        <li><a href="./consulta_tipos_ingrediente.html">Tipo de Ingrediente</a></li>

                                </ul>
                        </div>
                </li>
                <li>
                        <div class="dropdown">
                                <button class="btn btn-link dropdown-toggle" type="button" data-toggle="dropdown">
                                        Relatório
                                        <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                        <li><a href="./gerar_relatorio_mensal.html">Mensal</a></li>
                                        <li><a href="./gerar_relatorio_anual.html">Anual</a></li>
                                </ul>
                        </div>
                </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
                <li class="active" data-toggle="modal" data-target="#loginModal"><a href="#">Faça login para continuar <span class="sr-only">(current)</span></a></li>
          </ul>
        </div>
  </div>
</nav>
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
