--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

-- Started on 2019-07-22 15:14:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16393)
-- Name: loja1; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA loja1;


ALTER SCHEMA loja1 OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 204 (class 1259 OID 16450)
-- Name: abastece; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.abastece (
    lote integer NOT NULL,
    data_entrega timestamp without time zone NOT NULL,
    produto_cod_produto3 integer NOT NULL,
    fornecedor_cnpj character varying(30) DEFAULT NULL::character varying
);


ALTER TABLE loja1.abastece OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16681)
-- Name: administra; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.administra (
    funcionario_pessoa_cpf character varying(13) NOT NULL,
    cliente_cod_cliente integer NOT NULL,
    cliente_pessoa_cpf character varying(13) NOT NULL
);


ALTER TABLE loja1.administra OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16706)
-- Name: carro; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.carro (
    num_chassi integer NOT NULL,
    modelo character varying(20) NOT NULL,
    cor character varying(15) NOT NULL,
    marca character varying(45) NOT NULL,
    cod_veicular integer,
    produto_cod_produto1 integer NOT NULL,
    ano integer
);


ALTER TABLE loja1.carro OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16468)
-- Name: cliente; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.cliente (
    cod_cliente integer NOT NULL,
    pts_fidelidade integer NOT NULL,
    pessoa_cpf1 character varying(13) NOT NULL
);


ALTER TABLE loja1.cliente OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16466)
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE; Schema: loja1; Owner: postgres
--

CREATE SEQUENCE loja1.cliente_cod_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loja1.cliente_cod_cliente_seq OWNER TO postgres;

--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 205
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE OWNED BY; Schema: loja1; Owner: postgres
--

ALTER SEQUENCE loja1.cliente_cod_cliente_seq OWNED BY loja1.cliente.cod_cliente;


--
-- TOC entry 199 (class 1259 OID 16394)
-- Name: endereço; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1."endereço" (
    cep character varying(10) NOT NULL,
    logradouro character varying(45) NOT NULL,
    bairro character varying(40) NOT NULL,
    cidade character varying(20) NOT NULL,
    estado character varying(20) NOT NULL
);


ALTER TABLE loja1."endereço" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16716)
-- Name: fidelidade; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.fidelidade (
    cod_fidelidade integer NOT NULL,
    qtd_ponto integer NOT NULL,
    validade date NOT NULL,
    venda_nf1 integer NOT NULL,
    cliente_cod_cliente2 integer NOT NULL,
    cliente_pessoa2_cpf character varying NOT NULL
);


ALTER TABLE loja1.fidelidade OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16399)
-- Name: fornecedor; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.fornecedor (
    cnpj character varying(30) NOT NULL,
    nome character varying(45) NOT NULL,
    telefone character varying(16) NOT NULL,
    endereco character varying(200) NOT NULL
);


ALTER TABLE loja1.fornecedor OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16479)
-- Name: funcionario; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.funcionario (
    curriculo character varying(255) NOT NULL,
    senha character varying(16) NOT NULL,
    salario double precision NOT NULL,
    pessoa_cpf character varying(13) NOT NULL
);


ALTER TABLE loja1.funcionario OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16489)
-- Name: mora; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.mora (
    numero integer NOT NULL,
    complemento character varying(45) NOT NULL,
    pessoa_cpf character varying(13) NOT NULL,
    "endereço_cep" character varying(10) NOT NULL
);


ALTER TABLE loja1.mora OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17609)
-- Name: nome_view; Type: VIEW; Schema: loja1; Owner: postgres
--

CREATE VIEW loja1.nome_view AS
 SELECT carro.num_chassi,
    carro.marca,
    carro.modelo,
    carro.ano,
    carro.cor,
    carro.cod_veicular,
    carro.produto_cod_produto1
   FROM loja1.carro;


ALTER TABLE loja1.nome_view OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16404)
-- Name: pessoa; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.pessoa (
    cpf character varying(13) NOT NULL,
    nome character varying(45) NOT NULL,
    sobrenome character varying(45) NOT NULL,
    rg character varying(11) NOT NULL,
    telefone character varying(16) NOT NULL,
    email character varying(30) NOT NULL,
    data_nascimento date NOT NULL
);


ALTER TABLE loja1.pessoa OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16506)
-- Name: peça; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1."peça" (
    cod_peca integer NOT NULL,
    tipo character varying(20) NOT NULL,
    nome character varying(15) NOT NULL,
    descricao character varying(200) NOT NULL,
    produto_cod_produto2 integer NOT NULL
);


ALTER TABLE loja1."peça" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16504)
-- Name: peça_cod_peca_seq; Type: SEQUENCE; Schema: loja1; Owner: postgres
--

