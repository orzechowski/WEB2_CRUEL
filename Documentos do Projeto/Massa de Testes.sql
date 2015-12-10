-- BANCO ORGANIZACIONAL --
-- WIPE --
DELETE FROM colaborador;
DELETE FROM cargo;
-- FIXES --

alter table colaborador alter column senha type text; -- Necessario pra guardar a hash MD5 de senha
ALTER SEQUENCE cargo_id_cargo_seq RESTART WITH 1;

-- DADOS --

insert into cargo (nome) values ('Gerente');
insert into cargo (nome) values ('Nutricionista');
insert into cargo (nome) values ('Atendente');
--Cliente não precisa de cadastro
--insert into cargo (nome) values ('Cliente');

insert into colaborador values ('12345678911','Dona Gerente','gerente@cruel.com',MD5('gerente123'),'Rua Ger 123',4188889999,'','true',1);
insert into colaborador values ('98765432111','Sr Nutricionista','nutricionista@cruel.com',MD5('nutricionista123'),'Rua Nutri 123',4198984545,123999,'true',2);
insert into colaborador values ('11223344511','Mr Atendente','atendente@cruel.com',MD5('atendente123'),'Rua Colab 123',4199998888,'','true',3);


-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- BANCO ORGANIZACIONAL --

-- WIPE --

DELETE FROM ingredientescardapio;
DELETE FROM cardapio;
DELETE FROM ingrediente;
DELETE FROM refeicao;
DELETE FROM tipoingrediente;
DELETE FROM registro;
DELETE FROM tipocliente;

-- FIXES --

ALTER SEQUENCE cardapio_id_cardapio_seq RESTART WITH 1;
ALTER SEQUENCE ingrediente_id_ingrediente_seq RESTART WITH 1;
ALTER SEQUENCE refeicao_id_refeicao_seq RESTART WITH 1;
ALTER SEQUENCE tipocliente_id_tipo_seq RESTART WITH 1;
ALTER SEQUENCE tipoingrediente_id_tipoingrediente_seq RESTART WITH 1;

-- DADOS --
insert into tipoingrediente (descricao) values('Arroz'); /*1*/
insert into tipoingrediente (descricao) values('Feijao'); /*2*/
insert into tipoingrediente (descricao) values('Salada'); /*3*/
insert into tipoingrediente (descricao) values('Carne'); /*4*/
insert into tipoingrediente (descricao) values('Acompanhamento'); /*5*/
insert into tipoingrediente (descricao) values('Sobremesa'); /*6*/

insert into ingrediente (nome, descricao, id_tipoingrediente) values('Arroz a Grega', 'Arroz com muita coisa', 1);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Arroz Pipoca', 'Arroz com alegria', 1);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Feijao Craca', 'Feijao dos Mamonas', 2);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Feijao de Vó', 'Aquele que nunca tem no RU', 2);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Salada de Alfafa', 'É quase alface', 3);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Salada de Maionese', 'Salmonela wins', 3);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Carne de Panela', 'Carne feito em panela', 4);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Bife a Fantasia', 'Imagine', 4);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Batata Chips', 'Alegria da criançada', 5);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Suco Tang', 'Com açucar e água até a morte', 5);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Flan de mamão', 'Urgh', 6);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Sagu', 'Bora bêbado praula', 6);

insert into refeicao (descricao) values('Almoco'); /*1*/
insert into refeicao (descricao )values('Janta');  /*2*/

--DIA 1
insert into cardapio (data, id_refeicao) values('2015-12-01', 1);
insert into ingredientescardapio values(1, 1);
insert into ingredientescardapio values(1, 3);
insert into ingredientescardapio values(1, 5);
insert into ingredientescardapio values(1, 7);
insert into ingredientescardapio values(1, 9);
insert into ingredientescardapio values(1, 11);

insert into cardapio (data, id_refeicao) values('2015-12-01', 2);
insert into ingredientescardapio values(2, 2);
insert into ingredientescardapio values(2, 4);
insert into ingredientescardapio values(2, 6);
insert into ingredientescardapio values(2, 8);
insert into ingredientescardapio values(2, 10);
insert into ingredientescardapio values(2, 12);

