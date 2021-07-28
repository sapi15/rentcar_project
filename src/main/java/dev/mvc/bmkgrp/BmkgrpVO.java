package dev.mvc.bmkgrp;

/*
    bmkgrpno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '즐겨찾기 그룹 번호',
    name                              VARCHAR(30)    NOT NULL COMMENT '즐겨찾기 그룹 이름',
    rdate                             DATETIME     NOT NULL COMMENT '즐겨찾기 그룹 등록일'
 */

public class BmkgrpVO {
  
  private int bmkgrpno;
  private String name;
  private String rdate;
 
  public int getBmkgrpno() {
    return bmkgrpno;
  }
  public void setBmkgrpno(int bmkgrpno) {
    this.bmkgrpno = bmkgrpno;
  }

  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }

  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  

}
