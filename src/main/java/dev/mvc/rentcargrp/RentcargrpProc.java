package dev.mvc.rentcargrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.rentcargrp.RentcargrpProc")     // 이름지정
public class RentcargrpProc implements RentcargrpProcInter {
  @Autowired  
  private RentcargrpDAOInter rentcargrpDAO;

  @Override
  public int create(RentcargrpVO rentcargrpVO) {
    int cnt = rentcargrpDAO.create(rentcargrpVO);
    return cnt;
  }

  @Override
  public List<RentcargrpVO> list_rentcargrpno_asc() {
    List<RentcargrpVO> list = this.rentcargrpDAO.list_rentcargrpno_asc();
    return list;
  }
  
  @Override
  public List<RentcargrpVO> list_seqno_asc() {
    List<RentcargrpVO> list = this.rentcargrpDAO.list_seqno_asc();
    return list;
  }

  @Override
  public RentcargrpVO read(int rentcargrpno) {
    RentcargrpVO rentcargrpVO = this.rentcargrpDAO.read(rentcargrpno);
    return rentcargrpVO;
  }

  @Override
  public int update(RentcargrpVO rentcargrpVO) {
    int cnt = this.rentcargrpDAO.update(rentcargrpVO);
    
    return cnt;
  }

  @Override
  public int delete(int rentcargrpno) {
    int cnt = this.rentcargrpDAO.delete(rentcargrpno);
    
    return cnt;
  }

  @Override
  public int update_seqno_up(int rentcargrpno) {
    int cnt = this.rentcargrpDAO.update_seqno_up(rentcargrpno);
    
    return cnt;
  }

  @Override
  public int update_seqno_down(int rentcargrpno) {
    int cnt = this.rentcargrpDAO.update_seqno_down(rentcargrpno);
    
    return cnt;
  }


  /*
   * @Override public int update_returnid(RentcargrpVO rentcargrpVO) { int cnt =
   * 0; if (rentcargrpVO.getReturnid().toUpperCase().equals("반납대기")) {
   * rentcargrpVO.setReturnid("반납완료"); } else { rentcargrpVO.setReturnid("반납대기");
   * } cnt = this.rentcargrpDAO.update_returnid(rentcargrpVO); return cnt; }
   */


  
  
}
