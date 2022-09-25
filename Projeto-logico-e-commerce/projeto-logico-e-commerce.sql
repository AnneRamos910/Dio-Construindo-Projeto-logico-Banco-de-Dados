-- inserção de dados e queries.
use ecommerce;

show tables;

-- tabela cliente.
desc clientes;

insert into clientes (Nome, Sobrenome, CPF, Endereco, Contato, Data_de_nascimento)
Values ('Ana', 'Carolina', '1598764879', 'rua expedicionarios 10','11992668798','2001-10-14'),
('Roberta', 'Silva', '265322652', 'francisco valio 250','45996845579','1970-08-20'),
('Pedro', 'Henrique', '47898524815', 'avenida 5 de novembro 1001','5698756148','1980-11-10');

-- tabela produto 
desc produto;
insert into produto (Nome, Descricao, Categoria, avaliacao, tamanho)
values ('Celular','moto g4' ,'eletrônico','5',null),
('Boneca Reborn','para criancas acima de 2 anos' ,'Brinquedo','4',null),
('Camiseta Brazil','camiseta de agodão,regata' ,'Esporte','4.5','M');

select * from clientes;
select * from produto;


-- tabela pedido
desc pedidos;
insert into pedidos (idPedido_Cliente, status_do_pedido, DescricaoPedido, Frete) 
values (1,default,'compra via aplicativo','80'),
(2,default,'compra via aplicativo','100'),
(3,null,'compra via aplicativo','150');


-- tabela pessoa física
desc pessoa_fisica;
insert into pessoa_fisica (idPessoaFisica, CPF, NomeCompleto)
values (1,'114578998517','Roberta Aparecida da Silva'),
(2,'487968153246','João Pedro Alemida'),
(3,'265897458197','Maria de lurdes');
select * from pessoa_fisica;


-- tabela pessoa juridica
desc pessoa_juridica;

insert into pessoa_juridica (idPessoaJuridica, CNPJ, Nome_da_empresa)
values (1,'114578998517458','Show Products'),
(2,'487962768153246','Especialista Eletro'),
(3,'298565897458197','Esporte Vision');


-- tabela produto_estoque 

desc produto_estoque;
insert into produto_estoque (idProduto, idEstoque, Endereco, quantidade)
values (2,2,'rua pedro marques 621', '100'),
 (3, 3, 'jose de paulo 1021', '70'),
  (4,4, 'americo izzo 1007', '150');
  select * from  produto_estoque;
  
  -- tabela produto_pedido
  desc produto_pedido;
  insert into produto_pedido (IdProduto, idPedido, Quantidade, Status_pedido)
  values (1,1, '100', default),
  (2,2, '70', default),
  (3,3, '50', default);

  select * from produto_pedido;
  
  -- tabela produtos_vendedor
  desc produtos_vendedor;
  insert into produtos_vendedor (idPvendedor, idProduto, Quantidade)
  values (1,1,'5'),
  (2,2,'15'),
  (3,3,'10');
  select* from produtos_vendedor;

-- tabela entregas
desc entregas;

insert into entregas (idEntregas, Codigo_de_rastreio, Status_entrega, Data_da_entrega)
values ('1','06595528621513215162450504', default, '2022-08-10'),
('2', '8954844621518454215162450504', default, '2022-07-20'),
 ('3','4854854621513215162450504', default, '2022-09-11');
 
select * from entregas;

-- tabela estoque
desc estoque;
insert into estoque (idEstoque,Endereco, Quantidade)
values(1,'rua padre albuquerque 1045','250'),
(2,'rua venancio ayres 104','200'),
(3,'rua bejamin constant 465','100');
select * from entregas;

-- tabela fornecedor 
desc fornecedor;
insert into fornecedor (idFornecedor, Razao_social, CNPJ, contato)
values (1,'Produtos ltda Brasil','45963785197648','03256982828'),
 (2,'Esporte guia','4548456428','01545871291'),
  (3,'Outer Kids','55140484820','01996547134');

-- tabela pagamentos
desc pagamento;
insert into pagamento (idCliente, idPagamento, tipo_de_pagamento, limite_disponivel)
values (1,1,'cartão', '1000'),
(2,2,'boleto', '90'),
(3,3,'pix', '100');
select * from pagamento;

-- tabela distribuidora 
desc distribuidora;
insert into distribuidora (idDistribuidora, Nome, Endereco)
values (1,'Estação Esport', 'rua campos salles 1414, Centro-Itapetinga/SP'),
(2,'Eletro Stor', 'rua francisco valio 1019, São Paulo/SP'),
 (3,'Mundo Kids ', 'rua copacabana 4541 Rio de Janeiro/RJ');

select * from distribuidora;

-- tabela produto_fornecedor.
desc produto_fornecedor;
select * from  produto_fornecedor;

insert into produto_fornecedor (idFornecedor, idProduto, quantidade)
values (1,1,'250'),
(2,1,'350'),
(3,1,'200');

select count(*) from clientes;

select * from clientes c, pedidos p where c.idCliente = idPedido;

select * from clientes c, pedidos p where c.idCliente = idPedido_Cliente;

select * from clientes left outer join pedidos ON idCliente = idPedido_Cliente;