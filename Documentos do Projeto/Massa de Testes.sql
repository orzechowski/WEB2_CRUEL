insert into tipocliente (descricao,valor,ativo) values ('Professor', 1 , false)
insert into tipocliente (descricao,valor,ativo) values ('Servidor', 2 , true);
insert into tipocliente (descricao,valor,ativo) values ('Aluno', 3 , true);
insert into tipocliente (descricao,valor,ativo) values ('Externo', 7 , false);


insert into cargo (nome) values ('Gerente');
insert into cargo (nome) values ('Nutricionista');
insert into cargo (nome) values ('Atendente');
insert into cargo (nome) values ('Cliente');

insert into colaborador values (11111111111,'Marcelo','m@m',11111,'asdf',11111111,'','true',1);
insert into colaborador values (22222222222,'Maria','m@m',22222,'asdf',11111111,222222,'true',2);
insert into colaborador values (33333333333,'Jose','m@m',33333,'asdf',11111111,'','true',3);

insert into tipoingrediente (descricao) values('Arroz'); /*1*/
insert into tipoingrediente (descricao) values('Feijao'); /*2*/
insert into tipoingrediente (descricao) values('Salada'); /*3*/
insert into tipoingrediente (descricao) values('Carne'); /*4*/
insert into tipoingrediente (descricao) values('Acompanhamento'); /*5*/
insert into tipoingrediente (descricao) values('Sobremesa'); /*6*/

insert into ingrediente (nome, descricao, id_tipoingrediente) values('Arroz a Grega', 'Arroz com muita coisa', 1);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Arroz Pipoca', 'Arroz com alegria', 1);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Feijao Craca', 'Feijao dos Mamonas', 2);
insert into ingrediente (nome, descricao, id_tipoingrediente) values('Feijao de vó', 'Aquele que nunca tem no RU', 2);
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

insert into cardapio (data, id_refeicao) values('2015-12-01', 1);
insert into cardapio (data, id_refeicao) values('2015-12-01', 2);

insert into ingredientescardapio values(1, 1);
insert into ingredientescardapio values(1, 3);
insert into ingredientescardapio values(1, 5);
insert into ingredientescardapio values(1, 7);
insert into ingredientescardapio values(1, 9);
insert into ingredientescardapio values(1, 11);
insert into ingredientescardapio values(2, 2);
insert into ingredientescardapio values(2, 4);
insert into ingredientescardapio values(2, 6);
insert into ingredientescardapio values(2, 8);
insert into ingredientescardapio values(2, 10);
insert into ingredientescardapio values(2, 12);
