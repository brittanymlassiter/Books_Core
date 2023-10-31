-- MySQL Script generated by MySQL Workbench
-- Tue Oct 31 18:20:59 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Books
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Books` ;

-- -----------------------------------------------------
-- Schema Books
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Books` DEFAULT CHARACTER SET utf8 COLLATE utf8_danish_ci ;
USE `Books` ;

-- -----------------------------------------------------
-- Table `Books`.`authors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Books`.`authors` ;

CREATE TABLE IF NOT EXISTS `Books`.`authors` (
  `author_id` INT NOT NULL,
  `author_name` VARCHAR(45) NULL,
  PRIMARY KEY (`author_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`books`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Books`.`books` ;

CREATE TABLE IF NOT EXISTS `Books`.`books` (
  `book_id` INT NOT NULL,
  `Title` VARCHAR(45) NULL,
  `authors_author_id` INT NOT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `fk_books_authors_idx` (`authors_author_id` ASC) VISIBLE,
  CONSTRAINT `fk_books_authors`
    FOREIGN KEY (`authors_author_id`)
    REFERENCES `Books`.`authors` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Books`.`users` ;

CREATE TABLE IF NOT EXISTS `Books`.`users` (
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Books`.`favorites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Books`.`favorites` ;

CREATE TABLE IF NOT EXISTS `Books`.`favorites` (
  `book_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`book_id`, `user_id`),
  INDEX `fk_books_has_users_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_books_has_users_books1_idx` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_books_has_users_books1`
    FOREIGN KEY (`book_id`)
    REFERENCES `Books`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_has_users_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `Books`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
