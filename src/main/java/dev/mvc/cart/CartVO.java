package dev.mvc.cart;

/**
 *  cartno                            INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '장바구니번호',
    memberno                          INT(10)    NOT NULL COMMENT '회원 번호',
    rentno                            INT(10)    NOT NULL COMMENT '렌트번호',
    rdate                             DATETIME     NOT NULL COMMENT '날짜',
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (rentno) REFERENCES rent (rentno)

 *
 */

public class CartVO {
/*
 * SELECT c.cartno, c.memberno, c.rentno, r.maker, r.carname, r.model, r.thumb1, r.thumb2, 
     r.normal_price, r.weekend_price, c.rdate
 */
  
  /** Cart */
  private int cartno;
  private int memberno;
  private int rentno;
  private String rdate;
  
  /** rent */
  private String maker;
  private String carname;
  private String model;
  private String thumb1; // 실제 저장된 메인 이미지
  private String thumb2;  //실제 저장된 로고 이미지
  private String normal_price;
  private String weekend_price;
  
  
  public int getCartno() {
    return cartno;
  }
  public void setCartno(int cartno) {
    this.cartno = cartno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public int getRentno() {
    return rentno;
  }
  public void setRentno(int rentno) {
    this.rentno = rentno;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getMaker() {
    return maker;
  }
  public void setMaker(String maker) {
    this.maker = maker;
  }
  public String getCarname() {
    return carname;
  }
  public void setCarname(String carname) {
    this.carname = carname;
  }
  public String getModel() {
    return model;
  }
  public void setModel(String model) {
    this.model = model;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public String getThumb2() {
    return thumb2;
  }
  public void setThumb2(String thumb2) {
    this.thumb2 = thumb2;
  }
  public String getNormal_price() {
    return normal_price;
  }
  public void setNormal_price(String normal_price) {
    this.normal_price = normal_price;
  }
  public String getWeekend_price() {
    return weekend_price;
  }
  public void setWeekend_price(String weekend_price) {
    this.weekend_price = weekend_price;
  }
  
  



 

}
