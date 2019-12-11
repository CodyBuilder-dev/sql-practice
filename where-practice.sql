/*소속팀이 삼성블루윙즈이거나 전남드래곤즈에 소속된 선수들이어야 하고, 포지션이 미드필더(MF:Midfielder)이어야 한다. 키는 170 센티미터 이상이고 180 이하여야 한다.*/
/*비교연산자*/
SELECT player_name FROM player WHERE (소속팀_id = '삼성블루윙즈' OR 소속팀_id = '전남드래곤즈') AND 포지션 = 'MF' AND height >= 170 AND height <= 180;

/*SQL연산자*/
SELECT player_name FROM player WHERE 소속팀_id IN ('삼성블루윙즈','전남드래곤즈') AND 포지션 LIKE 'MF' AND height BETWEEN 170 AND 180;

/*[예제] 사원 테이블에서 JOB이 MANAGER이면서 20번 부서에 속하거나, JOB이 CLERK이면서 30번 부서에 속하는 사원의 정보를 IN 연산자의 다중 리스트를 이용해 출력하라.*/
SELECT ENAME, JOB, DEPTNO FROM EMP WHERE (JOB, DEPTNO) IN (('MANAGER',20),('CLERK',30));

/*[예제] 사원 테이블에서 JOB이 MANAGER이거나 CLERK이고, 부서가 20번이거나 30번인 사람*/
SELECT ENAME, JOB, DEPTNO FROM EMP WHERE JOB IN ('MANAGER','CLERK') AND DEPTNO IN (20,30);

/*[예제] “장”씨 성을 가진 선수들의 정보를 조회하는 WHERE 절을 작성한다.*/
SELECT player_name FROM player WHERE player_name LIKE '장%';