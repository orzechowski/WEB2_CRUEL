<%-- 
    Document   : cadastro_tipo_cliente
    Created on : Nov 21, 2015, 5:26:58 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CRUEL - Cadastro Tipo Cliente</title>
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
        <div class="container-fluid tudo"> 
            <div class="row meio">
                <div class=" col-md-12 col-lg-12 col-sm-12 conteudo">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3 class="panel-title">Cadastro de Clientes</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal" method="POST" action="ServGerente?action=addtpcli">
                                <div class="control-group">
                                    <label class="control-label" for="nome">Nome de Registro</label>
                                    <div class="controls">
                                          <input id="nome" name="nome" class="form-control" required type="text">
                                    </div>
                                </div>   
                                <div class="control-group">
                                    <label class="control-label" for="valor">Valor de Entrada</label>
                                    <div class="controls">
                                        <input id="valor" name="valor" class="form-control" required type="text" placeholder="R$ 0,00">
                                    </div>
                                </div>
                                <div class="control-group pull-right">
                                    <label class="control-label" for="submit"></label>
                                    <div class="controls">
                                        <button id="submit" name="submit" class="btn btn-success">Cadastrar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
