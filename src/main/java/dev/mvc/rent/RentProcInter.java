package dev.mvc.rent;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

public interface RentProcInter {

  /**
   * 등록
   * 
   * @param infoVO
   * @return
   */
  public int create(RentVO rentVO);

  /**
   * rentcargrpno별 목록
   * 
   * @param rentcargrpno
   * @return
   */
  public List<RentVO> list_by_rentcargrpno(int rentcargrpno);

  /**
   * 카테고리별 검색 목록
   * 
   * @param hashMap
   * @return
   */
  public List<RentVO> list_by_rentcargrpno_search(HashMap<String, Object> hashMap);

  /**
   * 카테고리별 검색 레코드 갯수
   * 
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);

  /**
   * 검색 + 페이징 목록
   * 
   * @return
   */
  public List<RentVO> list_by_rentcargrpno_search_paging(HashMap<String, Object> map);


  /**
   * 페이지 목록 문자열 생성, Box 형태
   * 
   * @param list_file    목록 파일명
   * @param rentcargrpno 카테고리번호 ?
   * @param search_count 검색 갯수
   * @param now_page     현재 페이지, now_page는 1부터 시작
   * @param word         검색어
   * @return
   */
  public String pagingBox(String list_file, int rentcargrpno, int search_count, int now_page, String word);
  
  
  /**
   * 검색 + 페이징 목록 (그리드)
   * 
   * @return
   */
  public List<RentVO> list_by_rentcargrpno_grid_search_paging(HashMap<String, Object> map);
  
  /**
   * 페이지 목록 문자열 생성, Box 형태(그리드)
   * 
   * @param list_file    목록 파일명
   * @param rentcargrpno 카테고리번호 
   * @param search_count 검색 갯수
   * @param now_page     현재 페이지, now_page는 1부터 시작
   * @param word         검색어
   * @return
   */
  public String pagingBox_grid(String list_file, int rentcargrpno, int search_count, int now_page, String word);

  /**
   * 일반적인 조회
   * 
   * @param RentVO
   * @return
   */
  public RentVO read(int rentno);
  
  /**
   * 텍스트 수정용 조회
   * @param contentsno
   * @return
   */
  public RentVO read_update_text(int rentno);
  
  /**
   * 텍스트 정보 수정
   * @param infoVO
   * @return
   */
  public int update_text(RentVO rentVO);
  
  /**
   * 세부정보 수정
   * @param infoVO
   * @return
   */
  public int product_update(RentVO rentVO);
  
  /**
   * 텍스트 삭제
   * @param rentno
   * @return
   */
  public int delete(int rentno);
  
  /**
   * 파일 정보 수정
   * @param rentVO
   * @return
   */
  public int update_file(RentVO rentVO);
  
  /**
   * 검색 + 페이징 목록(join)
   * @param map
   * @return
   */
  public List<Rentcargrp_RentVO> list_all_join_search_paging(HashMap<String, Object> map);
  
  /**
   * 페이지 목록 문자열 생성, join목록
   * @param list_file    목록 파일명
   * @param rentcargrpno 카테고리번호 ?
   * @param search_count 검색 갯수
   * @param now_page     현재 페이지, now_page는 1부터 시작
   * @param word         검색어
   * @return
   */
  public String pagingBox_join(String list_file, int rentcargrpno, int search_count, int now_page, String word);
  
    /**
   * 로그인된 회원 계정인지 검사합니다.
   * @param session
   * @return true: 관리자
   */
  public boolean isMember(HttpSession session);   
  
  /**
   * 로그인된 관리자인지 검사합니다.
   * @param session
   * @return true: 관리자
   */
  public boolean isAdmin(HttpSession session);   
  
  /**
   * 추천수 증가
   * @param rentno
   * @return
   */
  public int update_recom(int rentno);

}
