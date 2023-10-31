-- drop database dbPadaria;

create database dbPadaria;

show databases;

use dbPadaria;

create table fornecedores (
idFornecedor int primary key auto_increment,
nomeFornecedor varchar(50) not null,
cnpjFornecedor char(20) not null unique,
telefoneFornecedor varchar(20),
emailFornecedor varchar (50) not null unique,
cep varchar (10),
enderecoFornecedor varchar(100),
numeroEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado char(2)
);

insert into fornecedores (nomeFornecedor, cnpjFornecedor, telefoneFornecedor, emailFornecedor, cep, enderecoFornecedor, numeroEndereco, bairro, cidade, estado) values
("Carlos jr", "83.556.227/0001-45", "(12) 3211-8135", "carlos6@gmail.com", "02913-020", "Travessa Reverendo Paulo Hasse-Professor", "557", "Vila Ursulina", "São Paulo", "SP" );

select * from fornecedores;

create table produtos (
idProduto int primary key auto_increment,
nomeProduto varchar(100) not null, 
descricaoProduto text, 
precoProduto decimal (10,2) not null, 
estoqueProduto int not null,
categoriaProduto enum ("Pães", "Bolos", "Croissants", "Salgados"), 
idFornecedor int not null,
foreign key (idFornecedor) references fornecedores (idFornecedor)
);

describe produtos;

insert into produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values 
("Croissants", "É um pão recheado por dentro com boa crocância por fora, com diversas variedades e sabores", 4.50, 2, "Pães", 1);

insert into produtos (nomeProduto, descricaoProduto, precoProduto, estoqueProduto, categoriaProduto, idFornecedor) values 
("Coxinha", "Massa cremosa a base de batata, superfície dourada e crocante, com o empanamento aderente à massa, recheio de peito de frango desfiado, com fragmentos de salsinha e cebolinha.", 13.50, 3, "Salgados", 1);

select * from produtos;

select * from produtos where categoriaProduto = "Pães";

select * from produtos where precoProduto < 40.00 order by precoProduto asc;

create table clientes (
idCliente int primary key auto_increment,
nomeCliente varchar(50) not null,
cpfCliente char(20) not null unique,
telefoneCliente varchar(20),
emailCliente varchar (50) unique,
cep varchar (10),
enderecoCliente varchar(100),
numeroEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado char(2)
);

describe clientes;

insert into clientes (nomeCliente, cpfCliente, telefoneCliente, emailCliente, cep, enderecoCliente, numeroEndereco, bairro, cidade, estado) values 
("Julio vaz", "988.189.750-56", "(21) 2521-3564", "julio2@gmail.com", "22790-520", "Rua Leiloeiro Ernani Mello", "4667", "Recreio dos Bandeirantes", "Rio de Janeiro", "RJ");

select * from clientes;

create table pedidos (
idPedido int primary key auto_increment,
dataPedido timestamp default current_timestamp,
statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
idCliente int not null,
foreign key (idCliente) references clientes (idCliente)
);

insert into pedidos (statusPedido, idCliente) values ("Finalizado", 1);

select * from pedidos;
select * from pedidos inner join clientes on pedidos.idCliente = clientes.idCliente;

create table itensPedidos (
iditensPedido int primary key auto_increment, 
idPedido int not null,
idProduto int not null,
foreign key (idPedido) references pedidos(idPedido),
foreign key (idProduto) references produtos(idProduto),
quantidade int not null
);


insert into itensPedidos (idPedido, idProduto, quantidade) values (3, 1, 5);
insert into itensPedidos (idPedido, idProduto, quantidade) values (3, 2, 4);

select * from itensPedidos;

select itensPedidos.iditensPedido, pedidos.idPedido,
produtos.idProduto, produtos.nomeProduto, produtos.precoProduto, produtos.categoriaProduto
from (itensPedidos inner join pedidos on itensPedidos.idPedido = pedidos.idPedido) 
inner join produtos on itensPedidos.idProduto = produtos.idProduto;