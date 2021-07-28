package dev.mvc.rent;

import java.util.HashMap;
import java.util.List;

public interface RentDAOInter {

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
   * 검색 + 페이징 목록 (그리드)
   * 
   * @return
   */
  public List<RentVO> list_by_rentcargrpno_grid_search_paging(HashMap<String, Object> map);

  /**
   * 일반적인 조회
   * 
   * @param RentVO
   * @return
   */
  public RentVO read(int rentno);
  
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
   * @param infono
   * @return
   */
  public int delete(int rentno);
  
  /**
   * 파일 정보 수정
   * @param infoVO
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
   * 추천수 증가
   * @param rentno
   * @return
   */
  public int update_recom(int rentno);

}
