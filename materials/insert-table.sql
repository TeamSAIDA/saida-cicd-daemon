# code 테이블 초기값 입력
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('race_cd', '00', 'Random');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('race_cd', '01', 'Terran');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('race_cd', '02', 'Protoss');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('race_cd', '03', 'Zerg');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('race_cd', '04', 'Unknown');

INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('type_cd', '01', 'proxy');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('type_cd', '02', 'dll');

INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('map_cd', '01', '(2)Benzene.scx');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('map_cd', '02', '(2)Destination.scx');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('map_cd', '03', '(2)HeartbreakRidge.scx');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('map_cd', '04', '(3)Aztec.scx');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('map_cd', '05', '(3)TauCross.scx');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('map_cd', '06', '(4)Andromeda.scx');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('map_cd', '07', '(4)CircuitBreaker.scx');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('map_cd', '08', '(4)EmpireoftheSun.scm');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('map_cd', '09', '(4)Fortress.scx');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('map_cd', '10', '(4)Python.scx');

INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('rslt_cd', '01', '정상승리');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('rslt_cd', '02', '상대방의 오류로 승리');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('rslt_cd', '03', '타임아웃 무승부이나 점수로 승리');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('rslt_cd', '04', '정상패배');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('rslt_cd', '05', '자신의 오류로 패배');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('rslt_cd', '06', '타임아웃 무승부이나 점수로 패배');

INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('owner_cd', '01', 'SDS 에서 만든 봇');
INSERT INTO code (`code_id`, `code_val`, `code_desc`) VALUES ('owner_cd', '02', '대회 참가자들 봇');


# bot 테이블 초기값 입력
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('UAlbertaBot', '02', '02', '00', 'BWAPI_412', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('Aiur', '02', '02', '02', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('CruzBot', '02', '02', '02', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('MegaBot', '02', '02', '02', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('NUSBot', '02', '02', '02', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('Skynet', '02', '02', '02', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('Xelnaga', '02', '02', '02', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('Ximp', '02', '02', '02', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('IceBot', '02', '02', '01', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('Iron', '02', '02', '01', 'BWAPI_412', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('LetaBot', '02', '02', '01', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('Oritaka', '02', '02', '01', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('SRbotOne', '02', '02', '01', 'BWAPI_412', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('TerranUAB', '02', '02', '01', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('Tyr', '02', '01', '01', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('Cimex', '02', '02', '03', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('GarmBot', '02', '01', '03', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('JiaBot', '02', '02', '03', 'BWAPI_412', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('Overkill', '02', '02', '03', 'BWAPI_412', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('tscmoo', '02', '01', '03', 'BWAPI_374', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO bot (`bot_name`, `owner_cd`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('ZZZKBot', '02', '02', '03', 'BWAPI_412', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ---
-- Test Data
-- ---


INSERT INTO bot (`bot_name`, `type_cd`, `race_cd`, `api_version`, `create_dt`, `update_dt`) VALUES ('name','typeCd','raceCd','apiversion',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO `game` (`turn`,`game_id`,`bot_id_1`,`bot_id_2`,`rslt_cd`,`create_dt`, `update_dt`) VALUES (0, 0, 1, 2, '04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


