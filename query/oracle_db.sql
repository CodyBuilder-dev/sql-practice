﻿/* Formatted on 2020/05/17 오후 6:15:47 (QP5 v5.360) */
-- CHAPTER 4
-- DESC 구문
DESC EMP;

DESC DEPT;

DESC SALGRADE;

-- 테이블별 제약조건 확인 구문

SELECT *
  FROM USER_CONSTRAINTS
 WHERE table_name = 'EMP';

SELECT *
  FROM USER_CONSTRAINTS
 WHERE table_name = 'DEPT';

DESC USER_CONSTRAINTS;

-- 테이블별 기본키 추가 구문 
-- ALTER TABLE 테이블명 ADD CONSTRAINTS 제약명 제약조건(컬럼);

ALTER TABLE DEPT
    ADD CONSTRAINTS primary key(DEPTNO);

ALTER TABLE DEPT
    ADD PRIMARY KEY (DEPTNO);

ALTER TABLE DEPT
    DROP PRIMARY KEY;

ALTER TABLE EMP
    ADD CONSTRAINTS test_no_pk PRIMARY KEY (EMPNO);

-- SELECT FROM 구문

SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO FROM EMP;

SELECT EMPNO, DEPTNO FROM EMP;

SELECT ENAME, SAL, SAL * 12 + COMM AS ANNSAL, COMM FROM EMP;

  SELECT *
    FROM EMP
ORDER BY SAL;

  SELECT *
    FROM EMP
ORDER BY EMPNO DESC;

-- 연습문제
-- Q2

SELECT DISTINCT JOB
  FROM EMP;

-- Q3

  SELECT EMPNO      AS EMPLOYEE_NO,
         ENAME      AS EMPLOYEE_NAME,
         MGR        AS MANAGER,
         SAL        AS SALARY,
         COMM       AS COMMISSION,
         DEPTNO     AS DEPARTMENT_NO
    FROM EMP
ORDER BY DEPTNO DESC, ENAME ASC;

-- Chapter 5

SELECT *
  FROM EMP
 WHERE DEPTNO = 30;

SELECT *
  FROM EMP
 WHERE EMPNO = 7782;

SELECT *
  FROM EMP
 WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

SELECT *
  FROM EMP
 WHERE DEPTNO = 30 AND JOB = 'Salesman';

SELECT *
  FROM EMP
 WHERE EMPNO = '7499' AND DEPTNO = '30';

SELECT *
  FROM EMP
 WHERE JOB = 'SALESMAN' OR DEPTNO = '20';

-- 연산자

SELECT *
  FROM EMP
 WHERE SAL * '12' = '36000';

SELECT *
  FROM EMP
 WHERE SAL * '12' <> '36000';

SELECT *
  FROM EMP
 WHERE JOB >= 'S';

SELECT *
  FROM EMP
 WHERE JOB = ('MANAGER', 'SALESMAN', 'ANALYST');

SELECT *
  FROM EMP
 WHERE JOB IN ('MANAGER', 'SALESMAN', 'ANALYST');

SELECT *
  FROM EMP
 WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'ANALYST');

SELECT *
  FROM EMP
 WHERE SAL BETWEEN 2000 AND 3000;

SELECT *
  FROM EMP
 WHERE SAL NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드

SELECT *
  FROM EMP
 WHERE ENAME LIKE 'S%';

SELECT *
  FROM EMP
 WHERE ENAME BETWEEN 'S' AND 'T';

SELECT *
  FROM EMP
 WHERE ENAME >= 'SA' AND ENAME <= 'SZ';

SELECT *
  FROM EMP
 WHERE COMM IS NULL;

SELECT *
  FROM EMP
 WHERE MGR IS NOT NULL;

-- 집합 연산자
-- 서로 다른 두개 SELECT문의 결과를 합집합으로 합쳐 주는 것
-- 세로로 합치기, 즉 행으로 합치기만 가능
-- 따라서 두 SELECT문 결과의 열 개수와 열 데이터타입은 같아야 함

