-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ngtodo
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ngtodo` ;

-- -----------------------------------------------------
-- Schema ngtodo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ngtodo` DEFAULT CHARACTER SET utf8 ;
USE `ngtodo` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `email` ON `user` (`email` ASC);


-- -----------------------------------------------------
-- Table `todo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `todo` ;

CREATE TABLE IF NOT EXISTS `todo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `task` VARCHAR(55) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `completed` TINYINT(1) NULL DEFAULT '0',
  `user_id` INT(11) NOT NULL,
  `due_date` VARCHAR(50) NULL DEFAULT NULL,
  `complete_date` VARCHAR(50) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `todo_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `user_id` ON `todo` (`user_id` ASC);

SET SQL_MODE = '';
GRANT USAGE ON *.* TO todo@localhost;
 DROP USER todo@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'todo'@'localhost' IDENTIFIED BY 'todo';

GRANT ALL ON * TO 'todo'@'localhost';
GRANT ALL ON * TO 'todo'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `ngtodo`;
INSERT INTO `user` (`id`, `email`, `password`) VALUES (1, 'aaron@wahoo.com', '1234');
INSERT INTO `user` (`id`, `email`, `password`) VALUES (2, 'bob@moogle.com', '4321');
INSERT INTO `user` (`id`, `email`, `password`) VALUES (3, 'jay@notmail.com', '3214');

COMMIT;


-- -----------------------------------------------------
-- Data for table `todo`
-- -----------------------------------------------------
START TRANSACTION;
USE `ngtodo`;
INSERT INTO `todo` (`id`, `task`, `description`, `completed`, `user_id`, `due_date`, `complete_date`, `created_at`, `updated_at`) VALUES (1, 'buy food', 'go to safeway', 0, 1, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO `todo` (`id`, `task`, `description`, `completed`, `user_id`, `due_date`, `complete_date`, `created_at`, `updated_at`) VALUES (2, 'buy cloths', 'go to walmart', 0, 2, NULL, NULL, DEFAULT, DEFAULT);
INSERT INTO `todo` (`id`, `task`, `description`, `completed`, `user_id`, `due_date`, `complete_date`, `created_at`, `updated_at`) VALUES (3, 'buy computer', 'go to apple store', 0, 3, NULL, NULL, DEFAULT, DEFAULT);

COMMIT;
