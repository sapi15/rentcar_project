package dev.mvc.bmkgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.bmkgrp.BmkgrpProc")
public class BmkgrpProc implements BmkgrpProcInter {
  @Autowired
  private BmkgrpDAOInter bmkgrpDAO;
  
  public BmkgrpProc() {
    System.out.println("-> BmkgrpProc created");
  }

  @Override
  public int create(BmkgrpVO bmkgrpVO) {
    int cnt = this.bmkgrpDAO.create(bmkgrpVO);
    return cnt;
  }

  @Override
  public List<BmkgrpVO> list_bmkgrpno_asc() {
    List<BmkgrpVO> list = this.bmkgrpDAO.list_bmkgrpno_asc();
    return list;
  }

  @Override
  public BmkgrpVO read(int bmkgrpno) {
    BmkgrpVO bmkgrpVO = this.bmkgrpDAO.read(bmkgrpno);
    return bmkgrpVO;
  }

  @Override
  public int update(BmkgrpVO bmkgrpVO) {
    int cnt = this.bmkgrpDAO.update(bmkgrpVO);
    return cnt;
  }

  @Override
  public int delete(int bmkgrpno) {
    int cnt = this.bmkgrpDAO.delete(bmkgrpno);
    return cnt;
  }


}
