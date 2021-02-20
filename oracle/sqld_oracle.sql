--0. Setting/DCL(Data Control Language)
--Oracle 12c����, user/role��տ� c##�� �ٿ��� �ϴµ�, �Ʒ��� ��ɾ ���� �� �ص� ��
alter session set "_ORACLE_SCRIPT"=true;  

--���� ���� Ȯ��
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'SQLD';
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTED_ROLE = 'DBA';
SELECT * FROM DBA_SYS_PRIVS;

--���� ���� ����
GRANT CREATE SESSION to c##sqld;
GRANT CREATE TABLE to c##sqld;



--1. DDL (Data Definition Language)
--1-1. ���̺� ���� with ��������
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

--SELECT ���� ���� ���̺� ����
-- ���� ���̺� ������ ������ �� ���̺��� ���� �� ���

--1-2. ���̺� ���� ��� Ȯ��
DESCRIBE player;
DESC team;
DESCRIBE stadium;

--���̺� �������� Ȯ��                    
SELECT * FROM ALL_CONSTRAINTS A, ALL_CONS_COLUMNS B WHERE A.TABLE_NAME = "PLAYER" ORDER BY B.POSITION;

--1-3. ALTER TABLE�� �̿��� ���̺� ���� ����
--ADD COLUMN

--DROP COLUMN

--MODIFY COLUMN

--ADD CONSTRAINT

--DROP CONSTRAINT

--1-4. RENAME TABLE�� ���̺� �̸� �ٲٱ�

--1-5. DROP TABLE�� ���̺� ���ֱ�

--1-6. TRUNCATE TABLE�� ���̺� ����

--���̺� ��� ����
--SHOW tables; MySQL�� ���̺� ����. Oracle������ ���� ����
SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE='TABLE';
SELECT * FROM USER_TABLES;
SELECT * FROM TABS;


--2. DML(Data Manipulation Language)
--2-1. INSERT INTO �� ������ ����
--�⺻������ ���ٿ� ������ �ϳ���, ���� ������ �ѹ��� �������� ������ ���� �ʿ�

--�θ� ���̺�(team ���̺�) �� ����, �ڽ� ���̺�(player ���̺�)���� ������ �ϸ� ���Ἲ ���� �߻�
INSERT INTO stadium VALUES ('D01','061','792-5600');

INSERT INTO team (TEAM_ID,REGION_NAME,TEAM_NAME,STADIUM_ID) VALUES ('K07','����','�����巡����','D01');

INSERT INTO PLAYER (PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, HEIGHT, WEIGHT, BACK_NO)
            VALUES ('2002007', '������', 'K07', 'MF', 178, 73, 7);
INSERT INTO PLAYER 
            VALUES ('2002010','��û��','K07','','BlueDragon','2002','MF','17',NULL, NULL,'1',180,69);
--���ǵ��� ���� ����, ''�� ��Ÿ���ų� NUILL�� ���� �� ����.
--�ƹ��͵� �� ������ ��� �Ƿ���?

--2-2. UPDATE�� �Էµ� ������ ����
UPDATE PLAYER SET BACK_NO = 99;
UPDATE PLAYER SET POSITION = 'MF';

--2-3. DELETE FROM ���� ������ ����
DELETE from PLAYER;
DELETE team;
--2-4. SELECT FROM���� ������ �ҷ�����
SELECT * FROM player;

--3. TCL(Transaction Control Language)

--4. WHERE��

--5. �Լ�

--6. Group by, Having

--7. Order by

--8. Join
--EQUI Join
--[����] ���� ���̺�� �� ���̺��� ���� �̸��� �Ҽӵ� ���� �̸��� ����Ͻÿ�.
SELECT PLAYER.PLAYER_NAME ������, TEAM.TEAM_NAME �Ҽ����� 
    FROM PLAYER, TEAM
    WHERE PLAYER.TEAM_ID = TEAM.TEAM_ID;
SELECT PLAYER.PLAYER_NAME ������, TEAM.TEAM_NAME �Ҽ�����
    FROM PLAYER INNER JOIN TEAM ON PLAYER.TEAM_ID = TEAM.TEAM_ID;

