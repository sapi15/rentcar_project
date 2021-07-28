package dev.mvc.bmkgrp;

import java.util.List;

public interface BmkgrpDAOInter {
  
  /**
   * 등록
   * @param bmkgrpVO
   * @return
   */
  public int create(BmkgrpVO bmkgrpVO);
  
  /**
   * 등록 순서별 목록
   * @return
   */
  public List<BmkgrpVO> list_bmkgrpno_asc();
  
  /**
   *  조회, 수정
   * @param bmkgrpno
   * @return
   */
  public BmkgrpVO read(int bmkgrpno);
  
  /**
   * 수정 처리
   * @param bmkgrpVO
   * @return
   */
  public int update(BmkgrpVO bmkgrpVO);
  
  /**
   * 삭제 처리 
   * @param bmkgrpno
   * @return
   */
  public int delete(int bmkgrpno);
  


}