SELECT SAL FROM EMP
UNION
SELECT SAL * 12 FROM EMP;

-- Chapter 5 연습문제
-- Q1

SELECT *
  FROM EMP
 WHERE ENAME LIKE '%S';

-- Q2

SELECT EMPNO,
       ENAME,
       JOB,
       SAL,
       DEPTNO
  FROM EMP
 WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

-- Q3

SELECT EMPNO,
       ENAME,
       SAL,
       DEPTNO
  FROM EMP
 WHERE SAL > 2000 AND DEPTNO IN (20, 30);

SELECT EMPNO,
       ENAME,
       SAL,
       DEPTNO
  FROM EMP
 WHERE SAL > 2000 AND DEPTNO = 20
UNION
SELECT EMPNO,
       ENAME,
       SAL,
       DEPTNO
  FROM EMP
 WHERE SAL > 2000 AND DEPTNO = 30;

-- Q4

-- Q5

-- Q6

-- CHAPTER 6
-- Single Row Function
-- UPPER, LOWER, INITCAP

SELECT ENAME, UPPER (ENAME), LOWER (ENAME), INITCAP (ENAME) FROM EMP;

SELECT *
  FROM EMP
 WHERE ENAME = 'scott';

SELECT *
  FROM EMP
 WHERE UPPER (ENAME) = UPPER ('scott');

SELECT UPPER (ENAME) FROM EMP;

SELECT ENAME, LENGTH (ENAME) FROM EMP;

SELECT ENAME, LENGTH (ENAME)
  FROM EMP
 WHERE LENGTH (ENAME) >= 5;

SELECT SAL, LENGTH (SAL) FROM EMP;

-- LENGTHB Function

SELECT ENAME, LENGTH (ENAME), LENGTHB (ENAME) FROM EMP;

SELECT SAL, LENGTH (SAL), LENGTHB (SAL) FROM EMP;

SELECT *
  FROM EMP
 WHERE LENGTH (JOB) >= 6;

SELECT LENGTH ('코디빌더'), LENGTHB ('코디빌더') FROM DUAL;

SELECT LENGTH ('꽕'), LENGTHB ('꽕') FROM DUAL;

-- SUBSTR Function
-- SUBSTR

SELECT JOB, SUBSTR (JOB, 1, 2), SUBSTR (JOB, 3, 2), SUBSTR (JOB, 5) FROM EMP;

SELECT JOB, SUBSTR (JOB, -3) FROM EMP;

SELECT SUBSTR (ENAME, 3) FROM EMP;

-- INSTR Function
-- INSTR(대상 문자열, 부분 문자열, 탐색시작 위치, 몇번째)

SELECT INSTR ('HELLO, HELLO. ORACLE!,''HELL', 1, 2) FROM DUAL;

SELECT SUBSTR ('HELLO, HELLO. ORACLE!',
               INSTR ('HELLO, HELLO. ORACLE!',
                      'HELL',
                      1,
                      2))
  FROM DUAL;

-- REPLACE Function
-- REPLACE(문자열,찾는 문자, 대체할 문자)

SELECT '02-3397-1234'                         AS REPLACE_BEFORE,
       REPLACE ('02-3397-1234', '-', '/')     AS REPLACE_OTHER,
       REPLACE ('02-3397-1234', '-')          AS REPLACE_REMOVE
  FROM DUAL;

-- LPAD Function
-- LPAD(문자열, 요구 자리수, 채울 문자)
-- RPAD(문자열, 요구 자리수, 채울 문자)

SELECT 'Oracle',
       LPAD ('Oracle', 10, '#')     AS LPAD,
       LPAD ('Oracle', 10)          AS LPAD,
       RPAD ('Oracle', 10, '#')     AS RPAD,
       RPAD ('Oracle', 10)          AS RPAD
  FROM DUAL;

