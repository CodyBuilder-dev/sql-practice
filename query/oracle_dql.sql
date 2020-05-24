/* Formatted on 2020/05/17 오후 6:15:47 (QP5 v5.360) */
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
    ADD CONSTRAINTS PRIMARY KEY (DEPTNO);

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
 -- TO_CHAR (날짜, 문자 형태, 'NLS_DATE_LANGUAGE=언어')
 -- 문자 포맷 정보는 오라클 문서 참조
 SELECT SYSDATE FROM DUAL;
 
 SELECT TO_CHAR(SYSDATE,'yy/mm/dd hh24:mi:ss') AS 현재날짜시간
    FROM DUAL;
 
SELECT SAL,
    TO_CHAR(SAL,'$99.999')
    FROM EMP;
 -- TO_NUMBER Function
 
 -- TO_DATE Function
 
 -- DECODE 함수
 
-- CHAPTER 7
-- 다중행 함수(Multiple Row Function)

-- SUM Function
-- SUM(DISTINCT/ALL)(열) OVER (분석용 문법)
SELECT SUM(SAL)
    FROM EMP;
    
SELECT SAL,SUM(SAL) -- 다중행 함수를 여러 행 출력과 함께 쓸 수 없음
    FROM EMP;

SELECT SUM(SAL),SUM(COMM)
    FROM EMP;
    
-- COUNT Function
-- COUNT (DISTINCT/ALL) (열) OVER (분석용 문법)
SELECT COUNT(*)
    FROM EMP;
    
SELECT COUNT(*)
    FROM EMP
    WHERE DEPTNO=30;
    
SELECT COUNT(COMM)
    FROM EMP;
    
-- MAX/MIN 함수
-- MAX (DISTINCT/ALL) (열) OVER (분석문법)
SELECT MAX(SAL)
    FROM EMP;
    
SELECT MIN(SAL)
    FROM EMP
    WHERE DEPTNO =10;
    
SELECT MAX(HIREDATE)
    FROM EMP
    WHERE DEPTNO=20;

SELECT MIN(HIREDATE)
    FROM EMP
    WHERE DEPTNO=20;   
    
-- AVG 함수
-- AVG (DISTINCT/ALL) (열) OVER (분석문법)
SELECT AVG(SAL)
    FROM EMP
    WHERE DEPTNO=30;
    
SELECT AVG(DISTINCT SAL)
    FROM EMP
    WHERE DEPTNO=30;
    
SELECT AVG(COMM)
    FROM EMP
    WHERE DEPTNO=30;
    
-- GROUP BY
/*
SELECT 
FROM
WHERE
GROUP BY
HAVING
*/
SELECT 10 AS DEPTNO,AVG(SAL)
    FROM EMP
    WHERE DEPTNO=10
UNION
SELECT 20 AS DEPTNO,AVG(SAL)
    FROM EMP
    WHERE DEPTNO=20
UNION
SELECT 30 AS DEPTNO,AVG(SAL)
    FROM EMP
    WHERE DEPTNO=30;

SELECT AVG(SAL),DEPTNO
    FROM EMP
    GROUP BY DEPTNO;
    
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO,JOB
    ORDER BY DEPTNO,JOB;
    
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY JOB,DEPTNO
    ORDER BY DEPTNO,JOB;
    
SELECT AVG(COMM),DEPTNO
    FROM EMP
    GROUP BY DEPTNO;
    
    
-- ROLLUP Function
-- 각 GROUP의 전체 결과를 묶어서 한 열로 출력해줌
SELECT DEPTNO,JOB,COUNT(SAL), MAX(SAL),MIN(SAL),AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO,ROLLUP(JOB);
-- CUBE Function

-- SETS Function

 -- GROUPINg Function
 
 -- CHAPTER 8
 -- 1. Multiple FROM (= Cross Join)
 -- M * N 의 결과값이 생성됨
 SELECT *
    FROM EMP,DEPT
    ORDER BY EMPNO;
 
