/**********************************/
/* Table Name: 차량분류 */
/**********************************/
DROP TABLE kindgrp;

CREATE TABLE kindgrp(
		kindgrpno                     		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '차량분류 번호',
		rentcargrpno                  		INT(10)		 NOT NULL COMMENT '렌트카 그룹 번호',
		adminno                       		INT(10)		 DEFAULT 0		 NOT NULL COMMENT '관리자 번호',
		maker                         		VARCHAR(20)		 NOT NULL COMMENT '제조사',
		carname                       		VARCHAR(20)		 NOT NULL COMMENT '차량명',
		kind                          		VARCHAR(10)		 NOT NULL COMMENT '차량분류',
		model                         		VARCHAR(100)		  NULL COMMENT '모델명',
		hp                            		VARCHAR(20)		  NULL COMMENT '마력',
		file1                         		VARCHAR(100)		 NULL  COMMENT '메인 이미지',
		file1saved                    		VARCHAR(100)		 NULL  COMMENT '실제 저장된 메인 이미지',
		thumb1                        		VARCHAR(100)		 NULL  COMMENT '메인 이미지 preview',
		size1                         		INT(10)		 DEFAULT 0		 NOT NULL COMMENT '메인 이미지 크기',
		rdate                         		DATETIME		 NOT NULL COMMENT '등록일',
		content                       		VARCHAR(4000)		 NOT NULL COMMENT '내용',
		word                          		VARCHAR(300)		 NULL  COMMENT '검색어',
		passwd                        		VARCHAR(15)		 NOT NULL COMMENT '패스워드',
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (rentcargrpno) REFERENCES rentcargrp (rentcargrpno)
) COMMENT='차량분류';


-- 참조 테이블의 데이터 조회
SELECT * FROM rentcargrp;

SELECT * FROM admin;

SELECT * FROM kindgrp;


--등록
INSERT INTO kindgrp(rentcargrpno, adminno, maker, kind, carname, model, hp, 
						file1, file1saved, thumb1, size1, rdate, content, word, passwd)
VALUES(3, 1, '기아', '중형', 'K5', '1.6가솔린터보', '180hp', 
		'car.jpg', 'car_1.jpg', 'car_t.jpg', 1000, NOW(),'내용','검색어','1234');
		
INSERT INTO kindgrp(rentcargrpno, adminno, maker, kind, carname, model, hp, 
						file1, file1saved, thumb1, size1, rdate, content, word, passwd)
VALUES(3, 1, '기아', '중형', '쏘렌토', '1.6HEV터보', '230hp', 
		'car.jpg', 'car_1.jpg', 'car_t.jpg', 1000, NOW(),'내용','검색어','1234');
		
INSERT INTO kindgrp(rentcargrpno, adminno, maker, kind, carname, model, hp, 
						file1, file1saved, thumb1, size1, rdate, content, word, passwd)
VALUES(2, 1, '기아', '소형', 'NIRO', '1.6HEV', '141hp', 
		'car.jpg', 'car_1.jpg', 'car_t.jpg', 1000, NOW(),'내용','검색어','1234');

COMMIT;


--kindgrpno 별 전체 목록
SELECT kindgrpno, rentcargrpno, adminno, maker, kind, carname, model, hp, 
		file1, file1saved, thumb1, size1, rdate, content, word, passwd
FROM kindgrp
WHERE rentcargrpno = 3
ORDER BY kindgrpno ASC;


-- rentcargrpno별 검색 목록
-- 1) 검색
SELECT kindgrpno, rentcargrpno, adminno, maker, kind, carname, model, hp, 
		file1, file1saved, thumb1, size1, rdate, content, word, passwd
FROM kindgrp
WHERE rentcargrpno=1 AND word LIKE CONCAT('%','스위스','%')
ORDER BY cinforno DESC;

-- title, content, word column search
SELECT kindgrpno, rentcargrpno, adminno, maker, kind, carname, model, hp, 
		file1, file1saved, thumb1, size1, rdate, content, word, passwd
FROM kindgrp
WHERE rentcargrpno=1 AND (kind LIKE CONCAT('%', '유럽', '%') OR 
					     		  content LIKE CONCAT('%', '유럽', '%') OR 
							     word LIKE CONCAT('%', '유럽', '%'))
ORDER BY kindgrpno DESC;


-- ② 검색 레코드 갯수
-- 전체 레코드 갯수
SELECT COUNT(*) as cnt
FROM kindgrp
WHERE rentcargrpno=1;

-- cateno 별 검색된 레코드 갯수
SELECT COUNT(*) as cnt
FROM kindgrp
WHERE rentcargrpno=1 AND word LIKE CONCAT('%', '스위스', '%');

SELECT COUNT(*) as cnt
FROM kindgrp
WHERE rentcargrpno=1 AND (kind LIKE CONCAT('%', '유럽', '%') OR 
							     content LIKE CONCAT('%', '유럽', '%') OR 
							     word LIKE CONCAT('%', '유럽', '%'));


-- 일반적 조회
SELECT kindgrpno, rentcargrpno, adminno, maker, kind, carname, model, hp, 
		 file1, file1saved, thumb1, size1, rdate, content, word, passwd
FROM kindgrp
WHERE kindgrpno = 1