--DIA 02
insert into cardapio (data, id_refeicao) values('2015-12-02', 1);
insert into ingredientescardapio values(3, 1);
insert into ingredientescardapio values(3, 3);
insert into ingredientescardapio values(3, 5);
insert into ingredientescardapio values(3, 7);
insert into ingredientescardapio values(3, 9);
insert into ingredientescardapio values(3, 11);

insert into cardapio (data, id_refeicao) values('2015-12-02', 2);
insert into ingredientescardapio values(4, 2);
insert into ingredientescardapio values(4, 4);
insert into ingredientescardapio values(4, 6);
insert into ingredientescardapio values(4, 8);
insert into ingredientescardapio values(4, 10);
insert into ingredientescardapio values(4, 12);

--DIA 09
insert into cardapio (data, id_refeicao) values('2015-12-09', 1);
insert into ingredientescardapio values(5, 1);
insert into ingredientescardapio values(5, 3);
insert into ingredientescardapio values(5, 5);
insert into ingredientescardapio values(5, 7);
insert into ingredientescardapio values(5, 9);
insert into ingredientescardapio values(5, 11);

insert into cardapio (data, id_refeicao) values('2015-12-09', 2);
insert into ingredientescardapio values(6, 2);
insert into ingredientescardapio values(6, 4);
insert into ingredientescardapio values(6, 6);
insert into ingredientescardapio values(6, 8);
insert into ingredientescardapio values(6, 10);
insert into ingredientescardapio values(6, 12);

--DIA 10
insert into cardapio (data, id_refeicao) values('2015-12-10', 1);
insert into ingredientescardapio values(7, 1);
insert into ingredientescardapio values(7, 3);
insert into ingredientescardapio values(7, 5);
insert into ingredientescardapio values(7, 7);
insert into ingredientescardapio values(7, 9);
insert into ingredientescardapio values(7, 11);

insert into cardapio (data, id_refeicao) values('2015-12-10', 2);
insert into ingredientescardapio values(8, 2);
insert into ingredientescardapio values(8, 4);
insert into ingredientescardapio values(8, 6);
insert into ingredientescardapio values(8, 8);
insert into ingredientescardapio values(8, 10);
insert into ingredientescardapio values(8, 12);

--DIA 11
insert into cardapio (data, id_refeicao) values('2015-12-11', 1);
insert into ingredientescardapio values(9, 1);
insert into ingredientescardapio values(9, 3);
insert into ingredientescardapio values(9, 5);
insert into ingredientescardapio values(9, 7);
insert into ingredientescardapio values(9, 9);
insert into ingredientescardapio values(9, 11);

insert into cardapio (data, id_refeicao) values('2015-12-11', 2);
insert into ingredientescardapio values(10, 2);
insert into ingredientescardapio values(10, 4);
insert into ingredientescardapio values(10, 6);
insert into ingredientescardapio values(10, 8);
insert into ingredientescardapio values(10, 10);
insert into ingredientescardapio values(10, 12);

insert into tipocliente (descricao,valor,ativo) values ('Professor', 1.3333 , false);
insert into tipocliente (descricao,valor,ativo) values ('Servidor', 2.75 , true);
insert into tipocliente (descricao,valor,ativo) values ('Aluno', 33.1 , true);
insert into tipocliente (descricao,valor,ativo) values ('Visitante', 3.14 , false);

insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-10 01:33:45',1.3333,'11223344511',1);
insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-10 01:33:46',2.75,'11223344511',2);
insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-10 01:33:47',33.1,'11223344511',3);
insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-10 01:33:48',3.14,'11223344511',4);

insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-09 01:33:45',1.3333,'11223344511',1);
insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-09 01:33:46',2.75,'11223344511',2);
insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-09 01:33:47',33.1,'11223344511',3);
insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-09 01:33:48',3.14,'11223344511',4);

insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-08 01:33:45',1.3333,'11223344511',1);
insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-08 01:33:46',2.75,'11223344511',2);
insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-08 01:33:47',33.1,'11223344511',3);
insert into registro(datahora,valor_cobrado,cpf_colaborador,categoria_cliente) values ('2015-12-08 01:33:48',3.14,'11223344511',4);


