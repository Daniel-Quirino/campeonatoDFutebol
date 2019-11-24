-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: campeonatodefutebol
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `campeonato`
--

DROP TABLE IF EXISTS `campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `campeonato` (
  `codCampeonato` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `timeVencedor` int(11) DEFAULT NULL,
  `artilheiro` int(11) DEFAULT NULL,
  PRIMARY KEY (`codCampeonato`),
  KEY `fk_campeonato_timeVencedor` (`timeVencedor`),
  KEY `fk_campeonato` (`artilheiro`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campeonato`
--

LOCK TABLES `campeonato` WRITE;
/*!40000 ALTER TABLE `campeonato` DISABLE KEYS */;
/*!40000 ALTER TABLE `campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao`
--

DROP TABLE IF EXISTS `cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cartao` (
  `codPartida` int(11) DEFAULT NULL,
  `tempoDaPartida` date DEFAULT NULL,
  `jogador` int(11) DEFAULT NULL,
  KEY `fk_cartao_partida` (`jogador`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao`
--

LOCK TABLES `cartao` WRITE;
/*!40000 ALTER TABLE `cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clube`
--

DROP TABLE IF EXISTS `clube`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clube` (
  `CNPJ` float NOT NULL,
  `estadioSede` varchar(30) DEFAULT NULL,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clube`
--

LOCK TABLES `clube` WRITE;
/*!40000 ALTER TABLE `clube` DISABLE KEYS */;
/*!40000 ALTER TABLE `clube` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `contrato` (
  `codContrato` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `CNPJ` float NOT NULL,
  `codJogador` int(11) DEFAULT NULL,
  PRIMARY KEY (`codContrato`),
  KEY `fk_jogador_contrato` (`codJogador`),
  KEY `fk_clube_contrato` (`CNPJ`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadio`
--

DROP TABLE IF EXISTS `estadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `estadio` (
  `codEstadio` int(11) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(30) DEFAULT NULL,
  `capacidadeMax` varchar(30) DEFAULT NULL,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codEstadio`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadio`
--

LOCK TABLES `estadio` WRITE;
/*!40000 ALTER TABLE `estadio` DISABLE KEYS */;
INSERT INTO `estadio` VALUES (1,'Belo Horizonte','23018','Independencia'),(2,'Curitiba','42370','Arena da Baixada'),(3,'Salvador','50025','Arena Fonte Nova'),(4,'Rio de Janeiro','44661','Nilton Santos'),(5,'Fortaleza','63903','Arena da Baixada'),(6,'Chapeco','20089','Arena Condá'),(7,'Sao Paulo','47605','Arena Corinthians'),(8,'Belo Horizonte','61846','Mineirao'),(9,'Rio de Janeiro','78838','Maracanã'),(10,'Porto Alegre','55662','Arena do Grêmio'),(11,'Porto Alegre','50128','Beira-Rio'),(12,'São Paulo','43713','Allianz Parque'),(13,'Curitiba','20083','Vila Capanema'),(14,'Santos','16068','Vila Belmiro'),(15,'São Paulo','72039','Morumbi'),(16,'Recife','32983','Ilha do Retiro'),(17,'Rio de Janeiro','21680','São Januário'),(18,'Bahia','30618','Barradão');
/*!40000 ALTER TABLE `estadio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gol`
--

DROP TABLE IF EXISTS `gol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gol` (
  `codPartida` int(11) DEFAULT NULL,
  `tempoDaPartida` date DEFAULT NULL,
  `jogador` int(11) DEFAULT NULL,
  KEY `fk_cartao_partida` (`jogador`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gol`
--

LOCK TABLES `gol` WRITE;
/*!40000 ALTER TABLE `gol` DISABLE KEYS */;
/*!40000 ALTER TABLE `gol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogador`
--

DROP TABLE IF EXISTS `jogador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `jogador` (
  `codJogador` int(11) NOT NULL AUTO_INCREMENT,
  `posicao` varchar(30) DEFAULT NULL,
  `primeiroNome` varchar(30) DEFAULT NULL,
  `sobrenome` varchar(30) DEFAULT NULL,
  `altura` float DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `dataDeascimento` date DEFAULT NULL,
  PRIMARY KEY (`codJogador`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogador`
--

LOCK TABLES `jogador` WRITE;
/*!40000 ALTER TABLE `jogador` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partida`
--

DROP TABLE IF EXISTS `partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `partida` (
  `codPartida` int(11) NOT NULL AUTO_INCREMENT,
  `dataDaPartida` date DEFAULT NULL,
  `timeCasa` int(11) DEFAULT NULL,
  `timeVisitante` int(11) DEFAULT NULL,
  `estadio` int(11) DEFAULT NULL,
  PRIMARY KEY (`codPartida`),
  KEY `fk_partida_timeCasa` (`timeCasa`),
  KEY `fk_partida_timeVisitante` (`timeVisitante`),
  KEY `fk_partida_estadio` (`estadio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partida`
--

LOCK TABLES `partida` WRITE;
/*!40000 ALTER TABLE `partida` DISABLE KEYS */;
/*!40000 ALTER TABLE `partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_campeonato`
--

DROP TABLE IF EXISTS `registro_campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `registro_campeonato` (
  `anoCampeonato` date NOT NULL,
  `clube` int(11) DEFAULT NULL,
  `campeonato` int(11) DEFAULT NULL,
  PRIMARY KEY (`anoCampeonato`),
  KEY `fk_registro_clube` (`clube`),
  KEY `fk_registro_campeonato` (`campeonato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_campeonato`
--

LOCK TABLES `registro_campeonato` WRITE;
/*!40000 ALTER TABLE `registro_campeonato` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'campeonatodefutebol'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-24 18:33:05
