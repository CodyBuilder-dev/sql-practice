--0. Setting
--Oracle 12c부터, user/role명앞에 c##을 붙여야 하는데, 아래의 명령어를 쓰면 안 해도 됨
alter session set "_ORACLE_SCRIPT"=true;  

--유저 권한 확인
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'SQLD';
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTED_ROLE = 'DBA';
SELECT * FROM DBA_SYS_PRIVS;

--유저 권한 설정
GRANT CREATE SESSION to c##sqld;
GRANT CREATE TABLE to c##sqld;