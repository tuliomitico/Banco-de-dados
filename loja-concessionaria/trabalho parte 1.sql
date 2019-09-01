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

--Listar cliente que tem a media de pontos de fidelidades maior que 149 a dos demais

select pe.nome,to_char(avg(qtd_ponto),'9999') as media
from fidelidade f join cliente cl on (f.cliente_pessoa2_cpf=cl.pessoa_cpf1) join
pessoa pe on (pe.cpf=cl.pessoa_cpf1) group by pe.cpf having avg(qtd_ponto) > 149;

--Listar os emails que são da Google

select email from pessoa where email ilike '%gmail____'

--Ordenar os fornecedore e listar seus nomes pela ordem de data de entrega crescente

select fo.nome,ab.data_entrega 
from fornecedor fo join abastece ab using (cnpj) order by data_entrega ASC;

--Listar os nomes e sobrenomes dos funcionarios que estão administrando algum cliente

select pe.nome,pe.sobrenome from pessoa pe
join funcionario fu using (cpf) where fu.cpf in (select ad.funcionario_pessoa_cpf from  
									administra ad);

--Listar nome e sobrenomes dos clientes que não são administrados

select pe.nome,pe.sobrenome from pessoa pe
join cliente cl on (pe.cpf=cl.pessoa_cpf1) where cl.pessoa_cpf1 not in (select ad.cliente_pessoa_cpf from  
									administra ad);

--Listar por notas fiscais o número de produtos por venda

select v.nf,count(pr.cod_produto) from venda v 
join possui po on (v.nf=po.venda_nf) join produto pr on (pr.cod_produto=po.produto_cod_produto) 
group by v.nf;

--Listar todas as peças que não foram vendidas

select pe.nome,pe.tipo,pe.descricao,pe.cod_peca
from peça as pe where cod_produto not in (select pr.cod_produto from 
										   produto pr join possui po 
										  		on (pr.cod_produto = po.produto_cod_produto) 
										   join venda v on (v.nf=po.venda_nf));

--Listar o suposto lucro dos tapetes da Ford com precisão de 2 digitos

select to_char(sum(preco_venda) - sum(preco_custo),'999.99') as tapete from (select * from peça as pe join produto as pr using (cod_produto) where pe.nome ilike 
'Tapete Ford') as valor_venda;



									
