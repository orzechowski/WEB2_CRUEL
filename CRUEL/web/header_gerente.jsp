
<!--
NAVBAR GERENTE
-->

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
				<li><a href="./index.html">Home</a></li>
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
							<li><a href="./consulta_gerentes.html">Gerente</a></li>
							<li><a href="./consulta_atendentes.html">Atendentes</a></li>
							<li><a href="./consulta_nutricionistas.html">Nutricionistas</a></li>
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
		</div>
	</div>
</nav>