--[����]����(PLAYER) ���̺�� ��(TEAM) ���̺��� K-���� �Ҽ� �������� �̸�, ��ѹ��� �� ������ �ҼӵǾ� �ִ� ���� �� �������� �˰� �ʹ�
SELECT PLAYER.PLAYER_NAME, PLAYER.BACK_NO, PLAYER.TEAM_ID, TEAM.TEAM_NAME, TEAM.REGION_NAME
    FROM PLAYER, TEAM WHERE PLAYER.TEAM_ID = TEAM.TEAM_ID;

SELECT PLAYER.PLAYER_NAME, PLAYER.BACK_NO, PLAYER.TEAM_ID, TEAM.TEAM_NAME, TEAM.REGION_NAME
    FROM PLAYER INNER JOIN TEAM ON PLAYER.TEAM_ID = TEAM.TEAM_ID;
    
--9. Optimizer
--Rule Based Optimizer
SELECT ENAME FROM EMP WHERE JOB = 'SALESMAN' AND SAL BETWEEN 3000 AND 6000;
SELECT * FROM EMP;
--AutoTrace �̿� �����ȹ Ȯ��
SET autotrace on;

--DBMS_XPLAN �̿� �����ȹ Ȯ��
EXPLAIN plan FOR
  SELECT ename, sal, job
    FROM emp
   WHERE sal = 3000;

SELECT *
  FROM TABLE(dbms_xplan.display);
  
  
-- Standart Join

--Inner Join
--WHERE �� JOIN ����
SELECT EMP.DEPTNO, EMPNO, ENAME, DNAME FROM EMP, DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO;
--FROM �� JOIN ����
SELECT EMP.DEPTNO, EMPNO, ENAME, DNAME FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO; 
SELECT EMP.DEPTNO, EMPNO, ENAME, DNAME FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

--Natural Join
SELECT DEPTNO, EMPNO, ENAME, DNAME FROM EMP NATURAL JOIN DEPT;

SELECT EMP.DEPTNO, EMPNO, ENAME, DNAME FROM EMP NATURAL JOIN DEPT; 

--Using ������

--On ������

--On ������ with Where

--���� ���̺� join

--Cross Join

--Outer Join

--���տ�����
--���� : SELECT Į����1, Į����2, ... FROM ���̺��1 [WHERE ���ǽ� ] [[GROUP BY Į��(Column)�̳� ǥ���� [HAVING �׷����ǽ� ] ] ���� ������ SELECT Į����1, Į����2, ... FROM ���̺��2 [WHERE ���ǽ� ] [[GROUP BY Į��(Column)�̳� ǥ���� [HAVING �׷����ǽ� ] ] [ORDER BY 1, 2 [ASC�Ǵ� DESC ] ; 
SELECT PLAYER_NAME, BACK_NO FROM PLAYER WHERE TEAM_ID = 'K02' 
    UNION SELECT PLAYER_NAME , BACK_NO FROM PLAYER WHERE TEAM_ID = 'K07' ORDER BY 1;

--���տ����� ����
--1) K-���� �Ҽ� ������ �߿��� �Ҽ��� �Ｚ����������� ������������巹�������� �����鿡 ���� ������ ��κ��� �ʹ�.
--1 sol) �Ｚ�������� �����巡������ ������
SELECT * FROM team; --team table Ȯ��
SELECT * FROM player WHERE team_id = 'K07'
    UNION SELECT * FROM player WHERE team_id = 'K02';

--2) K-���� �Ҽ� ������ �߿��� �Ҽ��� �Ｚ����������� ������� �������� ��Ű��(GK)�� �������� ��� ���� �ʹ�.
--2 sol) �Ｚ�������� �������� ������
SELECT * FROM player WHERE team_id = 'K02' 
    UNION SELECT * FROM player WHERE position='GK';
    
--3) K-���� �Ҽ� �����鿡 ���� ���� �߿��� �����Ǻ� ���Ű�� ���� ���Ű�� �˰� �ʹ�.
--3 sol) �����Ǻ� ���Ű�� ���ϰ�, ���� ���Ű�� ���� ��ģ��?
SELECT position,AVG(height) FROM player GROUP BY position
    UNION SELECT team_id, AVG(height) FROM player GROUP BY team_id;