CREATE SEQUENCE loja1."peça_cod_peca_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loja1."peça_cod_peca_seq" OWNER TO postgres;

--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 209
-- Name: peça_cod_peca_seq; Type: SEQUENCE OWNED BY; Schema: loja1; Owner: postgres
--

ALTER SEQUENCE loja1."peça_cod_peca_seq" OWNED BY loja1."peça".cod_peca;


--
-- TOC entry 212 (class 1259 OID 16555)
-- Name: possui; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.possui (
    quantidade integer NOT NULL,
    venda_nf integer NOT NULL,
    produto_cod_produto integer NOT NULL
);


ALTER TABLE loja1.possui OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16411)
-- Name: produto; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.produto (
    cod_produto integer NOT NULL,
    preco_venda double precision NOT NULL,
    preco_custo double precision NOT NULL,
    data_compra date NOT NULL
);


ALTER TABLE loja1.produto OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16409)
-- Name: produto_cod_produto_seq; Type: SEQUENCE; Schema: loja1; Owner: postgres
--

CREATE SEQUENCE loja1.produto_cod_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loja1.produto_cod_produto_seq OWNER TO postgres;

--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 202
-- Name: produto_cod_produto_seq; Type: SEQUENCE OWNED BY; Schema: loja1; Owner: postgres
--

ALTER SEQUENCE loja1.produto_cod_produto_seq OWNED BY loja1.produto.cod_produto;


--
-- TOC entry 211 (class 1259 OID 16540)
-- Name: venda; Type: TABLE; Schema: loja1; Owner: postgres
--

CREATE TABLE loja1.venda (
    nf integer NOT NULL,
    preco_total double precision NOT NULL,
    data_venda date NOT NULL,
    cliente_cod_cliente1 integer NOT NULL,
    funcionario_pessoa1_cpf character varying(13) NOT NULL,
    cliente_pessoa1_cpf character varying(13) NOT NULL
);


ALTER TABLE loja1.venda OWNER TO postgres;

--
-- TOC entry 2837 (class 2604 OID 16471)
-- Name: cliente cod_cliente; Type: DEFAULT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.cliente ALTER COLUMN cod_cliente SET DEFAULT nextval('loja1.cliente_cod_cliente_seq'::regclass);


--
-- TOC entry 2838 (class 2604 OID 16509)
-- Name: peça cod_peca; Type: DEFAULT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1."peça" ALTER COLUMN cod_peca SET DEFAULT nextval('loja1."peça_cod_peca_seq"'::regclass);


--
-- TOC entry 2835 (class 2604 OID 16414)
-- Name: produto cod_produto; Type: DEFAULT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.produto ALTER COLUMN cod_produto SET DEFAULT nextval('loja1.produto_cod_produto_seq'::regclass);


--
-- TOC entry 3013 (class 0 OID 16450)
-- Dependencies: 204
-- Data for Name: abastece; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3022 (class 0 OID 16681)
-- Dependencies: 213
-- Data for Name: administra; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3023 (class 0 OID 16706)
-- Dependencies: 214
-- Data for Name: carro; Type: TABLE DATA; Schema: loja1; Owner: postgres
--

INSERT INTO loja1.carro (num_chassi, modelo, cor, marca, cod_veicular, produto_cod_produto1, ano) VALUES (13465789, 'Onyx', 'Prata', 'Chevrolet', 123476, 13465789, 2015);


--
-- TOC entry 3015 (class 0 OID 16468)
-- Dependencies: 206
-- Data for Name: cliente; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3008 (class 0 OID 16394)
-- Dependencies: 199
-- Data for Name: endereço; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3024 (class 0 OID 16716)
-- Dependencies: 215
-- Data for Name: fidelidade; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3009 (class 0 OID 16399)
-- Dependencies: 200
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3016 (class 0 OID 16479)
-- Dependencies: 207
-- Data for Name: funcionario; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3017 (class 0 OID 16489)
-- Dependencies: 208
-- Data for Name: mora; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3010 (class 0 OID 16404)
-- Dependencies: 201
-- Data for Name: pessoa; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3019 (class 0 OID 16506)
-- Dependencies: 210
-- Data for Name: peça; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3021 (class 0 OID 16555)
-- Dependencies: 212
-- Data for Name: possui; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3012 (class 0 OID 16411)
-- Dependencies: 203
-- Data for Name: produto; Type: TABLE DATA; Schema: loja1; Owner: postgres
--

INSERT INTO loja1.produto (cod_produto, preco_venda, preco_custo, data_compra) VALUES (13465789, 25000, 18000, '2018-10-15');


