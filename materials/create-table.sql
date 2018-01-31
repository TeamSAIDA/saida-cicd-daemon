-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'game'
-- 대전 경기 이력정보
-- ---

DROP TABLE IF EXISTS `game`;

CREATE TABLE `game` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `bot_id` INTEGER NULL DEFAULT NULL,
  `id_bot_1` INTEGER NULL DEFAULT NULL,
  `id_bot_2` INTEGER NULL DEFAULT NULL,
  `win_count` INTEGER NULL DEFAULT NULL,
  `loss_count` INTEGER NULL DEFAULT NULL,
  `draw_count` INTEGER NULL DEFAULT NULL,
  `race_type_of_bot1` CHAR(1) NULL DEFAULT NULL,
  `race_type_of_bot2` CHAR(1) NULL DEFAULT NULL,
  `create_dt` DATETIME NULL DEFAULT NULL,
  `update_dt` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT '대전 경기 이력정보';

-- ---
-- Table 'bot'
-- 봇 정보
-- ---

DROP TABLE IF EXISTS `bot`;

CREATE TABLE `bot` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `bot_name` VARCHAR(100) NULL DEFAULT NULL,
  `api_version` INTEGER NULL DEFAULT NULL,
  `owner` VARCHAR(100) NULL DEFAULT NULL,
  `type` INTEGER NULL DEFAULT NULL,
  `race_type` CHAR(1) NULL DEFAULT NULL,
  `create_dt` DATETIME NULL DEFAULT NULL,
  `update_dt` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT '봇 정보';

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `game` ADD FOREIGN KEY (id_bot_1) REFERENCES `bot` (`id`);
ALTER TABLE `game` ADD FOREIGN KEY (id_bot_2) REFERENCES `bot` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `game` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `bot` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---


 INSERT INTO `bot` (`id`,`bot_name`,`api_version`,`owner`,`type`,`race_type`) VALUES (1,'joe',1,'joe',1,'T');

INSERT INTO `game` (`id`,`bot_id`,`id_bot_1`,`id_bot_2`,`win_count`,`loss_count`,
`draw_count`,`race_type_of_bot1`,`race_type_of_bot2`)
VALUES
(1,1,1,1,3,4,5,'T','R');


