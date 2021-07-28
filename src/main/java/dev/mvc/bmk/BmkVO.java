package dev.mvc.bmk;

/*
    bmkno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '즐겨찾기 번호',
    name                              VARCHAR(30)    NOT NULL COMMENT '즐겨찾기 이름',
    content                           VARCHAR(100)     NOT NULL COMMENT '즐겨찾기 내용',
    rdate                             DATETIME     NOT NULL COMMENT '즐겨찾기 등록일',
    bmkgrpno                          INT(10)    NOT NULL COMMENT '즐겨찾기 그룹 번호',
  FOREIGN KEY (bmkgrpno) REFERENCES bmkgrp (bmkgrpno)
*/

public class BmkVO {
  
    private int bmkno;
    private String name;
    private String content;
    private String rdate;
    private int bmkgrpno;
    
    public BmkVO() { }

    /**
     * @return the bmkno
     */
    public int getBmkno() {
      return bmkno;
    }

    /**
     * @param bmkno the bmkno to set
     */
    public void setBmkno(int bmkno) {
      this.bmkno = bmkno;
    }

    /**
     * @return the name
     */
    public String getName() {
      return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
      this.name = name;
    }

    /**
     * @return the content
     */
    public String getContent() {
      return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
      this.content = content;
    }

    /**
     * @return the rdate
     */
    public String getRdate() {
      return rdate;
    }

    /**
     * @param rdate the rdate to set
     */
    public void setRdate(String rdate) {
      this.rdate = rdate;
    }

    /**
     * @return the bmkgrpno
     */
    public int getBmkgrpno() {
      return bmkgrpno;
    }

    /**
     * @param bmkgrpno the bmkgrpno to set
     */
    public void setBmkgrpno(int bmkgrpno) {
      this.bmkgrpno = bmkgrpno;
    }

 
   
  

}
