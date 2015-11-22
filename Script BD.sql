/*===============================================================
======== BD - GERENTE
===============================================================*/
/* ********** CARGO *********** */
CREATE TABLE cargo(
	id_cargo serial PRIMARY KEY,
	nome varchar(30)
);


/* ********** COLABORADOR *********** */
CREATE TABLE colaborador(
	cpf integer PRIMARY KEY,
	nome varchar(50),
	email varchar(30),
	senha varchar(20),
	endereco varchar(80),
	telefone integer,
	crn integer,
	ativo boolean,
	id_cargo integer,

	CONSTRAINT fkColaborador FOREIGN KEY (id_cargo) REFERENCES cargo (id_cargo)
);

/*===============================================================
======== BD - ORGANIZACIONAL 
===============================================================*/
/* ********** TIPO INGREDIENTE *********** */
CREATE TABLE tipoIngrediente(
	id_TipoIngrediente SERIAL PRIMARY KEY,
	descricao varchar(50)
);

/* ********** INGREDIENTE *********** */
CREATE TABLE ingrediente(
	id_ingrediente SERIAL PRIMARY KEY,
	nome varchar(30),
	descricao varchar(50),
	id_tipoIngrediente integer,

	CONSTRAINT fkIngrediente FOREIGN KEY (id_tipoIngrediente) REFERENCES tipoIngrediente (id_TipoIngrediente)
);

/* ********** TIPOCLIENTE *********** */
CREATE TABLE tipoCliente(
	id_tipo SERIAL PRIMARY KEY,
	descricao varchar(50),
	valor float(2)
);

/* ********** REGISTRO *********** */
CREATE TABLE registro(
	dataHora timestamp,
	valor_cobrado float(2),
	cpf_colaborador integer,
	categoria_cliente integer,
	
	CONSTRAINT fkRegistro FOREIGN KEY (categoria_cliente) REFERENCES tipoCliente (id_tipo)
);

/* ********** REFEICAO *********** */
CREATE TABLE refeicao(
	id_refeicao SERIAL PRIMARY KEY,
	descricao varchar(50)
);

/* ********** CARDAPIO *********** */
CREATE TABLE cardapio(
	id_cardapio SERIAL  PRIMARY KEY,
	data date,
	id_refeicao integer,
	
	CONSTRAINT fkCardapio FOREIGN KEY (id_refeicao) REFERENCES refeicao (id_refeicao)
);

/* ********** INGREDIENTES CARDAPIO *********** */
CREATE TABLE ingredientesCardapio(
	id_cardapio integer,
	ingrediente integer,

	CONSTRAINT fkIngredienteCardapio  FOREIGN KEY (id_cardapio) REFERENCES cardapio (id_cardapio),
	CONSTRAINT fkIngredienteCardapio2 FOREIGN KEY (ingrediente) REFERENCES ingrediente (id_ingrediente)
);


/* ********** INSERÇÃO INICIAL *********** */
INSERT INTO cargo (nome) VALUES ('Gerente'); /* 1 */
INSERT INTO cargo (nome) VALUES ('Nutricionista'); /* 2 */
INSERT INTO cargo (nome) VALUES ('Atendente'); /* 3 */
INSERT INTO cargo (nome) VALUES ('Cliente'); /* 4 */