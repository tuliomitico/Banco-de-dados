CREATE DATABASE  IF NOT EXISTS `loja1` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `loja1`;
-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: loja1
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abastece`
--

DROP TABLE IF EXISTS `abastece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abastece` (
  `lote` int(11) NOT NULL,
  `data_entrega` datetime NOT NULL,
  `Produto_cod_produto3` int(11) NOT NULL,
  `Forncedor_CNPJ` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`lote`),
  KEY `Produto_cod_produto3_idx` (`Produto_cod_produto3`),
  KEY `Fornecedor_CNPJ_idx` (`Forncedor_CNPJ`),
  CONSTRAINT `Fornecedor_CNPJ` FOREIGN KEY (`Forncedor_CNPJ`) REFERENCES `fornecedor` (`CNPJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Produto_cod_produto3` FOREIGN KEY (`Produto_cod_produto3`) REFERENCES `produto` (`cod_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abastece`
--

LOCK TABLES `abastece` WRITE;
/*!40000 ALTER TABLE `abastece` DISABLE KEYS */;
/*!40000 ALTER TABLE `abastece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administra`
--

DROP TABLE IF EXISTS `administra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administra` (
  `Funcionario_Pessoa_cpf` varchar(13) NOT NULL,
  `Cliente_cod_cliente` int(11) NOT NULL,
  `Cliente_Pessoa_cpf` varchar(13) NOT NULL,
  PRIMARY KEY (`Funcionario_Pessoa_cpf`,`Cliente_cod_cliente`,`Cliente_Pessoa_cpf`),
  KEY `Cliente_cod_cliente_idx` (`Cliente_cod_cliente`),
  KEY `Cliente_Pessoa_cpf_idx` (`Cliente_Pessoa_cpf`),
  CONSTRAINT `Cliente_Pessoa_cpf` FOREIGN KEY (`Cliente_Pessoa_cpf`) REFERENCES `cliente` (`Pessoa_cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Cliente_cod_cliente` FOREIGN KEY (`Cliente_cod_cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Funcionario_Pessoa_cpf` FOREIGN KEY (`Funcionario_Pessoa_cpf`) REFERENCES `funcionario` (`Pessoa_cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administra`
--

LOCK TABLES `administra` WRITE;
/*!40000 ALTER TABLE `administra` DISABLE KEYS */;
/*!40000 ALTER TABLE `administra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carro` (
  `num_chassi` int(11) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `ano` date NOT NULL,
  `cor` varchar(15) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `cod_veicular` int(11) DEFAULT NULL,
  `Produto_cod_produto1` int(11) NOT NULL,
  PRIMARY KEY (`num_chassi`),
  KEY `Produto_cod_produto1_idx` (`Produto_cod_produto1`),
  CONSTRAINT `Produto_cod_produto1` FOREIGN KEY (`Produto_cod_produto1`) REFERENCES `produto` (`cod_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `pts_fidelidade` int(11) NOT NULL,
  `Pessoa_cpf` varchar(13) NOT NULL,
  PRIMARY KEY (`cod_cliente`),
  KEY `fk_Cliente_Pessoa_idx` (`Pessoa_cpf`),
  CONSTRAINT `fk_Cliente_Pessoa` FOREIGN KEY (`Pessoa_cpf`) REFERENCES `pessoa` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereço`
--

DROP TABLE IF EXISTS `endereço`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereço` (
  `cep` varchar(10) NOT NULL,
  `logradouro` varchar(45) NOT NULL,
  `bairro` varchar(40) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`cep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereço`
--

LOCK TABLES `endereço` WRITE;
/*!40000 ALTER TABLE `endereço` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereço` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fidelidade`
--

DROP TABLE IF EXISTS `fidelidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fidelidade` (
  `cod_fidelidade` int(11) NOT NULL,
  `qtd_ponto` int(11) NOT NULL,
  `validade` date NOT NULL,
  `Venda_nf1` int(11) NOT NULL,
  `Cliente_cod_cliente2` int(11) NOT NULL,
  `Cliente_Pessoa2_cpf` varchar(13) NOT NULL,
  PRIMARY KEY (`cod_fidelidade`),
  KEY `Cliente_cod_cliente_idx` (`Cliente_cod_cliente2`),
  KEY `Cliente_Pessoa2_cpf_idx` (`Cliente_Pessoa2_cpf`),
  KEY `Vendas_nf1_idx` (`Venda_nf1`),
  CONSTRAINT `Cliente_Pessoa2_cpf` FOREIGN KEY (`Cliente_Pessoa2_cpf`) REFERENCES `cliente` (`Pessoa_cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Cliente_cod_cliente2` FOREIGN KEY (`Cliente_cod_cliente2`) REFERENCES `cliente` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Vendas_nf1` FOREIGN KEY (`Venda_nf1`) REFERENCES `venda` (`nf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fidelidade`
--

LOCK TABLES `fidelidade` WRITE;
/*!40000 ALTER TABLE `fidelidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `fidelidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `CNPJ` varchar(30) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(16) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  PRIMARY KEY (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `curriculo` varchar(255) NOT NULL,
  `senha` varchar(16) NOT NULL,
  `salario` float NOT NULL,
  `Pessoa_cpf` varchar(13) NOT NULL,
  PRIMARY KEY (`Pessoa_cpf`),
  CONSTRAINT `fk_Funcionario_Pessoa1` FOREIGN KEY (`Pessoa_cpf`) REFERENCES `pessoa` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mora`
--

DROP TABLE IF EXISTS `mora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mora` (
  `numero` int(11) NOT NULL,
  `complemento` varchar(45) NOT NULL,
  `Pessoa_cpf` varchar(13) NOT NULL,
  `Endereço_cep` varchar(10) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `Pessoa_cpf_idx` (`Pessoa_cpf`),
  KEY `Endereço_cep_idx` (`Endereço_cep`),
  CONSTRAINT `Endereço_cep` FOREIGN KEY (`Endereço_cep`) REFERENCES `endereço` (`cep`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Pessoa_cpf` FOREIGN KEY (`Pessoa_cpf`) REFERENCES `pessoa` (`cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mora`
--

LOCK TABLES `mora` WRITE;
/*!40000 ALTER TABLE `mora` DISABLE KEYS */;
/*!40000 ALTER TABLE `mora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peça`
--

DROP TABLE IF EXISTS `peça`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peça` (
  `cod_peca` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  `nome` varchar(15) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `Produto_cod_produto2` int(11) NOT NULL,
  PRIMARY KEY (`cod_peca`),
  KEY `Produto_cod_produto2_idx` (`Produto_cod_produto2`),
  CONSTRAINT `Produto_cod_produto2` FOREIGN KEY (`Produto_cod_produto2`) REFERENCES `produto` (`cod_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peça`
--

LOCK TABLES `peça` WRITE;
/*!40000 ALTER TABLE `peça` DISABLE KEYS */;
/*!40000 ALTER TABLE `peça` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `cpf` varchar(13) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `rg` varchar(11) NOT NULL,
  `telefone` varchar(16) NOT NULL,
  `email` varchar(30) NOT NULL,
  `data_nascimento` date NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possui`
--

DROP TABLE IF EXISTS `possui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `possui` (
  `quantidate` int(11) NOT NULL,
  `Venda_nf` int(11) NOT NULL,
  `Produto_cod_produto` int(11) NOT NULL,
  KEY `Venda_nf_idx` (`Venda_nf`),
  KEY `Produto_cod_produto_idx` (`Produto_cod_produto`),
  CONSTRAINT `Produto_cod_produto` FOREIGN KEY (`Produto_cod_produto`) REFERENCES `produto` (`cod_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Venda_nf` FOREIGN KEY (`Venda_nf`) REFERENCES `venda` (`nf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possui`
--

LOCK TABLES `possui` WRITE;
/*!40000 ALTER TABLE `possui` DISABLE KEYS */;
/*!40000 ALTER TABLE `possui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `cod_produto` int(11) NOT NULL AUTO_INCREMENT,
  `preco_venda` float NOT NULL,
  `preco_custo` float NOT NULL,
  `data_compra` date NOT NULL,
  PRIMARY KEY (`cod_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `nf` int(11) NOT NULL,
  `preco_total` float NOT NULL,
  `data_venda` date NOT NULL,
  `Cliente_cod_cliente1` int(11) NOT NULL,
  `Cliente_Pessoa1_cpf` varchar(13) NOT NULL,
  `Funcionario_Pessoa1_cpf` varchar(13) NOT NULL,
  PRIMARY KEY (`nf`),
  KEY `Cliente_cod_cliente_idx` (`Cliente_cod_cliente1`),
  KEY `Cliente_Pessoa_cpf_idx` (`Cliente_Pessoa1_cpf`),
  KEY `Funcionario_Pessoa_cpf_idx` (`Funcionario_Pessoa1_cpf`),
  CONSTRAINT `Cliente_Pessoa1_cpf` FOREIGN KEY (`Cliente_Pessoa1_cpf`) REFERENCES `cliente` (`Pessoa_cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Cliente_cod_cliente1` FOREIGN KEY (`Cliente_cod_cliente1`) REFERENCES `cliente` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Funcionario_Pessoa1_cpf` FOREIGN KEY (`Funcionario_Pessoa1_cpf`) REFERENCES `funcionario` (`Pessoa_cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-18 19:02:18
