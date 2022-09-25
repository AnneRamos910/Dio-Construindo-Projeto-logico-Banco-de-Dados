create table clientes(
idCliente int auto_increment primary key,
Nome varchar(30) not null, 
Sobrenome varchar(25) not null,
CPF char(11) not null,
Endereco varchar(45) not null, 
Contato char(12),
Data_de_nascimento DATE not null, 
constraint unique_cpf_cliente unique (CPF)
);
desc clientes;


create table Pessoa_fisica (
idPessoaFisica int primary key,
CPF char(12),
NomeCompleto varchar(45) not null,
constraint unique_cpf_cliente unique (CPF),
constraint fk_pessoafisica_cliente foreign key (idPessoaFisica) references clientes(idCliente)
);

drop table pessoa_juridica;
create table Pessoa_juridica (
idPessoaJuridica int primary key,
CNPJ char(15),
Nome_da_empresa varchar(45) not null, 
constraint unique_cnpj_cliente unique (CNPJ),
constraint fk_pessoajuridica_cliente foreign key (idPessoaJuridica) references clientes(idCliente)
);

create table produto (
IdProduto int auto_increment primary key,
Nome varchar(15) not null,
Descricao varchar(40) not null,
Categoria enum('Eletrônico','Brinquedo','Esporte','Beleza' )not null,
avaliacao float default 0,
 tamanho varchar (10)
);
desc produto;

create table vendedor (
idVendedor int auto_increment primary key,
Razao_social varchar(255) not null, 
Nome_fantasia varchar(45) not null, 
CPF char(12),
CNPJ char(15),
local varchar(255) not null, 
contato char(11) not null, 
constraint unique_cpf_vendedor unique (CPF),
constraint unique_cnpj_vendedor unique(CNPJ)
);

create table pedidos(
idPedido int auto_increment primary key,
idPedidoCliente int,
Status_do_pedido enum('Endamento','Enviado','Entregue'),
DescricaoPedido varchar(100) not null,
Frete float default 10,
constraint fk_pedidos_cliente foreign key (idPedidoCliente) references clientes(idCliente)
);

desc pedidos;

create table entregas(
idEntrega int primary key,
Codigo_de_rastreio varchar(45) not null, 
Status_entrega enum('Encaminhado','Enviado','Entregue'),
Data_da_entrega DATE
);


create table pagamento(
idCliente int,
id_pagamento int,
tipo_de_pagamento enum('Boleto', 'Cartão', 'Pix'),
Limite_disponivel float,
primary key (idCliente, id_pagamento)
);

create table estoque (
idEstoque int auto_increment primary key,
Local varchar(45),
Quantidade  int default 0
);

create table fornecedor(
IdFornecedor int auto_increment primary key,
Razao_social varchar(255)  not null, 
CNPJ char(15) not null,
contato  char(11) not null,
constraint unique_fornecedor unique (CNPJ)
);

create table produtos_vendedor (
idPvendedor int,
idProduto int,
Quantidade int default 1,
primary key (idPVendedor, idProduto),
constraint  fk_pruduto_vendedor foreign key (idPVendedor) references vendedor(idvendedor),
constraint  fk_pruduto_produto foreign key (idProduto) references produto(idProduto)
);

create table produto_pedido(
idProduto int, 
idPedido int,
Quantidade int default 1,
Status enum('Disponivel','Sem estoque') default 'Disponivel',
primary key (idProduto, idPedido),
constraint fk_produts_vendedor foreign key (idProduto) references produto(idProduto),
constraint fk_produts_produto foreign key (idPedido) references  pedido(idPedido)
);


create table produto_estoque (
idProduto int, 
idEstoque int,
Local varchar (255) not null,
quantidade int default 1,
primary key (idProduto, idEstoque),
constraint fk_produto_vendedor foreign key (idproduto) references produto(idProduto),
constraint fk_produto_produto foreign key(idestoque) references estoque(idEstoque)
);

create table produto_fornecedor (
idFornecedor int, 
idProduto int,
quantidade int not null, 
primary key (idFornecedor, idProduto),
constraint fk_produto_fornecedor_fornecedor foreign key (idFornecedor) references fornecedor(idFornecedor),
constraint fk_produto_fornecedor_produto foreign key (idProduto) references produto(idProduto)
);

create table distribuidora (
idDistribuidora int primary key, 
Nome varchar(45) not null, 
Endereço varchar (255) not null, 
constraint fk_distribuidora_fornecedor foreign key (idDistribuidora) references fornecedor(idFornecedor)
);

