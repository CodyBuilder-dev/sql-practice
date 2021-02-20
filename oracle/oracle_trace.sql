/**
 * ����Ŭ Trace ��ȸ �� ����� ���� ���� ����
 */
-- ���� Trace ��뿩�� Ȯ��

------------------------ 10046 Trace ------------------------------
-- 10046 Trace ��� ����
ALTER SESSION SET SQL_TRACE = TRUE;
ALTER SESSION SET EVENTS '10046 trace name context forever, level 12';
ALTER SESSION SET TRACEFILE_IDENTIFIER='MyFirstTrace';

-- ���� SQL ����
SELECT
	EMPNO,
    JOB,
    HIREDATE,
    SAL
FROM
    SCOTT.EMP
WHERE
    SAL > 100;
   
-- Trace ������� �� ���� ����
ALTER SESSION SET SQL_TRACE = FALSE;

-- ���� ������ Trace ���� ��� ȭ��
SELECT VALUE FROM V$DIAG_INFO WHERE NAME = 'Default Trace File';

-- ���� �ν��Ͻ��� Trace ���� ��� Ȯ��
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

-- Trace ������� �� ���� ����
ALTER SESSION SET SQL_TRACE = FALSE;

-- ���� ������ Trace ���� ��� ȭ��
SELECT VALUE FROM V$DIAG_INFO WHERE NAME = 'Default Trace File';

select * from v$version;

select dbms_utility.get_time as cur_hsec from dual;

select trunc((dbms_utility.get_time)/100, 2)  as elapsed from dual;

select * from table(dbms_xplan.display_cursor(NULL,NULL,'allstats last -rows +predicate'));
