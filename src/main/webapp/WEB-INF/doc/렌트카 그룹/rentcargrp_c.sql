/**********************************/
/* Table Name: 렌트카그룹 */
/**********************************/
DROP TABLE rentcargrp;

CREATE TABLE rentcargrp(
		rentcargrpno                  		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '렌트카그룹 번호',
		seqno                         		INT(7)		 NOT NULL COMMENT '출력순서',
		cate                          		VARCHAR(10)		 NOT NULL COMMENT '카테고리',
		rdate                         		DATETIME		 NOT NULL COMMENT '등록날짜'
) COMMENT='렌트카그룹';


--Create, 등록
INSERT INTO rentcargrp(seqno, cate, rdate)
VALUES(1, '경차', NOW());
INSERT INTO rentcargrp(seqno, cate, rdate)
VALUES(2, '소형', NOW());
INSERT INTO rentcargrp(seqno, cate, rdate)
VALUES(3, '중형', NOW());
INSERT INTO rentcargrp(seqno, cate, rdate)
VALUES(4, '대형', NOW());

COMMIT;


--List, 목록
SELECT rentcargrpno, seqno, userna, carna, kind, rentype, rdate, returnid
FROM rentcargrp
ORDER BY rentcargrpno ASC;

--Read, 조회
SELECT rentcargrpno, seqno, userna, carna, kind, rentype, rdate, returnid
FROM rentcargrp
WHERE rentcargrpno = 1;

--Update, 수정 
UPDATE rentcargrp
SET userna='홍길동', carna='K9', kind='대형', rentype='장기렌트'
WHERE rentcargrpno=3;

--Delete, 삭제
delete from rentcargrp
where rentcargrpno=2

select * from rentcargrp;

COMMIT;

-- 출력 순서에따른 전체 목록
SELECT rentcargrpno, seqno, userna, carna, kind, rentype, rdate, returnid
FROM rentcargrp
ORDER BY seqno ASC;
 
-- 출력 순서 올림(상향), 10 ▷ 1
UPDATE rentcargrp
SET seqno = seqno - 1
WHERE rentcargrpno = 1;
 
-- 출력순서 내림(하향), 1 ▷ 10
UPDATE rentcargrp
SET seqno = seqno + 1
WHERE rentcargrpno = 1;

COMMIT;

-- seqno 정렬
SELECT rentcargrpno, seqno, userna, carna, kind, rentype, rdate, returnid
FROM rentcargrp
ORDER BY seqno ASC;

-- 출력 모드의 변경
UPDATE rentcargrp
SET rentype='장기렌트'
WHERE rentcargrpno = 1;

SELECT * FROM rentcargrp;

UPDATE rentcargrp
SET rentype='단기렌트'
WHERE rentcargrpno = 1;

-- 출력 모드의 변경
UPDATE rentcargrp
SET returnid='반납대기'
WHERE rentcargrpno = 1;

SELECT * FROM rentcargrp;

UPDATE rentcargrp
SET returnid='반납완료'
WHERE rentcargrpno = 1;

commit;cartcart