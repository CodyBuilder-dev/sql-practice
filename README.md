# sql-practice
<s>5월 SQLD 시험대비를 위한 SQL문 실습 repo</s> => 시험 합격  
SQLP 대비 및 업무를 위한 SQL문 학습 repo

## repo의 구성
doit-oracle : Doit! 오라클 교재 폴더
1. data : 실습용으로 사용할 데이터베이스 및 메타데이터 DDL/DML
2. query : 실습용으로 사용할 SQL구문 파일
3. setting : 데이터베이스 내 유저 등 설정파일

## 레퍼런스 정리
### 데이터베이스 일반론
|내용|링크|
|---|---|
|(구)정보처리기사 데이터베이스 과목 총정리|[링크](https://androidtest.tistory.com/56)|

### 개발툴
|분류|내용|링크|
|---|---|---|
|Orcl Client|오라클 클라이언트 다중 설치시 트러블 슈팅|[tnsnames.ora 충돌](https://booraik.tistory.com/entry/Oracle-%EC%97%AC%EB%9F%AC-Ver%EC%9D%98-%EC%98%A4%EB%9D%BC%ED%81%B4%EC%9D%84-%EC%84%A4%EC%B9%98%ED%95%A8%EC%9C%BC%EB%A1%9C-%EC%9D%B8%ED%95%B4-%EB%82%98%EB%8A%94-%EC%B6%A9%EB%8F%8C%ED%98%84%EC%83%81)|
|Orcl Client|오라클 Listener 동작 원리|[링크](http://www.gurubee.net/lecture/2811)|
|Orcl Client|NLS_LANG의 의미|[링크](https://m.blog.naver.com/PostView.nhn?blogId=tyboss&logNo=70036575256&proxyReferer=https:%2F%2Fwww.google.com%2F)<br>[오라클 Charset 종류 및 설명](https://db.necoaki.net/134)|
|Orcl Client|캐릭터셋 충돌 해결|[서버측 Charset 확인쿼리](https://poison81.tistory.com/entry/%EC%98%A4%EB%9D%BC%ED%81%B4-%ED%95%9C%EA%B8%80%EA%B9%A8%EC%A7%90%ED%98%84%EC%83%81-%ED%95%B4%EA%B2%B0%EB%B0%A9%EB%B2%95-%ED%86%A0%EB%93%9C)|
|Orcl Client|설치시 옵션(instant client/런타임 등) 설명|[링크](https://m.blog.naver.com/PostView.nhn?blogId=iceprce&logNo=150131040553&proxyReferer=https:%2F%2Fwww.google.com%2F)|
|SQL Dev|현재 데이터베이스 세션 확인법|도구 → 세션 모니터 → STATUS 컬럼 → ACTIVE/INACTIVE 필|
|SQL Dev|SQL Developer 날짜 표기 설정|[링크](https://allmana.tistory.com/98)|
|SQL Dev|ORACLE_HOME,TNS_ADMIN 경로 설정|[링크](https://www.hyoyoung.net/88)|
|SQL Dev|SQL Developer 한글깨짐|[시스템 언어를 영어로 설정](https://dongyeopblog.wordpress.com/2016/03/16/%EC%98%A4%EB%9D%BC%ED%81%B4-sql-developer-%ED%95%9C%EA%B8%80%EA%B9%A8%EC%A7%90%EB%AC%B8%EC%A0%9C-%EC%98%81%EB%AC%B8%ED%8C%90/)|
|Toad|Toad 클라이언트 인식 문제 해결|[링크](http://blog.naver.com/PostView.nhn?blogId=icandoevery&logNo=140115580947&redirect=Dlog&widgetTypeCall=true)|
|Toad|Describe에 Comment 보이게 하기|[링크](https://zzznara2.tistory.com/180)|
|Toad|안쓰는 Connection 지우기|[링크](https://stove99.tistory.com/183)|
|Toad|단축키|[링크](https://unions5.tistory.com/39)|

### 에러 대응
|내용|링크|
|---|---|
|오라클 공백문자 char(49824)로 인한 UTF-8/EUC-KR간 인코딩 충돌 문제|[char(49824) 확인](https://babolsk.tistory.com/1037)<br>[한글인코딩간 호환성 관계](https://studyforus.tistory.com/167)<br>[비즈메시지 인코딩](https://m.blog.naver.com/PostView.nhn?blogId=mirinae_choi&logNo=220872610843&proxyReferer=https:%2F%2Fwww.google.com%2F)|
|DB Safer측 접근차단으로 인한 ORA-00990|[링크](https://pantarei.tistory.com/1351)|
|ORA-12557|[TNS 환경변수 설정](https://m.blog.naver.com/PostView.nhn?blogId=jjjhygo91&logNo=221527599370&proxyReferer=https:%2F%2Fwww.google.com%2F)|
|ORA-12154|[OS와 Toad 비트수차이로 인한 문제](https://addio3305.tistory.com/73)|

### 메타데이터
|DBMS|내용|링크|
|---|---|---|
|ORACLE| 데이터 딕셔너리의 이해|[링크](https://tocsg.tistory.com/78)|
|ORACLE| 패키지 이해|[링크](https://coding-factory.tistory.com/456)|
|ORACLE| 프로시저 조회|[링크](https://gent.tistory.com/108)|
|ORACLE| 패키지,잡스케줄 등 조회|[링크](https://m.blog.naver.com/PostView.nhn?blogId=eyekdk&logNo=60189429188&proxyReferer=https:%2F%2Fwww.google.com%2F)|
|ORACLE| V$SQL 관련뷰 조회시 주의사항|[링크](https://ukja.tistory.com/323)|
|ORACLE| V$SQL 관련뷰 컬럼|[링크](https://hyunki1019.tistory.com/42)|
|ORACLE| 쿼리 실행이력 조회|[링크](http://blog.naver.com/PostView.nhn?blogId=webmaster23&logNo=220909957416&parentCategoryNo=&categoryNo=3&viewDate=&isShowPopularPosts=false&from=postView)|
|ORACLE| 쿼리 실행시간 기록 조회|[링크](https://hellowk1.blogspot.com/2018/06/oracle-db.html) <br>[링크](https://tyboss.tistory.com/entry/Oracle-%EC%98%A4%EB%9D%BC%ED%81%B4-%EC%BF%BC%EB%A6%AC-%EC%8B%9C%EA%B0%84)|
|ORACLE| 테이블 생성시간 확인하기|[링크](etc-query/check_create_date.sql)|
|ORACLE| 권한 부여/제거/조회(USER_TAB_PRIVS_RECD) | [링크](https://m.blog.naver.com/PostView.nhn?blogId=heartflow89&logNo=221002112762&proxyReferer=https:%2F%2Fwww.google.com%2F)|
|ORACLE|V$PARAMTER 확인|[구루비 링크](http://www.gurubee.net/lecture/1860)|

### DML
|DBMS|내용|링크|
|---|---|---|
|ORACLE|UPDATE문 여러 컬럼 한번에 수행|[링크](https://dongdongfather.tistory.com/114)|

### Join
|DBMS|내용|링크|
|--|--|--|
|Oracle|(+) 조인|[링크](https://gent.tistory.com/289)|

### 함수
|DBMS|내용|링크|
|--|--|--|
|Oracle|문자열 처리 함수|[링크](https://m.blog.naver.com/PostView.nhn?blogId=c6369&logNo=220734317313&proxyReferer=https:%2F%2Fwww.google.com%2F)|

### PL/SQL & 프로시저
|DBMS|내용|링크|
|--|--|--|
|Oracle|반복문|[링크](https://coding-factory.tistory.com/452)|
|Oracle|오라클 서브프로그램|[함수와 프로시저](https://gdtbgl93.tistory.com/149)|
|Oracle|중첩 블록|[링크](https://nrhan.tistory.com/entry/PLSQL-%EA%B0%9C%EA%B4%80-2)|
|Oracle|JOB, Scheduler|[JOB 과 Scheduler 비교](https://m.blog.naver.com/PostView.nhn?blogId=tttnnn1234&logNo=220190181975&proxyReferer=https:%2F%2Fwww.google.com%2F)<br>[JOB 명령어](https://tnsgud.tistory.com/38)<br>[Scheduler 명령어](https://m.blog.naver.com/PostView.nhn?blogId=tttnnn1234&logNo=220190181975&proxyReferer=https:%2F%2Fwww.google.com%2F)|

