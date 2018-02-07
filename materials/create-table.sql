-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'code'
-- 코드 정보
-- ---
DROP TABLE IF EXISTS code;

CREATE TABLE code (
  `code_id` VARCHAR(30) NOT NULL,
  `code_val` CHAR(2) NOT NULL,
  `code_desc` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`code_id`, `code_val`)
) COMMENT '코드 정보';

-- ---
-- Table 'game'
-- 대전 경기 이력정보
-- ---
DROP TABLE IF EXISTS `game`;

CREATE TABLE `game` (
  `turn` INTEGER NOT NULL,
  `game_id` INTEGER NOT NULL,
  `bot_id_1` INTEGER NOT NULL,
  `bot_id_2` INTEGER NOT NULL,
  `race_cd_1` CHAR(2) NOT NULL DEFAULT '04',
  `race_cd_2` CHAR(2) NOT NULL DEFAULT '04',
  `rslt_cd` CHAR(2) NOT NULL,
  `map_cd` CHAR(2) NOT NULL,
  `create_dt` DATETIME NULL DEFAULT NULL,
  `update_dt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`turn`, `game_id`)
) COMMENT '대전 경기 이력정보';

-- ---
-- Table 'bot'
-- 봇 정보
-- ---

DROP TABLE IF EXISTS `bot`;

CREATE TABLE `bot` (
  `bot_id` INTEGER AUTO_INCREMENT,
  `bot_name` VARCHAR(100) NOT NULL,
  `owner_cd` CHAR(2) NOT NULL DEFAULT '01',
  `type_cd` CHAR(2) NOT NULL,
  `race_cd` CHAR(2) NOT NULL,
  `api_version` VARCHAR(20) NOT NULL,
  `create_dt` DATETIME NULL DEFAULT NULL,
  `update_dt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`bot_id`)
) COMMENT '봇 정보';

-- ---
-- Foreign Keys
-- ---
ALTER TABLE `game` ADD FOREIGN KEY (bot_id_1) REFERENCES `bot` (`bot_id`);
ALTER TABLE `game` ADD FOREIGN KEY (bot_id_2) REFERENCES `bot` (`bot_id`);


-- ---
-- Unique Constraint
-- ---
create unique index BOT_NAME_UNIQUE ON BOT (bot_name)

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `game` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `bot` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

