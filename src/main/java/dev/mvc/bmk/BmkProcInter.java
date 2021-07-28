package dev.mvc.bmk;

import java.util.List;

public interface BmkProcInter {
  
  /**
   *  등록
   * @param bmkVO
   * @return
   */
  public int create(BmkVO bmkVO);
  
  /**
   *  전체 목록
   * @return
   */
  public List<BmkVO> list_all();  
  
  /**
   *  Bmkgrp 별 목록
   * @return
   */
  public List<BmkVO> list_by_bmkgrpno(int bmkgrpno);
  
  /**
   * Bmkgrp + Bmk join, 연결 목록
   * @return
   */
  public List<Bmkgrp_BmkVO> list_all_join();
  
  /**
   *  조회, 수정
   * @param bmkno
   * @return
   */
  public BmkVO read(int bmkno);
  
  /**
   * 수정 처리 
   * @param bmkVO
   * @return
   */
  public int update(BmkVO bmkVO);
  
  /**
   * 삭제 처리 
   * @param bmkno
   * @return
   */
  public int delete(int bmkno);
  
  

}
