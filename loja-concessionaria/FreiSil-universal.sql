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

CREATE SEQUENCE loja1.produto_cod_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE loja1.produto_cod_produto_seq OWNED BY loja1.produto.cod_produto;


CREATE TABLE loja1.fornecedor (
    cnpj loja1.tipo_cnpj NOT NULL,
    nome VARCHAR(45) NOT NULL,
    telefone VARCHAR(16) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    CONSTRAINT fornecedor_pkey PRIMARY KEY (cnpj)
);

CREATE TABLE loja1."endereço" (
    cep VARCHAR(10) NOT NULL,
    logradouro VARCHAR(45) NOT NULL,
    bairro VARCHAR(40) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT "endereço_pkey" PRIMARY KEY (cep)
);

CREATE TABLE loja1.funcionario (
    curriculo VARCHAR(255) NOT NULL,
    senha VARCHAR(16) NOT NULL,
    salario REAL NOT NULL,
    pessoa_cpf loja1.tipo_cpf NOT NULL,
    CONSTRAINT funcionario_pkey PRIMARY KEY (pessoa_cpf),
    CONSTRAINT funcionario_pessoa_cpf_fkey FOREIGN KEY (pessoa_cpf) REFERENCES loja1.pessoa(cpf) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE loja1.carro (
    num_chassi INT NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    cor VARCHAR(15) NOT NULL,
    marca VARCHAR(45) NOT NULL,
    cod_veicular INT,
    produto_cod_produto1 INT NOT NULL,
    ano INT,
    CONSTRAINT carro_pkey PRIMARY KEY (num_chassi),
    CONSTRAINT produto_cod_produto1 FOREIGN KEY (produto_cod_produto1) REFERENCES loja1.produto(cod_produto) ON DELETE NO ACTION ON UPDATE NO ACTION
);