--
-- TOC entry 3020 (class 0 OID 16540)
-- Dependencies: 211
-- Data for Name: venda; Type: TABLE DATA; Schema: loja1; Owner: postgres
--



--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 205
-- Name: cliente_cod_cliente_seq; Type: SEQUENCE SET; Schema: loja1; Owner: postgres
--

SELECT pg_catalog.setval('loja1.cliente_cod_cliente_seq', 1, false);


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 209
-- Name: peça_cod_peca_seq; Type: SEQUENCE SET; Schema: loja1; Owner: postgres
--

SELECT pg_catalog.setval('loja1."peça_cod_peca_seq"', 1, false);


--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 202
-- Name: produto_cod_produto_seq; Type: SEQUENCE SET; Schema: loja1; Owner: postgres
--

SELECT pg_catalog.setval('loja1.produto_cod_produto_seq', 1, false);


--
-- TOC entry 2848 (class 2606 OID 16455)
-- Name: abastece abastece_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.abastece
    ADD CONSTRAINT abastece_pkey PRIMARY KEY (lote);


--
-- TOC entry 2862 (class 2606 OID 16685)
-- Name: administra administra_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.administra
    ADD CONSTRAINT administra_pkey PRIMARY KEY (funcionario_pessoa_cpf, cliente_cod_cliente, cliente_pessoa_cpf);


--
-- TOC entry 2864 (class 2606 OID 16710)
-- Name: carro carro_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.carro
    ADD CONSTRAINT carro_pkey PRIMARY KEY (num_chassi);


--
-- TOC entry 2850 (class 2606 OID 16473)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cod_cliente);


--
-- TOC entry 2840 (class 2606 OID 16398)
-- Name: endereço endereço_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1."endereço"
    ADD CONSTRAINT "endereço_pkey" PRIMARY KEY (cep);


--
-- TOC entry 2866 (class 2606 OID 16723)
-- Name: fidelidade fidelidade_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.fidelidade
    ADD CONSTRAINT fidelidade_pkey PRIMARY KEY (cod_fidelidade);


--
-- TOC entry 2842 (class 2606 OID 16403)
-- Name: fornecedor fornecedor_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (cnpj);


--
-- TOC entry 2854 (class 2606 OID 16483)
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (pessoa_cpf);


--
-- TOC entry 2856 (class 2606 OID 16493)
-- Name: mora mora_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.mora
    ADD CONSTRAINT mora_pkey PRIMARY KEY (numero);


--
-- TOC entry 2852 (class 2606 OID 16670)
-- Name: cliente pessoa_cpf1_un; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.cliente
    ADD CONSTRAINT pessoa_cpf1_un UNIQUE (pessoa_cpf1);


--
-- TOC entry 2844 (class 2606 OID 16408)
-- Name: pessoa pessoa_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (cpf);


--
-- TOC entry 2858 (class 2606 OID 16511)
-- Name: peça peça_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1."peça"
    ADD CONSTRAINT "peça_pkey" PRIMARY KEY (cod_peca);


--
-- TOC entry 2846 (class 2606 OID 16416)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (cod_produto);


--
-- TOC entry 2860 (class 2606 OID 16544)
-- Name: venda venda_pkey; Type: CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (nf);


--
-- TOC entry 2868 (class 2606 OID 16461)
-- Name: abastece abastece_fornecedor_cnpj_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.abastece
    ADD CONSTRAINT abastece_fornecedor_cnpj_fkey FOREIGN KEY (fornecedor_cnpj) REFERENCES loja1.fornecedor(cnpj);


--
-- TOC entry 2867 (class 2606 OID 16456)
-- Name: abastece abastece_produto_cod_produto3_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.abastece
    ADD CONSTRAINT abastece_produto_cod_produto3_fkey FOREIGN KEY (produto_cod_produto3) REFERENCES loja1.produto(cod_produto);


--
-- TOC entry 2879 (class 2606 OID 16686)
-- Name: administra administra_cliente_pessoa_cpf; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.administra
    ADD CONSTRAINT administra_cliente_pessoa_cpf FOREIGN KEY (cliente_pessoa_cpf) REFERENCES loja1.cliente(pessoa_cpf1);


--
-- TOC entry 2880 (class 2606 OID 16691)
-- Name: administra cliente_cod_cliente; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.administra
    ADD CONSTRAINT cliente_cod_cliente FOREIGN KEY (cliente_cod_cliente) REFERENCES loja1.cliente(cod_cliente);


--
-- TOC entry 2884 (class 2606 OID 16729)
-- Name: fidelidade cliente_cod_cliente2; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.fidelidade
    ADD CONSTRAINT cliente_cod_cliente2 FOREIGN KEY (cliente_cod_cliente2) REFERENCES loja1.cliente(cod_cliente);


