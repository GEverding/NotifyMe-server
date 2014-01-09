USE NotifyMe;

DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS user;

CREATE  TABLE `NotifyMe`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = TokuDB;

CREATE  TABLE `NotifyMe`.`event` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `timestamp` INT NOT NULL ,
  `user_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `user_id` (`user_id` ASC) )
ENGINE = TokuDB;
