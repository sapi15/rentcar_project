/**********************************/
/* Table Name: 즐겨찾기 내용 */
/**********************************/
DROP TABLE bmk;

CREATE TABLE bmk(
		bmkno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '즐겨찾기 번호',
		name                          		VARCHAR(30)		 NOT NULL COMMENT '즐겨찾기 이름',
		content                       		VARCHAR(100)		 NOT NULL COMMENT '즐겨찾기 내용',
		rdate                         		DATETIME		 NOT NULL COMMENT '즐겨찾기 등록일',
		bmkgrpno                      		INT(10)		 NOT NULL COMMENT '즐겨찾기 그룹 번호',
  FOREIGN KEY (bmkgrpno) REFERENCES bmkgrp (bmkgrpno)
) COMMENT='즐겨찾기 내용';

SELECT * FROM bmkgrp ORDER BY bmkgrpno ASC;

INSERT INTO bmk(name, content, rdate, bmkgrpno)
VALUES('K3','1.6가솔린', NOW(), 1 );
INSERT INTO bmk(name, content, rdate, bmkgrpno)
VALUES('니로HEV','1.6HEV', NOW(), 1 );
INSERT INTO bmk(name, content, rdate, bmkgrpno)
VALUES('K5','1.6가솔린터보', NOW(), 2 );
INSERT INTO bmk(name, content, rdate, bmkgrpno)
VALUES('쏘렌토','1.6터보HEV', NOW(), 2 );
INSERT INTO bmk(name, content, rdate, bmkgrpno)
VALUES('K8','3.5가솔린', NOW(), 3 );
INSERT INTO bmk(name, content, rdate, bmkgrpno)
VALUES('K9','5.0가솔린 AWD', NOW(), 3 );

COMMIT;


-- 전체 목록
SELECT bmkno, name, content, rdate, bmkgrpno
FROM bmk
ORDER BY bmkno ASC;

-- 조회
SELECT bmkno, name, content, rdate, bmkgrpno
FROM bmk
WHERE bmkno = 1;

-- bmkgrp 별 목록
SELECT bmkno, name, content, rdate, bmkgrpno
FROM bmk
WHERE bmkgrpno = 1
ORDER BY bmkno ASC;

-- bmkgrp + bmk join, 연결 목록
SELECT a.bmkgrpno as g_bmkgrpno, a.name as g_name,
       b.bmkno, b.bmkgrpno, b.name, b.content, b.rdate
FROM bmkgrp a, bmk b
WHERE a.bmkgrpno =  b.bmkgrpno
ORDER BY bmkgrpno ASC, bmkno ASC;


-- 수정
UPDATE bmk
SET bmkgrpno=1, name='니로PEV', content='1.6가솔린PHEV'
WHERE bmkno = 1;

SELECT * FROM bmk;

-- 삭제
DELETE FROM bmk
WHERE bmkgrpno = 3;

SELECT * FROM bmk;

COMMIT;