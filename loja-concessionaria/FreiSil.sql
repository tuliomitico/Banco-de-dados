CREATE SCHEMA loja1;

CREATE DOMAIN loja1.tipo_cpf AS character varying(13);
CREATE DOMAIN loja1.tipo_cnpj AS character varying(30);

CREATE TABLE loja1.abastece (
    lote integer NOT NULL,
    data_entrega timestamp without time zone NOT NULL,
    produto_cod_produto3 integer NOT NULL,
    fornecedor_cnpj loja1.tipo_cnpj DEFAULT NULL::character varying
);

CREATE TABLE loja1.administra (
    funcionario_pessoa_cpf loja1.tipo_cpf NOT NULL,
    cliente_cod_cliente integer NOT NULL,
    cliente_pessoa_cpf loja1.tipo_cpf NOT NULL
);

CREATE TABLE loja1.carro (
    num_chassi integer NOT NULL,
    modelo character varying(20) NOT NULL,
    cor character varying(15) NOT NULL,
    marca character varying(45) NOT NULL,
    cod_veicular integer,
    produto_cod_produto1 integer NOT NULL,
    ano integer
);

CREATE TABLE loja1.cliente (
    cod_cliente integer NOT NULL,
    pts_fidelidade integer NOT NULL,
    pessoa_cpf1 loja1.tipo_cpf NOT NULL
);


CREATE SEQUENCE loja1.cliente_cod_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE loja1.cliente_cod_cliente_seq OWNED BY loja1.cliente.cod_cliente;

CREATE TABLE loja1."endereço" (
    cep character varying(10) NOT NULL,
    logradouro character varying(45) NOT NULL,
    bairro character varying(40) NOT NULL,
    cidade character varying(20) NOT NULL,
    estado character varying(20) NOT NULL
);

CREATE TABLE loja1.fidelidade (
    cod_fidelidade integer NOT NULL,
    qtd_ponto integer NOT NULL,
    validade date NOT NULL,
    venda_nf1 integer NOT NULL,
    cliente_cod_cliente2 integer NOT NULL,
    cliente_pessoa2_cpf loja1.tipo_cpf NOT NULL
);

CREATE TABLE loja1.fornecedor (
    cnpj loja1.tipo_cnpj NOT NULL,
    nome character varying(45) NOT NULL,
    telefone character varying(16) NOT NULL,
    endereco character varying(200) NOT NULL
);

CREATE TABLE loja1.funcionario (
    curriculo character varying(255) NOT NULL,
    senha character varying(16) NOT NULL,
    salario double precision NOT NULL,
    pessoa_cpf loja1.tipo_cpf NOT NULL
);

CREATE TABLE loja1.mora (
    numero integer NOT NULL,
    complemento character varying(45) NOT NULL,
    pessoa_cpf loja1.tipo_cpf NOT NULL,
    "endereço_cep" character varying(10) NOT NULL
);

CREATE VIEW loja1.nome_view AS
 SELECT carro.num_chassi,
    carro.marca,
    carro.modelo,
    carro.ano,
    carro.cor,
    carro.cod_veicular,
    carro.produto_cod_produto1
   FROM loja1.carro;

CREATE TABLE loja1.pessoa (
    cpf loja1.tipo_cpf NOT NULL,
    nome character varying(45) NOT NULL,
    sobrenome character varying(45) NOT NULL,
    rg character varying(11) NOT NULL,
    telefone character varying(16) NOT NULL,
    email character varying(30) NOT NULL,
    data_nascimento date NOT NULL
);

CREATE TABLE loja1."peça" (
    cod_peca integer NOT NULL,
    tipo character varying(20) NOT NULL,
    nome character varying(15) NOT NULL,
    descricao character varying(200) NOT NULL,
    produto_cod_produto2 integer NOT NULL
);

CREATE SEQUENCE loja1."peça_cod_peca_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE loja1."peça_cod_peca_seq" OWNED BY loja1."peça".cod_peca;

