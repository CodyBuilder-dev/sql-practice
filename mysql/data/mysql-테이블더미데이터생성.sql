use nodejs;
# ============ 연습용 테이블 생성 ==================
CREATE TABLE users (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    age INT UNSIGNED NOT NULL,
    married TINYINT NOT NULL,
    comment TEXT NULL,
    created_at DATETIME NOT NULL DEFAULT now(),
    PRIMARY KEY(id),
    UNIQUE INDEX name_UNIQUE (name ASC))
    COMMENT = '사용자 정보'
    DEFAULT CHARSET=utf8
    ENGINE= InnoDB;
    
CREATE TABLE comments (
	id INT NOT NULL AUTO_INCREMENT,
    commenter INT NOT NULL,
    ccomment VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT now(),
    PRIMARY KEY(id),
    INDEX commenter_idx (commenter ASC),
    CONSTRAINT commenter
    FOREIGN KEY (commenter)
    REFERENCES nodejs.users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    COMMENT = '댓글'
    DEFAULT CHARSET=utf8
    ENGINE=InnoDB;
    
# ============== 더미데이터 넣기 =====================
INSERT INTO  users (name,age,married,comment) VALUES ('nero',32,1,'자기소개2');
INSERT INTO comments (commenter, comment) VALUES (1,'안녕하세요. zero의 댓글입니다');

