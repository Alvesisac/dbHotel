/* Mostrar os bancos de dados existentes no servidor */
show databases;

/*Excluir a tabela*/
drop table funcionarios;

/* Criar um novo banco*/
create database dbHotel;

/*seleciona o banco*/
use dbHotel;

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

/* Insert um novo funcionário na tabela com nome, login, senha criptografada */
insert into funcionarios(nomeFunc, login, senha) values ("Felipe Coelho", "felipe", md5 ("123@senac")); 


/* READ */
/* Ler/Buscar as informações da tabela funcionários */
select * from funcionarios;

/* UPDATE */
/* Atualizar o campo login na tabela funcionarios especificando o id */

update funcionarios set cargo = "Gerência" where idFunc = 5;




