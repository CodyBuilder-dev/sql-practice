-- 아마도 Oracle과 주석이 동일하지 않을까?
-- 문법은 MySQL이랑 비슷하면서 주석은 Oracle Style이네

-- 외부 테이블 만들기
CREATE EXTERNAL TABLE IF NOT EXISTS Names_text (
	EmployeeID INT,
	FirstName STRING,
	Title STRING,
	State STRING,
	Laptop STRING
	)
	COMMENT 'Employee Names'
	ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
	STORED AS TEXTFILE
	LOCATION '/user/hive/names';

-- 외부 테이블 데이터 확인하기
-- 별도의 INSERT문이 없어도 자동으로 파일로부터 데이터 읽어옴
SELECT * FROM names_text;



--  내부 테이블 만들기
CREATE TABLE IF NOT EXISTS Names_part( 
	EmployeeID INT,
	FirstName STRING,
	Title STRING,
	Laptop STRING)
COMMENT 'Employee names partitioned by state'
PARTITIONED BY (State STRING)
STORED AS ORC;     

SELECT * FROM names_part;

DROP TABLE names_part;

INSERT
	INTO
	TABLE Names_part PARTITION(state = 'PA')
SELECT
	EmployeeID,
	FirstName,
	Title,
	Laptop
FROM
	Names_text
WHERE
	state = 'PA';
