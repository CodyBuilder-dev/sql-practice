# =========== 유저 명단 및 권한 확인 ==================
# 메타데이터 데이터베이스 접근
USE MYSQL;
# 유저 테이블 확인
SELECT * FROM USER;
# 유저에 할당된 권한 보기
SHOW GRANTS FOR 'test'@'%';

# =============== 유저에 권한 추가 ==========================
GRANT ALL PRIVILEGES ON nodejs.* to 'test'@'%';

 
 