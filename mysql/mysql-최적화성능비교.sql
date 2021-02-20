/**
MySQL 성능 확인 쿼리
*/

-- 데이터 예시
SELECT * FROM test ORDER BY rand() LIMIT 1;

-- ###### WHERE절 데이터타입에 따른 성능 차이 ##############
-- (1) 정수형 컬럼에 문자열 값 비교
-- rows = 1 신속히 처리됨
EXPLAIN
SELECT * FROM test
WHERE j = '3531750248';

-- (2) 문자형 컬럼에 문자열 값 비교
-- rows = 1 신속히 처리됨
EXPLAIN
SELECT * FROM test
WHERE s = '46421362783380';

-- (3) 문자형 컬럼에  정수 값 비교
-- rows = 131276으로 매우 느림
EXPLAIN
SELECT * FROM test
WHERE s = 46421362783380;

-- ###### 함수 사용에 따른 성능 차이 ##############
-- 좌변에 함수 적용
-- rows = 131020 으로 매우 느림
EXPLAIN
SELECT * FROM test
WHERE 1=1 
	AND DATE_FORMAT(d,'%Y%m%d') >= "20000101"
	AND DATE_FORMAT(d,'%Y%m%d') < "20001231"
;

-- 우변에 포맷팅 적용
-- rows = 4618로 매우 빠름
EXPLAIN
SELECT * FROM test
WHERE 1=1 
	AND d >= "2000-01-01"
	AND d <  "2000-12-31";

-- ############### LIKE