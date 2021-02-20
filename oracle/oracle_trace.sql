/**
 * 오라클 Trace 조회 및 사용을 위한 쿼리 모음
 */
-- 현재 Trace 사용여부 확인

------------------------ 10046 Trace ------------------------------
-- 10046 Trace 사용 시작
ALTER SESSION SET SQL_TRACE = TRUE;
ALTER SESSION SET EVENTS '10046 trace name context forever, level 12';
ALTER SESSION SET TRACEFILE_IDENTIFIER='MyFirstTrace';

-- 샘플 SQL 실행
SELECT
	EMPNO,
    JOB,
    HIREDATE,
    SAL
FROM
    SCOTT.EMP
WHERE
    SAL > 100;
   
-- Trace 사용종료 및 파일 생성
ALTER SESSION SET SQL_TRACE = FALSE;

-- 현재 세션의 Trace 파일 경로 화긴
SELECT VALUE FROM V$DIAG_INFO WHERE NAME = 'Default Trace File';

-- 현재 인스턴스의 Trace 파일 경로 확인
SELECT VALUE FROM V$DIAG_INFO WHERE NAME = 'Diag Trace';

------------------ 10053 Trace -------------------------
ALTER SESSION SET SQL_TRACE = TRUE;
alter session set events '10053 trace name context forever, level 1';
ALTER SESSION SET TRACEFILE_IDENTIFIER='MyFirstTrace10053';

-- Sample SQL
SELECT DEPTNO, EMPNO, ENAME, DNAME
FROM   SCOTT.EMP
NATURAL JOIN SCOTT.DEPT
WHERE DEPTNO = 10;

-- Trace 사용종료 및 파일 생성
ALTER SESSION SET SQL_TRACE = FALSE;

-- 현재 세션의 Trace 파일 경로 화긴
SELECT VALUE FROM V$DIAG_INFO WHERE NAME = 'Default Trace File';

select * from v$version;

select dbms_utility.get_time as cur_hsec from dual;

select trunc((dbms_utility.get_time)/100, 2)  as elapsed from dual;

select * from table(dbms_xplan.display_cursor(NULL,NULL,'allstats last -rows +predicate'));
