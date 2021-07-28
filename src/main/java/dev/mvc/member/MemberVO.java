package dev.mvc.member;

/*
    memberno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '회원 번호',
    id                                VARCHAR(20)    NOT NULL COMMENT '아이디',
    passwd                            VARCHAR(30)    NOT NULL COMMENT '패스워드',
    mname                             VARCHAR(20)    NOT NULL COMMENT '성명',
    tel                               VARCHAR(13)    NOT NULL COMMENT '전화번호',
    postcode                          VARCHAR(5)     NOT NULL COMMENT '우편번호',
    address1                          VARCHAR(100)     NOT NULL COMMENT '주소1',
    address2                          VARCHAR(80)    NOT NULL COMMENT '주소2',
    mdate                             DATETIME     NOT NULL COMMENT '가입일',
    grade                             INT(3)     NOT NULL COMMENT '등급'
 * 
 */

public class MemberVO {

  int memberno;
  String id;
  String passwd;
  String mname;
  String tel;
  String email1;
  String email2;
  String email_yn;
  String postcode;
  String address1;
  String address2;
  String mdate;
  int grade;
  
  
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getMname() {
    return mname;
  }
  public void setMname(String mname) {
    this.mname = mname;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getEmail1() {
    return email1;
  }
  public void setEmail1(String email1) {
    this.email1 = email1;
  }
  public String getEmail2() {
    return email2;
  }
  public void setEmail2(String email2) {
    this.email2 = email2;
  }
  public String getEmail_yn() {
    return email_yn;
  }
  public void setEmail_yn(String email_yn) {
    this.email_yn = email_yn;
  }
  public String getPostcode() {
    return postcode;
  }
  public void setPostcode(String postcode) {
    this.postcode = postcode;
  }
  public String getAddress1() {
    return address1;
  }
  public void setAddress1(String address1) {
    this.address1 = address1;
  }
  public String getAddress2() {
    return address2;
  }
  public void setAddress2(String address2) {
    this.address2 = address2;
  }
  public String getMdate() {
    return mdate;
  }
  public void setMdate(String mdate) {
    this.mdate = mdate;
  }
  public int getGrade() {
    return grade;
  }
  public void setGrade(int grade) {
    this.grade = grade;
  }
  
  

  
  
  
}
