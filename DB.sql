DROP DATABASE IF EXISTS `test6`;
CREATE DATABASE `test6`;
USE `test6`;
#--------------------------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(60) NOT NULL,
    `name` CHAR(20) NOT NULL,
    nickname CHAR(20) NOT NULL,
    cellphoneNum CHAR(20) NOT NULL,
    email CHAR(50) NOT NULL
);
#--------------------------------------------
#--------------------------------------------
DESC `member`;
SELECT * FROM `member`;

#테스트 데이터
INSERT INTO `member`
SET regDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`name` = '관리자',
nickname = '관리자',
cellphoneNum = '01000000000',
email = 'admin@test6.com';

INSERT INTO `member`
SET regDate = NOW(),
loginId = 'test1',
loginPw = 'test1',
`name` = '테스트이름1',
nickname = '테스트별명1',
cellphoneNum = '01000000001',
email = 'test1@test6.com';

INSERT INTO `member`
SET regDate = NOW(),
loginId = 'test2',
loginPw = 'test2',
`name` = '테스트이름2',
nickname = '테스트별명2',
cellphoneNum = '01000000002',
email = 'test2@test6.com';

DELETE FROM `member`;
DELETE FROM `member` WHERE id = 17;