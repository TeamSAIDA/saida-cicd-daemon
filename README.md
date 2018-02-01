# Saida Data Framework Server
사이다팀에서 사용되는 봇과 토너먼트 이력 정보를 관리하는 서버

## Pre Requisite
구분  | 프로그램  | 버젼  | 설명  
--|---|---|--
1   | Python   | 3.5  |   requirements.txt 참고
2  | flaskRESTful  |   | requirements.txt 참고  
3   | pymysql  |   |  
4   | Microsoft visual studio | 2013 edition   |  
5  | MySQL | 5.5.59.0 community version     |  

### MySQL 설정
Server mode로만 설치
3306 기본포트
saida / saida
리모트 연결 접속 허용을 위해 아래 커맨드 실행 필요(초기 셋업시) 링크
grant all privileges on saida.* to 'saida'@"%" identified by 'saida' with grant option;
flush privlileges;

### Mysql 접속정보


구분  | 속성  | 값   | 설명  |  
--|---|---|---|--
  1 | host   |  192.168.0.23  |   |  
  2 | name   |  saida |   |  
  3 | user   |  saida |   |  
  4 | password  | saida  |   |    
  5 | database-name  | saida  |   |  
  6 | init-script   | \\materials\\create-table.sql  |   |  

### SQL script
```{sql}
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
  `map` CHAR(2) NULL DEFAULT NULL,
  `is_error` CHAR NULL DEFAULT NULL,
  `race_type_of_bot1` CHAR(1) NULL DEFAULT NULL,
  `race_type_of_bot2` CHAR(1) NULL DEFAULT NULL,
  `create_dt` DATETIME NULL DEFAULT NULL,
  `update_dt` DATETIME NULL DEFAULT NULL,
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

-- INSERT INTO `game` (`id`,`bot_id`,`id_bot_1`,`id_bot_2`,`win_count`,`loss_count`,`draw_count`,`map`,`is_error`,`race_type_of_bot1`,`race_type_of_bot2`,`create_dt`,`update_dt`) VALUES
-- ('','','','','','','','','','','','','');
-- INSERT INTO `bot` (`id`,`bot_name`,`api_version`,`owner`,`type`,`race_type`,`create_dt`,`update_dt`) VALUES
-- ('','','','','','','','');
```


## Architecture
![architecture](images/2018/01/architecture.png)

## ERD
![erd](images/2018/01/erd.png)


## REST APIs
REST API 목록은 Postman에 작성하여 [여기](https://www.getpostman.com/collections/6ecd041e507bf53c9ac9) 링크통해 공유합니다.


## 실행방법

### 환경설정
DB설정 정보를 config.py에서 수정
### 실행
```
python main.py
```
