/**********************************/
/* Table Name: 관리자 */
/**********************************/
DROP TABLE admin;

CREATE TABLE admin(
		adminno                       		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '관리자 번호',
		id                            		VARCHAR(20)		 NOT NULL COMMENT '아이디'
) COMMENT='관리자';

SELECT adminno, id FROM admin ORDER BY adminno ASC;

--등록
INSERT INTO admin(id)
VALUES('admin1');
INSERT INTO admin(id)
VALUES('admin2');
INSERT INTO admin(id)
VALUES('admin3');

COMMIT;
