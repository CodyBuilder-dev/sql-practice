-- 다양한 데이터타입을 가진 테이블 생성
USE test;

CREATE TABLE test (
	i INT UNSIGNED NOT NULL auto_increment,
    j INT UNSIGNED NOT NULL,
    s VARCHAR(64) NOT NULL,
    d DATETIME NOT NULL,
    primary key(i)
);

ALTER TABLE test ADD key(j), ADD key(s), ADD key(d);

INSERT INTO test (j,s,d)
VALUES
(
	crc32(rand()),
    crc32(rand())*12345,
    date_add(now(),interval -crc32(rand())/5 second)
);


-- 2^N으로 데이터를 만들어냄
INSERT INTO test(j,s,d)
SELECT 
	crc32(rand()),
    crc32(rand())*12345,
    date_add(now(),interval -crc32(rand())/5 second)
FROM test;


