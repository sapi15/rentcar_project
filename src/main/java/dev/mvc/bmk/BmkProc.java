package dev.mvc.bmk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.bmkgrp.BmkgrpVO;
import dev.mvc.rentcargrp.RentcargrpDAOInter;

@Component("dev.mvc.bmk.BmkProc")
public class BmkProc implements BmkProcInter {
  @Autowired
  private BmkDAOInter bmkDAO;

  @Override
  public int create(BmkVO bmkVO ) {
    int cnt = this.bmkDAO.create(bmkVO);
    return cnt;
  }

  @Override
  public List<BmkVO> list_all() {
    List<BmkVO> list = this.bmkDAO.list_all();
    return list;
  }
  
  @Override
  public List<BmkVO> list_by_bmkgrpno(int bmkgrpno) {
    List<BmkVO> list = this.bmkDAO.list_by_bmkgrpno(bmkgrpno);
    return list;
  }

  @Override
  public List<Bmkgrp_BmkVO> list_all_join() {
    List<Bmkgrp_BmkVO> list = this.bmkDAO.list_all_join();
    return list;
  }

  @Override
  public BmkVO read(int bmkno) {
    BmkVO bmkVO = this.bmkDAO.read(bmkno);
    return bmkVO;
  }

  @Override
  public int update(BmkVO bmkVO) {
    int cnt = this.bmkDAO.update(bmkVO);
    return cnt;
  }

  @Override
  public int delete(int bmkno) {
    int cnt = this.bmkDAO.delete(bmkno);
    return cnt;
  }



}
