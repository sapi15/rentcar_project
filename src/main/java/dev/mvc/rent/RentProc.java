package dev.mvc.rent;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.rent.RentProc")
public class RentProc implements RentProcInter {
  @Autowired
  private RentDAOInter rentDAO;

  public RentProc() {
  }

  @Override
  public int create(RentVO rentVO) {
    int cnt = this.rentDAO.create(rentVO);
    return cnt;
  }

  @Override
  public List<RentVO> list_by_rentcargrpno(int rentcargrpno) {
    List<RentVO> list = this.rentDAO.list_by_rentcargrpno(rentcargrpno);
    return list;
  }

  @Override
  public List<RentVO> list_by_rentcargrpno_search(HashMap<String, Object> hashMap) {
    List<RentVO> list = this.rentDAO.list_by_rentcargrpno_search(hashMap);

    for (RentVO rentDAO : list) { // 내용이 160자 이상이면 160자만 선택
      String contents = rentDAO.getContents();
      if (contents.length() > 160) {
        contents = contents.substring(0, 160) + "...";
        rentDAO.setContents(contents);
      }
    }
    return list;
  }

  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = this.rentDAO.search_count(hashMap);
    return count;
  }

  /**
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
   * 18 19 20 [다음]
   *
   * @param list_file    목록 파일명
   * @param rentcargrpno 카테고리번호
   * @param search_count 검색(전체) 레코드수
   * @param now_page     현재 페이지
   * @param word         검색어
   * @return 페이징 생성 문자열
   */
  @Override
  public String pagingBox(String list_file, int rentcargrpno, int search_count, int now_page, String word) {
    int total_page = (int) (Math.ceil((double) search_count / Contents.RECORD_PER_PAGE)); // 전체 페이지 수
    int total_grp = (int) (Math.ceil((double) total_page / Contents.PAGE_PER_BLOCK)); // 전체 그룹 수
    int now_grp = (int) (Math.ceil((double) now_page / Contents.PAGE_PER_BLOCK)); // 현재 그룹 번호

    // 1 group: 1 2 3
    // 2 group: 4 5 6
    // 3 group: 7 8 9
    int start_page = ((now_grp - 1) * Contents.PAGE_PER_BLOCK) + 1; // 특정 그룹의 시작 페이지
    int end_page = (now_grp * Contents.PAGE_PER_BLOCK); // 특정 그룹의 마지막 페이지

    StringBuffer str = new StringBuffer();

    str.append("<style type='text/css'>");
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}");
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
    str.append("  .span_box_1{");
    str.append("    text-align: center;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("  }");
    str.append("  .span_box_2{");
    str.append("    text-align: center;");
    str.append("    background-color: #668db4;");
    str.append("    color: #FFFFFF;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("  }");
    str.append("</style>");
    str.append("<DIV id='paging'>");
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 

    // 이전 10개 페이지로 이동
    // now_grp: 1 (1 ~ 10 page)
    // now_grp: 2 (11 ~ 20 page)
    // now_grp: 3 (21 ~ 30 page)
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
    int _now_page = (now_grp - 1) * Contents.PAGE_PER_BLOCK;
    if (now_grp >= 2) { // 현재 그룹번호가 2이상이면 이전 그룹으로 갈수 있는 링크 생성
      str.append("<span class='span_box_1'>"
          + "<A href='" + list_file + "?&word=" + word + "&now_page=" + _now_page + "&rentcargrpno=" + rentcargrpno + "'>이전</A></span>");
    }

    // 중앙의 페이지 목록
    for (int i = start_page; i <= end_page; i++) {
      if (i > total_page) { // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break;
      }

      if (now_page == i) { // 목록에 출력하는 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<span class='span_box_2'>" + i + "</span>"); // 현재 페이지, 강조
      } else {
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<span class='span_box_1'> "
            + "<A href='" + list_file + "?word=" + word + "&now_page=" + i + "&rentcargrpno=" + rentcargrpno + "'>" + i + "</A></span>");
      }
    }

    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page), nowGrp: 2 (11 ~ 20 page), nowGrp: 3 (21 ~ 30 page)
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지 21
    _now_page = (now_grp * Contents.PAGE_PER_BLOCK) + 1;
    if (now_grp < total_grp) {
      str.append("<span class='span_box_1'>"
          + "<A href='" + list_file + "?&word=" + word + "&now_page=" + _now_page + "&rentcargrpno=" + rentcargrpno + "'>다음</A></span>");
    }
    str.append("</DIV>");

    return str.toString();
  }
  
  /**
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
   * 18 19 20 [다음]
   *
   * @param list_file    목록 파일명
   * @param rentcargrpno 카테고리번호
   * @param search_count 검색(전체) 레코드수
   * @param now_page     현재 페이지
   * @param word         검색어
   * @return 페이징 생성 문자열
   */
  @Override
  public String pagingBox_grid(String list_file, int rentcargrpno, int search_count, int now_page, String word) {
    int total_page = (int) (Math.ceil((double) search_count / Contents_grid.RECORD_PER_PAGE)); // 전체 페이지 수
    int total_grp = (int) (Math.ceil((double) total_page / Contents_grid.PAGE_PER_BLOCK)); // 전체 그룹 수
    int now_grp = (int) (Math.ceil((double) now_page / Contents_grid.PAGE_PER_BLOCK)); // 현재 그룹 번호

    // 1 group: 1 2 3
    // 2 group: 4 5 6
    // 3 group: 7 8 9
    int start_page = ((now_grp - 1) * Contents_grid.PAGE_PER_BLOCK) + 1; // 특정 그룹의 시작 페이지
    int end_page = (now_grp * Contents_grid.PAGE_PER_BLOCK); // 특정 그룹의 마지막 페이지

    StringBuffer str = new StringBuffer();

    str.append("<style type='text/css'>");
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}");
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
    str.append("  .span_box_1{");
    str.append("    text-align: center;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("  }");
    str.append("  .span_box_2{");
    str.append("    text-align: center;");
    str.append("    background-color: #668db4;");
    str.append("    color: #FFFFFF;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("  }");
    str.append("</style>");
    str.append("<DIV id='paging'>");
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 

    // 이전 10개 페이지로 이동
    // now_grp: 1 (1 ~ 10 page)
    // now_grp: 2 (11 ~ 20 page)
    // now_grp: 3 (21 ~ 30 page)
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
    int _now_page = (now_grp - 1) * Contents_grid.PAGE_PER_BLOCK;
    if (now_grp >= 2) { // 현재 그룹번호가 2이상이면 이전 그룹으로 갈수 있는 링크 생성
      str.append("<span class='span_box_1'>"
          + "<A href='" + list_file + "?&word=" + word + "&now_page=" + _now_page + "&rentcargrpno=" + rentcargrpno + "'>이전</A></span>");
    }

    // 중앙의 페이지 목록
    for (int i = start_page; i <= end_page; i++) {
      if (i > total_page) { // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break;
      }

      if (now_page == i) { // 목록에 출력하는 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<span class='span_box_2'>" + i + "</span>"); // 현재 페이지, 강조
      } else {
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<span class='span_box_1'>"
            + "<A href='" + list_file + "?word=" + word + "&now_page=" + i + "&rentcargrpno=" + rentcargrpno + "'>" + i + "</A></span>");
      }
    }

    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page), nowGrp: 2 (11 ~ 20 page), nowGrp: 3 (21 ~ 30 page)
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지 21
    _now_page = (now_grp * Contents_grid.PAGE_PER_BLOCK) + 1;
    if (now_grp < total_grp) {
      str.append("<span class='span_box_1'>"
          + "<A href='" + list_file + "?&word=" + word + "&now_page=" + _now_page + "&rentcargrpno=" + rentcargrpno + "'>다음</A></span>");
    }
    str.append("</DIV>");

    return str.toString();
  }

  @Override
  public List<RentVO> list_by_rentcargrpno_search_paging(HashMap<String, Object> map) {
    /*
     * 페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작 1 페이지 시작: LIMIT 0, 10 2 페이지 시작:
     * LIMIT 10, 10 3 페이지 시작: LIMIT 20, 10
     * 
     * offset 결정, 1페이지당 출력할 레코드 갯수 10개 1 페이지 = 0 * 10: LIMIT 0, 10 2 페이지 = 1 * 10:
     * LIMIT 10, 10 3 페이지 = 2 * 10: LIMIT 20, 10
     */
    int offset = ((Integer) map.get("now_page") - 1) * Contents.RECORD_PER_PAGE;
    // System.out.println("-> offset: " + offset);

    map.put("offset", offset);
    map.put("page_size", Contents.RECORD_PER_PAGE);
    // System.out.println("-> page_size: " + Contents.RECORD_PER_PAGE);

    List<RentVO> list = this.rentDAO.list_by_rentcargrpno_search_paging(map);

    for (RentVO rentVO : list) { // 내용이 160자 이상이면 160자만 선택
      String contents = rentVO.getContents();
      if (contents.length() > 160) {
        contents = contents.substring(0, 160) + "...";
        rentVO.setContents(contents);
      }

      String carname = Tool.convertChar(rentVO.getCarname());
      rentVO.setCarname(carname);

      contents = Tool.convertChar(contents);
      rentVO.setContents(contents);
    }

    return list;
  }

  @Override
  public RentVO read(int rentno) {
    RentVO rentVO = this.rentDAO.read(rentno);

    String carname = rentVO.getCarname();
    String contents = rentVO.getContents();

    carname = Tool.convertChar(carname); // 특수 문자 처리
    rentVO.setCarname(carname);
    
    //contents = Tool.convertChar(contents); // 특수 문자 처리
    //rentVO.setContents(contents);

    long size1 = rentVO.getSize1();
    rentVO.setSize1_label(Tool.unit(size1));

    return rentVO;
  }

  @Override
  public List<RentVO> list_by_rentcargrpno_grid_search_paging(HashMap<String, Object> map) {
    /*
     * 페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작 1 페이지 시작: LIMIT 0, 10 2 페이지 시작:
     * LIMIT 10, 10 3 페이지 시작: LIMIT 20, 10
     * 
     * offset 결정, 1페이지당 출력할 레코드 갯수 10개 1 페이지 = 0 * 10: LIMIT 0, 10 2 페이지 = 1 * 10:
     * LIMIT 10, 10 3 페이지 = 2 * 10: LIMIT 20, 10
     */
    int offset = ((Integer) map.get("now_page") - 1) * Contents_grid.RECORD_PER_PAGE;
    // System.out.println("-> offset: " + offset);

    map.put("offset", offset);
    map.put("page_size", Contents_grid.RECORD_PER_PAGE);
    // System.out.println("-> page_size: " + Contents.RECORD_PER_PAGE);

    List<RentVO> list = this.rentDAO.list_by_rentcargrpno_grid_search_paging(map);

    for (RentVO rentVO : list) { // 내용이 160자 이상이면 160자만 선택
      String contents = rentVO.getContents();
      if (contents.length() > 160) {
        contents = contents.substring(0, 160) + "...";
        rentVO.setContents(contents);
      }

      String carname = Tool.convertChar(rentVO.getCarname());
      rentVO.setCarname(carname);

      contents = Tool.convertChar(contents);
      rentVO.setContents(contents);
    }

    return list;
  }

  @Override
  public RentVO read_update_text(int rentno) {
    RentVO rentVO = this.rentDAO.read(rentno);
    return rentVO;
  }
  
  @Override
  public int product_update(RentVO rentVO) {
    int cnt = this.rentDAO.product_update(rentVO);
    return cnt;
  }
  
  @Override
  public int update_text(RentVO rentVO) {
    int cnt = this.rentDAO.update_text(rentVO);
    return cnt;
  }

  @Override
  public int delete(int rentno) {
    int cnt = this.rentDAO.delete(rentno);
    return cnt;
  }

  @Override
  public int update_file(RentVO rentVO) {
    int cnt = this.rentDAO.update_file(rentVO);
    return cnt;
  }

  @Override
  public List<Rentcargrp_RentVO> list_all_join_search_paging(HashMap<String, Object> map) {
    /*
     * 페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작 1 페이지 시작: LIMIT 0, 10 2 페이지 시작:
     * LIMIT 10, 10 3 페이지 시작: LIMIT 20, 10
     * 
     * offset 결정, 1페이지당 출력할 레코드 갯수 10개 1 페이지 = 0 * 10: LIMIT 0, 10 2 페이지 = 1 * 10:
     * LIMIT 10, 10 3 페이지 = 2 * 10: LIMIT 20, 10
     */
    int offset = ((Integer) map.get("now_page") - 1) * Contents_list_all_join.RECORD_PER_PAGE;
    // System.out.println("-> offset: " + offset);

    map.put("offset", offset);
    map.put("page_size", Contents_list_all_join.RECORD_PER_PAGE);
    // System.out.println("-> page_size: " + Contents.RECORD_PER_PAGE);

    List<Rentcargrp_RentVO> list = this.rentDAO.list_all_join_search_paging(map);

    for (Rentcargrp_RentVO rentcargrp_rentVO : list) { // 내용이 160자 이상이면 160자만 선택
      String contents = rentcargrp_rentVO.getContents();
      if (contents.length() > 160) {
        contents = contents.substring(0, 160) + "...";
        rentcargrp_rentVO.setContents(contents);
      }

      String carname = Tool.convertChar(rentcargrp_rentVO.getCarname());
      rentcargrp_rentVO.setCarname(carname);

      contents = Tool.convertChar(contents);
      rentcargrp_rentVO.setContents(contents);
    }

    return list;
  }

  @Override
  public String pagingBox_join(String list_file, int rentcargrpno, int search_count, int now_page, String word) {
    int total_page = (int) (Math.ceil((double) search_count / Contents_list_all_join.RECORD_PER_PAGE)); // 전체 페이지 수
    int total_grp = (int) (Math.ceil((double) total_page / Contents_list_all_join.PAGE_PER_BLOCK)); // 전체 그룹 수
    int now_grp = (int) (Math.ceil((double) now_page / Contents_list_all_join.PAGE_PER_BLOCK)); // 현재 그룹 번호 , 올림하니까 시작 now_grp=1

    // 1 group: 1 2 3
    // 2 group: 4 5 6
    // 3 group: 7 8 9
    int start_page = ((now_grp - 1) * Contents_list_all_join.PAGE_PER_BLOCK) + 1; // 특정 그룹의 시작 페이지
    int end_page = (now_grp * Contents_list_all_join.PAGE_PER_BLOCK); // 특정 그룹의 마지막 페이지

    StringBuffer str = new StringBuffer();

    str.append("<style type='text/css'>");
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}");
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
    str.append("  .span_box_1{");
    str.append("    text-align: center;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("  }");
    str.append("  .span_box_2{");
    str.append("    text-align: center;");
    str.append("    background-color: #668db4;");
    str.append("    color: #FFFFFF;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/");
    str.append("  }");
    str.append("</style>");
    str.append("<DIV id='paging'>");