CREATE TABLE loja1.possui (
    quantidade integer NOT NULL,
    venda_nf integer NOT NULL,
    produto_cod_produto integer NOT NULL
);

CREATE TABLE loja1.produto (
    cod_produto integer NOT NULL,
    preco_venda double precision NOT NULL CHECK (preco_venda > 0),
    preco_custo double precision NOT NULL CHECK (preco_custo > 0),
    data_compra date NOT NULL
);

CREATE SEQUENCE loja1.produto_cod_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE loja1.produto_cod_produto_seq OWNED BY loja1.produto.cod_produto;

CREATE TABLE loja1.venda (
    nf integer NOT NULL,
    preco_total double precision NOT NULL CHECK (preco_total > 0),
    data_venda date NOT NULL,
    cliente_cod_cliente1 integer NOT NULL,
    funcionario_pessoa1_cpf loja1.tipo_cpf NOT NULL,
    cliente_pessoa1_cpf loja1.tipo_cpf NOT NULL
);

ALTER TABLE ONLY loja1.cliente ALTER COLUMN cod_cliente SET DEFAULT nextval('loja1.cliente_cod_cliente_seq'::regclass);

ALTER TABLE ONLY loja1."peça" ALTER COLUMN cod_peca SET DEFAULT nextval('loja1."peça_cod_peca_seq"'::regclass);

ALTER TABLE ONLY loja1.produto ALTER COLUMN cod_produto SET DEFAULT nextval('loja1.produto_cod_produto_seq'::regclass);

ALTER TABLE ONLY loja1.abastece
    ADD CONSTRAINT abastece_pkey PRIMARY KEY (lote);

ALTER TABLE ONLY loja1.administra
    ADD CONSTRAINT administra_pkey PRIMARY KEY (funcionario_pessoa_cpf, cliente_cod_cliente, cliente_pessoa_cpf);

ALTER TABLE ONLY loja1.carro
    ADD CONSTRAINT carro_pkey PRIMARY KEY (num_chassi);

ALTER TABLE ONLY loja1.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cod_cliente);

ALTER TABLE ONLY loja1."endereço"
    ADD CONSTRAINT "endereço_pkey" PRIMARY KEY (cep);

ALTER TABLE ONLY loja1.fidelidade
    ADD CONSTRAINT fidelidade_pkey PRIMARY KEY (cod_fidelidade);

ALTER TABLE ONLY loja1.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (cnpj);

ALTER TABLE ONLY loja1.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (pessoa_cpf);

ALTER TABLE ONLY loja1.mora
    ADD CONSTRAINT mora_pkey PRIMARY KEY (numero);

ALTER TABLE ONLY loja1.cliente
    ADD CONSTRAINT pessoa_cpf1_un UNIQUE (pessoa_cpf1);

ALTER TABLE ONLY loja1.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (cpf);

ALTER TABLE ONLY loja1."peça"
    ADD CONSTRAINT "peça_pkey" PRIMARY KEY (cod_peca);

ALTER TABLE ONLY loja1.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (cod_produto);

ALTER TABLE ONLY loja1.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (nf);

ALTER TABLE ONLY loja1.abastece
    ADD CONSTRAINT abastece_fornecedor_cnpj_fkey FOREIGN KEY (fornecedor_cnpj) REFERENCES loja1.fornecedor(cnpj);

ALTER TABLE ONLY loja1.abastece
    ADD CONSTRAINT abastece_produto_cod_produto3_fkey FOREIGN KEY (produto_cod_produto3) REFERENCES loja1.produto(cod_produto);

ALTER TABLE ONLY loja1.administra
    ADD CONSTRAINT administra_cliente_pessoa_cpf FOREIGN KEY (cliente_pessoa_cpf) REFERENCES loja1.cliente(pessoa_cpf1);

ALTER TABLE ONLY loja1.administra
    ADD CONSTRAINT cliente_cod_cliente FOREIGN KEY (cliente_cod_cliente) REFERENCES loja1.cliente(cod_cliente);

