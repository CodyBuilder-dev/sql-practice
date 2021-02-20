/**
 * 쿼리 변환과 관련된 파라미터와 기록을 찾아보는 파일
 */


-- Search Type Parameter
SELECT * FROM V$PARAMETER; WHERE NAME LIKE '%_optimizer%';