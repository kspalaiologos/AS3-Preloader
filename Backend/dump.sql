﻿
-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE uw426;

--
-- Drop table `game_settings`
--
DROP TABLE IF EXISTS game_settings;

--
-- Drop table `items`
--
DROP TABLE IF EXISTS items;

--
-- Drop table `items_fidget`
--
DROP TABLE IF EXISTS items_seller;

--
-- Drop table `messages`
--
DROP TABLE IF EXISTS messages;

--
-- Drop table `server_config`
--
DROP TABLE IF EXISTS server_config;

--
-- Drop table `user_data`
--
DROP TABLE IF EXISTS user_data;

--
-- Drop table `user_fights`
--
DROP TABLE IF EXISTS user_fights;

--
-- Set default database
--
USE uw426;

--
-- Create table `user_fights`
--
CREATE TABLE user_fights (
  fight_id INT(11) NOT NULL AUTO_INCREMENT,
  user_id INT(11) NOT NULL,
  target_id INT(11) NOT NULL,
  success TEXT NOT NULL,
  honor INT(11) NOT NULL,
  fight_time DATETIME NOT NULL,
  PRIMARY KEY (fight_id)
)
ENGINE = MYISAM,
CHARACTER SET utf8,
CHECKSUM = 0,
COLLATE utf8_general_ci;

--
-- Create table `user_data`
--
CREATE TABLE user_data (
  user_id INT(11) NOT NULL AUTO_INCREMENT,
  user_name TINYTEXT NOT NULL,
  password TINYTEXT NOT NULL,
  lvl INT(11) NOT NULL DEFAULT 1,
  silver BIGINT(20) NOT NULL DEFAULT 0,
  email TINYTEXT NOT NULL,
  email_validated INT(1) NOT NULL DEFAULT 1,
  last_ip VARCHAR(30) NOT NULL,
  last_activ VARCHAR(30) NOT NULL,
  ssid TINYTEXT CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  reg_date BIGINT(20) NOT NULL,
  warned ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL DEFAULT 'no',
  enabled ENUM('yes','no') CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL DEFAULT 'yes',
  class TINYINT(4) NOT NULL,
  gender TINYINT(4) NOT NULL,
  thirst SMALLINT(6) NOT NULL DEFAULT 2500,
  attr_str INT(11) NOT NULL DEFAULT 10,
  attr_agi INT(11) NOT NULL DEFAULT 10,
  attr_int INT(11) NOT NULL DEFAULT 10,
  attr_wit INT(11) NOT NULL DEFAULT 10,
  attr_luck INT(11) NOT NULL DEFAULT 10,
  honor INT(11) NOT NULL DEFAULT 100,
  copycat_lvl VARCHAR(11) NOT NULL DEFAULT '150:150:150',
  copycat_str VARCHAR(100) NOT NULL DEFAULT '2056:887:884',
  copycat_dex VARCHAR(100) NOT NULL DEFAULT '884:861:1543',
  copycat_int VARCHAR(100) NOT NULL DEFAULT '861:1546:862',
  copycat_wit VARCHAR(100) NOT NULL DEFAULT '1417:1417:1418',
  copycat_luck VARCHAR(100) NOT NULL DEFAULT '1118:1118:1121',
  user_desc TEXT NOT NULL,
  status TINYINT(4) NOT NULL DEFAULT 0,
  status_end INT(11) NOT NULL DEFAULT 0,
  status_extra TINYINT(4) NOT NULL DEFAULT 0,
  quest_gold_1 INT(11) NOT NULL DEFAULT 5,
  quest_location_1 TINYINT(4) DEFAULT 9,
  quest_location_2 TINYINT(4) NOT NULL DEFAULT 4,
  quest_exp_1 INT(11) NOT NULL DEFAULT 125,
  quest_dur_1 INT(11) NOT NULL DEFAULT 1,
  quest_gold_2 INT(11) NOT NULL DEFAULT 8,
  quest_exp_2 INT(11) NOT NULL DEFAULT 92,
  quest_dur_2 INT(11) NOT NULL DEFAULT 3,
  exp BIGINT(20) NOT NULL DEFAULT 0,
  drinks INT(5) NOT NULL DEFAULT 0,
  quest_reroll_time BIGINT(20) NOT NULL DEFAULT 0,
  shop_reroll_time BIGINT(20) NOT NULL DEFAULT 0,
  fill_level INT(11) NOT NULL DEFAULT 0,
  fill_level_next INT(11) NOT NULL DEFAULT 150,
  access INT(11) NOT NULL DEFAULT 0,
  face smallint(4) NOT NULL,
  PRIMARY KEY (user_id)
)
ENGINE = MYISAM,
CHARACTER SET utf8,
CHECKSUM = 0,
COLLATE utf8_general_ci;

