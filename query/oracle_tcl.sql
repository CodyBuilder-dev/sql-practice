/*트랜젝션이란?
= 여러개의 SQL문이 모여서 하나의 실행 단위로 묶이는 것
= 트랜젝션에 포함된 SQL문들은 반드시 전부 다 실행되거나, 아예 실행되지 않거나 둘중에 하나여야 함
= (앞부분은 실행되고 뒷부분은 실행되지 않는다? -> 대참사)
= 따라서 아예 실행되지 않은 경우의 BACKUP이 필요함
= 또한 중간에 깨지는 상황에 대한 대비가 필요함
*/

/*트랜젝션 제어문?
트랜젝션을 완전히 반영하거나 (COMMIT)
트랜젝션을 완전히 취소하거나 (ROLLBACK)
*/

/* 트랜젝션의 동작 
--트랜젝션 1 시작--
DML
...
TCL (COMMIT)
--트랜젝션 1 종료. 결과 반영--
--트랜젝션 2 시작--
DML
...
TCL (ROLLBACK)
--트랜젝션 2 종료. 결과 취소. 트랜젝션 1 종료시점으로 돌아감--
*/


-- 트랜젝션 0
CREATE TABLE DEPT_TCL
    AS SELECT * FROM DEPT;
    
SELECT * FROM DEPT_TCl;
-- 트랜젝션 0 종료(DDL은 AUTO COMMIT)

-- 트랜젝션 1
INSERT INTO DEPT_TCL
VALUES (50,'DATABASE','SEOUL');

UPDATE DEPT_TCL
SET LOC = 'BUSAN'
WHERE DEPTNO =40;

DELETE FROM DEPT_TCL
WHERE DNAME='RESEARCH';
 
SELECT * FROM DEPT_TCL;

-- TCL 1
ROLLBACK;

SELECT * FROM DEPT_TCL;

-- 트랜젝션 2
INSERT INTO DEPT_TCL
VALUES (50,'NETWORK','SEOUL');

UPDATE DEPT_TCL
SET LOC='BUSAN'
WHERE DEPTNO=20;

DELETE FROM DEPT_TCL
WHERE DEPTNO=40;

SELECT * FROM DEPT_TCL;

-- TCL2
COMMIT;

SELECT * FROM DEPT_TCL;

-- 세션
-- 데이터베이스에 연결하여 관련 작업을 수행하고 종료하기까지 전체 기간
-- 1접속 = 1세션
-- 세션이 이루어진 후에는 트랜젝션들을 순차적으로 수행해 나감

-- 읽기 일관성
-- 다른 세션에서는, TCL로 변경이 확정되기 전까지는 타 트랜젝션의 변경과 무관한 값만을 ㅇ릭는다