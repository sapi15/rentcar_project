/**********************************/
/* Table Name: 주문_결제 */
/**********************************/
DROP TABLE order_pay;

CREATE TABLE order_pay(
		order_payno                   		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '주문번호',
		memberno                      		INT(10)		 NOT NULL COMMENT '회원 번호',
		rname                         		VARCHAR(20)		 NULL COMMENT '동반운전자 성명',
		rtel                          		VARCHAR(14)		 NULL COMMENT '동반운전자 전화번호',
		paytype                       		INT(1)		 NOT NULL COMMENT '결제종류',
		payment                        		VARCHAR(10)		 NOT NULL COMMENT '결제금액',
		rdate                         		DATE		 NOT NULL COMMENT '결제일',
  FOREIGN KEY (memberno) REFERENCES member (memberno)
) COMMENT='주문_결제';

INSERT into order_pay(memberno, rname, rtel, paytype, payment, rdate)
VALUES(19, '홍길동', '010-1111-1111', 1, '200000',NOW())


SELECT order_payno, memberno, rname, rtel, paytype, payment, rdate
FROM	order_pay
WHERE memberno=19
ORDER BY order_payno DESC;
