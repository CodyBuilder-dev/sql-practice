DROP DATABASE IF EXISTS  madang;
DROP USER IF EXISTS  madang@localhost;
create user madang@localhost identified WITH mysql_native_password  by 'madang';
create database madang;
grant all privileges on madang.* to madang@localhost with grant option;
commit;

USE madang;

/* 
테이블명 : PLAYER
테이블 설명 : K-리그 선수들의 정보를 가지고 있는 테이블
칼럼명 :
PLAYER_ID (선수ID) 문자 고정 자릿수 7자리,
PLAYER_NAME (선수명) 문자 가변 자릿수 20자리,
TEAM_ID (팀ID) 문자 고정 자릿수 3자리,
E_PLAYER_NAME (영문선수명) 문자 가변 자릿수 40자리,
NICKNAME (선수별명) 문자 가변 자릿수 30자리,
JOIN_YYYY (입단년도) 문자 고정 자릿수 4자리,
POSITION (포지션) 문자 가변 자릿수 10자리,
BACK_NO (등번호) 숫자 2자리,
NATION (국적) 문자 가변 자릿수 20자리,
BIRTH_DATE (생년월일) 날짜,
SOLAR (양/음) 문자 고정 자릿수 1자리,
HEIGHT (신장) 숫자 3자리,
WEIGHT (몸무게) 숫자 3자리,
제약조건 :
기본키(PRIMARY KEY) → PLAYER_ID (제약조건명은 PLAYER_ID_PK) 값이 반드시 존재 (NOT NULL) → PLAYER_NAME, TEAM_ID
*/

CREATE TABLE PLAYER (PLAYER_ID CHAR(7) NOT NULL,
PLAYER_NAME VARCHAR(20) NOT NULL,
TEAM_ID CHAR(3) NOT NULL,
E_PLAYER_NAME VARCHAR(40),
NICKNAME VARCHAR(30),
JOIN_YYYY CHAR(4),
POSITION VARCHAR(10),
BACK_NO NUMERIC(2),
NATION VARCHAR(20),
BIRTH_DATE DATETIME,
SOLAR CHAR(1),
HEIGHT NUMERIC(3),
WEIGHT NUMERIC(3));

CREATE TABLE player (abcd VARCHAR(2));

DESC player;

/*
테이블명 : TEAM
테이블 설명 : K-리그 선수들의 소속팀에 대한 정보를 가지고 있는 테이블
칼럼명 :
TEAM_ID (팀 고유 ID) 문자 고정 자릿수 3자리,
REGION_NAME (연고지 명) 문자 가변 자릿수 8자리,
TEAM_NAME (한글 팀 명) 문자 가변 자릿수 40자리,
E-TEAM_NAME (영문 팀 명) 문자 가변 자릿수 50자리 ,
ORIG_YYYY (창단년도) 문자 고정 자릿수 4자리,
STADIUM_ID (구장 고유 ID) 문자 고정 자릿수 3자리,
ZIP_CODE1 (우편번호 앞 3자리) 문자 고정 자릿수 3자리,
ZIP_CODE2 (우편번호 뒷 3자리) 문자 고정 자릿수 3자리,
ADDRESS (주소) 문자 가변 자릿수 80자리,
DDD (지역번호) 문자 가변 자릿수 3자리,
TEL (전화번호) 문자 가변 자릿수 10자리,
FAX (팩스번호) 문자 가변 자릿수 10자리,
HOMEPAGE (홈페이지) 문자 가변 자릿수 50자리
OWNER (구단주) 문자 가변 자릿수 10자리, 
제약조건 :
기본 키(PRIMARY KEY) → TEAM_ID (제약조건명은 TEAM_ID_PK) NOT NULL → REGION_NAME, TEAM_NAME, STADIUM_ID (제약조건명은 미적용)
*/

CREATE TABLE team (
team_id CHAR(3) NOT NULL, region_name VARCHAR(8) NOT NULL,
team_name VARCHAR(40) NOT NULL,e_team_name VARCHAR(50), orig_yyyy char(4), stadium_id CHAR(3) NOT NULL, zip_code CHAR(3),
zip_code2 CHAR(3), address VARCHAR(80), ddd VARCHAR(3), tel VARCHAR(10), fax VARCHAR(10),
homepage VARCHAR(50), owner VARCHAR(10), 
CONSTRAINT team_id_pk PRIMARY KEY (team_id));

DESC team;

/*선수(PLAYER) 테이블과 같은 내용으로 TEAM_TEMP라는 복사 테이블을 만들어 본다.*/
CREATE TABLE team_temp AS SELECT * FROM team;

DESC team_temp;

/*SELECT * INTO team_temp2 from team;*/
