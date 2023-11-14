show databases;

create database dbPadaria;

use dbPadaria;

create table fornecedores (
	idFornecedor int primary key auto_increment,
    nomeFornecedor varchar(50) not null,
    cnpjFornecedor varchar(20) not null,
    telefoneFornecedor varchar(20),
    emailFornecedor varchar(50) not null unique,
    cep varchar(9),
    enderecoFornecedor varchar(100),
    numeroEndereco varchar(10),
    bairro varchar(40),
    cidade varchar(40),
    estado char(2)
);

insert into fornecedores (nomeFornecedor, cnpjFornecedor, emailFornecedor) values ("Ana Rosa Confeitaria", "03.266.407/0001-53", "anarosaconfeitaria@gmail.com");
select * from fornecedores;

create table produtos (
	idProduto int primary key auto_increment,
    nomeProduto varchar(50) not null,
    descricaoProduto text,
    precoProduto decimal (10,2) not null,
    estoqueProduto int not null,
    categoriaProduto enum("Pães", "Bolos", "Confeitaria", "Salgados"),
    idFornecedor int not null,
    foreign key (idFornecedor) references fornecedores (idFornecedor)
);

ALTER TABLE produtos ADD COLUMN validadeProduto date;
ALTER TABLE produtos ADD COLUMN pesoProduto decimal (10,2);
ALTER TABLE produtos ADD COLUMN ingredientesProdutos text;

insert into produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor, validadeProduto, pesoProduto, ingredientesProdutos) values ("Bolo de laranja","Massa aromatizada com o sabor da fruta, para melhor degustação e prazer", 44.99, 5, "Bolos", 1, "2023-11-20" , "2.00", "3 ovos, 2 colheres de sopa de margarina, 1 xícara de açúcar, 2 xícaras de farinha de trigo, 1 xícara de suco de laranja,
 1 colher de sopa de fermento, 1 xícara de açúcar, Meia xícara de suco de laranja"); 

insert into produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor, validadeProduto, pesoProduto, ingredientesProdutos) values 
("Coxinha", "Massa cremosa a base de batata, superfície dourada e crocante, com o empanamento aderente à massa, recheio de peito de frango desfiado, com fragmentos de salsinha e cebolinha.", 13.50, 3, "Salgados", 1,
 "2023-11-21", "0.45","500 ml de leite, 600 g farinha de trigo, 1 peito de frango medio, 1 colher de sopa margarina qualy, 3 xícaras de água, 2 colheres de sopa farinha trigo, 500 g farinha de rosca, 2 tablete caldo galinha,
 400 g batata cozida e espremida, 1 colher de sobremesa de sal, 1 cebola picada, 1/2 maço de cheiro verde, 1 folha de louro, 1 litro de água gelada, 1 litro de óleo para fritar");

insert into produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor, validadeProduto, pesoProduto, ingredientesProdutos) values 
("Croissants", "É um pão recheado por dentro com boa crocância por fora, com diversas variedades e sabores", 4.50, 2, "Pães", 1,"2023-11-22", "0.30", "3 xícaras de farinha de trigo (aproximadamente), 3 colheres de sopa de manteiga em temperatura ambiente, 2 ovos batidos ligeiramente, ½ xícara de água em temperatura ambiente,
100g de manteiga em temperatura ambiente, 1 colher de sopa cheia de fermento biológico instantâneo (10g), 2 colheres de sopa rasas de açúcar, 1 colherinha de sal, 1 colher de sopa de farinha de trigo, 1 ovo batido para pincelar");


select * from produtos;


insert into produtos (nomeProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values ("Bolo de laranja", 44.99, 5, "Bolos", 1); 
insert into produtos (nomeProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values ("Farinha", 14.90, 7, "Confeitaria", 1); 

select * from produtos where categoriaProduto = "Pães";

select * from produtos where precoProduto < 50.00 order by precoProduto asc;

create table clientes (
	idCliente int primary key auto_increment,
    nomeCliente varchar(50),
    cpfCliente varchar(15) not null unique, 
    telefoneCliente varchar(20),
    emailCliente varchar(50) unique,
    cep varchar (9),
    enderecoCliente varchar(100),
    numeroEndereco varchar (10),
    bairro varchar(40),
    cidade varchar(40),
    estado char(2)
);

insert into clientes (nomeCliente, cpfCliente, telefoneCliente, emailCliente, cep, enderecoCliente, numeroEndereco, bairro, cidade, estado) values 
("Julio vaz", "988.189.750-56", "(21) 2521-3564", "julio2@gmail.com", "22790-520", "Rua Leiloeiro Ernani Mello", "4667", "Recreio dos Bandeirantes", "Rio de Janeiro", "RJ");

select * from clientes;

create table pedidos (
	idPedido int primary key auto_increment,
    dataPedido timestamp default current_timestamp,
    statusPedido enum ("Pendente", "Finalizado", "Cancelado") not null,
    idCliente int not null,
    foreign key (idCliente) references clientes (idCliente)
);

insert into pedidos (statusPedido, idCliente) values ("Pendente", 1);

select * from pedidos inner join clientes on pedidos.idCliente = clientes.idCliente;

create table itensPedidos (
	idItensPedidos int primary key auto_increment,
    idPedido int not null,
    idProduto int not null,
    foreign key (idPedido) references pedidos (idPedido),
    foreign key (idProduto) references produtos (idProduto),
	quantidade int not null
);

select * from itensPedidos;
insert into itensPedidos (idPedido, idProduto, quantidade) values (1, 1, 3);
insert into itensPedidos (idPedido, idProduto, quantidade) values (1, 2, 5);


/* OBJETIVO: consultar o nome do cliente que abriu seu pedido em determinada data para verificar o que ele comprou de itens nesse pedido e a respectiva quantidade,
ou seja, quais produtos e quanto de cada um 
QUEM COMPROU? QUANDO COMPROU? O QUE COMPROU? QUANTO COMPROU? */

select clientes.nomeCliente, pedidos.idPedido, pedidos.dataPedido, itensPedidos.quantidade, produtos.nomeProduto, produtos.precoProduto
from clientes inner join pedidos on clientes.idCliente = pedidos.idCliente inner join
itensPedidos on pedidos.idPedido = itensPedidos.idPedido inner join
produtos on produtos.idProduto = itensPedidos.idProduto;

select sum(quantidade * 18.00 ) as total from itensPedidos inner join pedidos on itensPedidos.idPedido = pedidos.idPedido where pedidos.idPedido = 3;

select sum(produtos.precoProduto * itensPedidos.quantidade) as Total from produtos inner join itensPedidos on produtos.idProduto = itensPedidos.idProduto where idPedido = 3; 


select *  from produtos where validadeProduto > curdate();

select * from produtos where categoriaProduto = "Pães" and ingredientesProdutos not like "%farinha de trigo%" and precoProduto < 7.90;