--
-- Create table `server_config`
--
CREATE TABLE server_config (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(300) NOT NULL,
  value VARCHAR(300) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = MYISAM,
AUTO_INCREMENT = 15,
CHARACTER SET utf8,
CHECKSUM = 0,
COLLATE utf8_general_ci;

--
-- Create table `messages`
--
CREATE TABLE messages (
  msg_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  sender_id BIGINT(20) NOT NULL,
  reciver_id BIGINT(20) NOT NULL,
  time BIGINT(20) NOT NULL,
  subject TINYTEXT NOT NULL,
  msg TEXT NOT NULL,
  `read` TINYINT(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (msg_id)
)
ENGINE = MYISAM,
CHARACTER SET utf8,
CHECKSUM = 0,
COLLATE utf8_general_ci;

--
-- Create table `items_seller`
--
CREATE TABLE items_seller (
  id INT(11) NOT NULL AUTO_INCREMENT,
  item_type TINYINT(4) NOT NULL,
  item_id SMALLINT(6) NOT NULL,
  dmg_min INT(11) NOT NULL DEFAULT 0,
  dmg_max INT(11) NOT NULL DEFAULT 0,
  atr_type_1 INT(11) NOT NULL,
  atr_type_2 INT(11) NOT NULL DEFAULT 0,
  atr_type_3 INT(11) NOT NULL DEFAULT 0,
  atr_val_1 INT(11) NOT NULL,
  atr_val_2 INT(11) NOT NULL DEFAULT 0,
  atr_val_3 INT(11) NOT NULL DEFAULT 0,
  gold INT(11) NOT NULL DEFAULT 0,
  mush INT(11) NOT NULL DEFAULT 0,
  slot INT(11) NOT NULL,
  owner_id INT(11) NOT NULL,
  enchant BIGINT(20) NOT NULL,
  enchant_power BIGINT(20) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = MYISAM,
CHARACTER SET utf8,
CHECKSUM = 0,
COLLATE utf8_general_ci;

--
-- Create table `items`
--
CREATE TABLE items (
  id INT(11) NOT NULL AUTO_INCREMENT,
  item_type TINYINT(4) NOT NULL,
  item_id SMALLINT(6) NOT NULL,
  dmg_min INT(11) NOT NULL,
  dmg_max INT(11) NOT NULL,
  atr_type_1 TINYINT(4) NOT NULL,
  atr_type_2 TINYINT(4) NOT NULL,
  atr_type_3 TINYINT(4) NOT NULL,
  atr_val_1 INT(11) NOT NULL,
  atr_val_2 INT(11) NOT NULL,
  atr_val_3 INT(11) NOT NULL,
  gold INT(11) NOT NULL,
  lvl INT(11) NOT NULL DEFAULT 0,
  slot TINYINT(4) NOT NULL,
  owner_id INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = MYISAM,
CHARACTER SET utf8,
CHECKSUM = 0,
COLLATE utf8_general_ci;

--
-- Create table `game_settings`
--
CREATE TABLE game_settings (
  id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  setting VARCHAR(300) NOT NULL,
  value VARCHAR(300) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = MYISAM,
AUTO_INCREMENT = 37,
CHARACTER SET utf8,
CHECKSUM = 0,
COLLATE utf8_general_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;