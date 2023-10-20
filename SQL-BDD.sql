/* Mostrar os bancos de dados existentes no servidor */
show databases;

/*Excluir a tabela*/
drop table funcionarios;

/* Criar um novo banco*/
create database dbHotel;

/*seleciona o banco*/
use dbHotel;

/* Excluir um campo da tabela */
alter table funcionarios drop column email;

/* Resposicionar o campo email para que ele fique após o campo login */
alter table funcionarios modify column email varchar(50) not null after login;

/* Adicionar o campo email à tabela funcionarios */
alter table funcionarios add column email varchar(50) not null;

/*Criar uma nova tabela*/

create table funcionarios (
/*int se refere ao tipo do campo na tabela 
primary key determina que o campo idFunc seja uma chave primária 
responsável por identificar cada cadastro */
	idFunc int primary key auto_increment,
    /* varchar é a quaantidade variável de caracteres no nome (nesse caso, até 100 caracteres)
    not null determina que o campo seja obrigatório */
	/*nomeFunc varchar(100) not null,*/
    /* unique determina que o campo seja único e o valor não possa repetir */
    login varchar(20) not null unique,
    senha varchar(255) not null,
    cargo varchar(20)

);
/*descrever os campos da tabela funcionarios */
describe funcionarios;



/* Ver tabelas criadas*/
show tables;

/* CREATE */
/*Inserir um novo funcionário na tabela, com nome, login, senha criptografada e cargo */
insert into funcionarios(nomeFunc, login, senha, cargo) values ("Administrador", "admin", md5("admin"), "Administrador");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Pamella pereto", "pamellapereto", md5("123@senac"), "TI");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Breno Silva", "BrenoSilva", md5("123@senac"), "Contabilidade");

insert into funcionarios(nomeFunc, login, senha, cargo) values ("Victoria Cardoso", "VictoriaCardoso", md5("123@senac"), "RH");

insert into funcionarios(nomeFunc, login, senha) values ("Laura", "LauraLopes", md5("123@senac"));

insert into funcionarios(nomefunc, login, senha, email, cargo) values ("Thiago Saga","ThiagoSaga06", md5("123@senac"), "ThiagoSaga06.gmail.com", "Gerência");

/* Insert um novo funcionário na tabela com nome, login, senha criptografada */
insert into funcionarios(nomeFunc, login, senha) values ("Felipe Coelho", "felipe", md5 ("123@senac")); 

/**/
select * from funcionarios where cargo = "Gerencia" order by nomeFunc asc;


/* READ */
/* Ler/Buscar as informações da tabela funcionários */
select * from funcionarios;

/*Buscar o ID e o nome do funcionário da tabela funcionários ordenando o nome alfabeticamente (ascendente, de A a Z)*/
select idFunc as ID_funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc asc;

/*Buscar o ID e o nome do funcionário da tabela funcionários ordenando o nome alfabeticamente (ascendente, de Z a A)*/
select idFunc as ID_funcionario, nomeFunc as Nome_Funcionario from funcionarios order by nomeFunc desc;

/* Buscar os campos ID com apelido ID_Funcionario, nomeFunc com o apelido Nome_Funcionario e cargo com o apelido Cargo_Funcionario
 da tabela funcionarios ordenando de forma descendente (do maior ID para o menor) */
select IdFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios order by IdFunc desc;

/* Buscar os campos ID com apelido ID_Funcionario, nomeFunc com o apelido Nome_Funcionario e cargo com o apelido Cargo_Funcionario
 da tabela funcionarios ordenando de forma descendente (do maior ID para o menor) */
select IdFunc as ID_Funcionario, nomeFunc as Nome_Funcionario, cargo as Cargo_Funcionario from funcionarios where cargo  <>'null' order by IdFunc desc;

/* UPDATE */
/* Atualizar o campo login na tabela funcionarios especificando o id */

update funcionarios set cargo = "Gerência" where idFunc = 5;

update funcionarios set email = "Pamellapereto12@gmail.com" where idFunc = 7;

update funcionarios set email = "BrenoSilva13@gmail.com" where idFunc = 4;

update funcionarios set email = "VictoriaCardoso14@gmail.com" where idFunc = 5;

update funcionarios set email = "LauraLopes15@gmail.com" where idFunc = 6;

update funcionarios set email = "FelipeCoelho16@gmail.com" where idFunc = 8;

/*DELETE*/
Delete from funcionarios where idFunc = 8;


create table quartos (
	idQuarto int primary key auto_increment,
    andar varchar(10) not null,
    tipoQuarto varchar(50) not null,
    ocupacaoMax int not null,
    situacao char(3) not null,
    nome varchar (50) not null,
    descricao text,
    preco decimal (10,2) not null,
    tipoCama varchar (20),
    varanda char(3)
);

describe quartos;

alter table quartos add column numeroQuarto varchar(10) not null after andar;
