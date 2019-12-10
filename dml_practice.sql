DESC team;

INSERT INTO team (team_id,region_name,team_name,stadium_id) VALUES ("b",'aa','aaa','bbb');

SELECT * FROM team;

/*[예제] 선수 테이블에 박지성 선수의 데이터를 일부 칼럼만 입력한다.*/
DESC player;
INSERT INTO player (player_id,player_name,team_id) VALUES (2002007,'박지성','K07');

INSERT INTO PLAYER (PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, HEIGHT, WEIGHT, BACK_NO) VALUES ('2002007', '박지성', 'K07', 'MF', 178, 73, 7);
SELECT * FROM player;
/*[예제] 해당 테이블에 이청용 선수의 데이터를 입력해본다*/
INSERT INTO player VALUES (2002010,'이청용','k07','','BlueDragon',2002,'MF',17,NULL,NULL,'1',180,69);
SELECT * FROM player;