ALTER TABLE ONLY loja1.fidelidade
    ADD CONSTRAINT cliente_cod_cliente2 FOREIGN KEY (cliente_cod_cliente2) REFERENCES loja1.cliente(cod_cliente);

ALTER TABLE ONLY loja1.fidelidade
    ADD CONSTRAINT cliente_pessoa2_cpf FOREIGN KEY (cliente_pessoa2_cpf) REFERENCES loja1.cliente(pessoa_cpf1);

ALTER TABLE ONLY loja1.cliente
    ADD CONSTRAINT cliente_pessoa_cpf_fkey FOREIGN KEY (pessoa_cpf1) REFERENCES loja1.pessoa(cpf);

ALTER TABLE ONLY loja1.administra
    ADD CONSTRAINT funcionario_pessoa_cpf FOREIGN KEY (funcionario_pessoa_cpf) REFERENCES loja1.funcionario(pessoa_cpf);

ALTER TABLE ONLY loja1.funcionario
    ADD CONSTRAINT funcionario_pessoa_cpf_fkey FOREIGN KEY (pessoa_cpf) REFERENCES loja1.pessoa(cpf);

ALTER TABLE ONLY loja1.mora
    ADD CONSTRAINT "mora_endereço_cep_fkey" FOREIGN KEY ("endereço_cep") REFERENCES loja1."endereço"(cep);

ALTER TABLE ONLY loja1.mora
    ADD CONSTRAINT mora_pessoa_cpf_fkey FOREIGN KEY (pessoa_cpf) REFERENCES loja1.pessoa(cpf);

ALTER TABLE ONLY loja1."peça"
    ADD CONSTRAINT "peça_produto_cod_produto2_fkey" FOREIGN KEY (produto_cod_produto2) REFERENCES loja1.produto(cod_produto);

ALTER TABLE ONLY loja1.possui
    ADD CONSTRAINT possui_produto_cod_produto_fkey FOREIGN KEY (produto_cod_produto) REFERENCES loja1.produto(cod_produto);

ALTER TABLE ONLY loja1.possui
    ADD CONSTRAINT possui_venda_nf_fkey FOREIGN KEY (venda_nf) REFERENCES loja1.venda(nf);

ALTER TABLE ONLY loja1.carro
    ADD CONSTRAINT produto_cod_produto1 FOREIGN KEY (produto_cod_produto1) REFERENCES loja1.produto(cod_produto);

ALTER TABLE ONLY loja1.venda
    ADD CONSTRAINT venda_cliente_cod_cliente1_fkey FOREIGN KEY (cliente_cod_cliente1) REFERENCES loja1.cliente(cod_cliente);

ALTER TABLE ONLY loja1.venda
    ADD CONSTRAINT venda_funcionario_pessoa1_cpf_fkey FOREIGN KEY (funcionario_pessoa1_cpf) REFERENCES loja1.funcionario(pessoa_cpf);

ALTER TABLE ONLY loja1.venda
    ADD CONSTRAINT venda_pessoa_cliente1_cpf_fkey FOREIGN KEY (cliente_pessoa1_cpf) REFERENCES loja1.cliente(pessoa_cpf1);

ALTER TABLE ONLY loja1.fidelidade
    ADD CONSTRAINT vendas_nf1 FOREIGN KEY (venda_nf1) REFERENCES loja1.venda(nf);
    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

--VENDA
INSERT INTO loja1.venda (nf, preco_total, data_venda, cliente_cod_cliente, cliente_pessoa_cpf, funcionario_pessoa_cpf) VALUES ()

--POSSUI
INSERT INTO loja1.possui (venda_nf, produto_cod_produto, quantidade) VALUES ()

