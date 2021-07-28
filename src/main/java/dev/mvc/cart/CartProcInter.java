package dev.mvc.cart;

import java.util.List;

public interface CartProcInter {
  
  /**
   * 관심 모델 등록
   * 
   * @param cartVO
   * @return
   */
  public int create(CartVO cartVO);

  /**
   * 회원별 관심목록
   * @param memberno
   * @return
   */
  public List<CartVO> list_by_memberno(int memberno);
  
  /**
   * 삭제
   * @param cartno
   * @return
   */
  public int delete(int cartno);

}
