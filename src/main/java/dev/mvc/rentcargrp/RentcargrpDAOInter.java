package dev.mvc.rentcargrp;

import java.util.List;

public interface RentcargrpDAOInter {
  /**
   * 등록
   * 
   * @param rentcargrpVO
   * @return
   */
  public int create(RentcargrpVO rentcargrpVO);

  /**
   * 목록 순서별 목록
   * 
   * @return
   */
  public List<RentcargrpVO> list_rentcargrpno_asc();

  /**
   * 출력 순서별 목록
   * 
   * @return
   */
  public List<RentcargrpVO> list_seqno_asc();

  /**
   * 조회, 수정폼, 삭제폼
   * 
   * @param rentcargrpno 카테고리 그룹 번호, PK
   * @return
   */
  public RentcargrpVO read(int rentcargrpno);

  /**
   * 수정 처리
   * 
   * @param rentcargrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(RentcargrpVO rentcargrpVO);

  /**
   * 삭제 처리
   * 
   * @param rentcargrpno
   * @return 처리된 레코드 갯수
   */
  public int delete(int rentcargrpno);

  /**
   * 출력 순서 상향
   * 
   * @param rentcargrpno
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_up(int rentcargrpno);

  /**
   * 출력 순서 하향
   * 
   * @param rentcargrpno
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_down(int rentcargrpno);

  /*  *//**
         * returnid 수정
         * 
         * @param rentcargrpVO
         * @return
         *//*
            * public int update_returnid(RentcargrpVO rentcargrpVO);
            */

}