--PRODUTO
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465789, 25000, 18000, '2018-10-15');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465790, 30000, 22000, '2018-12-02');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465791, 43000, 38000, '2019-01-30');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465792, 100000, 78000, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465793, 120, 80, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465794, 110, 78, '2019-01-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465795, 80, 50, '2019-01-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465796, 50, 20, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465797, 50, 20, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465798, 50, 20, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465799, 50, 20, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465800, 50, 20, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465801, 65, 45, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465802, 65, 45, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465803, 95, 50, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465804, 95, 50, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465805, 95, 50, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465806, 95, 50, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465807, 98, 50, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465808, 98, 50, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465809, 98, 50, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465810, 98, 50, '2019-02-21');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465811, 98, 50, '2019-02-21');

--CARRO
INSERT INTO loja1.carro (num_chassi, modelo, cor, marca, cod_veicular, produto_cod_produto1, ano) VALUES (23465789, 'Onyx', 'Prata', 'Chevrolet', 123476, 13465789, 2015);
INSERT INTO loja1.carro (num_chassi, modelo, cor, marca, cod_veicular, produto_cod_produto1, ano) VALUES (23465790, 'HB20', 'Preto', 'Hyundai', 123477, 13465790, 2013);
INSERT INTO loja1.carro (num_chassi, modelo, cor, marca, cod_veicular, produto_cod_produto1, ano) VALUES (23465791, 'EcoSport', 'Branco', 'Ford', 123478, 13465791, 2014);
INSERT INTO loja1.carro (num_chassi, modelo, cor, marca, cod_veicular, produto_cod_produto1, ano) VALUES (23465792, 'Camaro','Amarelo', 'Chevrolet', 123479, 13465792, 2010);

--PECA
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(1, 'Acessório Exterior', 'Farol dianteiro', 'Farol dianteiro de Onyx', 13465793);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(2, 'Acessório Exterior', 'Farol traseiro', 'Farol traseiro de Onyx', 13465794);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(3, 'Acessório Exterior', 'Espelho retrovisor', 'Espelho retrovisor de Onyx', 13465795);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(4, 'Acessório Exterior', 'Emblema Chevrolet', 'Emblema Chevrolet', 13465796);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(5, 'Acessório Exterior', 'Emblema Ford', 'Emblema Ford', 13465797);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(6, 'Acessório Interior', 'Tapete Ford', 'Tapete de borracha preto', 13465798);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(7, 'Acessório Interior', 'Tapete Ford', 'Tapete de borracha preto', 13465799);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(8, 'Acessório Interior', 'Tapete Ford', 'Tapete de borracha cinza', 13465800);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(9, 'Acessório Interior', 'Tapete Ford', 'Tapete de borracha cinza', 13465801);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(10, 'Acessório Interior', 'Tapete Ford', 'Tapete de borracha cinza', 13465802);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(11, 'Acessório Interior', 'Pestana interna', 'Pestana interna para Onyx', 13465803);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(12, 'Acessório Interior', 'Pestana interna', 'Pestana interna para Onyx', 13465804);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(13, 'Acessório Interior', 'Pestana interna', 'Pestana interna para Onyx', 13465805);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(14, 'Acessório Interior', 'Pestana interna', 'Pestana interna para Onyx', 13465806);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(15, 'Acessório Interior', 'Maçaneta interna', 'Maçaneta interna para Onyx', 13465807);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(16, 'Acessório Interior', 'Maçaneta interna', 'Maçaneta interna para Onyx', 13465808);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(17, 'Acessório Interior', 'Maçaneta interna', 'Maçaneta interna para Onyx', 13465809);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(18, 'Acessório Interior', 'Maçaneta interna', 'Maçaneta interna para Onyx', 13465810);
INSERT INTO loja1."peça" (cod_peca, tipo, nome, descricao, produto_cod_produto2) VALUES(19, 'Acessório Interior', 'Maçaneta interna', 'Maçaneta interna para Onyx', 13465811);

--ABASTECE
INSERT INTO loja1.abastece (lote, abastececol, produto_cod_produto, fornecedor_cnpj, data_entrega) VALUES()