//    str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 

    // 이전 10개 페이지로 이동
    // now_grp: 1 (1 ~ 10 page)
    // now_grp: 2 (11 ~ 20 page)
    // now_grp: 3 (21 ~ 30 page)
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
    int _now_page = (now_grp - 1) * Contents_list_all_join.PAGE_PER_BLOCK;
    if (now_grp >= 2) { // 현재 그룹번호가 2이상이면 이전 그룹으로 갈수 있는 링크 생성
      str.append("<span class='span_box_1'><A href='" + list_file + "?&word=" + word + "&now_page=" + _now_page
           + "'>이전</A></span>");
    }

    // 중앙의 페이지 목록
    for (int i = start_page; i <= end_page; i++) {
      if (i > total_page) { // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break;
      }

      if (now_page == i) { // 목록에 출력하는 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<span class='span_box_2'>" + i + "</span>"); // 현재 페이지, 강조
      } else {
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<span class='span_box_1'><A href='" + list_file + "?word=" + word + "&now_page=" + i
           + "'>" + i + "</A></span>");
      }
    }

    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page), nowGrp: 2 (11 ~ 20 page), nowGrp: 3 (21 ~ 30 page)
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지 21
    _now_page = (now_grp * Contents_list_all_join.PAGE_PER_BLOCK) + 1;
    if (now_grp < total_grp) {
      str.append("<span class='span_box_1'><A href='" + list_file + "?&word=" + word + "&now_page=" + _now_page
         + "'>다음</A></span>");
    }
    str.append("</DIV>");

    return str.toString();
  }

  @Override
  public boolean isMember(HttpSession session){
    boolean sw = false; // 로그인하지 않은 것으로 초기화
    int grade = 99;
    
    // System.out.println("-> grade: " + session.getAttribute("grade"));
    if (session != null) {
      String id = (String)session.getAttribute("id");
      if (session.getAttribute("grade") != null) {
        grade = (int)session.getAttribute("grade");
      }
      
      if (id != null && grade <= 20){ // 관리자 + 회원
        sw = true;  // 로그인 한 경우
      }
    }
    
    return sw;
  }

  @Override
  public boolean isAdmin(HttpSession session) {
    boolean sw = false; // 로그인하지 않은 것으로 초기화
    int grade = 99;
    
    // System.out.println("-> grade: " + session.getAttribute("grade"));
    if (session != null) {
      String id = (String)session.getAttribute("id");
      if (session.getAttribute("grade") != null) {
        grade = (int)session.getAttribute("grade");
      }
      
      if (id != null && grade <= 10){ // 관리자
        sw = true;  // 로그인 한 경우
      }
    }
    
    return sw;
  }

  @Override
  public int update_recom(int rentno) {
    int cnt = this.rentDAO.update_recom(rentno);
    return cnt;
  }  



}
