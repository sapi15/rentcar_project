package dev.mvc.rentcargrp;
/*
    rentcargrpno                      INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '렌트카그룹 번호',
    seqno                             INT(7)     NOT NULL COMMENT '출력순서',
    cate                              VARCHAR(10)    NOT NULL COMMENT '카테고리',
    rdate                             DATETIME     NOT NULL COMMENT '예약날짜'
 */
public class RentcargrpVO {
  
  private int rentcargrpno;
  private int seqno;
  private String cate;
  private String rdate;
  
  
  public RentcargrpVO() {}


  public int getRentcargrpno() {
    return rentcargrpno;
  }
  public void setRentcargrpno(int rentcargrpno) {
    this.rentcargrpno = rentcargrpno;
  }

  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }

  public String getCate() {
    return cate;
  }
  public void setCate(String cate) {
    this.cate = cate;
  }

  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
  
  

  

  
}