--FORNECEDOR
INSERT INTO loja1.fornecedor (cnpj, nome, telefone, endereco) VALUES ()

--PESSOA
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233344','Caio','Pinheiro Souza','11223344556','3213-6540','caio@gmail.com','1981-03-28');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233345','Francine','Sterling','11223344557','3220-7589','francine@live.com','1993-08-17');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233346','Diego','Rubens Silva','11223344558','99220-8975','diego@bol.com','1979-06-27');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233347','Kevin','Costa Pinto','11223344559','98890-3344','kevin@outlook.com','2000-04-01');

INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233348','Caio','Santos Teixeira','11223344560','98890-3744','kevin@outlook.com','1985-04-01');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233349','Ângela','Rocha Castro','11223344561','98890-3844','angela@gmail.com','1977-05-01');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233350','Wilda','Silva Rocha','11223344562','98890-3944','wilda@gmail.com','1990-06-01');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233351','Eliseo','Santos Neto','11223344563','98890-4044','eliseo@outlook.com','1995-01-01');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233352','Max','Dantas Bittencourt','11223344564','98991-5444','max@live.com','1996-09-01');

INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233353','Sandra','Queiroz Rocha','11223344565','98950-1354','sandra@yahoo.com','1993-04-01');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233354','Ashley','Sandra Teixeira','11223344566','98861-4368','ashley@yahoo.com','1989-05-01');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233355','Elias',' Pedro Santana Júnior','11223344567','99146-4503','elias@gmail.com','1967-11-01');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233356','Emanuela','Lins de Bragança','11223344568','99120-3640','emanuela@bol.com','1977-12-01');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233357','Sandra','Silva Matos','11223344569','99148-3755','sandrasm@gmail.com','1994-10-01');

--CLIENTE
INSERT INTO loja1.cliente (cod_cliente, pts_fidelidade,pessoa_cpf1) VALUES (1, 0,'11122233344');
INSERT INTO loja1.cliente (cod_cliente, pts_fidelidade,pessoa_cpf1) VALUES (2, 260,'11122233345');
INSERT INTO loja1.cliente (cod_cliente, pts_fidelidade,pessoa_cpf1) VALUES (3, 150,'11122233346');
INSERT INTO loja1.cliente (cod_cliente, pts_fidelidade,pessoa_cpf1) VALUES (4, 50,'11122233347');
INSERT INTO loja1.cliente (cod_cliente, pts_fidelidade,pessoa_cpf1) VALUES (5, 700,'11122233348');
INSERT INTO loja1.cliente (cod_cliente, pts_fidelidade,pessoa_cpf1) VALUES (6, 130,'11122233349');
INSERT INTO loja1.cliente (cod_cliente, pts_fidelidade,pessoa_cpf1) VALUES (7, 500,'11122233350');
INSERT INTO loja1.cliente (cod_cliente, pts_fidelidade,pessoa_cpf1) VALUES (8, 1300,'11122233351');
INSERT INTO loja1.cliente (cod_cliente, pts_fidelidade,pessoa_cpf1) VALUES (9, 220,'11122233352');

--FUNCIONARIO
INSERT INTO loja1.funcionario (curriculo, senha, salario, pessoa_cpf) VALUES('C://Arquivos de Programas/Curriculos/', '0000', 1200, '11122233353');
INSERT INTO loja1.funcionario (curriculo, senha, salario, pessoa_cpf) VALUES('C://Arquivos de Programas/Curriculos/', '0000', 2000, '11122233354');
INSERT INTO loja1.funcionario (curriculo, senha, salario, pessoa_cpf) VALUES('C://Arquivos de Programas/Curriculos/', '0000', 4000, '11122233355');
INSERT INTO loja1.funcionario (curriculo, senha, salario, pessoa_cpf) VALUES('C://Arquivos de Programas/Curriculos/', '0000', 11000, '11122233356');
INSERT INTO loja1.funcionario (curriculo, senha, salario, pessoa_cpf) VALUES('C://Arquivos de Programas/Curriculos/', '0000', 3500, '11122233357');