-- 2. Multiple FROM with WHERE
-- Cross Join의 결과물 중에서 DEPTNO가 일치하는것만 출력하도록 제한
-- 이때 테이블의 Alias에는 AS를 쓰지 않음
SELECT *
    FROM EMP,DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT E.EMPNO,D.DEPTNO
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY EMPNO;
    
-- 등가 조인
-- 두 열이 등식으로 일치하는 경우
-- 이너 조인(Inner Join)과 유사
SELECT E.EMPNO,E.ENAME,D.DEPTNO,D.DNAME,D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
        AND SAL >=3000
    ORDER BY EMPNO;

-- 비등가 조인
-- 열이 등식으로 일치하는 것이 아니라, 부등식으로 범위 내에 드는 경우도 Join 가능
SELECT *
    FROM EMP E,SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
    
-- 자체 조인(Self Join)
SELECT *
    FROM EMP E1, EMP E2
    WHERE E1.EMPNO = E2.MGR;
    
-- 외부 조인(Outer Join)
-- Left Outer Join/Right Outer Join/Full Outer Join
-- 근데 보통 Outer를 제외하고 Left/Right/Full로 부름
SELECT *
    FROM EMP E1,EMP E2
    WHERE E1.MGR = E2.EMPNO(+);
    
SELECT *
    FROM EMP E1,EMP E2
    WHERE E1.MGR(+) = E2.EMPNO;

-- 3. NATURAL JOIN
-- 자동으로 이름과 자료형이 같은 열 찾아 등가 조인
-- 열이 여러개라면? -> 안 찾아봄
SELECT *
    FROM EMP E NATURAL JOIN DEPT D;

-- 4. JOIN USING
-- 역시 등가 조인 수행, 단, 문법상 열에 괄호를 써야 함
SELECT *
    FROM EMP E
    JOIN DEPT D USING (DEPTNO);

-- 5. JOIN ON
-- 역시 등가 조인
-- 가장 많이 쓰는 방식
SELECT *
    FROM EMP E
    JOIN DEPT D ON E.DEPTNO = D.DEPTNO;
    
-- 7. OUTER JOIN
SELECT *
    FROM EMP E
    LEFT JOIN DEPT D ON (E.DEPTNO = D.DEPTNO);
    
-- Q1
SELECT D.DEPTNO,DNAME,EMPNO,ENAME,SAL
    FROM DEPT D, EMP E
    WHERE D.DEPTNO = E.DEPTNO
        AND SAL >2000;
        
SELECT DEPTNO,DNAME,EMPNO,ENAME,SAL
    FROM DEPT D
        JOIN EMP E USING (DEPTNO)
    WHERE SAL >2000;

-- Q2
SELECT D.DEPTNO,D.DNAME,
    AVG(SAL) AS AVG_SAL,
    MAX(SAL) AS MAX_SAL,
    MIN(SAL) AS MIN_SAL,
    COUNT(SAL) AS CNT
    FROM DEPT D, EMP E
    WHERE D.DEPTNO = E.DEPTNO
    GROUP BY (D.DEPTNO,DNAME);
-- Q3

-- Q4
SELECT *
    FROM SALGRADE S,EMP E1
    LEFT JOIN EMP E2 ON E1.MGR = E2.EMPNO 
    JOIN DEPT D ON E1.DEPTNO = D.DEPTNO
    WHERE E1.SAL BETWEEN S.LOSAL AND S.HISAL;

-- Chapter 9
-- WHERE 절 서브쿼리
--- WHERE절에 복잡한 조건을 걸기 위해 사용
--- 단일행 서브쿼리 (Single Row Subquery)
SELECT *
    FROM EMP
    WHERE SAL > ( SELECT SAL
                    FROM EMP
                    WHERE ENAME='JONES');
                    
SELECT *
    FROM EMP
    WHERE COMM > ( SELECT COMM
                        FROM EMP
                        WHERE ENAME='ALLEN');
                        