--4) K-���� �Ҽ� ������ �߿��� �Ҽ��� �Ｚ����������̸鼭 �������� �̵��ʴ�(MF)�� �ƴ� �������� ������ ���� �ʹ�.
--4 sol) �Ｚ��������, �̵��ʴ��� �������� ���� �� ������ ���Ѵ�
--SELECT * FROM player WHERE team_id = 'K02' EXCEPT SELECT * FROM player WHERE position='MF';
SELECT * FROM player WHERE team_id = 'K02' MINUS SELECT * FROM player WHERE position='MF';

--5) K-���� �Ҽ� ������ �߿��� �Ҽ��� �Ｚ����������̸鼭 �������� ��Ű��(GK)�� �������� ������ ���� �ʹ�.


--������ ����

--���� ����
SELECT WORKER.ID �����ȣ, WORKER.NAME �����, MANAGER.NAME �����ڸ� FROM EMP WORKER, EMP MANAGER WHERE WORKER.MGR = MANAGER.ID;

--��������
--���� �� ��������
SELECT PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�
    FROM PLAYER
    WHERE TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '������')
    ORDER BY PLAYER_NAME; --'������'������ ���������� ��� ���� �߻�
SELECT PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�
    FROM PLAYER
    WHERE HEIGHT <= (SELECT AVG(HEIGHT) FROM PLAYER) ORDER BY player_name;

--������ ��������
SELECT REGION_NAME ��������, TEAM_NAME ����, E_TEAM_NAME ��������
    FROM TEAM
    WHERE TEAM_ID = (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '������')
    ORDER BY TEAM_NAME;--�������� ���� �߻�

SELECT REGION_NAME ��������, TEAM_NAME ����, E_TEAM_NAME ��������
    FROM TEAM
    WHERE TEAM_ID IN (SELECT TEAM_ID FROM PLAYER WHERE PLAYER_NAME = '������')
    ORDER BY TEAM_NAME;
    
--���� Į�� ��������
--[����] �Ҽ����� ���� Ű�� ���� �÷��̾� ������ �ҷ��´�
SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
    FROM PLAYER
    WHERE (TEAM_ID, HEIGHT) IN (SELECT TEAM_ID, MIN(HEIGHT) FROM PLAYER GROUP BY TEAM_ID)
    ORDER BY TEAM_ID, PLAYER_NAME;

--���� ��������
SELECT T.TEAM_NAME ����, M.PLAYER_NAME ������, M.POSITION ������, M.BACK_NO ��ѹ�, M.HEIGHT Ű
    FROM PLAYER M, TEAM T
    WHERE M.TEAM_ID = T.TEAM_ID AND M.HEIGHT < ( SELECT AVG(S.HEIGHT) FROM PLAYER S WHERE S.TEAM_ID = M.TEAM_ID AND S.HEIGHT IS NOT NULL GROUP BY S.TEAM_ID ) ORDER BY ������;

--SELECT�� ��������
SELECT PLAYER_NAME ������, HEIGHT Ű, (SELECT AVG(HEIGHT)
    FROM PLAYER X
    WHERE X.TEAM_ID = P.TEAM_ID) �����Ű
    FROM PLAYER P;
    

--VIEW ����
CREATE VIEW V_PLAYER_TEAM
    AS SELECT P.PLAYER_NAME, P.POSITION, P.BACK_NO, P.TEAM_ID, T.TEAM_NAME
    FROM PLAYER P, TEAM T
    WHERE P.TEAM_ID = T.TEAM_ID;

CREATE VIEW V_PLAYER_TEAM_FILTER
    AS SELECT PLAYER_NAME, POSITION, BACK_NO, TEAM_NAME
    FROM V_PLAYER_TEAM
    WHERE POSITION IN ('GK', 'MF');

--VIEW��ȸ
SELECT * FROM v_player_team;

