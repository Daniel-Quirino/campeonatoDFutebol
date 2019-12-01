CREATE DATABASE  IF NOT EXISTS `campeonadodefutebol` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `campeonadodefutebol`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: campeonadodefutebol
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
-- Table structure for table `artilheiro`
--

DROP TABLE IF EXISTS `artilheiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `artilheiro` (
  `jogador` int(11) NOT NULL,
  `qnt_Gols` int(11) NOT NULL,
  `campeonato` int(11) NOT NULL,
  PRIMARY KEY (`jogador`,`campeonato`),
  KEY `fk_artilheiro_2_idx` (`campeonato`),
  CONSTRAINT `fk_artilheiro_1` FOREIGN KEY (`jogador`) REFERENCES `jogador` (`codJogador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_artilheiro_2` FOREIGN KEY (`campeonato`) REFERENCES `campeonato` (`codCampeonato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artilheiro`
--

LOCK TABLES `artilheiro` WRITE;
/*!40000 ALTER TABLE `artilheiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `artilheiro` ENABLE KEYS */;
UNLOCK TABLES;

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
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codCampeonato`),
  KEY `fk_campeonato_timeVencedor` (`timeVencedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `cor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`partida_codPartida`,`jogador_codJogador`,`tempoDaPartida`),
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
  `estadioSede` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`),
  KEY `fk_clube_1_idx` (`estadioSede`),
  CONSTRAINT `fk_clube_1` FOREIGN KEY (`estadioSede`) REFERENCES `estadio` (`codEstadio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clube`
--

LOCK TABLES `clube` WRITE;
/*!40000 ALTER TABLE `clube` DISABLE KEYS */;
INSERT INTO `clube` VALUES (105027000000,11,'Internacional'),(7369230000000,5,'Ceará'),(7525950000000,3,'Bahia'),(15217000000000,18,'Vitória'),(17218000000000,1,'Atlético Mineiro'),(17241900000000,8,'Cruzeiro'),(33014600000000,1,'America Mineiro'),(33617500000000,17,'Vasco da Gama'),(33647600000000,19,'Fluminense'),(33649600000000,9,'Flamengo'),(34029600000000,4,'Botafogo'),(58196700000000,14,'Santos'),(58986100000000,16,'Sport'),(60518000000000,15,'São Paulo'),(61750300000000,12,'Palmeiras'),(61902700000000,7,'Corinthians'),(76710600000000,2,'Atlético Paranaense'),(81907400000000,13,'Paraná'),(83018800000000,6,'Chapecoense'),(92797900000000,10,'Grêmio');
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadio`
--

LOCK TABLES `estadio` WRITE;
/*!40000 ALTER TABLE `estadio` DISABLE KEYS */;
INSERT INTO `estadio` VALUES (1,'Belo Horizonte','23018','Independencia'),(2,'Curitiba','42370','Arena da Baixada'),(3,'Salvador','50025','Arena Fonte Nova'),(4,'Rio de Janeiro','44661','Nilton Santos'),(5,'Fortaleza','63903','Arena da Baixada'),(6,'Chapeco','20089','Arena Condá'),(7,'Sao Paulo','47605','Arena Corinthians'),(8,'Belo Horizonte','61846','Mineirao'),(9,'Rio de Janeiro','78838','Maracanã'),(10,'Porto Alegre','55662','Arena do Grêmio'),(11,'Porto Alegre','50128','Beira-Rio'),(12,'São Paulo','43713','Allianz Parque'),(13,'Curitiba','20083','Vila Capanema'),(14,'Santos','16068','Vila Belmiro'),(15,'São Paulo','72039','Morumbi'),(16,'Recife','32983','Ilha do Retiro'),(17,'Rio de Janeiro','21680','São Januário'),(18,'Bahia','30618','Barradão'),(19,'Rio de Janeiro','8000','Estádio das Laranjeiras');
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
  `nome` varchar(30) DEFAULT NULL,
  `clube` float NOT NULL,
  PRIMARY KEY (`codJogador`),
  KEY `fk_jogador_clube` (`clube`)
) ENGINE=MyISAM AUTO_INCREMENT=919 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogador`
--

LOCK TABLES `jogador` WRITE;
/*!40000 ALTER TABLE `jogador` DISABLE KEYS */;
INSERT INTO `jogador` VALUES (1,'Goleiro','Fernando Henrique',7369230000000),(2,'Zagueiro','Edu Dracena',61750300000000),(3,'Zagueiro','Juan',33649600000000),(4,'Técnico','Mano Menezes',17241900000000),(5,'Técnico','Gilson Kleina',83018800000000),(6,'Meia','Wagner',33617500000000),(7,'Goleiro','Fábio',17241900000000),(8,'Zagueiro','Paulo André',76710600000000),(9,'Meia','Michel Bastos',58986100000000),(10,'Meia','Cícero',92797900000000),(11,'Lateral','Jonathan',76710600000000),(12,'Atacante','Rafael Moura',33014600000000),(13,'Lateral','Patric',17218000000000),(14,'Meia','Rodriguinho',61902700000000),(15,'Lateral','Léo Moura',92797900000000),(16,'Meia','Henrique',17241900000000),(17,'Meia','Marcelo Mattos',33617500000000),(18,'Meia','Airton',33647600000000),(19,'Meia','D\'Alessandro',105027000000),(20,'Meia','Camilo',105027000000),(21,'Atacante','Lucca',105027000000),(22,'Goleiro','Vanderlei',58196700000000),(23,'Lateral','Edimar',60518000000000),(24,'Meia','Robinho',17241900000000),(25,'Lateral','Jean',61750300000000),(26,'Zagueiro','Werley',33617500000000),(27,'Lateral','Pará',33649600000000),(28,'Atacante','Wallyson',15217000000000),(29,'Meia','Willian Farias',15217000000000),(30,'Técnico','Enderson Moreira',33014600000000),(31,'Meia','Wellington',33617500000000),(32,'Lateral','Marcos Rocha',61750300000000),(33,'Lateral','Juninho',15217000000000),(34,'Zagueiro','Douglas',83018800000000),(35,'Meia','Zezinho',81907400000000),(36,'Zagueiro','Paulão',33617500000000),(37,'Meia','Moisés',61750300000000),(38,'Goleiro','Rodolfo',33647600000000),(39,'Meia','Edenílson',105027000000),(40,'Lateral','Carlinhos',33014600000000),(41,'Meia','Alan Ruschel',83018800000000),(42,'Atacante','Luan',17218000000000),(43,'Meia','Jucilei',60518000000000),(44,'Lateral','Dodô',58196700000000),(45,'Atacante','André',92797900000000),(46,'Zagueiro','Rodrigo Moledo',105027000000),(47,'Atacante','Bergson',76710600000000),(48,'Meia','Bruno Silva',17241900000000),(49,'Meia','Marquinhos Gabriel',61902700000000),(50,'Atacante','Rafael Sobis',17241900000000),(51,'Meia','Vecchio',58196700000000),(52,'Lateral','Victor Ferraz',58196700000000),(53,'Atacante','Alex Amado',7369230000000),(54,'Goleiro','Renan',7369230000000),(55,'Meia','Maicosuel',92797900000000),(56,'Zagueiro','Manoel',17241900000000),(57,'Atacante','Emerson Sheik',61902700000000),(58,'Goleiro','Giovanni',17218000000000),(59,'Lateral','Régis',60518000000000),(60,'Meia','Léo Cittadini',58196700000000),(61,'Meia','Paulo Roberto',61902700000000),(62,'Zagueiro','Neto',83018800000000),(63,'Goleiro','Santos',76710600000000),(64,'Meia','Deivid',58986100000000),(65,'Goleiro','Vladimir',58196700000000),(66,'Atacante','Pablo',76710600000000),(67,'Goleiro','Marcelo Grohe',92797900000000),(68,'Goleiro','Danilo Fernandes',105027000000),(69,'Goleiro','Martín Silva',33617500000000),(70,'Meia','Romulo',33649600000000),(71,'Meia','Reina',7369230000000),(72,'Meia','Nikão',76710600000000),(73,'Goleiro','Sidão',60518000000000),(74,'Atacante','Eduardo Sasha',58196700000000),(75,'Meia','Jackson Caucaia',7369230000000),(76,'Técnico','Jorginho',33617500000000),(77,'Meia','Ederson',33649600000000),(78,'Meia','Fillipe Soutto',15217000000000),(79,'Técnico','Rogério Micale',81907400000000),(80,'Atacante','Rhayner',15217000000000),(81,'Lateral','Diogo Barbosa',61750300000000),(82,'Meia','Seijas',105027000000),(83,'Zagueiro','Jackson',7525950000000),(84,'Meia','Linik',15217000000000),(85,'Zagueiro','Marllon',61902700000000),(86,'Meia','Wescley',7369230000000),(87,'Meia','Bruno Henrique',61750300000000),(88,'Atacante','Robinho',33647600000000),(89,'Meia','Mancuello',17241900000000),(90,'Atacante','Paulo Vitor',33617500000000),(91,'Meia','Bruno Cosendey',33617500000000),(92,'Meia','Vinícius',7525950000000),(93,'Meia','Esperon',92797900000000),(94,'Atacante','João Carlos',33647600000000),(95,'Zagueiro','Patrick',7369230000000),(96,'Meia','Alex Baumjohann',15217000000000),(97,'Meia','Willian Arão',33649600000000),(98,'Atacante','Jadson',92797900000000),(99,'Zagueiro','Arthur',17241900000000),(100,'Goleiro','Fernando Miguel',33617500000000),(101,'Atacante','Kelvin',33617500000000),(102,'Meia','Lucho González',76710600000000),(103,'Lateral','Léo',33647600000000),(104,'Atacante','Brenner',60518000000000),(105,'Lateral','Leonardo Simas',76710600000000),(106,'Zagueiro','Gabriel',92797900000000),(107,'Meia','Cuéllar',33649600000000),(108,'Atacante','Paulinho',33617500000000),(109,'Goleiro','Weverton',61750300000000),(110,'Zagueiro','Bremer',17218000000000),(111,'Atacante','Léo Passos',61750300000000),(112,'Meia','Elton',7525950000000),(113,'Goleiro','Agenor',58986100000000),(114,'Zagueiro','Helerson',34029600000000),(115,'Meia','Patrick',92797900000000),(116,'Zagueiro','Ricardo',33617500000000),(117,'Goleiro','Bruno Grassi',92797900000000),(118,'Meia','Michel ',92797900000000),(119,'Atacante','Júnior Brumado',7525950000000),(120,'Atacante','Ezequiel',34029600000000),(121,'Atacante','Lucas Campos',34029600000000),(122,'Atacante','Silvinho',81907400000000),(123,'Meia','Juninho',7369230000000),(124,'Meia','Thiago Galhardo',33617500000000),(125,'Meia','Khevin',83018800000000),(126,'Lateral','Bruno Cortez',92797900000000),(127,'Meia','Igor Gomes',60518000000000),(128,'Lateral','Giovanni',33014600000000),(129,'Meia','Jhonny Lucas',81907400000000),(130,'Zagueiro','Thuler',33649600000000),(131,'Atacante','Lincoln',33649600000000),(132,'Meia','Uillian Correia',15217000000000),(133,'Meia','João Paulo',34029600000000),(134,'Lateral','Pablo Maldini',33649600000000),(135,'Goleiro','Jailson',61750300000000),(136,'Atacante','Lucas Poletto',92797900000000),(137,'Goleiro','Éverson',7369230000000),(138,'Meia','Rodrigo Lindoso',34029600000000),(139,'Lateral','Lucas Soares',17241900000000),(140,'Meia','Vander',17241900000000),(141,'Lateral','Arnaldo',7369230000000),(142,'Zagueiro','Cléber Reis',81907400000000),(143,'Atacante','Hernane',92797900000000),(144,'Técnico','Fernando Diniz',76710600000000),(145,'Atacante','Yuri Alberto',58196700000000),(146,'Atacante','Rodrygo',58196700000000),(147,'Lateral','Samuel Xavier',7369230000000),(148,'Zagueiro','Bressan',92797900000000),(149,'Atacante','Fernando',61750300000000),(150,'Técnico','Lisca',7369230000000),(151,'Atacante','Matheus Matias',61902700000000),(152,'Zagueiro','Weverton Almeida',76710600000000),(153,'Meia','Matheus Henrique',92797900000000),(154,'Zagueiro','Matheus Guedes',58196700000000),(155,'Goleiro','Brenno',92797900000000),(156,'Lateral','Guilherme Guedes',92797900000000),(157,'Goleiro','Filipe',61902700000000),(158,'Zagueiro','Ericson',92797900000000),(159,'Atacante','Paulinho',60518000000000),(160,'Atacante','Bissoli',60518000000000),(161,'Meia','Gabriel',60518000000000),(162,'Meia','Alanzinho',61750300000000),(163,'Lateral','Liziero',60518000000000),(164,'Lateral','Esteves',61750300000000),(165,'Lateral','Vitinho',17241900000000),(166,'Atacante','Hygor',58986100000000),(167,'Lateral','Luan Cândido',61750300000000),(168,'Atacante','Guilherme Vieira',61750300000000),(169,'Lateral','João Pedro Ribeiro',7525950000000),(170,'Meia','Ferreira',58986100000000),(171,'Lateral','Mansur',81907400000000),(172,'Meia','Lucas Araújo',92797900000000),(173,'Atacante','Carneiro',60518000000000),(174,'Atacante','Romário Rodrigues',7369230000000),(175,'Atacante','Miullen',83018800000000),(176,'Meia','Lucas Silva',17241900000000),(177,'Atacante','Flávio',15217000000000),(178,'Atacante','Júnior Santos',83018800000000),(179,'Goleiro','Lucas Paes',60518000000000),(180,'Lateral','Carlos Augusto',61902700000000),(181,'Atacante','Brenner',105027000000),(182,'Lateral','Fabiano',105027000000),(183,'Atacante','Tiago Cunha',7369230000000),(184,'Meia','Nenén',83018800000000),(185,'Atacante','Toró',60518000000000),(186,'Técnico','Thiago Larghi',17218000000000),(187,'Meia','Pio',7369230000000),(188,'Meia','Guilherme Nunes',58196700000000),(189,'Meia','Gabriel Calabres',58196700000000),(190,'Zagueiro','Matheus Mancini',17218000000000),(191,'Atacante','Brenner',34029600000000),(192,'Atacante','Vitor Naum',76710600000000),(193,'Meia','Richard',105027000000),(194,'Atacante','Marcos Junior',33647600000000),(195,'Meia','Jadson',33647600000000),(196,'Meia','Maurício',7369230000000),(197,'Meia','Nadson',83018800000000),(198,'Goleiro','Murillo Lopes',81907400000000),(199,'Atacante','Ademir',33014600000000),(200,'Goleiro','Igor Campos',83018800000000),(201,'Atacante','Bruno Silva',83018800000000),(202,'Zagueiro','Lucas Fonseca',7525950000000),(203,'Goleiro','Vitor Eudes',17241900000000),(204,'Lateral','Yago Pikachu',33617500000000),(205,'Zagueiro','Marco Saravia',92797900000000),(206,'Meia','Jean Mota',58196700000000),(207,'Meia','Rodrigo Ancheta',92797900000000),(208,'Meia','Pepê',33649600000000),(209,'Lateral','Bryan',15217000000000),(210,'Meia','Gabriel',61902700000000),(211,'Meia','Isaque',92797900000000),(212,'Goleiro','Hugo Souza',33649600000000),(213,'Atacante','Wendel',33649600000000),(214,'Meia','Léo Gomes',15217000000000),(215,'Goleiro','Luis Carlos',81907400000000),(216,'Meia','Paulo Henrique',60518000000000),(217,'Atacante','Éderson',76710600000000),(218,'Zagueiro','Matheus Dantas',33649600000000),(219,'Meia','Lucas Lourenço',58196700000000),(220,'Lateral','Michael',33649600000000),(221,'Meia','Hugo Moura',33649600000000),(222,'Zagueiro','Patrick',33649600000000),(223,'Lateral','Reinaldo',60518000000000),(224,'Lateral','João Vitor',33647600000000),(225,'Lateral','Ramon',33649600000000),(226,'Atacante','Jonatas Belusso',15217000000000),(227,'Atacante','Vitor Gabriel',33649600000000),(228,'Meia','Caio',33647600000000),(229,'Meia','Thiago Santos',61750300000000),(230,'Goleiro','Richard',81907400000000),(231,'Meia','Guilherme Ribeiro',76710600000000),(232,'Atacante','Dudu',33647600000000),(233,'Meia','Demethryus',76710600000000),(234,'Atacante','Thiago Santos',81907400000000),(235,'Meia','Petros',60518000000000),(236,'Lateral','Felipe Jonatan',7369230000000),(237,'Meia','Naldo',7369230000000),(238,'Atacante','Alerrandro',17218000000000),(239,'Meia','Bruno Roberto',17218000000000),(240,'Meia','Lucas Santos',33617500000000),(241,'Zagueiro','Miranda',33617500000000),(242,'Meia','Moisés Ribeiro',83018800000000),(243,'Zagueiro','Rafael França',33617500000000),(244,'Zagueiro','Tiago ',7525950000000),(245,'Zagueiro','Luiz Felipe',58196700000000),(246,'Técnico','Claudinei Oliveira',58986100000000),(247,'Meia','Guilherme Biteco',81907400000000),(248,'Zagueiro','Luan Peres ',33647600000000),(249,'Zagueiro','Víctor Cuesta',105027000000),(250,'Meia','Marlone',58986100000000),(251,'Zagueiro','Ricardo Silva',33014600000000),(252,'Goleiro','João Pedro',33617500000000),(253,'Atacante','Matheus Santos',33014600000000),(254,'Lateral','Jeferson',15217000000000),(255,'Zagueiro','Nery Bareiro',83018800000000),(256,'Meia','Yago',17218000000000),(257,'Lateral','Henrique',33617500000000),(258,'Zagueiro','Bruno Pires',7369230000000),(259,'Atacante','Marcelinho',92797900000000),(260,'Goleiro','Marcos Felipe ',33647600000000),(261,'Meia','Marcelo',34029600000000),(262,'Goleiro','Uilson',17218000000000),(263,'Meia','Gabriel',58986100000000),(264,'Atacante','Carlos',81907400000000),(265,'Meia','Valdívia',60518000000000),(266,'Meia','Cazares',17218000000000),(267,'Atacante','Berrío ',33649600000000),(268,'Atacante','Clayton',17218000000000),(269,'Atacante','Andrés Ríos',33617500000000),(270,'Goleiro','João Paulo',58196700000000),(271,'Técnico','Cláudio Prates',7525950000000),(272,'Meia','Alex Santana',81907400000000),(273,'Meia','Jonas',33649600000000),(274,'Goleiro','João Ricardo',33014600000000),(275,'Lateral','Léo',7525950000000),(276,'Meia','Alisson',92797900000000),(277,'Atacante','Osman',83018800000000),(278,'Atacante','Henrique Dourado',33649600000000),(279,'Atacante','Rossi',105027000000),(280,'Meia','Juninho',33014600000000),(281,'Atacante','Aylon',33014600000000),(282,'Goleiro','Jean',60518000000000),(283,'Meia','Hyoran',61750300000000),(284,'Atacante','Borja',61750300000000),(285,'Meia','Cueva',60518000000000),(286,'Meia','Régis',7525950000000),(287,'Lateral','Marcelo Hermes',17241900000000),(288,'Zagueiro','Thales ',105027000000),(289,'Meia','Zé Rafael ',7525950000000),(290,'Atacante','Morato',60518000000000),(291,'Zagueiro','Wanderson',76710600000000),(292,'Atacante','Douglas Coutinho ',7369230000000),(293,'Lateral','Victor Luis',61750300000000),(294,'Atacante','Hyuri',7369230000000),(295,'Meia','Matheus Galdezani',17218000000000),(296,'Técnico','Maurício Barbieri',33649600000000),(297,'Técnico','Diego Aguirre',60518000000000),(298,'Atacante','Pablo Dyego',33647600000000),(299,'Atacante','Keno',61750300000000),(300,'Meia','Ruy',33014600000000),(301,'Zagueiro','Rafael Thyere',83018800000000),(302,'Atacante','Gabriel',58196700000000),(303,'Goleiro','Jandrei',83018800000000),(304,'Meia','Pavez',76710600000000),(305,'Zagueiro','Thiago Martins',61750300000000),(306,'Meia','Everton Felipe',58986100000000),(307,'Atacante','Marcos Guilherme ',60518000000000),(308,'Zagueiro','Neris',81907400000000),(309,'Meia','Patrick',105027000000),(310,'Zagueiro','Léo Pereira',76710600000000),(311,'Atacante','Luan Viana',81907400000000),(312,'Atacante','Clayson',61902700000000),(313,'Meia','Bruno Silva',33617500000000),(314,'Atacante','Neilton',15217000000000),(315,'Zagueiro','Rodrigo Becão',7525950000000),(316,'Goleiro','Glauco',33014600000000),(317,'Lateral','Malcoon',33014600000000),(318,'Atacante','Rogério',58986100000000),(319,'Meia','Allione',7525950000000),(320,'Zagueiro','Valdo',7369230000000),(321,'Zagueiro','Charles',81907400000000),(322,'Zagueiro','Bruno Alves',60518000000000),(323,'Lateral','Evandro',58986100000000),(324,'Atacante','Nico López',105027000000),(325,'Meia','Lucas Romero',17241900000000),(326,'Atacante','Denilson',15217000000000),(327,'Atacante','Rildo',33617500000000),(328,'Meia','Richard',33647600000000),(329,'Atacante','Everton',92797900000000),(330,'Atacante','Luan',92797900000000),(331,'Atacante','Judivan ',33014600000000),(332,'Meia','Torito González',81907400000000),(333,'Meia','Matheus Rossetto',76710600000000),(334,'Meia','José Welison',15217000000000),(335,'Lateral','Sidcley',61902700000000),(336,'Zagueiro','Vinicius',15217000000000),(337,'Zagueiro','Rodrigo Caio',60518000000000),(338,'Atacante','Geuvânio',33649600000000),(339,'Goleiro','Lucas Macanhan',76710600000000),(340,'Atacante','Fernandinho',7525950000000),(341,'Meia','Marcos Vinícius',34029600000000),(342,'Zagueiro','Luiz Otávio ',83018800000000),(343,'Meia','Canteros',83018800000000),(344,'Atacante','Raniel',17241900000000),(345,'Meia','Flávio',7525950000000),(346,'Goleiro','David',81907400000000),(347,'Atacante','Nathan',33617500000000),(348,'Zagueiro','Emerson Santos',61750300000000),(349,'Meia','Gustavo Blanco',17218000000000),(350,'Lateral','Leonardo',92797900000000),(351,'Goleiro','Thiago',33649600000000),(352,'Lateral','Zeca',105027000000),(353,'Zagueiro','Rayan',81907400000000),(354,'Zagueiro','Gabriel',17218000000000),(355,'Zagueiro','Messias',33014600000000),(356,'Zagueiro','Pedro Henrique',61902700000000),(357,'Meia','Thaciano',92797900000000),(358,'Zagueiro','Kannemann',92797900000000),(359,'Meia','Neto Moura',58986100000000),(360,'Meia','Vitor Bueno',58196700000000),(361,'Atacante','Carlos Henrique',58986100000000),(362,'Atacante','Tréllez',60518000000000),(363,'Meia','Yago',15217000000000),(364,'Meia','Desábato',33617500000000),(365,'Meia','Arrascaeta',17241900000000),(366,'Goleiro','Léo',92797900000000),(367,'Meia','Sornoza',33647600000000),(368,'Lateral','Rodinei',33649600000000),(369,'Goleiro','Gatito Fernández',34029600000000),(370,'Zagueiro','Walisson Maia',15217000000000),(371,'Lateral','Claudio Winck',58986100000000),(372,'Meia','Guilherme Costa',15217000000000),(373,'Meia','Alison',58196700000000),(374,'Lateral','Daniel Guedes ',58196700000000),(375,'Atacante','Ángel Romero',61902700000000),(376,'Meia','Serginho',33014600000000),(377,'Lateral','Yuri',34029600000000),(378,'Lateral','Felipe Rodrigues',58986100000000),(379,'Atacante','Júnior',15217000000000),(380,'Atacante','Pepê',92797900000000),(381,'Lateral','Aderlan',33014600000000),(382,'Zagueiro','Éder ',76710600000000),(383,'Atacante','Raphael Alemão',81907400000000),(384,'Lateral','Ayrton Lucas',33647600000000),(385,'Zagueiro','Jesiel',81907400000000),(386,'Zagueiro','Balbuena',61902700000000),(387,'Meia','Lucas',33617500000000),(388,'Goleiro','Lucas Perri',60518000000000),(389,'Zagueiro','Bruno Bispo',15217000000000),(390,'Atacante','Leandro Carvalho',34029600000000),(391,'Meia','Bruno Paulista',33617500000000),(392,'Meia','Leandro Vilela',81907400000000),(393,'Meia','Luiz Antonio ',83018800000000),(394,'Zagueiro','Arboleda',60518000000000),(395,'Atacante','Kazim',61902700000000),(396,'Meia','Leonardo Valencia',34029600000000),(397,'Lateral','Igor',81907400000000),(398,'Meia','Barreto',83018800000000),(399,'Meia','Gabriel Dias',105027000000),(400,'Zagueiro','Iago Maidana',17218000000000),(401,'Meia','Rafinha',7369230000000),(402,'Meia','Wesley',33014600000000),(403,'Meia','Jean',34029600000000),(404,'Meia','Élber',7525950000000),(405,'Zagueiro','Léo Ortiz',58986100000000),(406,'Zagueiro','Henrique',61902700000000),(407,'Lateral','Léo Principe',61902700000000),(408,'Lateral','Iago',105027000000),(409,'Atacante','Edigar Junio',7525950000000),(410,'Meia','Balbino',92797900000000),(411,'Meia','Matheus Anjos',76710600000000),(412,'Lateral','Caju',58196700000000),(413,'Zagueiro','Danilo Silva',105027000000),(414,'Zagueiro','Ramon',15217000000000),(415,'Lateral','Júnior Tavares',60518000000000),(416,'Meia','Pedro Ken',7369230000000),(417,'Zagueiro','Rafael Pereira',7369230000000),(418,'Atacante','Paolo Guerrero',33649600000000),(419,'Lateral','Apodi',83018800000000),(420,'Meia','Leandro Donizete',33014600000000),(421,'Goleiro','Erick',33014600000000),(422,'Zagueiro','Vitão',61750300000000),(423,'Goleiro','Saulo',34029600000000),(424,'Zagueiro','Yago',34029600000000),(425,'Técnico','Osmar Loss',61902700000000),(426,'Zagueiro','Rafael',33649600000000),(427,'Goleiro','Walter',61902700000000),(428,'Meia','Guerra',61750300000000),(429,'Lateral','Thiago Carleto',76710600000000),(430,'Atacante','Capixaba',33014600000000),(431,'Atacante','William Pottker',105027000000),(432,'Meia','Rodrigo Andrade',15217000000000),(433,'Meia','Nickson',15217000000000),(434,'Zagueiro','Igor Rabello',34029600000000),(435,'Zagueiro','Tiago Alves',7369230000000),(436,'Atacante','Copete',58196700000000),(437,'Lateral','Felipinho',33014600000000),(438,'Meia','Éverton Ribeiro',33649600000000),(439,'Lateral','Madson',92797900000000),(440,'Lateral','Marcos Vinícius ',83018800000000),(441,'Meia','Dodi',33647600000000),(442,'Atacante','Marlos',33649600000000),(443,'Zagueiro','Kanu',15217000000000),(444,'Zagueiro','Adryelson',58986100000000),(445,'Goleiro','Maílson',58986100000000),(446,'Meia','Leandrinho',34029600000000),(447,'Meia','Ralf',61902700000000),(448,'Atacante','Róger Guedes',17218000000000),(449,'Lateral','Mena',7525950000000),(450,'Meia','Andrigo',58986100000000),(451,'Lateral','Caio',58986100000000),(452,'Lateral','Bruno Pacheco',83018800000000),(453,'Lateral','Pedro Botelho',15217000000000),(454,'Meia','Jailson',92797900000000),(455,'Lateral','Gilson',34029600000000),(456,'Zagueiro','Anderson Martins',60518000000000),(457,'Atacante','Bruno Henrique',58196700000000),(458,'Zagueiro','Réver',33649600000000),(459,'Lateral','Moisés',34029600000000),(460,'Meia','Estevão',92797900000000),(461,'Meia','Arthur',92797900000000),(462,'Atacante','David',17241900000000),(463,'Goleiro','Victor',17218000000000),(464,'Meia','Elias',17218000000000),(465,'Goleiro','Gabriel Batista',33649600000000),(466,'Meia','Alex',76710600000000),(467,'Atacante','Diego',81907400000000),(468,'Meia','Maicon',92797900000000),(469,'Atacante','Kendy',83018800000000),(470,'Meia','Yuri',58196700000000),(471,'Meia','Bruno Guimarães',76710600000000),(472,'Lateral','Cedric',15217000000000),(473,'Lateral','Bruno',83018800000000),(474,'Goleiro','Tiepo',83018800000000),(475,'Zagueiro','Kanu',34029600000000),(476,'Atacante','Marquinhos',33014600000000),(477,'Lateral','Luis Ricardo',34029600000000),(478,'Meia','Jean Lucas',33649600000000),(479,'Meia','Juan Alano',105027000000),(480,'Atacante','Lucas Silva',33649600000000),(481,'Zagueiro','Dedé',17241900000000),(482,'Atacante','Ronald',105027000000),(483,'Meia','Renan Oliveira',33014600000000),(484,'Meia','Caio Henrique',81907400000000),(485,'Atacante','Felipe Azevedo',7369230000000),(486,'Atacante','Luan',33014600000000),(487,'Meia','João Pedro',34029600000000),(488,'Meia','Marquinhos',17218000000000),(489,'Lateral','Fábio Santos',17218000000000),(490,'Goleiro','Caíque França',61902700000000),(491,'Lateral','Marlon',33647600000000),(492,'Meia','Thiago Neves',17241900000000),(493,'Atacante','Roger',61902700000000),(494,'Atacante','Wellington Paulista',83018800000000),(495,'Lateral','Diego Ferreira',76710600000000),(496,'Meia','Márcio Araújo',83018800000000),(497,'Zagueiro','Everson',7525950000000),(498,'Meia','Pedrinho',61902700000000),(499,'Zagueiro','Zé Ivaldo',76710600000000),(500,'Meia','Lucas Marques',15217000000000),(501,'Goleiro','Fernando Leal',33014600000000),(502,'Lateral','Alemão',81907400000000),(503,'Meia','Christian',33014600000000),(504,'Meia','Jadson',61902700000000),(505,'Meia','Rafinha',17241900000000),(506,'Goleiro','Gabriel Félix',33617500000000),(507,'Atacante','Diogo Vitor',58196700000000),(508,'Lateral','Cascardo',76710600000000),(509,'Zagueiro','Lima',33014600000000),(510,'Atacante','Eder Luis',7369230000000),(511,'Lateral','Michel',33014600000000),(512,'Atacante','Giovanny ',76710600000000),(513,'Lateral','Edílson',17241900000000),(514,'Goleiro','Diego Alves',33649600000000),(515,'Zagueiro','Juninho',17218000000000),(516,'Meia','Felipe Melo',61750300000000),(517,'Meia','David',33014600000000),(518,'Atacante','Luis Henrique',92797900000000),(519,'Atacante','Arthur',7369230000000),(520,'Técnico','Jair Ventura',58196700000000),(521,'Atacante','Elton',7369230000000),(522,'Meia','Luiz Fernando ',34029600000000),(523,'Zagueiro','Fabrício Bruno',83018800000000),(524,'Goleiro','Elias',15217000000000),(525,'Meia','Douglas',92797900000000),(526,'Zagueiro','Matheus Ferraz',33014600000000),(527,'Atacante','Ricardo Oliveira',17218000000000),(528,'Goleiro','Caíque',15217000000000),(529,'Meia','Renato',58196700000000),(530,'Meia','Diego',33649600000000),(531,'Goleiro','De Amores',33647600000000),(532,'Zagueiro','Klaus',105027000000),(533,'Atacante','Lucas Fernandes',15217000000000),(534,'Meia','Nenê',60518000000000),(535,'Técnico','Odair Hellmann',105027000000),(536,'Atacante','Rafael Marques',58986100000000),(537,'Técnico','Abel Braga',33647600000000),(538,'Atacante','Aguirre',34029600000000),(539,'Técnico','Vagner Mancini',15217000000000),(540,'Atacante','Guilherme',83018800000000),(541,'Meia','Dudu Cearense',34029600000000),(542,'Goleiro','Magrão',58986100000000),(543,'Zagueiro','Thiago Heleno',76710600000000),(544,'Meia','Raul',33617500000000),(545,'Atacante','Willian',61750300000000),(546,'Lateral','Egídio',17241900000000),(547,'Goleiro','Cássio',61902700000000),(548,'Meia','Douglas',33647600000000),(549,'Técnico','Renato Gaúcho',92797900000000),(550,'Atacante','Léo Tilica',92797900000000),(551,'Meia','Kaio',92797900000000),(552,'Meia','Amaral',83018800000000),(553,'Lateral','Fagner',61902700000000),(554,'Goleiro','Deijair ',7525950000000),(555,'Goleiro','César',33649600000000),(556,'Zagueiro','Gustavo Henrique',58196700000000),(557,'Lateral','Bruno',60518000000000),(558,'Meia','Lucas Fernandes',60518000000000),(559,'Zagueiro','Rhodolfo',33649600000000),(560,'Zagueiro','Ernando',58986100000000),(561,'Goleiro','Júlio César',33647600000000),(562,'Lateral','Juninho Capixaba',61902700000000),(563,'Atacante','Geovane Itinga',7525950000000),(564,'Lateral','Fabrício',33617500000000),(565,'Meia','Lucas Paquetá',33649600000000),(566,'Meia','Guilherme',76710600000000),(567,'Meia','Everton',60518000000000),(568,'Meia','Elicarlos',83018800000000),(569,'Meia','Hudson',60518000000000),(570,'Zagueiro','Rafael Lima',33014600000000),(571,'Lateral','Lucas',15217000000000),(572,'Meia','Adilson',17218000000000),(573,'Zagueiro','David Braz',58196700000000),(574,'Meia','Luís Fernando',7525950000000),(575,'Meia','Carlos Eduardo',81907400000000),(576,'Lateral','Marcelo Oliveira',92797900000000),(577,'Meia','Gerson Magrão',33014600000000),(578,'Atacante','Deyverson',61750300000000),(579,'Atacante','Kayke',7525950000000),(580,'Meia','Jean Pyerre',92797900000000),(581,'Meia','Felipinho',7525950000000),(582,'Zagueiro','Breno',33617500000000),(583,'Meia','Marco Antônio',7525950000000),(584,'Meia','Ronaldo',33649600000000),(585,'Atacante','Yago',76710600000000),(586,'Lateral','Nicolas',76710600000000),(587,'Meia','Yan',61750300000000),(588,'Lateral','Báez',81907400000000),(589,'Meia','Mateus Vital',61902700000000),(590,'Atacante','Bill',76710600000000),(591,'Zagueiro','Lucas Veríssimo',58196700000000),(592,'Zagueiro','Aderllan',15217000000000),(593,'Goleiro','Lucas França',17241900000000),(594,'Goleiro','Keiller',105027000000),(595,'Goleiro','Cleiton',17218000000000),(596,'Lateral','Victor Luiz',17241900000000),(597,'Atacante','Índio',58986100000000),(598,'Zagueiro','Marcelo Benevenuto',34029600000000),(599,'Atacante','Bruno Xavier',61902700000000),(600,'Goleiro','John Victor',58196700000000),(601,'Zagueiro','Joel Carli',34029600000000),(602,'Lateral','Patrick Brey',17241900000000),(603,'Zagueiro','Léo Duarte',33649600000000),(604,'Meia','Araruna',60518000000000),(605,'Meia','Luquinhas',33647600000000),(606,'Goleiro','Michael',17218000000000),(607,'Atacante','Vico',92797900000000),(608,'Meia','Matheus Fernandes',34029600000000),(609,'Meia','Gregore',7525950000000),(610,'Atacante','Ribamar',76710600000000),(611,'Lateral','Alan Cardoso',33617500000000),(612,'Meia','Matheusinho',33014600000000),(613,'Lateral','Trauco',33649600000000),(614,'Atacante','Felipe Vizeu',33649600000000),(615,'Meia','Andrey',33617500000000),(616,'Meia','Jhony',81907400000000),(617,'Atacante','Marcinho',76710600000000),(618,'Goleiro','Lucas Ferreira',58986100000000),(619,'Meia','Gustavo Bochecha',34029600000000),(620,'Meia','Evander',33617500000000),(621,'Atacante','Vinicius Junior',33649600000000),(622,'Lateral','Júnior',81907400000000),(623,'Zagueiro','Léo Santos',61902700000000),(624,'Atacante','Artur',61750300000000),(625,'Atacante','Caio Monteiro',33617500000000),(626,'Lateral','Marcinho',34029600000000),(627,'Meia','Fabrício',58986100000000),(628,'Meia','Maycon',61902700000000),(629,'Atacante','Hugo Borges',33617500000000),(630,'Atacante','Caíque',60518000000000),(631,'Atacante','Marcelo',76710600000000),(632,'Atacante','Perotti',83018800000000),(633,'Meia','Mateus Norton',33647600000000),(634,'Goleiro','Daniel Fuzato',61750300000000),(635,'Meia','Diego Pituca',58196700000000),(636,'Atacante','Juninho Piauiense',7369230000000),(637,'Goleiro','Felipe',7525950000000),(638,'Lateral','Sander',58986100000000),(639,'Meia','Raphael Veiga',76710600000000),(640,'Atacante','Ítalo',7525950000000),(641,'Atacante','Caprini',76710600000000),(642,'Atacante','Luidy',7369230000000),(643,'Lateral','Riuler',76710600000000),(644,'Meia','Charles',105027000000),(645,'Atacante','Pedro',33647600000000),(646,'Meia','Lima',92797900000000),(647,'Meia','Alexsander',76710600000000),(648,'Lateral','Renan Lodi',76710600000000),(649,'Meia','Pablo Pardal',58986100000000),(650,'Goleiro','Cassiano',7525950000000),(651,'Lateral','Emerson',17218000000000),(652,'Goleiro','Daniel',105027000000),(653,'Meia','Wesley Dias',81907400000000),(654,'Lateral','Mantuan',61902700000000),(655,'Lateral','Kevin',17218000000000),(656,'Meia','Baralhas',76710600000000),(657,'Lateral','Éder Militão',60518000000000),(658,'Meia','Gabriel Pires',81907400000000),(659,'Atacante','Felipe',33647600000000),(660,'Zagueiro','Durval',58986100000000),(661,'Meia','Danilo',61902700000000),(662,'Meia','Zé Ricardo',33014600000000),(663,'Goleiro','Caio',76710600000000),(664,'Atacante','Arthur Gomes',58196700000000),(665,'Goleiro','Jefferson',34029600000000),(666,'Meia','Gabriel Furtado',61750300000000),(667,'Lateral','Dudu',105027000000),(668,'Goleiro','Matheus Vidotto',61902700000000),(669,'Zagueiro','Daniel ',76710600000000),(670,'Goleiro','Fernando Prass',61750300000000),(671,'Atacante','Pachu',34029600000000),(672,'Atacante','Matheus Alessandro',33647600000000),(673,'Atacante','Marcos Calazans',33647600000000),(674,'Zagueiro','Frazan',33647600000000),(675,'Meia','Matheus Lira',7369230000000),(676,'Zagueiro','Douglas Grolli',7525950000000),(677,'Zagueiro','Hiago',83018800000000),(678,'Goleiro','Fernando',17218000000000),(679,'Atacante','Fred',17241900000000),(680,'Lateral','Gilberto ',33647600000000),(681,'Goleiro','Jori',33014600000000),(682,'Zagueiro','Lucas Halter',76710600000000),(683,'Atacante','Marco Túlio',17218000000000),(684,'Lateral','Ezequiel ',17241900000000),(685,'Goleiro','Gabriel',76710600000000),(686,'Lateral','Renê',33649600000000),(687,'Zagueiro','Luis Henrique',33014600000000),(688,'Goleiro','Ivan',83018800000000),(689,'Meia','Tomás Andrade',17218000000000),(690,'Meia','Shaylon',60518000000000),(691,'Meia','Lepu',7525950000000),(692,'Meia','Richardson',7369230000000),(693,'Atacante','Arthur ',83018800000000),(694,'Meia','Luan',15217000000000),(695,'Meia','Warley',81907400000000),(696,'Meia','Nonoca',58986100000000),(697,'Atacante','Mikael',58986100000000),(698,'Zagueiro','Léo',17241900000000),(699,'Lateral','Eduardo',83018800000000),(700,'Zagueiro','Ibañez',33647600000000),(701,'Zagueiro','Vilson',61902700000000),(702,'Zagueiro','Murilo',17241900000000),(703,'Lateral','Ruan',105027000000),(704,'Meia','Bruno Leite',76710600000000),(705,'Meia','Ariel Cabral',17241900000000),(706,'Lateral','Norberto ',33014600000000),(707,'Meia','Jhemerson',15217000000000),(708,'Meia','Nilton',7525950000000),(709,'Atacante','Papagaio',61750300000000),(710,'Meia','Edson',7525950000000),(711,'Lateral','Ronaldo',33014600000000),(712,'Meia','Lucas Lima',61750300000000),(713,'Zagueiro','Luiz Gustavo',33617500000000),(714,'Meia','Renatinho',34029600000000),(715,'Atacante','Macula',33647600000000),(716,'Meia','Fabinho',7369230000000),(717,'Atacante','Marcelo',17241900000000),(718,'Zagueiro','Luan',61750300000000),(719,'Zagueiro','Pedro Geromel',92797900000000),(720,'Zagueiro','Léo Xavier',15217000000000),(721,'Lateral','Jonathan',34029600000000),(722,'Lateral','Romário ',7369230000000),(723,'Lateral','Mayke',61750300000000),(724,'Zagueiro','Max',58986100000000),(725,'Meia','Rodrigo Fernandes',33617500000000),(726,'Goleiro','Yago Darub',33649600000000),(727,'Zagueiro','Josué',15217000000000),(728,'Meia','Moresche',33617500000000),(729,'Lateral','Vinícius Freitas',83018800000000),(730,'Zagueiro','Oswaldo Henríquez',58986100000000),(731,'Zagueiro','Erazo',33617500000000),(732,'Goleiro','Fernando Castro',7525950000000),(733,'Goleiro','Diego',15217000000000),(734,'Atacante','Erik',17218000000000),(735,'Zagueiro','Paulo Miranda',92797900000000),(736,'Lateral','Rafael Galhardo',33617500000000),(737,'Zagueiro','Digão',17241900000000),(738,'Técnico','Alberto Valentim',34029600000000),(739,'Meia','Camacho',76710600000000),(740,'Lateral','Nino Paraíba',7525950000000),(741,'Zagueiro','Renato Chaves',33647600000000),(742,'Zagueiro','Gum',33647600000000),(743,'Lateral','Raul Prata',58986100000000),(744,'Lateral','Ramon',33617500000000),(745,'Atacante','André Lima',15217000000000),(746,'Meia','Arouca',17218000000000),(747,'Atacante','Jael',92797900000000),(748,'Atacante','Wellington Silva',105027000000),(749,'Goleiro','Marcelo Lomba',105027000000),(750,'Atacante','Rodrigo Pimpão',34029600000000),(751,'Goleiro','Paulo Victor',92797900000000),(752,'Atacante','Júnior Dutra',61902700000000),(753,'Meia','Diego Souza',60518000000000),(754,'Atacante','Dudu',61750300000000),(755,'Atacante','Kieza',34029600000000),(756,'Goleiro','Rafael',17241900000000),(757,'Lateral','Uendel',105027000000),(758,'Atacante','Vinicius',83018800000000),(759,'Zagueiro','Ronaldo Alves',58986100000000),(760,'Atacante','Leandro Damião',105027000000),(761,'Zagueiro','Leonardo Silva',17218000000000),(762,'Meia','Fellipe Bastos',58986100000000),(763,'Goleiro','Anderson',7525950000000),(764,'Meia','Giovanni Augusto',33617500000000),(765,'Lateral','João Lucas',7369230000000),(766,'Lateral','Jean',58986100000000),(767,'Atacante','Chará',17218000000000),(768,'Meia','Martín Sarrafiore',105027000000),(769,'Lateral','Carlos Gabriel',17218000000000),(770,'Meia','David Terans',17218000000000),(771,'Meia','Doffo',83018800000000),(772,'Zagueiro','Nicolás Freire',61750300000000),(773,'Meia','Cardona',7369230000000),(774,'Meia','Yann Rolim',83018800000000),(775,'Meia','Dudu',33617500000000),(776,'Técnico','Marcos Paquetá',34029600000000),(777,'Atacante','Gabriel Barbosa',61750300000000),(778,'Atacante','Jonathas',61902700000000),(779,'Atacante','Gilberto',7525950000000),(780,'Técnico','Marcelo Oliveira',33647600000000),(781,'Técnico','Ricardo Drubscky',33014600000000),(782,'Lateral','Lenon',33617500000000),(783,'Atacante','Marinho',92797900000000),(784,'Atacante','Marcelo Cirino',76710600000000),(785,'Atacante','Joao Rojas',60518000000000),(786,'Meia','Bryan Ruíz',58196700000000),(787,'Lateral','Danilo Avelar',61902700000000),(788,'Lateral','Bruno Peres',60518000000000),(789,'Atacante','Barcos',17241900000000),(790,'Atacante','Fernando Uribe',33649600000000),(791,'Zagueiro','Eduardo Brock',7369230000000),(792,'Atacante','Edinho',17218000000000),(793,'Atacante','Luciano',33647600000000),(794,'Meia','Bruno Nazário',76710600000000),(795,'Meia','Calyson',7369230000000),(796,'Meia','Jean Roberto',83018800000000),(797,'Meia','Gustavo Scarpa',61750300000000),(798,'Meia','Marcelo Meli',15217000000000),(799,'Atacante','Rodolfo ',81907400000000),(800,'Meia','Lincoln',92797900000000),(801,'Atacante','Crysan',76710600000000),(802,'Meia','Matheus Savio',33649600000000),(803,'Atacante','Leandrinho',17218000000000),(804,'Atacante','Jonatan Álvez',105027000000),(805,'Meia','Vitinho',61750300000000),(806,'Atacante','Walter Bou',15217000000000),(807,'Zagueiro','Ruan Renato',15217000000000),(808,'Meia','Rodrigo Figueiredo',61902700000000),(809,'Atacante','Erick',15217000000000),(810,'Técnico','Tiago Nunes',76710600000000),(811,'Lateral','Marcelo Benítez',15217000000000),(812,'Meia','Luan',60518000000000),(813,'Meia','Edinho',7369230000000),(814,'Atacante','Maxi López',33617500000000),(815,'Lateral','Reginaldo ',76710600000000),(816,'Atacante','Pilar',33014600000000),(817,'Atacante','Everaldo ',33647600000000),(818,'Atacante','Álvaro',105027000000),(819,'Goleiro','João Gabriel',15217000000000),(820,'Atacante','Juninho Quixadá',7369230000000),(821,'Meia','Nonato',105027000000),(822,'Meia','Carlos Sánchez',58196700000000),(823,'Meia','Nathan',17218000000000),(824,'Meia','Zé Ricardo',33647600000000),(825,'Goleiro','Diego',34029600000000),(826,'Técnico','Adilson Batista',33014600000000),(827,'Lateral','Márcio Azevedo',76710600000000),(828,'Lateral','Mateus',15217000000000),(829,'Zagueiro','Ruan Marvyn',17218000000000),(830,'Técnico','Wesley Carvalho',61750300000000),(831,'Atacante','Cabezas',33647600000000),(832,'Técnico','Cuca',58196700000000),(833,'Técnico','Luiz Felipe Scolari',61750300000000),(834,'Atacante','Derlis González',58196700000000),(835,'Técnico','João Burse',15217000000000),(836,'Meia','Araos',61902700000000),(837,'Técnico','Bruno Lazaroni',34029600000000),(838,'Atacante','Sergio Díaz',61902700000000),(839,'Goleiro','Luan Polli ',58986100000000),(840,'Zagueiro','Lucas Kal',60518000000000),(841,'Zagueiro','Derlan',92797900000000),(842,'Atacante','Rafael Grampola',81907400000000),(843,'Meia','Piris',33649600000000),(844,'Atacante','Vitinho',33649600000000),(845,'Zagueiro','Leandro Castan',33617500000000),(846,'Técnico','Guto Ferreira',83018800000000),(847,'Atacante','Wesley Pacheco',33014600000000),(848,'Zagueiro','Gustavo Gómez',61750300000000),(849,'Atacante','Vinícius Araújo',33617500000000),(850,'Meia','Igor Amaral',33014600000000),(851,'Zagueiro','Paulo Ricardo',33647600000000),(852,'Zagueiro','Tonhão',92797900000000),(853,'Lateral','Paulinho',7525950000000),(854,'Meia','Sananduva',76710600000000),(855,'Meia','Diego Torres',83018800000000),(856,'Meia','Orzusa',83018800000000),(857,'Técnico','Zé Ricardo',34029600000000),(858,'Lateral','Matheus Rocha',61750300000000),(859,'Lateral','Mayk',7525950000000),(860,'Atacante','Rodrigo Alves',7525950000000),(861,'Atacante','Goldeson',33014600000000),(862,'Zagueiro','Matias Antonini',92797900000000),(863,'Atacante','Mateus Gonçalves',58986100000000),(864,'Goleiro','Gabriel Brazão',17241900000000),(865,'Técnico','Carpegiani',15217000000000),(866,'Técnico','Eduardo Baptista',58986100000000),(867,'Zagueiro','Denilson',92797900000000),(868,'Técnico','Valdir',33617500000000),(869,'Zagueiro','Martín Rea',17218000000000),(870,'Atacante','Plata',76710600000000),(871,'Meia','Éderson',17241900000000),(872,'Meia','Matheus Sales',33014600000000),(873,'Meia','Roger Bernardo',17218000000000),(874,'Zagueiro','Felipe Santana',17218000000000),(875,'Goleiro','Leo',76710600000000),(876,'Meia','Felipe Gedoz ',76710600000000),(877,'Lateral','João Pedro ',7525950000000),(878,'Técnico','Nelsinho Baptista',58986100000000),(879,'Meia','Anselmo',58986100000000),(880,'Meia','Thomás',58986100000000),(881,'Atacante','Bruno Paulo',61902700000000),(882,'Técnico','Fábio Carille',61902700000000),(883,'Atacante','Riascos',33617500000000),(884,'Meia','Cleiton Xavier',15217000000000),(885,'Goleiro','Julio Cesar',33649600000000),(886,'Zagueiro','Alan',7369230000000),(887,'Meia','Jajá',33649600000000),(888,'Atacante','Dionathã',92797900000000),(889,'Zagueiro','Reginaldo',33647600000000),(890,'Meia','Marlon Freitas',33647600000000),(891,'Atacante','Marcinho',105027000000),(892,'Atacante','Fernandinho',105027000000),(893,'Zagueiro','Rafael',81907400000000),(894,'Atacante','Felipe Augusto',81907400000000),(895,'Atacante','Vitor Feijão',81907400000000),(896,'Atacante','Minho',81907400000000),(897,'Lateral','Ernandes',7369230000000),(898,'Meia','Tchê Tchê',61750300000000),(899,'Técnico','Marcelo Chamusca',7369230000000),(900,'Atacante','Roberto',7369230000000),(901,'Lateral','Leandro Silva',7369230000000),(902,'Meia','Rafael Longuine',58196700000000),(903,'Lateral','Rafael Carioca',7369230000000),(904,'Meia','Leandro Canhoto',7369230000000),(905,'Lateral','Diego Tavares',81907400000000),(906,'Atacante','Léo Ceará',15217000000000),(907,'Zagueiro','Lucas Ribeiro',15217000000000),(908,'Lateral','Elias',58986100000000),(909,'Lateral','Roberto',83018800000000),(910,'Goleiro','Diogo Silva',7369230000000),(911,'Atacante','Maurício Cordeiro',15217000000000),(912,'Meia','Marcão Silva',58986100000000),(913,'Meia','Jair',58986100000000),(914,'Goleiro','Jordi',33617500000000),(915,'Atacante','Robinho',7369230000000),(916,'Meia','Marquinho',76710600000000),(917,'Atacante','Rony',76710600000000),(918,'Atacante','Luan Ferreira',15217000000000);
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
  `campeonato` int(11) NOT NULL,
  PRIMARY KEY (`codPartida`,`clube_visitante_clube_CNPJ`,`clube_casa_clube_CNPJ`),
  KEY `fk_partida_estadio1_idx` (`estadio_codEstadio`),
  KEY `fk_partida_clube_visitante1_idx` (`clube_visitante_clube_CNPJ`),
  KEY `fk_partida_clube_casa1_idx` (`clube_casa_clube_CNPJ`),
  KEY `fk_partida_1_idx` (`campeonato`),
  CONSTRAINT `fk_partida_1` FOREIGN KEY (`campeonato`) REFERENCES `campeonato` (`codCampeonato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partida_clube_casa1` FOREIGN KEY (`clube_casa_clube_CNPJ`) REFERENCES `clube_casa` (`clube_CNPJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partida_clube_visitante1` FOREIGN KEY (`clube_visitante_clube_CNPJ`) REFERENCES `clube_visitante` (`clube_CNPJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partida_estadio1` FOREIGN KEY (`estadio_codEstadio`) REFERENCES `estadio` (`codEstadio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
-- Dumping routines for database 'campeonadodefutebol'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-01 15:27:25
