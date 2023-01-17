-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema collegeFinalFinalDatabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema collegeFinalFinalDatabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `collegeFinalFinalDatabase` DEFAULT CHARACTER SET utf8 ;
USE `collegeFinalFinalDatabase` ;

-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Admin` (
  `id` INT(45) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Faculty` (
  `id` INT(45) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Department` (
  `id` INT(45) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Faculty_id` INT(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Department_Faculty_idx` (`Faculty_id` ASC) VISIBLE,
  CONSTRAINT `fk_Department_Faculty`
    FOREIGN KEY (`Faculty_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Faculty` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Instructor` (
  `id` INT(45) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(45) NULL,
  `dob` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `Department_id` INT(45) NOT NULL,
  `isHod` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Instructor_Department1_idx` (`Department_id` ASC) VISIBLE,
  CONSTRAINT `fk_Instructor_Department1`
    FOREIGN KEY (`Department_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Department` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Student` (
  `id` INT(45) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `sex` VARCHAR(45) NULL,
  `dob` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `father_name` VARCHAR(45) NULL,
  `mother_name` VARCHAR(45) NULL,
  `guardian_name` VARCHAR(45) NULL,
  `image` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Course` (
  `id` INT(45) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `code` VARCHAR(45) NOT NULL,
  `credit_values` INT(45) NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  `Department_id` INT(45) NOT NULL,
  `Instructor_id` INT(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Course_Department1_idx` (`Department_id` ASC) VISIBLE,
  INDEX `fk_Course_Instructor1_idx` (`Instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Course_Department1`
    FOREIGN KEY (`Department_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Department` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Course_Instructor1`
    FOREIGN KEY (`Instructor_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Instructor` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Classroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Classroom` (
  `id` INT(45) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Exam_Session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Exam_Session` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Hod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Hod` (
  `id` INT(255) NOT NULL,
  `Department_id` INT(45) NOT NULL,
  `Instructor_id` INT(45) NOT NULL,
  PRIMARY KEY (`Department_id`, `Instructor_id`),
  INDEX `fk_Hod_Department1_idx` (`Department_id` ASC) VISIBLE,
  INDEX `fk_Hod_Instructor1_idx` (`Instructor_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Hod_Department1`
    FOREIGN KEY (`Department_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Department` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Hod_Instructor1`
    FOREIGN KEY (`Instructor_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Instructor` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Schedule` (
  `id` INT(100) NOT NULL,
  `day` VARCHAR(45) NOT NULL,
  `time` VARCHAR(255) NOT NULL,
  `Classroom_id` INT(45) NOT NULL,
  `Course_id` INT(45) NOT NULL,
  PRIMARY KEY (`Course_id`, `Classroom_id`, `day`, `time`),
  INDEX `fk_Schedule_Classroom1_idx` (`Classroom_id` ASC) VISIBLE,
  INDEX `fk_Schedule_Course1_idx` (`Course_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Schedule_Classroom1`
    FOREIGN KEY (`Classroom_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Classroom` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Schedule_Course1`
    FOREIGN KEY (`Course_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Course` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Student_has_Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Student_has_Course` (
  `Student_id` INT(45) NOT NULL,
  `Course_id` INT(45) NOT NULL,
  PRIMARY KEY (`Student_id`, `Course_id`),
  INDEX `fk_Student_has_Course_Course1_idx` (`Course_id` ASC) VISIBLE,
  INDEX `fk_Student_has_Course_Student1_idx` (`Student_id` ASC) VISIBLE,
  CONSTRAINT `fk_Student_has_Course_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Student` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Student_has_Course_Course1`
    FOREIGN KEY (`Course_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Course` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Exam_Session_has_Student_has_Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Exam_Session_has_Student_has_Course` (
  `Exam_Session_id` INT NOT NULL,
  `Student_has_Course_Student_id` INT(45) NOT NULL,
  `Student_has_Course_Course_id` INT(45) NOT NULL,
  PRIMARY KEY (`Exam_Session_id`, `Student_has_Course_Student_id`, `Student_has_Course_Course_id`),
  INDEX `fk_Exam_Session_has_Student_has_Course_Student_has_Course1_idx` (`Student_has_Course_Student_id` ASC, `Student_has_Course_Course_id` ASC) VISIBLE,
  INDEX `fk_Exam_Session_has_Student_has_Course_Exam_Session1_idx` (`Exam_Session_id` ASC) VISIBLE,
  CONSTRAINT `fk_Exam_Session_has_Student_has_Course_Exam_Session1`
    FOREIGN KEY (`Exam_Session_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Exam_Session` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exam_Session_has_Student_has_Course_Student_has_Course1`
    FOREIGN KEY (`Student_has_Course_Student_id` , `Student_has_Course_Course_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Student_has_Course` (`Student_id` , `Course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `collegeFinalFinalDatabase`.`Score`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `collegeFinalFinalDatabase`.`Score` (
  `id` INT NOT NULL,
  `ca_mark` VARCHAR(45) NULL,
  `exam_mark` VARCHAR(45) NULL,
  `final_mark` VARCHAR(45) NULL,
  `grade` VARCHAR(45) NULL,
  `session_id` INT NOT NULL,
  `student_id` INT(45) NOT NULL,
  `course_id` INT(45) NOT NULL,
  PRIMARY KEY (`id`, `session_id`, `student_id`, `course_id`),
  INDEX `fk_Score_Exam_Session_has_Student_has_Course1_idx` (`session_id` ASC, `student_id` ASC, `course_id` ASC) VISIBLE,
  CONSTRAINT `fk_Score_Exam_Session_has_Student_has_Course1`
    FOREIGN KEY (`session_id` , `student_id` , `course_id`)
    REFERENCES `collegeFinalFinalDatabase`.`Exam_Session_has_Student_has_Course` (`Exam_Session_id` , `Student_has_Course_Student_id` , `Student_has_Course_Course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
