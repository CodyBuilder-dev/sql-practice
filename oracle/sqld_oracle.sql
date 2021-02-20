--0. Setting/DCL(Data Control Language)
--Oracle 12c부터, user/role명앞에 c##을 붙여야 하는데, 아래의 명령어를 쓰면 안 해도 됨
alter session set "_ORACLE_SCRIPT"=true;  

--유저 권한 확인
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'SQLD';
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTED_ROLE = 'DBA';
SELECT * FROM DBA_SYS_PRIVS;

--유저 권한 설정
GRANT CREATE SESSION to c##sqld;
GRANT CREATE TABLE to c##sqld;



--1. DDL (Data Definition Language)
--1-1. 테이블 생성 with 제약조건
CREATE TABLE STADIUM ( STADIUM_ID CHAR(3) NOT NULL,
                        DDD VARCHAR2(3),
                        TEL VARCHAR2(10),
                        CONSTRAINT STADIUM_PK PRIMARY KEY (STADIUM_ID)
                        );
CREATE TABLE TEAM ( TEAM_ID CHAR(3) NOT NULL,
                    REGION_NAME VARCHAR2(8) NOT NULL,
                    TEAM_NAME VARCHAR2(40) NOT NULL,
                    E_TEAM_NAME VARCHAR2(50),
                    ORIG_YYYY CHAR(4),
                    STADIUM_ID CHAR(3) NOT NULL,
                    ZIP_CODE1 CHAR(3),
                    ZIP_CODE2 CHAR(3),
                    ADDRESS VARCHAR2(80),
                    DDD VARCHAR2(3),
                    TEL VARCHAR2(10),
                    FAX VARCHAR2(10),
                    HOMEPAGE VARCHAR2(50),
                    OWNER VARCHAR2(10),
                    CONSTRAINT TEAM_PK PRIMARY KEY (TEAM_ID),
                    CONSTRAINT TEAM_FK FOREIGN KEY (STADIUM_ID) REFERENCES STADIUM(STADIUM_ID) 
                    );
                        
CREATE TABLE player ( PLAYER_ID CHAR(7) NOT NULL,
                    PLAYER_NAME varchar2(20) NOT NULL,
                    TEAM_ID char(3) NOT NULL,
                    E_PLAYER_NAME VARCHAR2(40),
                    NICKNAME VARCHAR2(30),
                    JOIN_YYYY CHAR(4),
                    --PLAYER_POSITION VARCHAR2(10), 
                    POSITION VARCHAR2(10),
                    BACK_NO NUMBER(2),
                    NATION VARCHAR2(20),
                    BIRTH_DATE DATE,
                    SOLAR CHAR(1),
                    HEIGHT NUMBER(3),
                    WEIGHT NUMBER(3),
                    CONSTRAINT PLAYER_PK PRIMARY KEY (PLAYER_ID),
                    CONSTRAINT PLAYER_FK FOREIGN KEY (TEAM_ID) REFERENCES TEAM(TEAM_ID)
                    );

--SELECT 문을 통한 테이블 생성
-- 기존 테이블 구조를 본따서 새 테이블을 만들 때 사용

--1-2. 테이블 구조 요약 확인
DESCRIBE player;
DESC team;
DESCRIBE stadium;

--테이블 제약조건 확인                    
SELECT * FROM ALL_CONSTRAINTS A, ALL_CONS_COLUMNS B WHERE A.TABLE_NAME = "PLAYER" ORDER BY B.POSITION;

--1-3. ALTER TABLE을 이용해 테이블 구조 변경
--ADD COLUMN

--DROP COLUMN

--MODIFY COLUMN

--ADD CONSTRAINT

--DROP CONSTRAINT

--1-4. RENAME TABLE로 테이블 이름 바꾸기

--1-5. DROP TABLE로 테이블 없애기

--1-6. TRUNCATE TABLE로 테이블 비우기

--테이블 목록 보기
--SHOW tables; MySQL식 테이블 보기. Oracle에서는 동작 안함
SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE';
SELECT * FROM USER_TABLES;
SELECT * FROM TABS;


--2. DML(Data Manipulation Language)
--2-1. INSERT INTO 로 데이터 삽입
--기본적으로 한줄에 데이터 하나씩, 여러 데이터 한번에 넣으려면 쿼리문 수정 필요

--부모 테이블(team 테이블) 값 없이, 자식 테이블(player 테이블)값을 넣으려 하면 무결성 에러 발생
INSERT INTO stadium VALUES ('D01','061','792-5600');

