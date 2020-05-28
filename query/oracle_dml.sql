CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;

DROP TABLE DEPT_TEMP;

SELECT *
FROM DEPT_TEMP;

CREATE TABLE EMP_TEMP10
    AS SELECT * FROM EMP;
    
SELECT *
FROM EMP_TEMP10;

-- Insert문
-- INSERT INTO 테이블명 (열1,열2,열3...) VALUES (값1,값2,값3...)
INSERT INTO DEPT_TEMP (
    DEPTNO
    ,DNAME
    ,LOC
    )
VALUES (
    50
    ,'DATABASE'
    ,'SEOUL'
    );
    
SELECT * FROM DEPT_TEMP;

/*
INSERT INTO DEPT_TEMP (
    DEPTNO
    ,DNAME
    ,LOC
    )
VALUES (
    60
    ,'NETWORK'
    );
*/  
INSERT INTO DEPT_TEMP
VALUES (60,'NETWORK','BUSAN');

INSERT INTO DEPT_TEMP ( DEPTNO, DNAME, LOC)
VALUES (70,'WEB',NULL);

INSERT INTO DEPT_TEMP (DEPTNO,LOC)
VALUES (90,'INCHEON');

CREATE TABLE EMP_TEMP
    AS SELECT *
        FROM EMP
        WHERE 1 <> 1;
        
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP (
    EMPNO
    ,ENAME
    ,JOB
    ,MGR
    ,HIREDATE
    ,SAL
    ,COMM
    ,DEPTNO)  
VALUES (
    9999
    ,'홍길동'
    ,'PRESIDENT'
    ,NULL
    ,'2001/01/01'
    ,5000
    ,1000
    ,10);
    
INSERT INTO EMP_TEMP (
    EMPNO
    ,ENAME
    ,JOB
    ,MGR
    ,HIREDATE
    ,SAL
    ,COMM
    ,DEPTNO)  
VALUES (
    1111
    ,'성춘향'
    ,'MANAGER'
    ,9999
    ,'2001-01-05'
    ,4000
    ,NULL
    ,20);
    
INSERT INTO EMP_TEMP (
    EMPNO
    ,ENAME
    ,JOB
    ,MGR
    ,HIREDATE
    ,SAL
    ,COMM
    ,DEPTNO)  
VALUES (
    2111
    ,'이순신'
    ,'MANAGER'
    ,9999
    ,TO_DATE('07/01/2001', 'DD/MM/YYYY') -- 임의의 날짜 형식도 규칙에 맞게 DATE 로 인식
    ,4000
    ,NULL
    ,20);

INSERT INTO EMP_TEMP (
    EMPNO
    ,ENAME
    ,JOB
    ,MGR
    ,HIREDATE
    ,SAL
    ,COMM
    ,DEPTNO)  
VALUES (
    3111
    ,'심청이'
    ,'MANAGER'
    ,9999
    ,SYSDATE
    ,4000
    ,NULL
    ,30);

-- Insert Using Subquery
-- INSERT INTO 테이블명 (열1,열2,열3...) SELECT ...
INSERT INTO EMP_TEMP (
    EMPNO
    ,ENAME
    ,JOB
    ,MGR
    ,HIREDATE
    ,SAL
    ,COMM
    ,DEPTNO)
    SELECT E.EMPNO
        ,E.ENAME
        ,E.JOB
        ,E.MGR
        ,E.HIREDATE
        ,E.SAL
        ,E.COMM
        ,E.DEPTNO
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
        AND S.GRADE = 1;

SELECT * FROM EMP_TEMP;

-- UPDATE