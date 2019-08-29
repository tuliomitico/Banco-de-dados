--Selecione todos os carros

select * from lojas1.carro;

--Consultar os endereços cujo o bairro seja o Jardins

select * from loja1."endereço" where bairro='Jardins'

--Listar o marca, modelo, preço de venda dos carros com preço de venda acima de 29000 reais

select ca.marca,ca.modelo,pro.preco_venda 
from loja1.carro as ca join loja1.produto as pro on (ca.cod_produto=pro.cod_produto)
where pro.preco_venda > 29000

--Listar cep,numero,cpf,nome das pessoas

select mo.cep,mo.numero,mo.cpf,pe.nome 
from mora as mo join endereço as en using (cep) join pessoa as pe on (mo.cpf = pe.cpf);

--Listar media do preço de custo dos carros

select avg(preco_custo) from produto as pro join carro as ca using (cod_produto);

--Listar o numero de todos os clientes

select count(pessoa_cpf1) from cliente;

--Listar nome dos funcionários(as) que começam com 'sa'

select * from (select pe.nome,pe.sobrenome 
from pessoa as pe join funcionario as fu on (pe.cpf=fu.pessoa_cpf))
as nome_fun where nome ilike 'sa%';

--Listar as vendas que aconteceram entre o 2º trimestre de 2019

select * from venda where data_venda > '2019-03-31' and data_venda < '2019-06-30';