INSERT INTO team (TEAM_ID,REGION_NAME,TEAM_NAME,STADIUM_ID) VALUES ('K07','전남','전남드래곤즈','D01');

INSERT INTO PLAYER (PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, HEIGHT, WEIGHT, BACK_NO)
            VALUES ('2002007', '박지성', 'K07', 'MF', 178, 73, 7);
INSERT INTO PLAYER 
            VALUES ('2002010','이청용','K07','','BlueDragon','2002','MF','17',NULL, NULL,'1',180,69);
--정의되지 않은 값은, ''로 나타내거나 NUILL로 넣을 수 있음.
--아무것도 안 적으면 어떻게 되려나?

--2-2. UPDATE로 입력된 정보를 수정
UPDATE PLAYER SET BACK_NO = 99;
UPDATE PLAYER SET POSITION = 'MF';

--2-3. DELETE FROM 으로 데이터 제거
DELETE from PLAYER;
DELETE team;
--2-4. SELECT FROM으로 데이터 불러오기
SELECT * FROM player;

--3. TCL(Transaction Control Language)

--4. WHERE절

--5. 함수

--6. Group by, Having

--7. Order by

--8. Join
--EQUI Join
--[예제] 선수 테이블과 팀 테이블에서 선수 이름과 소속된 팀의 이름을 출력하시오.
SELECT PLAYER.PLAYER_NAME 선수명, TEAM.TEAM_NAME 소속팀명 
    FROM PLAYER, TEAM
    WHERE PLAYER.TEAM_ID = TEAM.TEAM_ID;
SELECT PLAYER.PLAYER_NAME 선수명, TEAM.TEAM_NAME 소속팀명
    FROM PLAYER INNER JOIN TEAM ON PLAYER.TEAM_ID = TEAM.TEAM_ID;

--[예제]선수(PLAYER) 테이블과 팀(TEAM) 테이블에서 K-리그 소속 선수들의 이름, 백넘버와 그 선수가 소속되어 있는 팀명 및 연고지를 알고 싶다
SELECT PLAYER.PLAYER_NAME, PLAYER.BACK_NO, PLAYER.TEAM_ID, TEAM.TEAM_NAME, TEAM.REGION_NAME
    FROM PLAYER, TEAM WHERE PLAYER.TEAM_ID = TEAM.TEAM_ID;

SELECT PLAYER.PLAYER_NAME, PLAYER.BACK_NO, PLAYER.TEAM_ID, TEAM.TEAM_NAME, TEAM.REGION_NAME
    FROM PLAYER INNER JOIN TEAM ON PLAYER.TEAM_ID = TEAM.TEAM_ID;
    
--9. Optimizer
--Rule Based Optimizer
SELECT ENAME FROM EMP WHERE JOB = 'SALESMAN' AND SAL BETWEEN 3000 AND 6000;
SELECT * FROM EMP;
--AutoTrace 이용 실행계획 확인
SET autotrace on;

--DBMS_XPLAN 이용 실행계획 확인
EXPLAIN plan FOR
  SELECT ename, sal, job
    FROM emp
   WHERE sal = 3000;

SELECT *
  FROM TABLE(dbms_xplan.display);
  
  
-- Standart Join

--Inner Join
--WHERE 절 JOIN 조건
SELECT EMP.DEPTNO, EMPNO, ENAME, DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;
--FROM 절 JOIN 조건
SELECT EMP.DEPTNO, EMPNO, ENAME, DNAME FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO; 
SELECT EMP.DEPTNO, EMPNO, ENAME, DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

--Natural Join
SELECT DEPTNO, EMPNO, ENAME, DNAME FROM EMP NATURAL JOIN DEPT;

SELECT EMP.DEPTNO, EMPNO, ENAME, DNAME FROM EMP NATURAL JOIN DEPT; 

--Using 조건절

--On 조건절

--On 조건절 with Where

--다중 테이블 join

--Cross Join

--Outer Join

