/**
 * 오라클 통계정보 관련 쿼리
 */

SELECT TABLE_NAME, LAST_ANALYZED ,NUM_ROWS FROM USER_TABLES;


-- SQL문 ID 획득
select username, module, sql_id, substr(sql_text,1,60) sql_text
from v$sql_monitor
where 1=1
--	AND sql_exec_start >= sysdate - 1
order by sql_exec_start;

-- REALTIME SQL MONITOR 사용
select DBMS_SQLTUNE.report_sql_monitor(sql_id => '&sql_id', type=>'TEXT' , report_level => 'ALL') from dual;

-- Autotask(통계정보 자동 갱신)
SELECT * FROM DBA_AUTOTASK_CLIENT;
SELECT * FROM DBA_AUTOTASK_WINDOW_CLIENTS;
SELECT * FROM DBA_SCHEDULER_WINDOWS;