SELECT *
    FROM EMP
    WHERE HIREDATE < (SELECT HIREDATE
                        FROM EMP
                        WHERE ENAME='SCOTT');
                        
SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
        AND E.SAL > (SELECT AVG(SAL)
                        FROM EMP);

--- 다중행 서브쿼리 (Multi Row Subquery)
-- IN
SELECT DEPTNO,MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO;

SELECT *
    FROM EMP
    WHERE SAL IN (SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);

-- ANY,SOME

-- ALL
SELECT *
    FROM EMP
    WHERE SAL > ALL (SELECT SAL
                        FROM EMP
                        WHERE DEPTNO = 30);


SELECT *
    FROM EMP
    WHERE HIREDATE < ALL (SELECT HIREDATE
                            FROM EMP
                            WHERE DEPTNO=10);
-- EXISTS
-- 서브쿼리 결과가 존재하면 메인쿼리 테이블의 모든 ROW를 선택
-- 서브쿼리 결과가 존재하지 않으면 메인쿼리 테이블의 모든 ROW를 제외
-- 사실상 WHERE절이 없는 것이나 다름없으므로 주의

--- 다중열 서브쿼리(Multi Column Subquery)
SELECT *
    FROM EMP
    WHERE (DEPTNO,SAL) IN (SELECT DEPTNO,MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);
                    
-- FROM 절 서브쿼리
--- 인라인 뷰(inline view)라고도 불림
--- 테이블이 너무 커서 FROM 절에 그냥 넣어 FULL SCAN 하기 어려운 경우
--- 테이블 내 조건에 맞는 일부 행, 일부 열만 추출한 후 별칭을 주어 사용

--- 인라인 뷰가 성능향상에 도움이 되는 케이스
--- (사실 그냥 단일테이블에 대해서 사용할 때는 큰 성능 차이가 없다)
--- 1. ROWNUM의 단점인 ORDER BY 적용불가 해결
--- 2. JOIN을 대규모로 수행할 경우 성능향상 
-- 인라인 뷰
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
        (SELECT * FROM DEPT) D
    WHERE E10.DEPTNO = D.DEPTNO;
    
-- 인라인뷰 (WITH절 사용)
/* WITH 별칭 AS ()
    SELECT 열
    FROM 별칭
    ...
*/
WITH 
    E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
    D AS (SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
    FROM E10,D
    WHERE E10.DEPTNO = D.DEPTNO;
    
-- SELECT절 서브쿼리
--- 스칼라 서브쿼리(Scalar Subquery)라고도 불림
--- 특징 : Union이 행 합치기라면, 스칼라 서브쿼리는 열 합치기
--- 핵심 장점 : 집계함수의 결과와 집계함수를 쓰지 않은 결과를 한번에 볼 수 있음. 즉 GROUP BY와 유사한 효과 가능
--- 단점 : 가독성이 매우 매우 심각하게 떨어질 수 있음. JOIN으로 할수 있으면 JOIN 쓰는게 맞음
SELECT ENAME,SAL,AVG(SAL)
    FROM EMP; -- 에러 발생!
    
SELECT ENAME,SAL, (SELECT AVG(SAL) FROM EMP) AS AVG_SAL
    FROM EMP; -- 정상 실행
    
SELECT ENAME,SAL,DEPTNO, (SELECT AVG(SAL) FROM EMP WHERE EMP.DEPTNO = E.DEPTNO) AS AVG_SAL
    FROM EMP E;
    
SELECT ENAME,
    SAL,
    DEPTNO, (SELECT AVG(SAL) FROM EMP WHERE EMP.DEPTNO = E.DEPTNO) AS DEPT_AVG_SAL,
    JOB, (SELECT AVG(SAL) FROM EMP WHERE EMP.JOB = E.JOB) AS JOB_AVG_SAL
    FROM EMP E;   
    
    