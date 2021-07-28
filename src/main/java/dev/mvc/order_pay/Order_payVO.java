package dev.mvc.order_pay;

public class Order_payVO {
/*
 *    order_payno                       INT(10)    NOT NULL    PRIMARY KEY COMMENT '주문번호',
    memberno                          INT(10)    NOT NULL COMMENT '회원 번호',
    rname                             VARCHAR(20)    NOT NULL COMMENT '대여인 성명',
    rtel                              VARCHAR(14)    NOT NULL COMMENT '대여인 전화번호',
    paytype                           INT(1)     NOT NULL COMMENT '결제종류',
    amount                            VARCHAR(10)    NOT NULL COMMENT '결제금액',
    rdate                             DATE     NOT NULL COMMENT '결제일',
  FOREIGN KEY (memberno) REFERENCES member (memberno)
 */
  
  private int order_payno;
  private int memberno;
  private String rname;
  private String rtel;
  private int paytype;
  private String amount;
  private String rdate;
  public int getOrder_payno() {
    return order_payno;
  }
  public void setOrder_payno(int order_payno) {
    this.order_payno = order_payno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getRname() {
    return rname;
  }
  public void setRname(String rname) {
    this.rname = rname;
  }
  public String getRtel() {
    return rtel;
  }
  public void setRtel(String rtel) {
    this.rtel = rtel;
  }
  public int getPaytype() {
    return paytype;
  }
  public void setPaytype(int paytype) {
    this.paytype = paytype;
  }
  public String getAmount() {
    return amount;
  }
  public void setAmount(String amount) {
    this.amount = amount;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  

}