--ADMINISTRA
INSERT INTO loja1.administra (funcionario_pessoa_cpf, cliente_cod_cliente, cliente_pessoa_cpf) VALUES ('11122233353', 1, '11122233344');
INSERT INTO loja1.administra (funcionario_pessoa_cpf, cliente_cod_cliente, cliente_pessoa_cpf) VALUES ('11122233355', 2, '11122233345');
INSERT INTO loja1.administra (funcionario_pessoa_cpf, cliente_cod_cliente, cliente_pessoa_cpf) VALUES ('11122233355', 3, '11122233346');
INSERT INTO loja1.administra (funcionario_pessoa_cpf, cliente_cod_cliente, cliente_pessoa_cpf) VALUES ('11122233355', 4, '11122233347');
INSERT INTO loja1.administra (funcionario_pessoa_cpf, cliente_cod_cliente, cliente_pessoa_cpf) VALUES ('11122233356', 5, '11122233348');
INSERT INTO loja1.administra (funcionario_pessoa_cpf, cliente_cod_cliente, cliente_pessoa_cpf) VALUES ('11122233353', 6, '11122233349');
INSERT INTO loja1.administra (funcionario_pessoa_cpf, cliente_cod_cliente, cliente_pessoa_cpf) VALUES ('11122233356', 7, '11122233350');
INSERT INTO loja1.administra (funcionario_pessoa_cpf, cliente_cod_cliente, cliente_pessoa_cpf) VALUES ('11122233357', 8, '11122233351');
INSERT INTO loja1.administra (funcionario_pessoa_cpf, cliente_cod_cliente, cliente_pessoa_cpf) VALUES ('11122233354', 9, '11122233352');

--FIDELIDADE
INSERT INTO loja1.fidelidade (cod_fidelidade, qtd_ponto, validade, cliente_cod_cliente, cliente_pessoa_cpf, venda_nf) VALUES()

--ENDERECO
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-025', 'Molestie Road', 'Shaine Q. Chandler', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-026', 'Molestie Road', 'Shaine Q. Chandler', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-027', 'Molestie Road', 'Shaine Q. Chandler', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-028', 'Molestie Road', 'Shaine Q. Chandler', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-029', 'Rua Nossa Senhora das Dores', 'Cirurgia', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-030', 'Rua Nossa Senhora das Dores', 'Cirurgia', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-031', 'Rua Nossa Senhora das Dores', 'Cirurgia', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-032', 'Rua Amapá', 'Siqueira Campos', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-033', 'Rua Amapá', 'Siqueira Campos', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-234', 'Rua Amapá', 'Siqueira Campos', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-035', 'Rua Maranhão', 'Bugio',  'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-136', 'Rua Santos', 'Campos', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-237', 'Rua Neves', 'Jardins', 'Aracaju', 'SE');
INSERT INTO loja1."endereço" (cep, logradouro, bairro, cidade, estado) VALUES ('49025-938', 'Rua Fogos', 'Jardins', 'Aracaju', 'SE');

--MORA
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (10, '', '11122233344', '49025-025');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (11, '', '11122233345', '49025-026');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (12, '', '11122233346', '49025-027');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (13, '', '11122233347', '49025-028');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (14, '', '11122233348', '49025-029');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (122, '', '11122233349', '49025-030');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (158, '', '11122233350', '49025-031');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (40, '', '11122233351', '49025-032');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (250, '', '11122233352', '49025-033');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (364, '', '11122233353', '49025-234');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (33, '', '11122233354', '49025-035');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (15, '', '11122233355', '49025-136');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (45, '', '11122233356', '49025-237');
INSERT INTO loja1.mora (numero, complemento, pessoa_cpf, "endereço_cep") VALUES (354, '', '11122233357', '49025-938');

