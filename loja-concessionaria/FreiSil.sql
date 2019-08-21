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

INSERT INTO loja1.carro (num_chassi, modelo, cor, marca, cod_veicular, produto_cod_produto1, ano) VALUES (13465789, 'Onyx', 'Prata', 'Chevrolet', 123476, 13465789, 2015);
INSERT INTO loja1.carro (num_chassi, modelo, cor, marca, cod_veicular, produto_cod_produto1, ano) VALUES (13465790, 'HB20', 'Preto', 'Hyundai', 123477, 13465790, 2013);
INSERT INTO loja1.carro (num_chassi, modelo, cor, marca, cod_veicular, produto_cod_produto1, ano) VALUES (13465791, 'EcoSport', 'Branco', 'Ford', 123478, 13465791, 2014);
INSERT INTO loja1.carro (num_chassi, modelo, cor, marca, cod_veicular, produto_cod_produto1, ano) VALUES (13465792, 'Camaro','Amarelo', 'Chevrolet', 123479, 13465792, 2010);

INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465789, 25000, 18000, '2018-10-15');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465790, 30000, 22000, '2018-12-02');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465791, 43000, 38000, '2019-01-30');
INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465792, 100000, 78000, '2019-02-21');

INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233344','Caio','Pinheiro Souza','11223344556','3213-6540','caio@gmail.com','1981-03-28');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233345','Francine','Sterling','11223344557','3220-7589','francine@live.com','1993-08-17');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233346','Diego','Rubens Silva','11223344558','99220-8975','diego@bol.com','1979-06-27');
INSERT INTO loja1.pessoa (cpf,nome,sobrenome,rg,telefone,email,data_nascimento) VALUES ('11122233347','Kevin','Costa Pinto','11223344559','98890-3344','kevin@outlook.com','2000-04-01');

INSERT INTO loja1.cliente (pts_fidelidade,pessoa_cpf1) VALUES (150,'11122233347');
INSERT INTO loja1.cliente (pts_fidelidade,pessoa_cpf1) VALUES (260,'11122233345');

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
