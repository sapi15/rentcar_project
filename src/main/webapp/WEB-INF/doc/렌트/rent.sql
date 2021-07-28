/**********************************/
/* Table Name: 차량정보 */
/**********************************/
DROP TABLE rent;
alter table info
rename to rent;

alter table rent
rename column infono to rentno;

alter table rent
change infono to rentno;



CREATE TABLE rent(
		rentno                        		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '렌트 번호',
		rentcargrpno                  		INT(10)		 NOT NULL COMMENT '렌트카 그룹 번호',
		adminno                       		INT(10)		 DEFAULT 0		 NOT NULL COMMENT '관리자 번호',
		maker                         		VARCHAR(20)		 NOT NULL COMMENT '제조사',
		carname                       		VARCHAR(20)		 NOT NULL COMMENT '차량명',
		kind                          		VARCHAR(20)		 NOT NULL COMMENT '차량분류',
		model                         		VARCHAR(100)		 NOT NULL COMMENT '모델명',
		fuel                          		VARCHAR(20)		 NOT NULL COMMENT '연료종류',
		hp                            		VARCHAR(20)		 NOT NULL COMMENT '마력',
		cc                            		VARCHAR(20)		 NOT NULL COMMENT '배기량',
		mileage                       		VARCHAR(20)		 NOT NULL COMMENT '복합연비',
		file1                         		VARCHAR(100)		 NULL  COMMENT '메인 이미지',
		file1saved                    		VARCHAR(100)		 NULL  COMMENT '실제 저장된 메인 이미지',
		thumb1                        		VARCHAR(100)		 NULL  COMMENT '메인 이미지 preview',
		size1                         		INT(10)		 DEFAULT 0		 NULL  COMMENT '메인 이미지 크기',
		file2                         		VARCHAR(100)		 NULL  COMMENT '로고 이미지',
		file2saved                    		VARCHAR(100)		 NULL  COMMENT '실제 저장된 로고 이미지',
		thumb2                        		VARCHAR(100)		 NULL  COMMENT '로고 이미지 preview',
		size2                         		INT(10)		 DEFAULT 0 NULL  COMMENT '로고 이미지 크기',
		word                          		VARCHAR(300)		 NOT NULL COMMENT '검색어',
		contents                       		VARCHAR(4000)		 NOT NULL COMMENT '내용',
		rdate                         		DATETIME		 NOT NULL COMMENT '등록일',
		passwd                        		VARCHAR(15)		 NOT NULL COMMENT '패스워드',
		recome										INT(7)		NULL COMMENT '추천수',
	   normal_price								VARCHAR(50)		NULL COMMENT '평일가격',
		weekend_price								VARCHAR(50)		NULL COMMENT '주말가격',
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (rentcargrpno) REFERENCES rentcargrp (rentcargrpno)
) COMMENT='차량정보';


-- 참조 테이블의 데이터 조회
SELECT * FROM rentcargrp;

SELECT * FROM admin;

SELECT * FROM rent;


-- 등록
INSERT INTO rent(rentcargrpno, adminno, maker, carname, kind, model, fuel, hp, cc, mileage, file1, file1saved, thumb1, 
						size1, file2, file2saved, thumb2, size2, word, contents, rdate, passwd) 
VALUES(3, 1, '기아', 'K5', '중형', '1.6가솔린 터보', '가솔린', '180hp', '1,600cc', '13.2~13.8km/ℓ', 'car.jpg', 'car_1.jpg', 'car_t.jpg', 
       1000, 'maker.jpg', 'maker_1.jpg', 'maker_t.jpg', 300, 'K5, 중형', '중형세단', NOW(), '1234')
INSERT INTO info(rentcargrpno, adminno, maker, carname, kind, model, fuel, hp, cc, mileage, file1, file1saved, thumb1, 
						size1, file2, file2saved, thumb2, size2, word, contents, rdate, passwd) 
VALUES(3, 1, '기아', '쏘렌토', '중형', '1.6터보HEV', '하이브리드, 가솔린', '230hp', '1,600cc', '14.3~15.3km/ℓ', 'car.jpg', 'car_1.jpg', 'car_t.jpg', 
       1000, 'maker.jpg', 'maker_1.jpg', 'maker_t.jpg', 300, '쏘렌토, 중형', '중형suv', NOW(), '1234')       
       
COMMIT;



--infono 별 전체 목록
SELECT rentno, rentcargrpno, adminno, maker, carname, kind, model, fuel, hp, cc, mileage, file1, file1saved, thumb1, 
		 size1, file2, file2saved, thumb2, size2, word, contents, rdate, passwd
FROM rent
WHERE rentcargrpno = 3
ORDER BY rentno ASC;


-- rentcargrpno별 검색 목록
-- 1) 검색
SELECT rentno, rentcargrpno, adminno, maker, carname, kind, model, fuel, hp, cc, mileage, file1, file1saved, thumb1, 
		 size1, file2, file2saved, thumb2, size2, word, contents, rdate, passwd
FROM rent
WHERE rentcargrpno=1 AND word LIKE CONCAT('%','스위스','%')
ORDER BY rentno DESC;

-- title, content, word column search
SELECT rentno, rentcargrpno, adminno, maker, carname, kind, model, fuel, hp, cc, mileage, file1, file1saved, thumb1, 
		 size1, file2, file2saved, thumb2, size2, word, contents, rdate, passwd
FROM rent
WHERE rentcargrpno=1 AND (kind LIKE CONCAT('%', '유럽', '%') OR 
					     		  contents LIKE CONCAT('%', '유럽', '%') OR 
							     word LIKE CONCAT('%', '유럽', '%'))
ORDER BY rentno DESC;


-- ② 검색 레코드 갯수
-- 전체 레코드 갯수
SELECT COUNT(*) as cnt
FROM rent
WHERE rentcargrpno=1;

-- infono 별 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM rent
WHERE rentcargrpno=1 AND word LIKE CONCAT('%', '스위스', '%');

SELECT COUNT(*) as cnt
FROM rent
WHERE rentcargrpno=1 AND (kind LIKE CONCAT('%', '유럽', '%') OR 
							     contents LIKE CONCAT('%', '유럽', '%') OR 
							     word LIKE CONCAT('%', '유럽', '%'));


-- 일반적 조회
SELECT rentno, rentcargrpno, adminno, maker, carname, kind, model, fuel, hp, cc, mileage, file1, file1saved, thumb1, 
		 size1, file2, file2saved, thumb2, size2, word, contents, rdate, passwd
FROM rent
WHERE rentno = 1


-- 수정
UPDATE rent
SET maker='제조사', carname='차량명', kind='중형', model='3.5가솔린', fuel='디젤', hp='380hp', cc='3,500cc', mileage='8.1km/ℓ',
    contents='내용', word='검색어'
WHERE rentno=1;


--삭제
DELETE FROM rent
WHERE rentno = 29;

COMMIT;


-- 파일 수정
UPDATE rent
SET file1='car.jpg', file1saved='car.jpg', thumb1='car_t.jpg', size1=5000, 
    file2='car2.jpg', file2saved='car2.jpg', thumb2='car2_t.jpg', size2=5000
WHERE rentno = 41;
		 
		 
SELECT * FROM rent;
SELECT * FROM rentcargrp;

-- 전체 목록(join)
SELECT i.rentno, i.rentcargrpno, i.adminno, i.maker, i.carname,
		 i.file1, i.file1saved, i.thumb1, i.size1, i.file2, i.file2saved, i.thumb2, i.size2
FROM rentcargrp r, rent i
WHERE r.rentcargrpno= i.rentcargrpno
ORDER BY rentcargrpno ASC, rentno asc;