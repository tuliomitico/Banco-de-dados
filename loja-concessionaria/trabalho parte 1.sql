--Selecione todos os carros

select * from lojas1.carro;

--Consultar os endereços cujo o bairro seja o Jardins

select * from loja1."endereço" where bairro='Jardins'

--Listar o marca, modelo, preço de venda dos carros com preço de venda acima de 29000 reais

select ca.marca,ca.modelo,pro.preco_venda 
from loja1.carro as ca join loja1.produto as pro on (ca.cod_produto=pro.cod_produto1)
where pro.preco_venda > 29000

--Listar cep,numero,cpf,nome das pessoas

select mo.cep,mo.numero,mo.cpf,pe.nome 
from mora as mo join endereço as en using (cep) join pessoa as pe on (mo.cpf = pe.cpf);