--GROUP �Լ�
--STEP 1. �Ϲ����� GROUP BY �� ���
--[����] �μ���� �������� �������� ������� �޿� ���� ������ �Ϲ����� GROUP BY SQL ������ �����Ѵ�.
SELECT DNAME, JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal" FROM EMP, DEPT WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY DNAME, JOB;


--STEP 1-2. GROUP BY �� + ORDER BY �� ���
--[����] �μ���� �������� �������� ������ �Ϲ����� GROUP BY SQL ���忡 ORDER BY ���� ��������ν� �μ�, �������� ������ �̷������.
SELECT DNAME, JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal" FROM EMP, DEPT WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY DNAME, JOB ORDER BY DNAME, JOB;

--STEP 2. ROLLUP �Լ� ��� 
--[����] �μ���� �������� �������� ������ �Ϲ����� GROUP BY SQL ���忡 ROLLUP �Լ��� ����Ѵ�.
SELECT DNAME, JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal" FROM EMP, DEPT WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY ROLLUP (DNAME, JOB);


--STEP 5. CUBE �Լ� �̿�
--[����] GROUP BY ROLLUP (DNAME, JOB) ���ǿ��� GROUP BY CUBE (DNAME, JOB) �������� �����ؼ� �����Ѵ�.
SELECT CASE GROUPING(DNAME) WHEN 1 THEN 'All Departments' ELSE DNAME END AS DNAME, CASE GROUPING(JOB) WHEN 1 THEN 'All Jobs' ELSE JOB END AS JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
    FROM EMP, DEPT 
    WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY CUBE (DNAME, JOB) ;

--[����] �Ϲ� �׷��Լ��� GROUPING SETS �Լ��� �����Ͽ� �μ���, JOB�� �ο����� �޿� ���� ���϶�.
SELECT DECODE(GROUPING(DNAME), 1, 'All Departments', DNAME) AS DNAME, DECODE(GROUPING(JOB), 1, 'All Jobs', JOB) AS JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
    FROM EMP, DEPT 
    WHERE DEPT.DEPTNO = EMP.DEPTNO GROUP BY GROUPING SETS (DNAME, JOB);

--WINDOW �Լ�
--���� �Լ�
--[����] ��� �����Ϳ��� �޿��� ���� ������ JOB ���� �޿��� ���� ������ ���� ����Ѵ�.
SELECT JOB, ENAME, SAL, 
    RANK( ) OVER (ORDER BY SAL DESC) ALL_RANK,
    RANK( ) OVER (PARTITION BY JOB ORDER BY SAL DESC) JOB_RANK 
    FROM EMP;
    
--[����] ���� SQL���� ����� JOB�� SALARY �������� ������ �Ǿ����� �ʴ�. ���ο� SQL������ ��ü SALARY ������ ���ϴ� ALL_RANK Į���� �����ϰ�, �������� SALARY ������ ���ϴ� JOB_RANK�� �˾ƺ����� �Ѵ�.
SELECT JOB, ENAME, SAL, RANK() OVER (PARTITION BY JOB ORDER BY SAL DESC) JOB_RANK FROM EMP;

--���� �Լ�
--[����] ������� �޿��� ���� �Ŵ����� �ΰ� �ִ� ������� SALARY ���� ���Ѵ�.
SELECT MGR, ENAME, SAL, SUM(SAL) OVER (PARTITION BY MGR) MGR_SUM FROM EMP;

--[����] OVER �� ���� ORDER BY ���� �߰��� ��Ƽ�� �� �����͸� �����ϰ� ���� SALARY �����ͱ����� �������� ����Ѵ�.
SELECT MGR, ENAME, SAL,
    SUM(SAL) OVER (PARTITION BY MGR ORDER BY SAL RANGE UNBOUNDED PRECEDING) as MGR_SUM
    FROM EMP;
    
--[����] ������� �޿��� ���� �Ŵ����� �ΰ� �ִ� ������� SALARY �� �ִ밪�� ���� ���Ѵ�.
SELECT MGR, ENAME, SAL,
    MAX(SAL) OVER (PARTITION BY MGR) as MGR_MAX
    FROM EMP;

--���� �Լ�

--�׷� �� ���� �Լ