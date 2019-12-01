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
INSERT INTO `clube` VALUES (105027000000,11,'Internacional'),(7369230000000,5,'Ceará'),(7525950000000,3,'Bahia'),(15217000000000,18,'Vitória'),(17218000000000,1,'Atlético Mineiro'),(17241900000000,8,'Cruzeiro'),(33014600000000,1,'America Mineiro'),(33617500000000,17,'Vasco da Gama'),(33649600000000,9,'Flamengo'),(34029600000000,4,'Botafogo'),(58196700000000,14,'Santos'),(58986100000000,16,'Sport'),(60518000000000,15,'São Paulo'),(61750300000000,12,'Palmeiras'),(61902700000000,7,'Corinthians'),(76710600000000,2,'Atlético Paranaense'),(81907400000000,13,'Paraná'),(83018800000000,6,'Chapecoense'),(92797900000000,10,'Grêmio');
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
  `clube` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codJogador`),
  KEY `fk_jogador_clube` (`clube`)
) ENGINE=MyISAM AUTO_INCREMENT=1837 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogador`
--

LOCK TABLES `jogador` WRITE;
/*!40000 ALTER TABLE `jogador` DISABLE KEYS */;
INSERT INTO `jogador` VALUES (919,'Goleiro','Fernando Henrique','5'),(920,'Zagueiro','Edu Dracena','12'),(921,'Zagueiro','Juan','9'),(922,'Técnico','Mano Menezes','8'),(923,'Técnico','Gilson Kleina','6'),(924,'Meia','Wagner','17'),(925,'Goleiro','Fábio','8'),(926,'Zagueiro','Paulo André','2'),(927,'Meia','Michel Bastos','16'),(928,'Meia','Cícero','10'),(929,'Lateral','Jonathan','2'),(930,'Atacante','Rafael Moura','1'),(931,'Lateral','Patric','1'),(932,'Meia','Rodriguinho','7'),(933,'Lateral','Léo Moura','10'),(934,'Meia','Henrique','8'),(935,'Meia','Marcelo Mattos','17'),(936,'Meia','Airton','19'),(937,'Meia','D\'Alessandro','11'),(938,'Meia','Camilo','11'),(939,'Atacante','Lucca','11'),(940,'Goleiro','Vanderlei','14'),(941,'Lateral','Edimar','15'),(942,'Meia','Robinho','8'),(943,'Lateral','Jean','12'),(944,'Zagueiro','Werley','17'),(945,'Lateral','Pará','9'),(946,'Atacante','Wallyson','18'),(947,'Meia','Willian Farias','18'),(948,'Técnico','Enderson Moreira','1'),(949,'Meia','Wellington','17'),(950,'Lateral','Marcos Rocha','12'),(951,'Lateral','Juninho','18'),(952,'Zagueiro','Douglas','6'),(953,'Meia','Zezinho','13'),(954,'Zagueiro','Paulão','17'),(955,'Meia','Moisés','12'),(956,'Goleiro','Rodolfo','19'),(957,'Meia','Edenílson','11'),(958,'Lateral','Carlinhos','1'),(959,'Meia','Alan Ruschel','6'),(960,'Atacante','Luan','1'),(961,'Meia','Jucilei','15'),(962,'Lateral','Dodô','14'),(963,'Atacante','André','10'),(964,'Zagueiro','Rodrigo Moledo','11'),(965,'Atacante','Bergson','2'),(966,'Meia','Bruno Silva','8'),(967,'Meia','Marquinhos Gabriel','7'),(968,'Atacante','Rafael Sobis','8'),(969,'Meia','Vecchio','14'),(970,'Lateral','Victor Ferraz','14'),(971,'Atacante','Alex Amado','5'),(972,'Goleiro','Renan','5'),(973,'Meia','Maicosuel','10'),(974,'Zagueiro','Manoel','8'),(975,'Atacante','Emerson Sheik','7'),(976,'Goleiro','Giovanni','1'),(977,'Lateral','Régis','15'),(978,'Meia','Léo Cittadini','14'),(979,'Meia','Paulo Roberto','7'),(980,'Zagueiro','Neto','6'),(981,'Goleiro','Santos','2'),(982,'Meia','Deivid','16'),(983,'Goleiro','Vladimir','14'),(984,'Atacante','Pablo','2'),(985,'Goleiro','Marcelo Grohe','10'),(986,'Goleiro','Danilo Fernandes','11'),(987,'Goleiro','Martín Silva','17'),(988,'Meia','Romulo','9'),(989,'Meia','Reina','5'),(990,'Meia','Nikão','2'),(991,'Goleiro','Sidão','15'),(992,'Atacante','Eduardo Sasha','14'),(993,'Meia','Jackson Caucaia','5'),(994,'Técnico','Jorginho','17'),(995,'Meia','Ederson','9'),(996,'Meia','Fillipe Soutto','18'),(997,'Técnico','Rogério Micale','13'),(998,'Atacante','Rhayner','18'),(999,'Lateral','Diogo Barbosa','12'),(1000,'Meia','Seijas','11'),(1001,'Zagueiro','Jackson','3'),(1002,'Meia','Linik','18'),(1003,'Zagueiro','Marllon','7'),(1004,'Meia','Wescley','5'),(1005,'Meia','Bruno Henrique','12'),(1006,'Atacante','Robinho','19'),(1007,'Meia','Mancuello','8'),(1008,'Atacante','Paulo Vitor','17'),(1009,'Meia','Bruno Cosendey','17'),(1010,'Meia','Vinícius','3'),(1011,'Meia','Esperon','10'),(1012,'Atacante','João Carlos','19'),(1013,'Zagueiro','Patrick','5'),(1014,'Meia','Alex Baumjohann','18'),(1015,'Meia','Willian Arão','9'),(1016,'Atacante','Jadson','10'),(1017,'Zagueiro','Arthur','8'),(1018,'Goleiro','Fernando Miguel','17'),(1019,'Atacante','Kelvin','17'),(1020,'Meia','Lucho González','2'),(1021,'Lateral','Léo','19'),(1022,'Atacante','Brenner','15'),(1023,'Lateral','Leonardo Simas','2'),(1024,'Zagueiro','Gabriel','10'),(1025,'Meia','Cuéllar','9'),(1026,'Atacante','Paulinho','17'),(1027,'Goleiro','Weverton','12'),(1028,'Zagueiro','Bremer','1'),(1029,'Atacante','Léo Passos','12'),(1030,'Meia','Elton','3'),(1031,'Goleiro','Agenor','16'),(1032,'Zagueiro','Helerson','4'),(1033,'Meia','Patrick','10'),(1034,'Zagueiro','Ricardo','17'),(1035,'Goleiro','Bruno Grassi','10'),(1036,'Meia','Michel ','10'),(1037,'Atacante','Júnior Brumado','3'),(1038,'Atacante','Ezequiel','4'),(1039,'Atacante','Lucas Campos','4'),(1040,'Atacante','Silvinho','13'),(1041,'Meia','Juninho','5'),(1042,'Meia','Thiago Galhardo','17'),(1043,'Meia','Khevin','6'),(1044,'Lateral','Bruno Cortez','10'),(1045,'Meia','Igor Gomes','15'),(1046,'Lateral','Giovanni','1'),(1047,'Meia','Jhonny Lucas','13'),(1048,'Zagueiro','Thuler','9'),(1049,'Atacante','Lincoln','9'),(1050,'Meia','Uillian Correia','18'),(1051,'Meia','João Paulo','4'),(1052,'Lateral','Pablo Maldini','9'),(1053,'Goleiro','Jailson','12'),(1054,'Atacante','Lucas Poletto','10'),(1055,'Goleiro','Éverson','5'),(1056,'Meia','Rodrigo Lindoso','4'),(1057,'Lateral','Lucas Soares','8'),(1058,'Meia','Vander','8'),(1059,'Lateral','Arnaldo','5'),(1060,'Zagueiro','Cléber Reis','13'),(1061,'Atacante','Hernane','10'),(1062,'Técnico','Fernando Diniz','2'),(1063,'Atacante','Yuri Alberto','14'),(1064,'Atacante','Rodrygo','14'),(1065,'Lateral','Samuel Xavier','5'),(1066,'Zagueiro','Bressan','10'),(1067,'Atacante','Fernando','12'),(1068,'Técnico','Lisca','5'),(1069,'Atacante','Matheus Matias','7'),(1070,'Zagueiro','Weverton Almeida','2'),(1071,'Meia','Matheus Henrique','10'),(1072,'Zagueiro','Matheus Guedes','14'),(1073,'Goleiro','Brenno','10'),(1074,'Lateral','Guilherme Guedes','10'),(1075,'Goleiro','Filipe','7'),(1076,'Zagueiro','Ericson','10'),(1077,'Atacante','Paulinho','15'),(1078,'Atacante','Bissoli','15'),(1079,'Meia','Gabriel','15'),(1080,'Meia','Alanzinho','12'),(1081,'Lateral','Liziero','15'),(1082,'Lateral','Esteves','12'),(1083,'Lateral','Vitinho','8'),(1084,'Atacante','Hygor','16'),(1085,'Lateral','Luan Cândido','12'),(1086,'Atacante','Guilherme Vieira','12'),(1087,'Lateral','João Pedro Ribeiro','3'),(1088,'Meia','Ferreira','16'),(1089,'Lateral','Mansur','13'),(1090,'Meia','Lucas Araújo','10'),(1091,'Atacante','Carneiro','15'),(1092,'Atacante','Romário Rodrigues','5'),(1093,'Atacante','Miullen','6'),(1094,'Meia','Lucas Silva','8'),(1095,'Atacante','Flávio','18'),(1096,'Atacante','Júnior Santos','6'),(1097,'Goleiro','Lucas Paes','15'),(1098,'Lateral','Carlos Augusto','7'),(1099,'Atacante','Brenner','11'),(1100,'Lateral','Fabiano','11'),(1101,'Atacante','Tiago Cunha','5'),(1102,'Meia','Nenén','6'),(1103,'Atacante','Toró','15'),(1104,'Técnico','Thiago Larghi','1'),(1105,'Meia','Pio','5'),(1106,'Meia','Guilherme Nunes','14'),(1107,'Meia','Gabriel Calabres','14'),(1108,'Zagueiro','Matheus Mancini','1'),(1109,'Atacante','Brenner','4'),(1110,'Atacante','Vitor Naum','2'),(1111,'Meia','Richard','11'),(1112,'Atacante','Marcos Junior','19'),(1113,'Meia','Jadson','19'),(1114,'Meia','Maurício','5'),(1115,'Meia','Nadson','6'),(1116,'Goleiro','Murillo Lopes','13'),(1117,'Atacante','Ademir','1'),(1118,'Goleiro','Igor Campos','6'),(1119,'Atacante','Bruno Silva','6'),(1120,'Zagueiro','Lucas Fonseca','3'),(1121,'Goleiro','Vitor Eudes','8'),(1122,'Lateral','Yago Pikachu','17'),(1123,'Zagueiro','Marco Saravia','10'),(1124,'Meia','Jean Mota','14'),(1125,'Meia','Rodrigo Ancheta','10'),(1126,'Meia','Pepê','9'),(1127,'Lateral','Bryan','18'),(1128,'Meia','Gabriel','7'),(1129,'Meia','Isaque','10'),(1130,'Goleiro','Hugo Souza','9'),(1131,'Atacante','Wendel','9'),(1132,'Meia','Léo Gomes','18'),(1133,'Goleiro','Luis Carlos','13'),(1134,'Meia','Paulo Henrique','15'),(1135,'Atacante','Éderson','2'),(1136,'Zagueiro','Matheus Dantas','9'),(1137,'Meia','Lucas Lourenço','14'),(1138,'Lateral','Michael','9'),(1139,'Meia','Hugo Moura','9'),(1140,'Zagueiro','Patrick','9'),(1141,'Lateral','Reinaldo','15'),(1142,'Lateral','João Vitor','19'),(1143,'Lateral','Ramon','9'),(1144,'Atacante','Jonatas Belusso','18'),(1145,'Atacante','Vitor Gabriel','9'),(1146,'Meia','Caio','19'),(1147,'Meia','Thiago Santos','12'),(1148,'Goleiro','Richard','13'),(1149,'Meia','Guilherme Ribeiro','2'),(1150,'Atacante','Dudu','19'),(1151,'Meia','Demethryus','2'),(1152,'Atacante','Thiago Santos','13'),(1153,'Meia','Petros','15'),(1154,'Lateral','Felipe Jonatan','5'),(1155,'Meia','Naldo','5'),(1156,'Atacante','Alerrandro','1'),(1157,'Meia','Bruno Roberto','1'),(1158,'Meia','Lucas Santos','17'),(1159,'Zagueiro','Miranda','17'),(1160,'Meia','Moisés Ribeiro','6'),(1161,'Zagueiro','Rafael França','17'),(1162,'Zagueiro','Tiago ','3'),(1163,'Zagueiro','Luiz Felipe','14'),(1164,'Técnico','Claudinei Oliveira','16'),(1165,'Meia','Guilherme Biteco','13'),(1166,'Zagueiro','Luan Peres ','19'),(1167,'Zagueiro','Víctor Cuesta','11'),(1168,'Meia','Marlone','16'),(1169,'Zagueiro','Ricardo Silva','1'),(1170,'Goleiro','João Pedro','17'),(1171,'Atacante','Matheus Santos','1'),(1172,'Lateral','Jeferson','18'),(1173,'Zagueiro','Nery Bareiro','6'),(1174,'Meia','Yago','1'),(1175,'Lateral','Henrique','17'),(1176,'Zagueiro','Bruno Pires','5'),(1177,'Atacante','Marcelinho','10'),(1178,'Goleiro','Marcos Felipe ','19'),(1179,'Meia','Marcelo','4'),(1180,'Goleiro','Uilson','1'),(1181,'Meia','Gabriel','16'),(1182,'Atacante','Carlos','13'),(1183,'Meia','Valdívia','15'),(1184,'Meia','Cazares','1'),(1185,'Atacante','Berrío ','9'),(1186,'Atacante','Clayton','1'),(1187,'Atacante','Andrés Ríos','17'),(1188,'Goleiro','João Paulo','14'),(1189,'Técnico','Cláudio Prates','3'),(1190,'Meia','Alex Santana','13'),(1191,'Meia','Jonas','9'),(1192,'Goleiro','João Ricardo','1'),(1193,'Lateral','Léo','3'),(1194,'Meia','Alisson','10'),(1195,'Atacante','Osman','6'),(1196,'Atacante','Henrique Dourado','9'),(1197,'Atacante','Rossi','11'),(1198,'Meia','Juninho','1'),(1199,'Atacante','Aylon','1'),(1200,'Goleiro','Jean','15'),(1201,'Meia','Hyoran','12'),(1202,'Atacante','Borja','12'),(1203,'Meia','Cueva','15'),(1204,'Meia','Régis','3'),(1205,'Lateral','Marcelo Hermes','8'),(1206,'Zagueiro','Thales ','11'),(1207,'Meia','Zé Rafael ','3'),(1208,'Atacante','Morato','15'),(1209,'Zagueiro','Wanderson','2'),(1210,'Atacante','Douglas Coutinho ','5'),(1211,'Lateral','Victor Luis','12'),(1212,'Atacante','Hyuri','5'),(1213,'Meia','Matheus Galdezani','1'),(1214,'Técnico','Maurício Barbieri','9'),(1215,'Técnico','Diego Aguirre','15'),(1216,'Atacante','Pablo Dyego','19'),(1217,'Atacante','Keno','12'),(1218,'Meia','Ruy','1'),(1219,'Zagueiro','Rafael Thyere','6'),(1220,'Atacante','Gabriel','14'),(1221,'Goleiro','Jandrei','6'),(1222,'Meia','Pavez','2'),(1223,'Zagueiro','Thiago Martins','12'),(1224,'Meia','Everton Felipe','16'),(1225,'Atacante','Marcos Guilherme ','15'),(1226,'Zagueiro','Neris','13'),(1227,'Meia','Patrick','11'),(1228,'Zagueiro','Léo Pereira','2'),(1229,'Atacante','Luan Viana','13'),(1230,'Atacante','Clayson','7'),(1231,'Meia','Bruno Silva','17'),(1232,'Atacante','Neilton','18'),(1233,'Zagueiro','Rodrigo Becão','3'),(1234,'Goleiro','Glauco','1'),(1235,'Lateral','Malcoon','1'),(1236,'Atacante','Rogério','16'),(1237,'Meia','Allione','3'),(1238,'Zagueiro','Valdo','5'),(1239,'Zagueiro','Charles','13'),(1240,'Zagueiro','Bruno Alves','15'),(1241,'Lateral','Evandro','16'),(1242,'Atacante','Nico López','11'),(1243,'Meia','Lucas Romero','8'),(1244,'Atacante','Denilson','18'),(1245,'Atacante','Rildo','17'),(1246,'Meia','Richard','19'),(1247,'Atacante','Everton','10'),(1248,'Atacante','Luan','10'),(1249,'Atacante','Judivan ','1'),(1250,'Meia','Torito González','13'),(1251,'Meia','Matheus Rossetto','2'),(1252,'Meia','José Welison','18'),(1253,'Lateral','Sidcley','7'),(1254,'Zagueiro','Vinicius','18'),(1255,'Zagueiro','Rodrigo Caio','15'),(1256,'Atacante','Geuvânio','9'),(1257,'Goleiro','Lucas Macanhan','2'),(1258,'Atacante','Fernandinho','3'),(1259,'Meia','Marcos Vinícius','4'),(1260,'Zagueiro','Luiz Otávio ','6'),(1261,'Meia','Canteros','6'),(1262,'Atacante','Raniel','8'),(1263,'Meia','Flávio','3'),(1264,'Goleiro','David','13'),(1265,'Atacante','Nathan','17'),(1266,'Zagueiro','Emerson Santos','12'),(1267,'Meia','Gustavo Blanco','1'),(1268,'Lateral','Leonardo','10'),(1269,'Goleiro','Thiago','9'),(1270,'Lateral','Zeca','11'),(1271,'Zagueiro','Rayan','13'),(1272,'Zagueiro','Gabriel','1'),(1273,'Zagueiro','Messias','1'),(1274,'Zagueiro','Pedro Henrique','7'),(1275,'Meia','Thaciano','10'),(1276,'Zagueiro','Kannemann','10'),(1277,'Meia','Neto Moura','16'),(1278,'Meia','Vitor Bueno','14'),(1279,'Atacante','Carlos Henrique','16'),(1280,'Atacante','Tréllez','15'),(1281,'Meia','Yago','18'),(1282,'Meia','Desábato','17'),(1283,'Meia','Arrascaeta','8'),(1284,'Goleiro','Léo','10'),(1285,'Meia','Sornoza','19'),(1286,'Lateral','Rodinei','9'),(1287,'Goleiro','Gatito Fernández','4'),(1288,'Zagueiro','Walisson Maia','18'),(1289,'Lateral','Claudio Winck','16'),(1290,'Meia','Guilherme Costa','18'),(1291,'Meia','Alison','14'),(1292,'Lateral','Daniel Guedes ','14'),(1293,'Atacante','Ángel Romero','7'),(1294,'Meia','Serginho','1'),(1295,'Lateral','Yuri','4'),(1296,'Lateral','Felipe Rodrigues','16'),(1297,'Atacante','Júnior','18'),(1298,'Atacante','Pepê','10'),(1299,'Lateral','Aderlan','1'),(1300,'Zagueiro','Éder ','2'),(1301,'Atacante','Raphael Alemão','13'),(1302,'Lateral','Ayrton Lucas','19'),(1303,'Zagueiro','Jesiel','13'),(1304,'Zagueiro','Balbuena','7'),(1305,'Meia','Lucas','17'),(1306,'Goleiro','Lucas Perri','15'),(1307,'Zagueiro','Bruno Bispo','18'),(1308,'Atacante','Leandro Carvalho','4'),(1309,'Meia','Bruno Paulista','17'),(1310,'Meia','Leandro Vilela','13'),(1311,'Meia','Luiz Antonio ','6'),(1312,'Zagueiro','Arboleda','15'),(1313,'Atacante','Kazim','7'),(1314,'Meia','Leonardo Valencia','4'),(1315,'Lateral','Igor','13'),(1316,'Meia','Barreto','6'),(1317,'Meia','Gabriel Dias','11'),(1318,'Zagueiro','Iago Maidana','1'),(1319,'Meia','Rafinha','5'),(1320,'Meia','Wesley','1'),(1321,'Meia','Jean','4'),(1322,'Meia','Élber','3'),(1323,'Zagueiro','Léo Ortiz','16'),(1324,'Zagueiro','Henrique','7'),(1325,'Lateral','Léo Principe','7'),(1326,'Lateral','Iago','11'),(1327,'Atacante','Edigar Junio','3'),(1328,'Meia','Balbino','10'),(1329,'Meia','Matheus Anjos','2'),(1330,'Lateral','Caju','14'),(1331,'Zagueiro','Danilo Silva','11'),(1332,'Zagueiro','Ramon','18'),(1333,'Lateral','Júnior Tavares','15'),(1334,'Meia','Pedro Ken','5'),(1335,'Zagueiro','Rafael Pereira','5'),(1336,'Atacante','Paolo Guerrero','9'),(1337,'Lateral','Apodi','6'),(1338,'Meia','Leandro Donizete','1'),(1339,'Goleiro','Erick','1'),(1340,'Zagueiro','Vitão','12'),(1341,'Goleiro','Saulo','4'),(1342,'Zagueiro','Yago','4'),(1343,'Técnico','Osmar Loss','7'),(1344,'Zagueiro','Rafael','9'),(1345,'Goleiro','Walter','7'),(1346,'Meia','Guerra','12'),(1347,'Lateral','Thiago Carleto','2'),(1348,'Atacante','Capixaba','1'),(1349,'Atacante','William Pottker','11'),(1350,'Meia','Rodrigo Andrade','18'),(1351,'Meia','Nickson','18'),(1352,'Zagueiro','Igor Rabello','4'),(1353,'Zagueiro','Tiago Alves','5'),(1354,'Atacante','Copete','14'),(1355,'Lateral','Felipinho','1'),(1356,'Meia','Éverton Ribeiro','9'),(1357,'Lateral','Madson','10'),(1358,'Lateral','Marcos Vinícius ','6'),(1359,'Meia','Dodi','19'),(1360,'Atacante','Marlos','9'),(1361,'Zagueiro','Kanu','18'),(1362,'Zagueiro','Adryelson','16'),(1363,'Goleiro','Maílson','16'),(1364,'Meia','Leandrinho','4'),(1365,'Meia','Ralf','7'),(1366,'Atacante','Róger Guedes','1'),(1367,'Lateral','Mena','3'),(1368,'Meia','Andrigo','16'),(1369,'Lateral','Caio','16'),(1370,'Lateral','Bruno Pacheco','6'),(1371,'Lateral','Pedro Botelho','18'),(1372,'Meia','Jailson','10'),(1373,'Lateral','Gilson','4'),(1374,'Zagueiro','Anderson Martins','15'),(1375,'Atacante','Bruno Henrique','14'),(1376,'Zagueiro','Réver','9'),(1377,'Lateral','Moisés','4'),(1378,'Meia','Estevão','10'),(1379,'Meia','Arthur','10'),(1380,'Atacante','David','8'),(1381,'Goleiro','Victor','1'),(1382,'Meia','Elias','1'),(1383,'Goleiro','Gabriel Batista','9'),(1384,'Meia','Alex','2'),(1385,'Atacante','Diego','13'),(1386,'Meia','Maicon','10'),(1387,'Atacante','Kendy','6'),(1388,'Meia','Yuri','14'),(1389,'Meia','Bruno Guimarães','2'),(1390,'Lateral','Cedric','18'),(1391,'Lateral','Bruno','6'),(1392,'Goleiro','Tiepo','6'),(1393,'Zagueiro','Kanu','4'),(1394,'Atacante','Marquinhos','1'),(1395,'Lateral','Luis Ricardo','4'),(1396,'Meia','Jean Lucas','9'),(1397,'Meia','Juan Alano','11'),(1398,'Atacante','Lucas Silva','9'),(1399,'Zagueiro','Dedé','8'),(1400,'Atacante','Ronald','11'),(1401,'Meia','Renan Oliveira','1'),(1402,'Meia','Caio Henrique','13'),(1403,'Atacante','Felipe Azevedo','5'),(1404,'Atacante','Luan','1'),(1405,'Meia','João Pedro','4'),(1406,'Meia','Marquinhos','1'),(1407,'Lateral','Fábio Santos','1'),(1408,'Goleiro','Caíque França','7'),(1409,'Lateral','Marlon','19'),(1410,'Meia','Thiago Neves','8'),(1411,'Atacante','Roger','7'),(1412,'Atacante','Wellington Paulista','6'),(1413,'Lateral','Diego Ferreira','2'),(1414,'Meia','Márcio Araújo','6'),(1415,'Zagueiro','Everson','3'),(1416,'Meia','Pedrinho','7'),(1417,'Zagueiro','Zé Ivaldo','2'),(1418,'Meia','Lucas Marques','18'),(1419,'Goleiro','Fernando Leal','1'),(1420,'Lateral','Alemão','13'),(1421,'Meia','Christian','1'),(1422,'Meia','Jadson','7'),(1423,'Meia','Rafinha','8'),(1424,'Goleiro','Gabriel Félix','17'),(1425,'Atacante','Diogo Vitor','14'),(1426,'Lateral','Cascardo','2'),(1427,'Zagueiro','Lima','1'),(1428,'Atacante','Eder Luis','5'),(1429,'Lateral','Michel','1'),(1430,'Atacante','Giovanny ','2'),(1431,'Lateral','Edílson','8'),(1432,'Goleiro','Diego Alves','9'),(1433,'Zagueiro','Juninho','1'),(1434,'Meia','Felipe Melo','12'),(1435,'Meia','David','1'),(1436,'Atacante','Luis Henrique','10'),(1437,'Atacante','Arthur','5'),(1438,'Técnico','Jair Ventura','14'),(1439,'Atacante','Elton','5'),(1440,'Meia','Luiz Fernando ','4'),(1441,'Zagueiro','Fabrício Bruno','6'),(1442,'Goleiro','Elias','18'),(1443,'Meia','Douglas','10'),(1444,'Zagueiro','Matheus Ferraz','1'),(1445,'Atacante','Ricardo Oliveira','1'),(1446,'Goleiro','Caíque','18'),(1447,'Meia','Renato','14'),(1448,'Meia','Diego','9'),(1449,'Goleiro','De Amores','19'),(1450,'Zagueiro','Klaus','11'),(1451,'Atacante','Lucas Fernandes','18'),(1452,'Meia','Nenê','15'),(1453,'Técnico','Odair Hellmann','11'),(1454,'Atacante','Rafael Marques','16'),(1455,'Técnico','Abel Braga','19'),(1456,'Atacante','Aguirre','4'),(1457,'Técnico','Vagner Mancini','18'),(1458,'Atacante','Guilherme','6'),(1459,'Meia','Dudu Cearense','4'),(1460,'Goleiro','Magrão','16'),(1461,'Zagueiro','Thiago Heleno','2'),(1462,'Meia','Raul','17'),(1463,'Atacante','Willian','12'),(1464,'Lateral','Egídio','8'),(1465,'Goleiro','Cássio','7'),(1466,'Meia','Douglas','19'),(1467,'Técnico','Renato Gaúcho','10'),(1468,'Atacante','Léo Tilica','10'),(1469,'Meia','Kaio','10'),(1470,'Meia','Amaral','6'),(1471,'Lateral','Fagner','7'),(1472,'Goleiro','Deijair ','3'),(1473,'Goleiro','César','9'),(1474,'Zagueiro','Gustavo Henrique','14'),(1475,'Lateral','Bruno','15'),(1476,'Meia','Lucas Fernandes','15'),(1477,'Zagueiro','Rhodolfo','9'),(1478,'Zagueiro','Ernando','16'),(1479,'Goleiro','Júlio César','19'),(1480,'Lateral','Juninho Capixaba','7'),(1481,'Atacante','Geovane Itinga','3'),(1482,'Lateral','Fabrício','17'),(1483,'Meia','Lucas Paquetá','9'),(1484,'Meia','Guilherme','2'),(1485,'Meia','Everton','15'),(1486,'Meia','Elicarlos','6'),(1487,'Meia','Hudson','15'),(1488,'Zagueiro','Rafael Lima','1'),(1489,'Lateral','Lucas','18'),(1490,'Meia','Adilson','1'),(1491,'Zagueiro','David Braz','14'),(1492,'Meia','Luís Fernando','3'),(1493,'Meia','Carlos Eduardo','13'),(1494,'Lateral','Marcelo Oliveira','10'),(1495,'Meia','Gerson Magrão','1'),(1496,'Atacante','Deyverson','12'),(1497,'Atacante','Kayke','3'),(1498,'Meia','Jean Pyerre','10'),(1499,'Meia','Felipinho','3'),(1500,'Zagueiro','Breno','17'),(1501,'Meia','Marco Antônio','3'),(1502,'Meia','Ronaldo','9'),(1503,'Atacante','Yago','2'),(1504,'Lateral','Nicolas','2'),(1505,'Meia','Yan','12'),(1506,'Lateral','Báez','13'),(1507,'Meia','Mateus Vital','7'),(1508,'Atacante','Bill','2'),(1509,'Zagueiro','Lucas Veríssimo','14'),(1510,'Zagueiro','Aderllan','18'),(1511,'Goleiro','Lucas França','8'),(1512,'Goleiro','Keiller','11'),(1513,'Goleiro','Cleiton','1'),(1514,'Lateral','Victor Luiz','8'),(1515,'Atacante','Índio','16'),(1516,'Zagueiro','Marcelo Benevenuto','4'),(1517,'Atacante','Bruno Xavier','7'),(1518,'Goleiro','John Victor','14'),(1519,'Zagueiro','Joel Carli','4'),(1520,'Lateral','Patrick Brey','8'),(1521,'Zagueiro','Léo Duarte','9'),(1522,'Meia','Araruna','15'),(1523,'Meia','Luquinhas','19'),(1524,'Goleiro','Michael','1'),(1525,'Atacante','Vico','10'),(1526,'Meia','Matheus Fernandes','4'),(1527,'Meia','Gregore','3'),(1528,'Atacante','Ribamar','2'),(1529,'Lateral','Alan Cardoso','17'),(1530,'Meia','Matheusinho','1'),(1531,'Lateral','Trauco','9'),(1532,'Atacante','Felipe Vizeu','9'),(1533,'Meia','Andrey','17'),(1534,'Meia','Jhony','13'),(1535,'Atacante','Marcinho','2'),(1536,'Goleiro','Lucas Ferreira','16'),(1537,'Meia','Gustavo Bochecha','4'),(1538,'Meia','Evander','17'),(1539,'Atacante','Vinicius Junior','9'),(1540,'Lateral','Júnior','13'),(1541,'Zagueiro','Léo Santos','7'),(1542,'Atacante','Artur','12'),(1543,'Atacante','Caio Monteiro','17'),(1544,'Lateral','Marcinho','4'),(1545,'Meia','Fabrício','16'),(1546,'Meia','Maycon','7'),(1547,'Atacante','Hugo Borges','17'),(1548,'Atacante','Caíque','15'),(1549,'Atacante','Marcelo','2'),(1550,'Atacante','Perotti','6'),(1551,'Meia','Mateus Norton','19'),(1552,'Goleiro','Daniel Fuzato','12'),(1553,'Meia','Diego Pituca','14'),(1554,'Atacante','Juninho Piauiense','5'),(1555,'Goleiro','Felipe','3'),(1556,'Lateral','Sander','16'),(1557,'Meia','Raphael Veiga','2'),(1558,'Atacante','Ítalo','3'),(1559,'Atacante','Caprini','2'),(1560,'Atacante','Luidy','5'),(1561,'Lateral','Riuler','2'),(1562,'Meia','Charles','11'),(1563,'Atacante','Pedro','19'),(1564,'Meia','Lima','10'),(1565,'Meia','Alexsander','2'),(1566,'Lateral','Renan Lodi','2'),(1567,'Meia','Pablo Pardal','16'),(1568,'Goleiro','Cassiano','3'),(1569,'Lateral','Emerson','1'),(1570,'Goleiro','Daniel','11'),(1571,'Meia','Wesley Dias','13'),(1572,'Lateral','Mantuan','7'),(1573,'Lateral','Kevin','1'),(1574,'Meia','Baralhas','2'),(1575,'Lateral','Éder Militão','15'),(1576,'Meia','Gabriel Pires','13'),(1577,'Atacante','Felipe','19'),(1578,'Zagueiro','Durval','16'),(1579,'Meia','Danilo','7'),(1580,'Meia','Zé Ricardo','1'),(1581,'Goleiro','Caio','2'),(1582,'Atacante','Arthur Gomes','14'),(1583,'Goleiro','Jefferson','4'),(1584,'Meia','Gabriel Furtado','12'),(1585,'Lateral','Dudu','11'),(1586,'Goleiro','Matheus Vidotto','7'),(1587,'Zagueiro','Daniel ','2'),(1588,'Goleiro','Fernando Prass','12'),(1589,'Atacante','Pachu','4'),(1590,'Atacante','Matheus Alessandro','19'),(1591,'Atacante','Marcos Calazans','19'),(1592,'Zagueiro','Frazan','19'),(1593,'Meia','Matheus Lira','5'),(1594,'Zagueiro','Douglas Grolli','3'),(1595,'Zagueiro','Hiago','6'),(1596,'Goleiro','Fernando','1'),(1597,'Atacante','Fred','8'),(1598,'Lateral','Gilberto ','19'),(1599,'Goleiro','Jori','1'),(1600,'Zagueiro','Lucas Halter','2'),(1601,'Atacante','Marco Túlio','1'),(1602,'Lateral','Ezequiel ','8'),(1603,'Goleiro','Gabriel','2'),(1604,'Lateral','Renê','9'),(1605,'Zagueiro','Luis Henrique','1'),(1606,'Goleiro','Ivan','6'),(1607,'Meia','Tomás Andrade','1'),(1608,'Meia','Shaylon','15'),(1609,'Meia','Lepu','3'),(1610,'Meia','Richardson','5'),(1611,'Atacante','Arthur ','6'),(1612,'Meia','Luan','18'),(1613,'Meia','Warley','13'),(1614,'Meia','Nonoca','16'),(1615,'Atacante','Mikael','16'),(1616,'Zagueiro','Léo','8'),(1617,'Lateral','Eduardo','6'),(1618,'Zagueiro','Ibañez','19'),(1619,'Zagueiro','Vilson','7'),(1620,'Zagueiro','Murilo','8'),(1621,'Lateral','Ruan','11'),(1622,'Meia','Bruno Leite','2'),(1623,'Meia','Ariel Cabral','8'),(1624,'Lateral','Norberto ','1'),(1625,'Meia','Jhemerson','18'),(1626,'Meia','Nilton','3'),(1627,'Atacante','Papagaio','12'),(1628,'Meia','Edson','3'),(1629,'Lateral','Ronaldo','1'),(1630,'Meia','Lucas Lima','12'),(1631,'Zagueiro','Luiz Gustavo','17'),(1632,'Meia','Renatinho','4'),(1633,'Atacante','Macula','19'),(1634,'Meia','Fabinho','5'),(1635,'Atacante','Marcelo','8'),(1636,'Zagueiro','Luan','12'),(1637,'Zagueiro','Pedro Geromel','10'),(1638,'Zagueiro','Léo Xavier','18'),(1639,'Lateral','Jonathan','4'),(1640,'Lateral','Romário ','5'),(1641,'Lateral','Mayke','12'),(1642,'Zagueiro','Max','16'),(1643,'Meia','Rodrigo Fernandes','17'),(1644,'Goleiro','Yago Darub','9'),(1645,'Zagueiro','Josué','18'),(1646,'Meia','Moresche','17'),(1647,'Lateral','Vinícius Freitas','6'),(1648,'Zagueiro','Oswaldo Henríquez','16'),(1649,'Zagueiro','Erazo','17'),(1650,'Goleiro','Fernando Castro','3'),(1651,'Goleiro','Diego','18'),(1652,'Atacante','Erik','1'),(1653,'Zagueiro','Paulo Miranda','10'),(1654,'Lateral','Rafael Galhardo','17'),(1655,'Zagueiro','Digão','8'),(1656,'Técnico','Alberto Valentim','4'),(1657,'Meia','Camacho','2'),(1658,'Lateral','Nino Paraíba','3'),(1659,'Zagueiro','Renato Chaves','19'),(1660,'Zagueiro','Gum','19'),(1661,'Lateral','Raul Prata','16'),(1662,'Lateral','Ramon','17'),(1663,'Atacante','André Lima','18'),(1664,'Meia','Arouca','1'),(1665,'Atacante','Jael','10'),(1666,'Atacante','Wellington Silva','11'),(1667,'Goleiro','Marcelo Lomba','11'),(1668,'Atacante','Rodrigo Pimpão','4'),(1669,'Goleiro','Paulo Victor','10'),(1670,'Atacante','Júnior Dutra','7'),(1671,'Meia','Diego Souza','15'),(1672,'Atacante','Dudu','12'),(1673,'Atacante','Kieza','4'),(1674,'Goleiro','Rafael','8'),(1675,'Lateral','Uendel','11'),(1676,'Atacante','Vinicius','6'),(1677,'Zagueiro','Ronaldo Alves','16'),(1678,'Atacante','Leandro Damião','11'),(1679,'Zagueiro','Leonardo Silva','1'),(1680,'Meia','Fellipe Bastos','16'),(1681,'Goleiro','Anderson','3'),(1682,'Meia','Giovanni Augusto','17'),(1683,'Lateral','João Lucas','5'),(1684,'Lateral','Jean','16'),(1685,'Atacante','Chará','1'),(1686,'Meia','Martín Sarrafiore','11'),(1687,'Lateral','Carlos Gabriel','1'),(1688,'Meia','David Terans','1'),(1689,'Meia','Doffo','6'),(1690,'Zagueiro','Nicolás Freire','12'),(1691,'Meia','Cardona','5'),(1692,'Meia','Yann Rolim','6'),(1693,'Meia','Dudu','17'),(1694,'Técnico','Marcos Paquetá','4'),(1695,'Atacante','Gabriel Barbosa','12'),(1696,'Atacante','Jonathas','7'),(1697,'Atacante','Gilberto','3'),(1698,'Técnico','Marcelo Oliveira','19'),(1699,'Técnico','Ricardo Drubscky','1'),(1700,'Lateral','Lenon','17'),(1701,'Atacante','Marinho','10'),(1702,'Atacante','Marcelo Cirino','2'),(1703,'Atacante','Joao \nRojas','15'),(1704,'Meia','Bryan Ruíz','14'),(1705,'Lateral','Danilo Avelar','7'),(1706,'Lateral','Bruno Peres','15'),(1707,'Atacante','Barcos','8'),(1708,'Atacante','Fernando Uribe','9'),(1709,'Zagueiro','Eduardo Brock','5'),(1710,'Atacante','Edinho','1'),(1711,'Atacante','Luciano','19'),(1712,'Meia','Bruno Nazário','2'),(1713,'Meia','Calyson','5'),(1714,'Meia','Jean Roberto','6'),(1715,'Meia','Gustavo Scarpa','12'),(1716,'Meia','Marcelo Meli','18'),(1717,'Atacante','Rodolfo ','13'),(1718,'Meia','Lincoln','10'),(1719,'Atacante','Crysan','2'),(1720,'Meia','Matheus Savio','9'),(1721,'Atacante','Leandrinho','1'),(1722,'Atacante','Jonatan Álvez','11'),(1723,'Meia','Vitinho','12'),(1724,'Atacante','Walter Bou','18'),(1725,'Zagueiro','Ruan Renato','18'),(1726,'Meia','Rodrigo Figueiredo','7'),(1727,'Atacante','Erick','18'),(1728,'Técnico','Tiago Nunes','2'),(1729,'Lateral','Marcelo Benítez','18'),(1730,'Meia','Luan','15'),(1731,'Meia','Edinho','5'),(1732,'Atacante','Maxi López','17'),(1733,'Lateral','Reginaldo ','2'),(1734,'Atacante','Pilar','1'),(1735,'Atacante','Everaldo ','19'),(1736,'Atacante','Álvaro','11'),(1737,'Goleiro','João Gabriel','18'),(1738,'Atacante','Juninho Quixadá','5'),(1739,'Meia','Nonato','11'),(1740,'Meia','Carlos Sánchez','14'),(1741,'Meia','Nathan','1'),(1742,'Meia','Zé Ricardo','19'),(1743,'Goleiro','Diego','4'),(1744,'Técnico','Adilson Batista','1'),(1745,'Lateral','Márcio Azevedo','2'),(1746,'Lateral','Mateus','18'),(1747,'Zagueiro','Ruan Marvyn','1'),(1748,'Técnico','Wesley Carvalho','12'),(1749,'Atacante','Cabezas','19'),(1750,'Técnico','Cuca','14'),(1751,'Técnico','Luiz Felipe Scolari','12'),(1752,'Atacante','Derlis González','14'),(1753,'Técnico','João Burse','18'),(1754,'Meia','Araos','7'),(1755,'Técnico','Bruno Lazaroni','4'),(1756,'Atacante','Sergio Díaz','7'),(1757,'Goleiro','Luan Polli ','16'),(1758,'Zagueiro','Lucas Kal','15'),(1759,'Zagueiro','Derlan','10'),(1760,'Atacante','Rafael Grampola','13'),(1761,'Meia','Piris','9'),(1762,'Atacante','Vitinho','9'),(1763,'Zagueiro','Leandro Castan','17'),(1764,'Técnico','Guto Ferreira','6'),(1765,'Atacante','Wesley Pacheco','1'),(1766,'Zagueiro','Gustavo Gómez','12'),(1767,'Atacante','Vinícius Araújo','17'),(1768,'Meia','Igor Amaral','1'),(1769,'Zagueiro','Paulo Ricardo','19'),(1770,'Zagueiro','Tonhão','10'),(1771,'Lateral','Paulinho','3'),(1772,'Meia','Sananduva','2'),(1773,'Meia','Diego Torres','6'),(1774,'Meia','Orzusa','6'),(1775,'Técnico','Zé Ricardo','4'),(1776,'Lateral','Matheus Rocha','12'),(1777,'Lateral','Mayk','3'),(1778,'Atacante','Rodrigo Alves','3'),(1779,'Atacante','Goldeson','1'),(1780,'Zagueiro','Matias Antonini','10'),(1781,'Atacante','Mateus Gonçalves','16'),(1782,'Goleiro','Gabriel Brazão','8'),(1783,'Técnico','Carpegiani','18'),(1784,'Técnico','Eduardo Baptista','16'),(1785,'Zagueiro','Denilson','10'),(1786,'Técnico','Valdir','17'),(1787,'Zagueiro','Martín Rea','1'),(1788,'Atacante','Plata','2'),(1789,'Meia','Éderson','8'),(1790,'Meia','Matheus Sales','1'),(1791,'Meia','Roger Bernardo','1'),(1792,'Zagueiro','Felipe Santana','1'),(1793,'Goleiro','Leo','2'),(1794,'Meia','Felipe Gedoz ','2'),(1795,'Lateral','João Pedro ','3'),(1796,'Técnico','Nelsinho Baptista','16'),(1797,'Meia','Anselmo','16'),(1798,'Meia','Thomás','16'),(1799,'Atacante','Bruno Paulo','7'),(1800,'Técnico','Fábio Carille','7'),(1801,'Atacante','Riascos','17'),(1802,'Meia','Cleiton Xavier','18'),(1803,'Goleiro','Julio Cesar','9'),(1804,'Zagueiro','Alan','5'),(1805,'Meia','Jajá','9'),(1806,'Atacante','Dionathã','10'),(1807,'Zagueiro','Reginaldo','19'),(1808,'Meia','Marlon Freitas','19'),(1809,'Atacante','Marcinho','11'),(1810,'Atacante','Fernandinho','11'),(1811,'Zagueiro','Rafael','13'),(1812,'Atacante','Felipe Augusto','13'),(1813,'Atacante','Vitor Feijão','13'),(1814,'Atacante','Minho','13'),(1815,'Lateral','Ernandes','5'),(1816,'Meia','Tchê Tchê','12'),(1817,'Técnico','Marcelo Chamusca','5'),(1818,'Atacante','Roberto','5'),(1819,'Lateral','Leandro \nSilva','5'),(1820,'Meia','Rafael Longuine','14'),(1821,'Lateral','Rafael Carioca','5'),(1822,'Meia','Leandro Canhoto','5'),(1823,'Lateral','Diego Tavares','13'),(1824,'Atacante','Léo Ceará','18'),(1825,'Zagueiro','Lucas Ribeiro','18'),(1826,'Lateral','Elias','16'),(1827,'Lateral','Roberto','6'),(1828,'Goleiro','Diogo Silva','5'),(1829,'Atacante','Maurício Cordeiro','18'),(1830,'Meia','Marcão Silva','16'),(1831,'Meia','Jair','16'),(1832,'Goleiro','Jordi','17'),(1833,'Atacante','Robinho','5'),(1834,'Meia','Marquinho','2'),(1835,'Atacante','Rony','2'),(1836,'Atacante','Luan Ferreira','18');
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

-- Dump completed on 2019-11-30 21:16:46
