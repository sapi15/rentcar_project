/**********************************/
/* Table Name: 즐겨찾기그룹 */
/**********************************/
DROP TABLE bmkgrp;

CREATE TABLE bmkgrp(
		bmkgrpno                      		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '즐겨찾기 그룹 번호',
		name                          		VARCHAR(30)		 NOT NULL COMMENT '즐겨찾기 그룹 이름',
		rdate                         		DATETIME		 NOT NULL COMMENT '즐겨찾기 그룹 등록일'
) COMMENT='즐겨찾기그룹';


--등록
INSERT INTO bmkgrp(name, rdate)
VALUES('소형',NOW());
INSERT INTO bmkgrp(name, rdate)
VALUES('중형',NOW());
INSERT INTO bmkgrp(name, rdate)
VALUES('대형',NOW());

COMMIT;

--전체 조회
SELECT bmkgrpno, name, rdate
FROM bmkgrp
ORDER BY bmkgrpno ASC;

--조회
SELECT bmkgrpno, name, rdate
FROM bmkgrp
WHERE bmkgrpno = 1;

--업데이트
UPDATE bmkgrp
SET name='경차'
WHERE bmkgrpno = 1;

--삭제
delete from bmkgrp
where bmkgrpno=2





