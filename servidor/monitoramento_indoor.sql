-- MySQL Script generated by MySQL Workbench
-- Tue Jun 16 11:10:57 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema monitoramento_indoor
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema monitoramento_indoor
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `monitoramento_indoor` DEFAULT CHARACTER SET utf8 ;
USE `monitoramento_indoor` ;

-- -----------------------------------------------------
-- Table `monitoramento_indoor`.`tb_dispositivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `monitoramento_indoor`.`tb_dispositivo` (
  `id_dispositivo` INT GENERATED ALWAYS AS () VIRTUAL,
  `no_localizacao` VARCHAR(45) NOT NULL,
  `no_dispositivo` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_dispositivo`),
  UNIQUE INDEX `id_dispositivo_UNIQUE` (`id_dispositivo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `monitoramento_indoor`.`tb_ocorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `monitoramento_indoor`.`tb_ocorrencia` (
  `id_ocorrencia` INT GENERATED ALWAYS AS () VIRTUAL,
  `id_dispositivo` INT NOT NULL,
  `vl_temperatura` DECIMAL(2,1) NOT NULL,
  `vl_luminosidade` INT(3) NOT NULL,
  `dt_ocorrencia` DATE NOT NULL,
  `hr_ocorrencia` TIME NOT NULL,
  `st_luminosidade` CHAR(1) NOT NULL,
  PRIMARY KEY (`id_ocorrencia`),
  UNIQUE INDEX `idtb_luminosidade_UNIQUE` (`id_ocorrencia` ASC) VISIBLE,
  INDEX `fk_tb_ocorrencia_tb_dispositivo_idx` (`id_dispositivo` ASC) VISIBLE,
  CONSTRAINT `fk_tb_ocorrencia_tb_dispositivo`
    FOREIGN KEY (`id_dispositivo`)
    REFERENCES `monitoramento_indoor`.`tb_dispositivo` (`id_dispositivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `monitoramento_indoor`.`tmp_ocorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `monitoramento_indoor`.`tmp_ocorrencia` (
  `id_tmp_ocorrencia` INT GENERATED ALWAYS AS () VIRTUAL,
  `id_dispositivo1` INT NOT NULL,
  `id_dispositivo2` INT NOT NULL,
  `dt_ocorrencia` DATE NOT NULL,
  `hr_ocorrencia` INT NOT NULL,
  `vl_temperatura1` DECIMAL(2,1) NOT NULL,
  `vl_temperatura2` DECIMAL(2,1) NOT NULL,
  `vl_dif_temperatira` DECIMAL(2,1) NOT NULL,
  PRIMARY KEY (`id_tmp_ocorrencia`),
  UNIQUE INDEX `id_tmp_ocorrencia_UNIQUE` (`id_tmp_ocorrencia` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
