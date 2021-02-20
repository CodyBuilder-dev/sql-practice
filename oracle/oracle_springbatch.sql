/* Spring Batch 메타데이터 테이블 조회 쿼리
* 각 테이블의 자료를 조회하고 어떤 의미의 테이블인지 정리한다
*/
SELECT * FROM ALL_TABLES WHERE OWNER ='SCOTT';

-- Unique Job Parameter별 Job Instance 이력
SELECT * FROM BATCH_JOB_INSTANCE;

-- Job Instance별 실행 및 성공/실패 이력
SELECT * FROM BATCH_JOB_EXECUTION;

-- Job Instance의 실행당시 Parameter
SELECT * FROM BATCH_JOB_EXECUTION_PARAMS;

-- 테이블 생성 완료
CREATE TABLE BOOK (
    BOOK_ID INT,
    BOOK_NAME VARCHAR2(100),
    BOOK_LOC VARCHAR2(100)
);

-- 시퀀스 생성
CREATE SEQUENCE SEQ_BOOK_ID
INCREMENT BY 1
START WITH 1
;


SELECT * FROM BOOBOOK_IDBOOK_IDBOOK_IDBOOK_IDK;