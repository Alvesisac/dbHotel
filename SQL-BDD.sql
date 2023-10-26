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

/* ADICIONAR COMANDOS ABAIXO */
alter table quartos add column cafeDaManha char(3) not null after preco;
alter table quartos add column foto varchar (255) not null after descricao;


alter table quartos add column numeroQuarto varchar(10) not null after andar;

insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda, cafeDaManha, foto) values ("8º", "505", "Superior Premier", 3, "não",
 "familiar", "O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42'', wi-fi grátis, cofre digital,
 frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", 1596.00, "Queen Size", "sim", "sim", "");
 
 insert into quartos (andar, numeroQuarto, tipoQuarto, ocupacaoMax, situacao, nome, descricao, preco, tipoCama, varanda, cafeDaManha, foto) values ("8º", "505", "Superior Premier", 3, "sim",
 "familiar", "O quarto de 32m² com piso frio, varanda - vista para o mar. Oferece ar condicionado individual, TV LCD 42'', wi-fi grátis, cofre digital,
 frigobar abastecido e banheiro com secador de cabelo e amenities e mesa de trabalho.", 200.00, "Queen Size", "nao", "nao", "https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2018/10/18/1313/Grand-Hyatt-Sao-Paulo-P804-Grand-Twin-Panoramic-View.jpg/Grand-Hyatt-Sao-Paulo-P804-Grand-Twin-Panoramic-View.16x9.jpg");
 
 update quartos set cafeDaManha = "sim" where idQuarto = 1;
 update quartos set foto = "https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2018/10/18/1313/Grand-Hyatt-Sao-Paulo-P804-Grand-Twin-Panoramic-View.jpg/Grand-Hyatt-Sao-Paulo-P804-Grand-Twin-Panoramic-View.16x9.jpg" where idQuarto = 1;

 update quartos set numeroQuarto = "506" where idQuarto = 2;
 
 select * from quartos;
 
Delete from quartos where idQuarto = 12;

select * from quartos where situacao = "sim";
select * from quartos where situacao = "nao" order by preco asc;

select * from quartos where cafeDaManha = "nao";
select * from quartos where varanda = "nao";
select * from quartos where preco < 700.00 ;
select * from quartos where cafeDaManha ="sim" and varanda = "sim" ;

update quartos set andar = "12º" where idQuarto = 13;
 
 
 /*Tabela Pedido*/
 /*dataPedido timestamp default current_timestamp significa que a data do pedido será a mesma do sistema, ou seja, a data atual
 statusPedido significa que a situação do pedido será entre as seguintes opções: Pedentes, Finalizado, Cancelado */
 
 create table pedido (
	idPedido int primary key auto_increment,
    dataPedido timestamp default current_timestamp,
    statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
    idCliente int not null,
    foreign key(idCliente) references clientes(idCLiente)
 );
 
 

alter table pedido modify column statusPedido enum("Pendente", "Finalizado", "Cancelado") not null;

 insert into pedido (statusPedido, idCliente) values ("Pendente", 1);
 insert into pedido (statusPedido, idCliente) values ("Finalizado", 2); 
 
 
 alter table reservas add column checkin datetime not null;
 alter table reservas add column checkout datetime not null;
 
 
 

 select * from pedido;
 
 select * from pedido inner join clientes on pedido.idCliente = clientes.idCliente;
 
 
 /*Tabela Reservas*/
 
 create table reservas (
	idReserva int primary key auto_increment,
    idPedido int not null,
    idQuarto int not null,
    foreign key (idPedido) references pedido(idPedido),
	foreign key (idQuarto) references quartos(idQuarto)
);
 
 describe reservas;
 
 select * from reservas;
 
 insert into reservas (idPedido, idQuarto, checkin, checkout) values(1, 1, "2023-11-08 22:00:00", "2023-12-10 22:00:00");
 insert into reservas (idPedido, idQuarto, checkin, checkout) values(1, 2, "2023-11-07 22:00:00", "2023-12-09 22:00:00");

 select * from reservas;
 select * from reservas inner join
 
 /*Tabela Clientes*/
 
 create table clientes (
	idCliente int primary key auto_increment,
    nomeCompleto varchar(100) not null,
    cpf char(14) not null unique,
    rg char(12) not null unique,
    email varchar(50) unique,
    celular varchar(20) not null,
    numeroCartao varchar(20) not null,
    nomeTitular varchar(100) not null,
    validade date,
    cvv char(3) not null,
    checkin datetime not null,
    checkout datetime not null
);
    
    describe clientes; 


    drop table clientes;
    
    insert into clientes (nomeCompleto, cpf, rg, email, celular,) values 
    ( "Isac Alves dos Santos", "649.277.990-85","21.653.913-4", "isacsanttos12sp@gmail.com", "(11) 2465-8465");
    
     insert into clientes (nomeCompleto, cpf, rg, email, celular,) values
     ( "Thiago rivas ", "549.013.290-65","34.875.911-3", "thiagorivas12@gmail.com", "(11) 2465-8465");
     
 select *  from clientes;

/*Buscar o nome completo e o celular do cliente que alugou o quarto de número 505, pois a tabela quartos está vinculada à tabela clientes pelo campo idQuarto */
select clientes.nomeCompleto,
clientes.celular
from quartos inner join clientes 
on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;

/* Buscar TODAS AS INFORMAÇÕES da tabela quartos que está vinculada à tabela clientes pelo campo idQuarto */
select * from quartos inner join clientes
on quartos.idQuarto = clientes.idQuarto;

update clientes set nomeTitular = "Rorgers" where idCliente = 2;


select clientes.nomeCompleto, clientes.checkout, clientes.checkin from quartos inner join clientes on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;
select clientes.nomeCompleto, clientes.checkout, clientes.checkin from quartos inner join clientes on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 506;

select clientes.nomeCompleto as Nome, date_format(clientes.checkout, '%d/%m/%Y - %H:%i') as checkout from quartos inner join clientes
on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 505;

select clientes.nomeCompleto as Nome, date_format(clientes.checkout, '%d/%m/%Y - %H:%i') as checkout from quartos inner join clientes
on quartos.idQuarto = clientes.idQuarto where numeroQuarto = 506;