--집합연산자
--문법 : SELECT 칼럼명1, 칼럼명2, ... FROM 테이블명1 [WHERE 조건식 ] [[GROUP BY 칼럼(Column)이나 표현식 [HAVING 그룹조건식 ] ] 집합 연산자 SELECT 칼럼명1, 칼럼명2, ... FROM 테이블명2 [WHERE 조건식 ] [[GROUP BY 칼럼(Column)이나 표현식 [HAVING 그룹조건식 ] ] [ORDER BY 1, 2 [ASC또는 DESC ] ; 
SELECT PLAYER_NAME, BACK_NO FROM PLAYER WHERE TEAM_ID = 'K02' 
    UNION SELECT PLAYER_NAME , BACK_NO FROM PLAYER WHERE TEAM_ID = 'K07' ORDER BY 1;

--집합연산자 예제
--1) K-리그 소속 선수들 중에서 소속이 삼성블루윙즈팀인 선수들과전남드레곤즈팀인 선수들에 대한 내용을 모두보고 싶다.
--1 sol) 삼성블루윙즈와 전남드래곤즈의 합집합
SELECT * FROM team; --team table 확인
SELECT * FROM player WHERE team_id = 'K07'
    UNION SELECT * FROM player WHERE team_id = 'K02';

--2) K-리그 소속 선수들 중에서 소속이 삼성블루윙즈팀인 선수들과 포지션이 골키퍼(GK)인 선수들을 모두 보고 싶다.
--2 sol) 삼성블루윙즈와 포지션의 합집합
SELECT * FROM player WHERE team_id = 'K02' 
    UNION SELECT * FROM player WHERE position='GK';
    
--3) K-리그 소속 선수들에 대한 정보 중에서 포지션별 평균키와 팀별 평균키를 알고 싶다.
--3 sol) 포지션별 평균키를 구하고, 팀별 평균키를 구해 합친다?
SELECT position,AVG(height) FROM player GROUP BY position
    UNION SELECT team_id, AVG(height) FROM player GROUP BY team_id;
--4) K-리그 소속 선수를 중에서 소속이 삼성블루윙즈팀이면서 포지션이 미드필더(MF)가 아닌 선수들의 정보를 보고 싶다.
--4 sol) 삼성블루윙즈와, 미드필더의 교집합을 구한 뒤 차집합 구한다
--SELECT * FROM player WHERE team_id = 'K02' EXCEPT SELECT * FROM player WHERE position='MF';
SELECT * FROM player WHERE team_id = 'K02' MINUS SELECT * FROM player WHERE position='MF';

--5) K-리그 소속 선수들 중에서 소속이 삼성블루윙즈팀이면서 포지션이 골키퍼(GK)인 선수들의 정보를 보고 싶다.


--계층형 질의

--셀프 조인
SELECT WORKER.ID 사원번호, WORKER.NAME 사원명, MANAGER.NAME 관리자명 FROM EMP WORKER, EMP MANAGER WHERE WORKER.MGR = MANAGER.ID;

--서브쿼리
--단일 행 서브쿼리
SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버
    FROM PLAYER
    WHERE TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '정남일')
    ORDER BY PLAYER_NAME; --'정남일'선수가 동명이인인 경우 오류 발생
SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버
    FROM PLAYER
    WHERE HEIGHT <= (SELECT AVG(HEIGHT) FROM PLAYER) ORDER BY player_name;

--다중행 서브쿼리
SELECT REGION_NAME 연고지명, TEAM_NAME 팀명, E_TEAM_NAME 영문팀명
    FROM TEAM
    WHERE TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '정현수')
    ORDER BY TEAM_NAME;--동명이인 에러 발생

SELECT REGION_NAME 연고지명, TEAM_NAME 팀명, E_TEAM_NAME 영문팀명
    FROM TEAM
    WHERE TEAM_ID IN (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '정현수')
    ORDER BY TEAM_NAME;
    
--다중 칼럼 서브쿼리
--[예제] 소속팀별 가장 키가 작은 플레이어 정보를 불러온다
SELECT TEAM_ID 팀코드, PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버, HEIGHT 키
    FROM PLAYER
    WHERE (TEAM_ID, HEIGHT) IN (SELECT TEAM_ID, MIN(HEIGHT) FROM PLAYER GROUP BY TEAM_ID)
    ORDER BY TEAM_ID, PLAYER_NAME;

--연관 서브쿼리
SELECT T.TEAM_NAME 팀명, M.PLAYER_NAME 선수명, M.POSITION 포지션, M.BACK_NO 백넘버, M.HEIGHT 키
    FROM PLAYER M, TEAM T
    WHERE M.TEAM_ID = T.TEAM_ID AND M.HEIGHT < ( SELECT AVG(S.HEIGHT) FROM PLAYER S WHERE S.TEAM_ID = M.TEAM_ID AND S.HEIGHT IS NOT NULL GROUP BY S.TEAM_ID ) ORDER BY 선수명;

--SELECT절 서브쿼리
SELECT PLAYER_NAME 선수명, HEIGHT 키, (SELECT AVG(HEIGHT)
    FROM PLAYER X
    WHERE X.TEAM_ID = P.TEAM_ID) 팀평균키
    FROM PLAYER P;
    

