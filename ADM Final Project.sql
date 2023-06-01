-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema global
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema global
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `global` DEFAULT CHARACTER SET utf8 ;
USE `global` ;

-- -----------------------------------------------------
-- Table `global`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global`.`Customers` (
  `Customer ID` INT NOT NULL,
  `Customer Name` VARCHAR(255) NULL,
  `Contact number` VARCHAR(55) NULL,
  `Email` VARCHAR(255) NULL,
  PRIMARY KEY (`Customer ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global`.`Delivery Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global`.`Delivery Address` (
  `Address ID` INT NOT NULL,
  `Street` VARCHAR(255) NULL,
  `City` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`Address ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global`.`Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global`.`Shipping` (
  `Ship ID` INT NOT NULL,
  `Ship Mode` VARCHAR(255) NULL,
  `Ship Date` DATE NULL,
  `Address ID` INT NULL,
  `Ship Cost` DECIMAL NULL,
  PRIMARY KEY (`Ship ID`),
  CONSTRAINT `Address ID fk`
    FOREIGN KEY (`Ship ID`)
    REFERENCES `global`.`Delivery Address` (`Address ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global`.`Products` (
  `ProductID INT` INT NOT NULL,
  `Product Name` VARCHAR(255) NULL,
  `Price` VARCHAR(45) NULL,
  `Category` VARCHAR(45) NULL,
  `Sub Category` VARCHAR(45) NULL,
  PRIMARY KEY (`ProductID INT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global`.`Orders` (
  `Order ID` INT NOT NULL,
  `Customer ID` VARCHAR(45) NULL,
  `Product ID` VARCHAR(45) NULL,
  `Delivery ID` VARCHAR(45) NULL,
  `Quantity` VARCHAR(45) NULL,
  PRIMARY KEY (`Order ID`),
  CONSTRAINT `customer ID fk`
    FOREIGN KEY (`Order ID`)
    REFERENCES `global`.`Customers` (`Customer ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Product ID fk`
    FOREIGN KEY (`Order ID`)
    REFERENCES `global`.`Products` (`ProductID INT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Ship ID`
    FOREIGN KEY (`Order ID`)
    REFERENCES `global`.`Shipping` (`Ship ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