--
-- TOC entry 2883 (class 2606 OID 16724)
-- Name: fidelidade cliente_pessoa2_cpf; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.fidelidade
    ADD CONSTRAINT cliente_pessoa2_cpf FOREIGN KEY (cliente_pessoa2_cpf) REFERENCES loja1.cliente(pessoa_cpf1);


--
-- TOC entry 2869 (class 2606 OID 16474)
-- Name: cliente cliente_pessoa_cpf_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.cliente
    ADD CONSTRAINT cliente_pessoa_cpf_fkey FOREIGN KEY (pessoa_cpf1) REFERENCES loja1.pessoa(cpf);


--
-- TOC entry 2881 (class 2606 OID 16696)
-- Name: administra funcionario_pessoa_cpf; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.administra
    ADD CONSTRAINT funcionario_pessoa_cpf FOREIGN KEY (funcionario_pessoa_cpf) REFERENCES loja1.funcionario(pessoa_cpf);


--
-- TOC entry 2870 (class 2606 OID 16484)
-- Name: funcionario funcionario_pessoa_cpf_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.funcionario
    ADD CONSTRAINT funcionario_pessoa_cpf_fkey FOREIGN KEY (pessoa_cpf) REFERENCES loja1.pessoa(cpf);


--
-- TOC entry 2872 (class 2606 OID 16499)
-- Name: mora mora_endereço_cep_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.mora
    ADD CONSTRAINT "mora_endereço_cep_fkey" FOREIGN KEY ("endereço_cep") REFERENCES loja1."endereço"(cep);


--
-- TOC entry 2871 (class 2606 OID 16494)
-- Name: mora mora_pessoa_cpf_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.mora
    ADD CONSTRAINT mora_pessoa_cpf_fkey FOREIGN KEY (pessoa_cpf) REFERENCES loja1.pessoa(cpf);


--
-- TOC entry 2873 (class 2606 OID 16512)
-- Name: peça peça_produto_cod_produto2_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1."peça"
    ADD CONSTRAINT "peça_produto_cod_produto2_fkey" FOREIGN KEY (produto_cod_produto2) REFERENCES loja1.produto(cod_produto);


--
-- TOC entry 2878 (class 2606 OID 16563)
-- Name: possui possui_produto_cod_produto_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.possui
    ADD CONSTRAINT possui_produto_cod_produto_fkey FOREIGN KEY (produto_cod_produto) REFERENCES loja1.produto(cod_produto);


--
-- TOC entry 2877 (class 2606 OID 16558)
-- Name: possui possui_venda_nf_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.possui
    ADD CONSTRAINT possui_venda_nf_fkey FOREIGN KEY (venda_nf) REFERENCES loja1.venda(nf);


--
-- TOC entry 2882 (class 2606 OID 16711)
-- Name: carro produto_cod_produto1; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.carro
    ADD CONSTRAINT produto_cod_produto1 FOREIGN KEY (produto_cod_produto1) REFERENCES loja1.produto(cod_produto);


--
-- TOC entry 2874 (class 2606 OID 16545)
-- Name: venda venda_cliente_cod_cliente1_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.venda
    ADD CONSTRAINT venda_cliente_cod_cliente1_fkey FOREIGN KEY (cliente_cod_cliente1) REFERENCES loja1.cliente(cod_cliente);


--
-- TOC entry 2875 (class 2606 OID 16550)
-- Name: venda venda_funcionario_pessoa1_cpf_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.venda
    ADD CONSTRAINT venda_funcionario_pessoa1_cpf_fkey FOREIGN KEY (funcionario_pessoa1_cpf) REFERENCES loja1.funcionario(pessoa_cpf);


--
-- TOC entry 2876 (class 2606 OID 16701)
-- Name: venda venda_pessoa_cliente1_cpf_fkey; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.venda
    ADD CONSTRAINT venda_pessoa_cliente1_cpf_fkey FOREIGN KEY (cliente_pessoa1_cpf) REFERENCES loja1.cliente(pessoa_cpf1);


--
-- TOC entry 2885 (class 2606 OID 16734)
-- Name: fidelidade vendas_nf1; Type: FK CONSTRAINT; Schema: loja1; Owner: postgres
--

ALTER TABLE ONLY loja1.fidelidade
    ADD CONSTRAINT vendas_nf1 FOREIGN KEY (venda_nf1) REFERENCES loja1.venda(nf);


-- Completed on 2019-07-22 15:14:28

--
-- PostgreSQL database dump complete
--

