-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: campeonato_de_futebol
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
  `nome` varchar(45) DEFAULT NULL,
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
  `tempoDaPartida` date NOT NULL,
  `partida_codPartida` int(11) NOT NULL,
  `jogador_codJogador` int(11) NOT NULL,
  PRIMARY KEY (`tempoDaPartida`,`partida_codPartida`,`jogador_codJogador`),
  KEY `fk_cartao_jogador1_idx` (`jogador_codJogador`)
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
  PRIMARY KEY (`CNPJ`),
  KEY `fk_clube_estadio` (`estadioSede`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clube`
--

LOCK TABLES `clube` WRITE;
/*!40000 ALTER TABLE `clube` DISABLE KEYS */;
INSERT INTO `clube` VALUES (17241900000000,'8','Cruzeiro'),(33649600000000,'9','Flamengo'),(61750300000000,'12','Palmeiras'),(105027000000,'11','Internacional'),(60518000000000,'15','São Paulo'),(17218000000000,'1','Atlético Mineiro'),(76710600000000,'2','Atlético Paranaense'),(34029600000000,'4','Botafogo'),(7369230000000,'5','Ceará'),(7525950000000,'3','Bahia'),(83018800000000,'6','Chapecoense'),(61902700000000,'7','Corinthians'),(81907400000000,'13','Paraná'),(58986100000000,'16','Sport'),(33617500000000,'17','Vasco da Gama'),(15217000000000,'18','Vitória'),(58196700000000,'14','Santos'),(92797900000000,'10','Grêmio');
/*!40000 ALTER TABLE `clube` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clube_casa`
--

DROP TABLE IF EXISTS `clube_casa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clube_casa` (
  `clube_CNPJ` float NOT NULL,
  PRIMARY KEY (`clube_CNPJ`),
  KEY `fk_clube_visitante_clube1_idx` (`clube_CNPJ`),
  CONSTRAINT `fk_clube_visitante_clube10` FOREIGN KEY (`clube_CNPJ`) REFERENCES `clube` (`CNPJ`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clube_casa`
--

LOCK TABLES `clube_casa` WRITE;
/*!40000 ALTER TABLE `clube_casa` DISABLE KEYS */;
/*!40000 ALTER TABLE `clube_casa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clube_visitante`
--

DROP TABLE IF EXISTS `clube_visitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `clube_visitante` (
  `clube_CNPJ` float NOT NULL,
  PRIMARY KEY (`clube_CNPJ`),
  KEY `fk_clube_visitante_clube1_idx` (`clube_CNPJ`),
  CONSTRAINT `fk_clube_visitante_clube1` FOREIGN KEY (`clube_CNPJ`) REFERENCES `clube` (`CNPJ`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clube_visitante`
--

LOCK TABLES `clube_visitante` WRITE;
/*!40000 ALTER TABLE `clube_visitante` DISABLE KEYS */;
/*!40000 ALTER TABLE `clube_visitante` ENABLE KEYS */;
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
  `clube_CNPJ` float NOT NULL,
  `jogador_codJogador` int(11) NOT NULL,
  PRIMARY KEY (`codContrato`,`jogador_codJogador`,`clube_CNPJ`),
  KEY `fk_contrato_clube1_idx` (`clube_CNPJ`),
  KEY `fk_contrato_jogador1_idx` (`jogador_codJogador`)
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
  `tempoDaPartida` date NOT NULL,
  `partida_codPartida` int(11) NOT NULL,
  `jogador_codJogador` int(11) NOT NULL,
  PRIMARY KEY (`partida_codPartida`,`tempoDaPartida`,`jogador_codJogador`),
  KEY `fk_gol_jogador1_idx` (`jogador_codJogador`),
  CONSTRAINT `fk_gol_jogador1` FOREIGN KEY (`jogador_codJogador`) REFERENCES `jogador` (`codJogador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_gol_partida1` FOREIGN KEY (`partida_codPartida`) REFERENCES `partida` (`codPartida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `estadio_codEstadio` int(11) NOT NULL,
  `clube_visitante_clube_CNPJ` float NOT NULL,
  `clube_casa_clube_CNPJ` float NOT NULL,
  PRIMARY KEY (`codPartida`,`clube_visitante_clube_CNPJ`,`clube_casa_clube_CNPJ`),
  KEY `fk_partida_estadio1_idx` (`estadio_codEstadio`),
  KEY `fk_partida_clube_visitante1_idx` (`clube_visitante_clube_CNPJ`),
  KEY `fk_partida_clube_casa1_idx` (`clube_casa_clube_CNPJ`)
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
  `clube_CNPJ` float NOT NULL,
  `campeonato_codCampeonato` int(11) NOT NULL,
  `anoCampeonato` date DEFAULT NULL,
  `num_registroCampeonato` int(11) NOT NULL,
  `registro_campeonatocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`num_registroCampeonato`,`clube_CNPJ`,`campeonato_codCampeonato`),
  KEY `fk_clube_has_campeonato_campeonato1_idx` (`campeonato_codCampeonato`),
  KEY `fk_clube_has_campeonato_clube_idx` (`clube_CNPJ`),
  CONSTRAINT `fk_clube_has_campeonato_campeonato1` FOREIGN KEY (`campeonato_codCampeonato`) REFERENCES `campeonato` (`codCampeonato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clube_has_campeonato_clube` FOREIGN KEY (`clube_CNPJ`) REFERENCES `clube` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_campeonato`
--

LOCK TABLES `registro_campeonato` WRITE;
/*!40000 ALTER TABLE `registro_campeonato` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'campeonato_de_futebol'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-30 17:02:40