--VIEW 생성
CREATE VIEW V_PLAYER_TEAM
    AS SELECT P.PLAYER_NAME, P.POSITION, P.BACK_NO, P.TEAM_ID, T.TEAM_NAME
    FROM PLAYER P, TEAM T
    WHERE P.TEAM_ID = T.TEAM_ID;

CREATE VIEW V_PLAYER_TEAM_FILTER
    AS SELECT PLAYER_NAME, POSITION, BACK_NO, TEAM_NAME
    FROM V_PLAYER_TEAM
    WHERE POSITION IN ('GK', 'MF');

--VIEW조회
SELECT * FROM v_player_team;

--GROUP 함수
--STEP 1. 일반적인 GROUP BY 절 사용
--[예제] 부서명과 업무명을 기준으로 사원수와 급여 합을 집계한 일반적인 GROUP BY SQL 문장을 수행한다.
SELECT DNAME, JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal" FROM EMP, DEPT WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY DNAME, JOB;


--STEP 1-2. GROUP BY 절 + ORDER BY 절 사용
--[예제] 부서명과 업무명을 기준으로 집계한 일반적인 GROUP BY SQL 문장에 ORDER BY 절을 사용함으로써 부서, 업무별로 정렬이 이루어진다.
SELECT DNAME, JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal" FROM EMP, DEPT WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY DNAME, JOB ORDER BY DNAME, JOB;

--STEP 2. ROLLUP 함수 사용 
--[예제] 부서명과 업무명을 기준으로 집계한 일반적인 GROUP BY SQL 문장에 ROLLUP 함수를 사용한다.
SELECT DNAME, JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal" FROM EMP, DEPT WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY ROLLUP (DNAME, JOB);


--STEP 5. CUBE 함수 이용
--[예제] GROUP BY ROLLUP (DNAME, JOB) 조건에서 GROUP BY CUBE (DNAME, JOB) 조건으로 변경해서 수행한다.
SELECT CASE GROUPING(DNAME) WHEN 1 THEN 'All Departments' ELSE DNAME END AS DNAME, CASE GROUPING(JOB) WHEN 1 THEN 'All Jobs' ELSE JOB END AS JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
    FROM EMP, DEPT 
    WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY CUBE (DNAME, JOB) ;

--[예제] 일반 그룹함수를 GROUPING SETS 함수로 변경하여 부서별, JOB별 인원수와 급여 합을 구하라.
SELECT DECODE(GROUPING(DNAME), 1, 'All Departments', DNAME) AS DNAME, DECODE(GROUPING(JOB), 1, 'All Jobs', JOB) AS JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
    FROM EMP, DEPT 
    WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY GROUPING SETS (DNAME, JOB);

--WINDOW 함수
--순위 함수
--[예제] 사원 데이터에서 급여가 높은 순서와 JOB 별로 급여가 높은 순서를 같이 출력한다.
SELECT JOB, ENAME, SAL, 
    RANK( ) OVER (ORDER BY SAL DESC) ALL_RANK,
    RANK( ) OVER (PARTITION BY JOB ORDER BY SAL DESC) JOB_RANK 
    FROM EMP;
    
--[예제] 앞의 SQL문의 결과는 JOB과 SALARY 기준으로 정렬이 되어있지 않다. 새로운 SQL에서는 전체 SALARY 순위를 구하는 ALL_RANK 칼럼은 제외하고, 업무별로 SALARY 순서를 구하는 JOB_RANK만 알아보도록 한다.
SELECT JOB, ENAME, SAL, RANK() OVER (PARTITION BY JOB ORDER BY SAL DESC) JOB_RANK FROM EMP;

--집계 함수
--[예제] 사원들의 급여와 같은 매니저를 두고 있는 사원들의 SALARY 합을 구한다.
SELECT MGR, ENAME, SAL, SUM(SAL) OVER (PARTITION BY MGR) MGR_SUM FROM EMP;

--[예제] OVER 절 내에 ORDER BY 절을 추가해 파티션 내 데이터를 정렬하고 이전 SALARY 데이터까지의 누적값을 출력한다.
SELECT MGR, ENAME, SAL,
    SUM(SAL) OVER (PARTITION BY MGR ORDER BY SAL RANGE UNBOUNDED PRECEDING) as MGR_SUM
    FROM EMP;
    
--[예제] 사원들의 급여와 같은 매니저를 두고 있는 사원들의 SALARY 중 최대값을 같이 구한다.
SELECT MGR, ENAME, SAL,
    MAX(SAL) OVER (PARTITION BY MGR) as MGR_MAX
    FROM EMP;

--순서 함수

--그룹 내 비율 함수