SELECT * FROM link_users;


DROP TABLE IF EXISTS link_data CASCADE;
DROP TABLE IF EXISTS link_mid CASCADE;
DROP TABLE IF EXISTS link_big CASCADE;
DROP TABLE IF EXISTS board CASCADE;
DROP TABLE IF EXISTS link_users CASCADE;

-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- link_users Table Create SQL
-- 테이블 생성 SQL - link_users
CREATE TABLE link_users
(
    `ID`    VARCHAR(25)    NOT NULL    COMMENT '아이디',
    `PW`    VARCHAR(45)    NOT NULL    COMMENT '비밀번호',
    `Name`  VARCHAR(45)    NOT NULL    COMMENT '이름',
    PRIMARY KEY (ID)
)DEFAULT CHARACTER SET UTF8;

-- 테이블 Comment 설정 SQL - link_users
ALTER TABLE link_users COMMENT '회원 정보';


-- link_big Table Create SQL
-- 테이블 생성 SQL - link_big
CREATE TABLE link_big
(
    `big_idx`  INT             NOT NULL    AUTO_INCREMENT COMMENT '대분류 인덱스',
    `title`    VARCHAR(100)    NOT NULL    COMMENT '제목',
    `intro`    VARCHAR(300)    NULL        COMMENT '설명',
    `emoji`    VARCHAR(45)     NULL        COMMENT '이모티콘',
    `ID`       VARCHAR(25)     NOT NULL    COMMENT '아이디',
    PRIMARY KEY (big_idx)
)DEFAULT CHARACTER SET UTF8;

-- 테이블 Comment 설정 SQL - link_big
ALTER TABLE link_big COMMENT '대분류';

-- Foreign Key 설정 SQL - link_big(ID) -> link_users(ID)
ALTER TABLE link_big
    ADD CONSTRAINT FK_link_big_ID_link_users_ID FOREIGN KEY (ID)
        REFERENCES link_users (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - link_big(ID)
-- ALTER TABLE link_big
-- DROP FOREIGN KEY FK_link_big_ID_link_users_ID;


-- link_mid Table Create SQL
-- 테이블 생성 SQL - link_mid
CREATE TABLE link_mid
(
    `big_idx`   INT             NOT NULL    COMMENT '대분류 인덱스',
    `mid_name`  VARCHAR(100)    NULL        COMMENT '카테고리',
    `mid_idx`   INT             NOT NULL    AUTO_INCREMENT COMMENT '중분류 인덱스',
    PRIMARY KEY (mid_idx)
)DEFAULT CHARACTER SET UTF8;

-- 테이블 Comment 설정 SQL - link_mid
ALTER TABLE link_mid COMMENT '중분류';

-- Foreign Key 설정 SQL - link_mid(big_idx) -> link_big(big_idx)
ALTER TABLE link_mid
    ADD CONSTRAINT FK_link_mid_big_idx_link_big_big_idx FOREIGN KEY (big_idx)
        REFERENCES link_big (big_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - link_mid(big_idx)
-- ALTER TABLE link_mid
-- DROP FOREIGN KEY FK_link_mid_big_idx_link_big_big_idx;


-- board Table Create SQL
-- 테이블 생성 SQL - board
CREATE TABLE board
(
    `board_idx`      INT              NOT NULL    AUTO_INCREMENT COMMENT '글번호',
    `board_title`    VARCHAR(45)      NULL        COMMENT '글제목',
    `board_content`  VARCHAR(1000)    NULL        COMMENT '글내용',
    `board_tag`      VARCHAR(45)      NULL        COMMENT '태그',
    `ID`             VARCHAR(25)      NULL        COMMENT '작성자',
    PRIMARY KEY (board_idx)
)DEFAULT CHARACTER SET UTF8;

-- Foreign Key 설정 SQL - board(ID) -> link_users(ID)
ALTER TABLE board
    ADD CONSTRAINT FK_board_ID_link_users_ID FOREIGN KEY (ID)
        REFERENCES link_users (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - board(ID)
-- ALTER TABLE board
-- DROP FOREIGN KEY FK_board_ID_link_users_ID;


-- link_data Table Create SQL
-- 테이블 생성 SQL - link_data
CREATE TABLE link_data
(
    `mid_idx`     INT             NOT NULL    COMMENT '중분류 인덱스',
    `data_idx`    INT             NOT NULL    AUTO_INCREMENT COMMENT '데이터 인덱스',
    `data_title`  VARCHAR(500)    NOT NULL    COMMENT '데이터 제목',
    `data_intro`  VARCHAR(500)    NULL        COMMENT '데이터 설명',
    `data_link`   VARCHAR(500)    NOT NULL    COMMENT '데이터 링크',
    PRIMARY KEY (data_idx)
)DEFAULT CHARACTER SET UTF8;

-- 테이블 Comment 설정 SQL - link_data
ALTER TABLE link_data COMMENT '링크 데이터';

-- Foreign Key 설정 SQL - link_data(mid_idx) -> link_mid(mid_idx)
ALTER TABLE link_data
    ADD CONSTRAINT FK_link_data_mid_idx_link_mid_mid_idx FOREIGN KEY (mid_idx)
        REFERENCES link_mid (mid_idx) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - link_data(mid_idx)
-- ALTER TABLE link_data
-- DROP FOREIGN KEY FK_link_data_mid_idx_link_mid_mid_idx;