package dev.mvc.rent;
/*
    rentno                            INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '렌트 번호',
    rentcargrpno                      INT(10)    NOT NULL COMMENT '렌트카 그룹 번호',
    adminno                           INT(10)    DEFAULT 0     NOT NULL COMMENT '관리자 번호',
    maker                             VARCHAR(20)    NOT NULL COMMENT '제조사',
    carname                           VARCHAR(20)    NOT NULL COMMENT '차량명',
    kind                              VARCHAR(20)    NOT NULL COMMENT '차량분류',
    model                             VARCHAR(100)     NOT NULL COMMENT '모델명',
    fuel                              VARCHAR(20)    NOT NULL COMMENT '연료종류',
    hp                                VARCHAR(20)    NOT NULL COMMENT '마력',
    cc                                VARCHAR(20)    NOT NULL COMMENT '배기량',
    mileage                           VARCHAR(20)    NOT NULL COMMENT '복합연비',
    file1                             VARCHAR(100)     NULL  COMMENT '메인 이미지',
    file1saved                        VARCHAR(100)     NULL  COMMENT '실제 저장된 메인 이미지',
    thumb1                            VARCHAR(100)     NULL  COMMENT '메인 이미지 preview',
    size1                             INT(10)    DEFAULT 0     NULL  COMMENT '메인 이미지 크기',
    file2                             VARCHAR(100)     NULL  COMMENT '로고 이미지',
    file2saved                        VARCHAR(100)     NULL  COMMENT '실제 저장된 로고 이미지',
    thumb2                            VARCHAR(100)     NULL  COMMENT '로고 이미지 preview',
    size2                             INT(10)    DEFAULT 0 NULL  COMMENT '로고 이미지 크기',
    word                              VARCHAR(300)     NOT NULL COMMENT '검색어',
    contents                          VARCHAR(4000)    NOT NULL COMMENT '내용',
    rdate                             DATETIME     NOT NULL COMMENT '등록일',
    passwd                            VARCHAR(15)    NOT NULL COMMENT '패스워드',
    recom                             INT(7)    DEFAULT 0 NULL  COMMENT '추천수',
 */

import org.springframework.web.multipart.MultipartFile;

public class RentVO {
  
  private int rentno;
  private int rentcargrpno;
  private int adminno;
  private String maker;
  private String carname;
  private String kind;
  private String model;
  private String fuel;
  private String hp;
  private String cc;
  private String mileage;
  private String file1;
  private String file1saved;
  private String thumb1;
  private long size1;
  private String file2;
  private String file2saved;
  private String thumb2;
  private long size2;
  private String word;
  private String contents;
  private String rdate;
  private String passwd;
  private int recom;
  private int normal_price;
  private int weekend_price;
  
 
  public int getRentno() {
    return rentno;
  }
  public void setRentno(int rentno) {
    this.rentno = rentno;
  }
  public int getRentcargrpno() {
    return rentcargrpno;
  }
  public void setRentcargrpno(int rentcargrpno) {
    this.rentcargrpno = rentcargrpno;
  }
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
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
  public String getKind() {
    return kind;
  }
  public void setKind(String kind) {
    this.kind = kind;
  }
  public String getModel() {
    return model;
  }
  public void setModel(String model) {
    this.model = model;
  }
  public String getFuel() {
    return fuel;
  }
  public void setFuel(String fuel) {
    this.fuel = fuel;
  }
  public String getHp() {
    return hp;
  }
  public void setHp(String hp) {
    this.hp = hp;
  }
  public String getCc() {
    return cc;
  }
  public void setCc(String cc) {
    this.cc = cc;
  }
  public String getMileage() {
    return mileage;
  }
  public void setMileage(String mileage) {
    this.mileage = mileage;
  }
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getFile1saved() {
    return file1saved;
  }
  public void setFile1saved(String file1saved) {
    this.file1saved = file1saved;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public long getSize1() {
    return size1;
  }
  public void setSize1(long size1) {
    this.size1 = size1;
  }
  public String getFile2() {
    return file2;
  }
  public void setFile2(String file2) {
    this.file2 = file2;
  }
  public String getFile2saved() {
    return file2saved;
  }
  public void setFile2saved(String file2saved) {
    this.file2saved = file2saved;
  }
  public String getThumb2() {
    return thumb2;
  }
  public void setThumb2(String thumb2) {
    this.thumb2 = thumb2;
  }
  public long getSize2() {
    return size2;
  }
  public void setSize2(long size2) {
    this.size2 = size2;
  }
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public int getRecom() {
    return recom;
  }
  public void setRecom(int recom) {
    this.recom = recom;
  }
  public int getNormal_price() {
    return normal_price;
  }
  public void setNormal_price(int normal_price) {
    this.normal_price = normal_price;
  }
  public int getWeekend_price() {
    return weekend_price;
  }
  public void setWeekend_price(int weekend_price) {
    this.weekend_price = weekend_price;
  }


  //SQL(오라클)에 없는(테이블에 없는) 변수를 필요에 의해 추가 선언이 가능하다. ★★
   /** 
   이미지 MultipartFile 
   <input type='file' class="form-control" name='file1MF' id='file1MF' 
                    value='' placeholder="파일 선택" >
   */
  private MultipartFile file1MF;       // 파일 저장 변수, name='file1MF' 와 관련.

  public MultipartFile getFile1MF() {
    return file1MF;
  }
  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }
  
  
  private MultipartFile file2MF;       // 파일 저장 변수, name='file2MF' 와 관련.

  public MultipartFile getFile2MF() {
    return file2MF;
  }
  public void setFile2MF(MultipartFile file2mf) {
    file2MF = file2mf;
  }
  
  
  /**
   * 파일 크기 단위 출력
   */
  private String size1_label;

  public String getSize1_label() {
    return size1_label;
  }
  public void setSize1_label(String size1_label) {
    this.size1_label = size1_label;
  }
  
  
  private String size2_label;

  public String getSize2_label() {
    return size2_label;
  }
  public void setSize2_label(String size2_label) {
    this.size2_label = size2_label;
  }
  
  
  
  
  
    
  
  
  

}
