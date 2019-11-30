-- MySQL Script generated by MySQL Workbench
-- sáb 30 nov 2019 18:36:16 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CampeonadodeFutebol
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `CampeonadodeFutebol` ;

-- -----------------------------------------------------
-- Schema CampeonadodeFutebol
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CampeonadodeFutebol` ;
USE `CampeonadodeFutebol` ;

-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`artilheiro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`artilheiro` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`artilheiro` (
  `jogador` INT NOT NULL,
  `qnt_Gols` INT NOT NULL,
  `campeonato` INT NOT NULL,
  PRIMARY KEY (`jogador`, `campeonato`),
  INDEX `fk_artilheiro_2_idx` (`campeonato` ASC),
  CONSTRAINT `fk_artilheiro_1`
    FOREIGN KEY (`jogador`)
    REFERENCES `CampeonadodeFutebol`.`jogador` (`codJogador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artilheiro_2`
    FOREIGN KEY (`campeonato`)
    REFERENCES `CampeonadodeFutebol`.`campeonato` (`codCampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`campeonato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`campeonato` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`campeonato` (
  `codCampeonato` INT(11) NOT NULL AUTO_INCREMENT,
  `inicio` DATE NULL DEFAULT NULL,
  `fim` DATE NULL DEFAULT NULL,
  `timeVencedor` INT(11) NULL DEFAULT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`codCampeonato`),
  INDEX `fk_campeonato_timeVencedor` (`timeVencedor` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`cartao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`cartao` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`cartao` (
  `tempoDaPartida` DATE NOT NULL,
  `partida_codPartida` INT(11) NOT NULL,
  `jogador_codJogador` INT(11) NOT NULL,
  `cor` VARCHAR(45) NULL,
  INDEX `fk_cartao_jogador1_idx` (`jogador_codJogador` ASC),
  PRIMARY KEY (`partida_codPartida`, `jogador_codJogador`, `tempoDaPartida`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`clube`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`clube` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`clube` (
  `CNPJ` FLOAT NOT NULL,
  `estadioSede` INT NOT NULL,
  `nome` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`CNPJ`),
  INDEX `fk_clube_1_idx` (`estadioSede` ASC),
  CONSTRAINT `fk_clube_1`
    FOREIGN KEY (`estadioSede`)
    REFERENCES `CampeonadodeFutebol`.`estadio` (`codEstadio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

LOCK TABLES `clube` WRITE;
/*!40000 ALTER TABLE `clube` DISABLE KEYS */;
INSERT INTO `clube` VALUES (17241900000000,'8','Cruzeiro'),(33649600000000,'9','Flamengo'),(61750300000000,'12','Palmeiras'),(105027000000,'11','Internacional'),(60518000000000,'15','São Paulo'),(17218000000000,'1','Atlético Mineiro'),(76710600000000,'2','Atlético Paranaense'),(34029600000000,'4','Botafogo'),(7369230000000,'5','Ceará'),(7525950000000,'3','Bahia'),(83018800000000,'6','Chapecoense'),(61902700000000,'7','Corinthians'),(81907400000000,'13','Paraná'),(58986100000000,'16','Sport'),(33617500000000,'17','Vasco da Gama'),(15217000000000,'18','Vitória'),(58196700000000,'14','Santos'),(92797900000000,'10','Grêmio');
/*!40000 ALTER TABLE `clube` ENABLE KEYS */;
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`clube_casa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`clube_casa` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`clube_casa` (
  `clube_CNPJ` FLOAT NOT NULL,
  INDEX `fk_clube_visitante_clube1_idx` (`clube_CNPJ` ASC),
  PRIMARY KEY (`clube_CNPJ`),
  CONSTRAINT `fk_clube_visitante_clube10`
    FOREIGN KEY (`clube_CNPJ`)
    REFERENCES `CampeonadodeFutebol`.`clube` (`CNPJ`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`clube_visitante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`clube_visitante` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`clube_visitante` (
  `clube_CNPJ` FLOAT NOT NULL,
  INDEX `fk_clube_visitante_clube1_idx` (`clube_CNPJ` ASC),
  PRIMARY KEY (`clube_CNPJ`),
  CONSTRAINT `fk_clube_visitante_clube1`
    FOREIGN KEY (`clube_CNPJ`)
    REFERENCES `CampeonadodeFutebol`.`clube` (`CNPJ`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`contrato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`contrato` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`contrato` (
  `codContrato` INT(11) NOT NULL AUTO_INCREMENT,
  `inicio` DATE NULL DEFAULT NULL,
  `fim` DATE NULL DEFAULT NULL,
  `clube_CNPJ` FLOAT NOT NULL,
  `jogador_codJogador` INT(11) NOT NULL,
  PRIMARY KEY (`codContrato`, `jogador_codJogador`, `clube_CNPJ`),
  INDEX `fk_contrato_clube1_idx` (`clube_CNPJ` ASC),
  INDEX `fk_contrato_jogador1_idx` (`jogador_codJogador` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`estadio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`estadio` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`estadio` (
  `codEstadio` INT(11) NOT NULL AUTO_INCREMENT,
  `cidade` VARCHAR(30) NULL DEFAULT NULL,
  `capacidadeMax` VARCHAR(30) NULL DEFAULT NULL,
  `nome` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`codEstadio`))
ENGINE = MyISAM
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = latin1;

LOCK TABLES `estadio` WRITE;
/*!40000 ALTER TABLE `estadio` DISABLE KEYS */;
INSERT INTO `estadio` VALUES (1,'Belo Horizonte','23018','Independencia'),(2,'Curitiba','42370','Arena da Baixada'),(3,'Salvador','50025','Arena Fonte Nova'),(4,'Rio de Janeiro','44661','Nilton Santos'),(5,'Fortaleza','63903','Arena da Baixada'),(6,'Chapeco','20089','Arena Condá'),(7,'Sao Paulo','47605','Arena Corinthians'),(8,'Belo Horizonte','61846','Mineirao'),(9,'Rio de Janeiro','78838','Maracanã'),(10,'Porto Alegre','55662','Arena do Grêmio'),(11,'Porto Alegre','50128','Beira-Rio'),(12,'São Paulo','43713','Allianz Parque'),(13,'Curitiba','20083','Vila Capanema'),(14,'Santos','16068','Vila Belmiro'),(15,'São Paulo','72039','Morumbi'),(16,'Recife','32983','Ilha do Retiro'),(17,'Rio de Janeiro','21680','São Januário'),(18,'Bahia','30618','Barradão');
/*!40000 ALTER TABLE `estadio` ENABLE KEYS */;
UNLOCK TABLES;


-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`gol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`gol` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`gol` (
  `tempoDaPartida` DATE NOT NULL,
  `partida_codPartida` INT(11) NOT NULL,
  `jogador_codJogador` INT(11) NOT NULL,
  PRIMARY KEY (`partida_codPartida`, `tempoDaPartida`, `jogador_codJogador`),
  INDEX `fk_gol_jogador1_idx` (`jogador_codJogador` ASC),
  CONSTRAINT `fk_gol_partida1`
    FOREIGN KEY (`partida_codPartida`)
    REFERENCES `CampeonadodeFutebol`.`partida` (`codPartida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gol_jogador1`
    FOREIGN KEY (`jogador_codJogador`)
    REFERENCES `CampeonadodeFutebol`.`jogador` (`codJogador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`jogador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`jogador` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`jogador` (
  `codJogador` INT(11) NOT NULL AUTO_INCREMENT,
  `posicao` VARCHAR(30) NULL DEFAULT NULL,
  `primeiroNome` VARCHAR(30) NULL DEFAULT NULL,
  `sobrenome` VARCHAR(30) NULL DEFAULT NULL,
  `altura` FLOAT NULL DEFAULT NULL,
  `peso` FLOAT NULL DEFAULT NULL,
  `dataNascimento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`codJogador`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`partida`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`partida` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`partida` (
  `codPartida` INT(11) NOT NULL AUTO_INCREMENT,
  `dataDaPartida` DATE NULL DEFAULT NULL,
  `estadio_codEstadio` INT(11) NOT NULL,
  `clube_visitante_clube_CNPJ` FLOAT NOT NULL,
  `clube_casa_clube_CNPJ` FLOAT NOT NULL,
  `campeonato` INT NOT NULL,
  PRIMARY KEY (`codPartida`, `clube_visitante_clube_CNPJ`, `clube_casa_clube_CNPJ`),
  INDEX `fk_partida_estadio1_idx` (`estadio_codEstadio` ASC),
  INDEX `fk_partida_clube_visitante1_idx` (`clube_visitante_clube_CNPJ` ASC),
  INDEX `fk_partida_clube_casa1_idx` (`clube_casa_clube_CNPJ` ASC),
  INDEX `fk_partida_1_idx` (`campeonato` ASC),
  CONSTRAINT `fk_partida_estadio1`
    FOREIGN KEY (`estadio_codEstadio`)
    REFERENCES `CampeonadodeFutebol`.`estadio` (`codEstadio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partida_clube_visitante1`
    FOREIGN KEY (`clube_visitante_clube_CNPJ`)
    REFERENCES `CampeonadodeFutebol`.`clube_visitante` (`clube_CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partida_clube_casa1`
    FOREIGN KEY (`clube_casa_clube_CNPJ`)
    REFERENCES `CampeonadodeFutebol`.`clube_casa` (`clube_CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partida_1`
    FOREIGN KEY (`campeonato`)
    REFERENCES `CampeonadodeFutebol`.`campeonato` (`codCampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `CampeonadodeFutebol`.`registro_campeonato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CampeonadodeFutebol`.`registro_campeonato` ;

CREATE TABLE IF NOT EXISTS `CampeonadodeFutebol`.`registro_campeonato` (
  `clube_CNPJ` FLOAT NOT NULL,
  `campeonato_codCampeonato` INT(11) NOT NULL,
  `anoCampeonato` DATE NULL,
  `num_registroCampeonato` INT NOT NULL,
  `registro_campeonatocol` VARCHAR(45) NULL,
  INDEX `fk_clube_has_campeonato_campeonato1_idx` (`campeonato_codCampeonato` ASC),
  INDEX `fk_clube_has_campeonato_clube_idx` (`clube_CNPJ` ASC),
  PRIMARY KEY (`num_registroCampeonato`, `clube_CNPJ`, `campeonato_codCampeonato`),
  CONSTRAINT `fk_clube_has_campeonato_clube`
    FOREIGN KEY (`clube_CNPJ`)
    REFERENCES `CampeonadodeFutebol`.`clube` (`CNPJ`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_clube_has_campeonato_campeonato1`
    FOREIGN KEY (`campeonato_codCampeonato`)
    REFERENCES `CampeonadodeFutebol`.`campeonato` (`codCampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
