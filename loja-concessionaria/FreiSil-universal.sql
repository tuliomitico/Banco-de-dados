DROP SCHEMA IF EXISTS loja1;

CREATE SCHEMA loja1;

CREATE DOMAIN loja1.tipo_cpf AS VARCHAR(13);
CREATE DOMAIN loja1.tipo_cnpj AS VARCHAR(30);

CREATE TABLE loja1.pessoa (
    cpf loja1.tipo_cpf NOT NULL,
    nome VARCHAR(45) NOT NULL,
    sobrenome VARCHAR(45) NOT NULL,
    rg VARCHAR(11) NOT NULL,
    telefone VARCHAR(16) NOT NULL,
    email VARCHAR(30) NOT NULL,
    data_nascimento DATE NOT NULL,
    CONSTRAINT pessoa_pkey PRIMARY KEY (cpf)
);

CREATE TABLE loja1.produto (
    cod_produto INT NOT NULL,
    preco_venda REAL NOT NULL CHECK (preco_venda > 0),
    preco_custo REAL NOT NULL CHECK (preco_custo > 0),
    data_compra DATE NOT NULL,
    CONSTRAINT produto_pkey PRIMARY KEY (cod_produto)
);

CREATE TABLE loja1.fornecedor (
    cnpj loja1.tipo_cnpj NOT NULL,
    nome VARCHAR(45) NOT NULL,
    telefone VARCHAR(16) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    CONSTRAINT fornecedor_pkey PRIMARY KEY (cnpj)
);