SELECT RPAD (SUBSTR ('930301-1234567', 1, INSTR ('930301-1234567', '-')),
             14,
             '*')
  FROM DUAL;

-- CONCAT
-- 

SELECT CONCAT (EMPNO, ENAME), CONCAT (EMPNO, CONCAT (':', ENAME))
  FROM EMP
 WHERE ENAME = 'SCOTT';


-- TRIM, LTRIM, RTRIM
-- TRIM (옵션 , 문자) FROM (원본 문자열)

SELECT TRIM (BOTH FROM ' _ _ O r a  c l e _ _ '),
       LENGTH (TRIM (BOTH FROM ' _ _ O r a  c l e _ _ ')),
       LENGTH (' _ _ O r a  c l e _ _ ')
  FROM DUAL;

-- ROUND Function
-- ROUND(숫자, 위치)
-- 위치는 0은 소수점 첫째자리, 1부터는 소수점위치, 음수는 자연수위치

SELECT ROUND (1234.5678)         AS ROUND,
       ROUND (1234.5678, 0)      AS ROUND,
       ROUND (1234.5678, 1)      AS ROUND,
       ROUND (1234.5678, -1)     AS ROUND,
       ROUND (1234.5678, -2)     AS ROUND
  FROM DUAL;

SELECT SAL, ROUND (SAL, -1) FROM EMP;

-- TRUNC Function
-- TRUNC(숫자,위치)

SELECT TRUNC (1234.5678)         AS TRUNC,
       TRUNC (1234.5678, 0)      AS TRUNC,
       TRUNC (1234.5678, 1)      AS TRUNC,
       TRUNC (1234.5678, -1)     AS TRUNC,
       TRUNC (1234.5678, -2)     AS TRUNC
  FROM DUAL;

-- CEIL/FLOOR Function
-- Ceil : 가장 가까운 큰 정수
-- Floor : 가장 가까운 작은 정수
-- Ceil (숫자)
SELECT CEIL('3.14'),
    CEIL('-3.14'),
    FLOOR('3.14'),
    FLOOR('-3.14')
    FROM DUAL;

-- MOD Function
-- MOD (나누어질 수, 나눌 수)
SELECT MOD(1023123,24) FROM DUAL; 

/* 날짜의 사칙연산
날짜 + 숫자
날짜 - 숫자
날짜 - 날짜
날짜 + 날짜 (X)
*/

-- SYSDATE
-- 오라클 데이터베이스 내 OS의 시간
SELECT SYSDATE,
    SYSDATE +1,
    SYSDATE -1
    FROM DUAL;
    
-- ADD_MONTHS Function
-- ADD_MONTHS(날짜,개월수)
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE,3)
    FROM DUAL;

SELECT EMPNO,ENAME,HIREDATE,ADD_MONTHS(HIREDATE,120)
    FROM EMP
    WHERE ADD_MONTHS(HIREDATE,120) > SYSDATE;
    
-- MONTHS_BETWEEN Function
-- MONTHS_BETWEEN(날짜1,날짜2)
-- 날짜 1 - 날짜 2
SELECT HIREDATE,
    HIREDATE+7,
    ADD_MONTHS(HIREDATE,6),
    MONTHS_BETWEEN(HIREDATE,HIREDATE+7),
    MONTHS_BETWEEN(HIREDATE,ADD_MONTHS(HIREDATE,6)),
    MONTHS_BETWEEN(ADD_MONTHS(HIREDATE,6),HIREDATE)
    FROM EMP;
    
 -- ROUND, TRUNC Function
 -- ROUND(날짜, 반올림 포맷)
 -- TRUNC(날짜, 내림 포맷)
 
 
 -- 자료형 함수
 DESC EMP;
 
 -- TO_CHAR Function
 
 -- TO_NUMBER Function
 
 -- TO_DATE Function
 