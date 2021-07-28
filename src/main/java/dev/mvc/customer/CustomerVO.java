package dev.mvc.customer;

/*
 *    customerno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '고객지원 번호'
) COMMENT='고객지원';
 * 
 * 
 */

public class CustomerVO {
  private int customerno;

  
  public int getCustomerno() {
    return customerno;
  }
  public void setCustomerno(int customerno) {
    this.customerno = customerno;
  }
  
  

}
