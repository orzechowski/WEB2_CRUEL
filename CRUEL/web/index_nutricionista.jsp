<%-- 
    Document   : index_nutricionista
    Created on : Nov 21, 2015, 5:45:25 PM
    Author     : Allan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/calendario.min.js"></script>
        <script src="js/fullcalendar.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/menu_nutricionista.jspf" %>
        
		<div class="container-fluid text-center tudo"> 
			<div class="row meio">
				<div class=" col-md-12 col-lg-12 col-sm-12 conteudo ">
					<hr>
					<div id="calendar"></div>
				</div>
			</div>
		</div>
	</body>
    </body>
</html>
