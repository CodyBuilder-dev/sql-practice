-- �Ƹ��� Oracle�� �ּ��� �������� ������?
-- ������ MySQL�̶� ����ϸ鼭 �ּ��� Oracle Style�̳�

-- �ܺ� ���̺� �����
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

-- �ܺ� ���̺� ������ Ȯ���ϱ�
-- ������ INSERT���� ��� �ڵ����� ���Ϸκ��� ������ �о��
SELECT * FROM names_text;



--  ���� ���̺� �����
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
