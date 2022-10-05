-- insersão
-- tabela clientes
desc clientes;

insert into clientes (idCliente, Nome,Endereco,Contato,CNH)
values(1,'Bruno Oliveira', 'rua francisco valio 1018 vila prado-São Paulo/SP','01197804517','12278955461'),
(2,'Ana Luiza', 'avenida americas 515 Rio de Janeiro/RJ','011326598471','14525411'),
(3,'Luana Aparecida', 'rua galvão bueno vila são jose 45-São Paulo/SP','015784529810','49875632108');
select * from clientes;

-- tabela ordem de servicos
desc ordemdeServicos;
select * from ordemdeServicos;
insert into ordemdeServicos(idOrdemdeServicos, Data_de_emissao, numero_de_identificacao, Valor, Status_ordem, DatadeEntrega, revisao)
values (1,'2021-08-10', '656515451564','200',default,'2021-08-22','troca de oleo'),
(2,'2020-06-18', '54515245664','350',default,'2020-07-01','manutenção do freios'),
(3,'2022-10-15', '25215451564','250',default,'2022-10-31','vela de ignição');


-- tabela cliente autoriza ordem de sevicos
desc clientes_autoriza_ordemdeServicos;
insert into clientes_autoriza_ordemdeServicos (idCliente, idOrdemdeServicos)
values (1,1),
(2,2);

-- tabela equipe
desc equipe;
insert into equipe (idEquipe, numero_de_funcionarios, especializacao)
values (1,'15','reformar carros antigos'),
(2,'10','manutenções de sistemas específico'),
(3,'20','em carros de luxos');


-- tabela estoque
desc estoque;
insert into estoque(idEstoque, Quantidade_min, Quantidade_max, Endereco )
values(1,'100','250', 'avenida lobarto 4457 São Paulo/SP'),
(2,'50','100', 'rua doutor coutinho 1057 São Paulo/SP'),
(3,'80','150', 'rua dos palmeiras 123 Minas/MG');

-- tabela pagamento
desc formadepagamento;

insert into formadepagamento (idFormadepagamento, tipo_de_pagamento, limite_disponivel)
values (1,default,300),
(2,default,1000),
(3,default,200);

-- tabela mao de obra
desc mao_de_obra;
insert into mao_de_obra (idVeiculos, idMecanico, valor)
values (1,1,'200'),
(2,2,'250'),
(3,2,'150');

-- tabela mecanico
desc mecanico;
insert into mecanico (idMecanico, nome, endereco, especialidade)
values (1,'joão Pedro', 'rua jair oliveira 1018 centro Itapevi/SP','especializado em carros antigos'),
(2,'Roberto da Silva', 'rua campos salles 1715 centro Itape/SP','reparador de sistemas'),
(3,'Pedro Guilherme', 'avenida paulista 1013 São Paulo/SP','preparador e customizador');


-- tabela ordem de serviços_peças
desc ordemdeservicos_pecas;
insert into ordemdeservicos_pecas (idPecas, idOrdemdeServicos, Quantidade)
values (1,1,'100'),
 (2,3,'300'),
  (3,2,'200');


-- tabela peças
desc pecas;
insert into pecas(idPecas, nome, Marca, Descricao,valor)
values (1, 'óleo de motor', 'petronas', 'óleo lubrificante','70'),
(2, 'lampada do farol', 'Carrhel', ' melhoria na visibilidade','80'),
(3, 'suporte da placa ', 'Mercosul', 'protege e compativel','100');

select * from pecas;


-- tabela veiculos 
desc veiculos;
insert into veiculos(idVeiculos, modelo, cor, Ano, Documentacao, placa)
values(1, 'Toyota','preto', '2018',default, 'HDK4598'),
(2, 'Ford','azul', '2017',default, 'KLW98635'),
(3, 'Chevrolet','vermelho', '2022',default, 'FDK45675');

select * from veiculos;