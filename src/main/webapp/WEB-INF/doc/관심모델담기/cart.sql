/**********************************/
/* Table Name: 장바구니 */
/**********************************/
DROP TABLE cart;

CREATE TABLE cart(
		cartno                        		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '장바구니번호',
		memberno                      		INT(10)		 NOT NULL COMMENT '회원 번호',
		rentno                        		INT(10)		 NOT NULL COMMENT '렌트번호',
		rdate                         		DATETIME		 NOT NULL COMMENT '날짜',
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (rentno) REFERENCES rent (rentno)
) COMMENT='장바구니';


CREATE INDEX adminno ON rent (adminno);
CREATE INDEX rentcargrpno ON rent (rentcargrpno);

SELECT * FROM cart;
SELECT * FROM member;
SELECT * FROM rent;

--등록
INSERT INTO cart(memberno, rentno, rdate)
VALUES(7, 8, NOW())
INSERT INTO cart(memberno, rentno, rdate)
VALUES(7, 9, NOW())

COMMIT;

-- 관심목록 출력
SELECT c.cartno, c.memberno, c.rentno, r.maker, r.carname, r.model, r.thumb1, r.thumb2, 
		 r.normal_price, r.weekend_price, c.rdate
FROM cart c, rent r
WHERE c.rentno = r.rentno AND c.memberno = 7
ORDER BY cartno DESC;


--삭제
DELETE FROM cart
WHERE cartno = 3;

SELECT 