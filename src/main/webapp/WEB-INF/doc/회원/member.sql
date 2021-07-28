/**********************************/
/* Table Name: 회원 */
/**********************************/
DROP TABLE member;

CREATE TABLE member(
		memberno INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '회원 번호',
		id VARCHAR(20) NOT NULL COMMENT '아이디',
		passwd VARCHAR(30) NOT NULL COMMENT '패스워드',
		mname VARCHAR(20) NOT NULL COMMENT '성명',
		tel VARCHAR(13) NOT NULL COMMENT '전화번호',
		email1 VARCHAR(80) COMMENT '이메일1',
		email2 VARCHAR(80) COMMENT '이메일2',
		email_yn VARCHAR(80) COMMENT '이메일수신 여부',
		postcode VARCHAR(5) COMMENT '우편번호',
		address1 VARCHAR(100) COMMENT '주소1',
		address2 VARCHAR(80) COMMENT '주소2',
		mdate DATETIME NOT NULL COMMENT '가입일',
		grade INT(3) NOT NULL COMMENT '등급'
) COMMENT='회원';

SELECT *
FROM member;

DELETE FROM member;

-- 등록
--등급(1 ~ 10: 관리자, 11~20: 회원, 비회원: 30~39, 정지 회원: 40~49)
INSERT INTO member(id, passwd, mname, tel, email1, email2, email_yn, postcode, address1, address2, mdate, grade) 
VALUES('admin','1234', '관리자', '010-1234-5678', 'admin1', 'naver.com', 'Y', '12345', '서울시 종로구', '관철동', NOW(), 1)
INSERT INTO member(id, passwd, mname, tel, email1, email2, email_yn, postcode, address1, address2, mdate, grade) 
VALUES('user1','1234', '홍길동', '010-1234-5678', 'user1', 'naver.com', 'Y', '12345', '서울시 종로구', '관철동', NOW(), 11)
INSERT INTO member(id, passwd, mname, tel, email1, email2, email_yn, postcode, address1, address2, mdate, grade) 
VALUES('user2','1234', '김길동', '010-1234-5678', 'user2', 'naver.com', 'Y', '12345', '서울시 강남구', '개포동', NOW(), 11)
INSERT INTO member(id, passwd, mname, tel, email1, email2, email_yn, postcode, address1, address2, mdate, grade) 
VALUES('user3','1234', '이길동', '010-1234-5678', 'user3', 'naver.com', 'Y', '12345', '서울시 서초구', '양재동', NOW(), 11)
INSERT INTO member(id, passwd, mname, tel, email1, email2, email_yn, postcode, address1, address2, mdate, grade) 
VALUES('user4','1234', '강길동', '010-1234-5678', 'user3', 'naver.com', 'Y', '12345', '서울시 서초구', '양재동', NOW(), 99)

COMMIT;


--목록 조회
SELECT memberno, id, passwd, mname, tel, email1, email2, postcode, address1, address2, mdate, grade
FROM member
ORDER BY memberno;

-- memberno로 회원 조회
SELECT memberno, id, passwd, mname, tel, email1, email2, postcode, address1, address2, mdate, grade
FROM member
WHERE memberno=1;

-- ID로 회원 조회
SELECT memberno, id, passwd, mname, tel, email1, email2, postcode, address1, address2, mdate, grade
FROM member
WHERE id="user2";


-- 회원정보 업데이트
UPDATE member
SET mname="최길동", tel="010-1234-5678", postcode="1234", address1="서울시 종로구", address2="2층", email1="email1", email2="email2"
WHERE memberno=5;

-- 회원정보 삭제
DELETE FROM member
WHERE memberno=12;

-- 패스워드 수정
UPDATE member
SET passwd="1111"
WHERE memberno=1;


-- 로그인
SELECT COUNT(*) as cnt
FROM member
WHERE id='user1' AND passwd='1111';











crawling