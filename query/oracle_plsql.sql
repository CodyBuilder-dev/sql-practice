﻿-- PL/SQL
--- Hello, PL/SQL


--- 변수
DECLARE
    V_EMPNO NUMBER(4) := 7788;
    -- V_EMPNO2 NUMBER(4) := 'SCOTT';
    V_ENAME VARCHAR(10) := 'SCOTT';
    -- V_ENAME VARCHAR(10) := 'SCOTT2';
    V_ENAME2 VARCHAR(10) := 2;
    V_ENAME3 VARCHAR(10);
    V_TAX CONSTANT NUMBER(1) :=3;
    -- V_TAX2 CONSTANT NUMBER(1);
    V_NUMBER NUMBER := 14;
    V_SCORE NUMBER := 87;
BEGIN
    -- V_ENAME4 VARCHAR(10) := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('Hello. PL/SQL'); 
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('V_ENAME : ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('V_ENAME2 : ' || V_ENAME2);
    DBMS_OUTPUT.PUT_LINE('V_ENAME3 : ' || V_ENAME3);
    -- V_TAX := 4;
    IF MOD(V_NUMBER,2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('V_NUMBER는 홀수입니다');
    ELSE
        DBMS_OUTPUT.PUT_LINE('V_NUMBER는 짝수입니다');
    END IF;
    --
    IF V_SCORE >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A학점');
    ELSIF V_SCORE >= 80 THEN
        DBMS_OUTPUT.PUT_LINE('B학점');
    ELSIF V_SCORE >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('C학점');
    ELSIF V_SCORE >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('D학점');
    ELSE
        DBMS_OUTPUT.PUT_LINE('''F학점''');
    END IF;
END;

-- 제어문
SELECT * FROM EMP;