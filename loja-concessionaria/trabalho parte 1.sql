--Selecione todos os carros

select * from lojas1.carro;

--Consultar os endereços cujo o bairro seja o Jardins

select * from loja1."endereço" where bairro='Jardins'

--Listar o marca, modelo, preço de venda dos carros com preço de venda acima de 29000 reais

select * from loja1.carro;
select * from loja1.produto;
select ca.marca,ca.modelo,pro.preco_venda 
from loja1.carro as ca join loja1.produto as pro on (cod_produto=produto_cod_produto1)
where pro.preco_venda > 29000

