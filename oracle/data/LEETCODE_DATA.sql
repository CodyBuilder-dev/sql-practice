/*
LEETCODE 코딩테스트용 테이블 및 데이터 생성 쿼리
*/

-------------- LEETCODE PERSON------------------
CREATE TABLE LEETCODE_PERSON (
    ID INT NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL
);

INSERT INTO LEETCODE_PERSON VALUES (1,'john@example.com');

INSERT INTO LEETCODE_PERSON VALUES (2,'bob@example.com');

INSERT INTO LEETCODE_PERSON VALUES (3,'john@example.com');

COMMIT;

-- 데이터 적재 확인
SELECT * FROM LEETCODE_PERSON;

---------------- HACKERRANK EMPLOYEE ----------------------
CREATE TABLE HACKER_EMPLOYEE (
    EMPLOYEE_ID INT,
    NAME VARCHAR2(50),
    MONTHS INT,
    SALARY INT
);

INSERT INTO HACKER_EMPLOYEE VALUES (12228,'Rose',15,1968);

INSERT INTO HACKER_EMPLOYEE VALUES (33645,'Angela',1,3443);

INSERT INTO HACKER_EMPLOYEE VALUES (45692,'Frank',17,1608);

INSERT INTO HACKER_EMPLOYEE VALUES (56118,'Patrick',7,1345);

INSERT INTO HACKER_EMPLOYEE VALUES (59725,'Lisa',11,2330);

INSERT INTO HACKER_EMPLOYEE VALUES (74197,'Kimberly',16,4372);

INSERT INTO HACKER_EMPLOYEE VALUES (78454,'Bonnie',8,1771);

INSERT INTO HACKER_EMPLOYEE VALUES (83565,'Michael',6,2017);

INSERT INTO HACKER_EMPLOYEE VALUES (98607,'Todd',5,3396);

INSERT INTO HACKER_EMPLOYEE VALUES (99989,'Joe',9,3573);

COMMIT;

SELECT * FROM HACKER_EMPLOYEE;


------------------ 
CREATE TABLE LEETCODE_Employee (Id int, Name varchar(255), Salary int, DepartmentId int);

CREATE TABLE LEETCODE_Department (Id int, Name varchar(255));

Truncate table LEETCODE_Employee;
Truncate table LEETCODE_Department;

insert into LEETCODE_Employee (Id, Name, Salary, DepartmentId) values ('1', 'Joe', '70000', '1');
insert into LEETCODE_Employee (Id, Name, Salary, DepartmentId) values ('2', 'Jim', '90000', '1');
insert into LEETCODE_Employee (Id, Name, Salary, DepartmentId) values ('3', 'Henry', '80000', '2');
insert into LEETCODE_Employee (Id, Name, Salary, DepartmentId) values ('4', 'Sam', '60000', '2');
insert into LEETCODE_Employee (Id, Name, Salary, DepartmentId) values ('5', 'Max', '90000', '1');
insert into LEETCODE_Department (Id, Name) values ('1', 'IT');
insert into LEETCODE_Department (Id, Name) values ('2', 'Sales');

SELECT * FROM LEETCODE_EMPLOYEE;

ROLLBACK;

COMMIT;