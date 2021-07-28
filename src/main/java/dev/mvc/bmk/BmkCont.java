package dev.mvc.bmk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.bmkgrp.BmkgrpProcInter;
import dev.mvc.bmkgrp.BmkgrpVO;

@Controller
public class BmkCont {
  @Autowired
  @Qualifier("dev.mvc.bmkgrp.BmkgrpProc")     
  private BmkgrpProcInter bmkgrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.bmk.BmkProc")
  private BmkProcInter bmkProc;
  
  /**
   * 새로고침 방지
   * @return
   */
  @RequestMapping(value="/bmk/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/bmk/" + url); // forward
    
    return mav; // forward
  }
  
  // http://localhost:9092/bmk/create.do?bmkgrpno=1
  /**
   * 등록 폼
   * 
   * @return
   */
  @RequestMapping(value = "/bmk/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/bmk/create");

    return mav; // forward
  }
  
  /**
   * 등록처리
   * http://localhost:9092/bmk/create.do?bmkgrpno=1
   * 
   * @return
   */
  @RequestMapping(value = "/bmk/create.do", method = RequestMethod.POST)
  public ModelAndView create(BmkVO bmkVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.bmkProc.create(bmkVO);
    mav.addObject("cnt", cnt);
    mav.addObject("bmkgrpno", bmkVO.getBmkgrpno());
    mav.addObject("name",bmkVO.getName());     // create_msg 의 parm.name 관련.
    mav.addObject("contents", bmkVO.getContent());
    mav.addObject("url", "create_msg");  // /cargrp/create_msg -> /cargrp/create_msg.jsp로 최종 실행됨.
    
    mav.setViewName("redirect:/bmk/msg.do");
    //mav.setViewName("/bmk/msg.do");
    
    return mav;
  }
  
    // http://localhost:9092/bmk/list_all.do?rentcargrpno=1 기존의 url 사용
    /**
    * 전체 목록
    * @return
    */
   @RequestMapping(value="/bmk/list_all.do", method=RequestMethod.GET )
   public ModelAndView list_all() {
     ModelAndView mav = new ModelAndView();
  
     List<BmkVO> list = this.bmkProc.list_all();
     mav.addObject("list", list); // request.setAttribute("list", list);
  
     mav.setViewName("/bmk/list_all"); 
     return mav;
   }
  
   // http://localhost:9092/bmk/list_by_rentcargrpno.do?rentcargrpno=1 
   /**
   * Bmkgrp별 전체 목록
   * @return
   */
  @RequestMapping(value="/bmk/list_by_bmkgrpno.do", method=RequestMethod.GET )
  public ModelAndView list_by_bmkgrpno(int bmkgrpno) {
    ModelAndView mav = new ModelAndView();
  
    List<BmkVO> list = this.bmkProc.list_by_bmkgrpno(bmkgrpno);
    mav.addObject("list", list); // request.setAttribute("list", list);
    
    BmkgrpVO  bmkgrpVO = bmkgrpProc.read(bmkgrpno); // Rentcargrp  정보
    mav.addObject("bmkgrpVO", bmkgrpVO); 
  
    mav.setViewName("/bmk/list_by_bmkgrpno"); 
    return mav;
  }
  
  /**
   * Bmkgrp + Bmk join, 연결 목록
   * http://localhost:9092/bmk/list_all_join.do 
   * @return
   */
  @RequestMapping(value="/bmk/list_all_join.do", method=RequestMethod.GET )
  public ModelAndView list_all_join() {
    ModelAndView mav = new ModelAndView();
    
    List<Bmkgrp_BmkVO> list = this.bmkProc.list_all_join();
    mav.addObject("list", list); // request.setAttribute("list", list);
  
    mav.setViewName("/bmk/list_all_join"); 
    return mav;
  }
  
  /**
   * 조회 + 수정폼 http://localhost:9092/bmk/read_update.do
   * 
   * @return
   */
@RequestMapping(value = "/bmk/read_update.do", method = RequestMethod.GET)
public ModelAndView read_update(int bmkno, int bmkgrpno) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/bmk/read_update"); // read_update.jsp
  
  BmkgrpVO  bmkgrpVO = this.bmkgrpProc.read(bmkgrpno);
  mav.addObject("bmkgrpVO", bmkgrpVO);
  
  BmkVO bmkVO = this.bmkProc.read(bmkno);
  mav.addObject("bmkVO", bmkVO);           // request.setAttribute("cateVO",cateVO);       // 객체 저장

  List<BmkVO> list = this.bmkProc.list_by_bmkgrpno(bmkgrpno);
  mav.addObject("list", list);

  return mav; // forward
}

/**
 * 수정 처리
 * 
 * @param cateVO
 * @return
 */
@RequestMapping(value = "/bmk/update.do", method = RequestMethod.POST)
public ModelAndView update(BmkVO bmkVO) {
  ModelAndView mav = new ModelAndView();

  int cnt = this.bmkProc.update(bmkVO);
  
  mav.addObject("cnt", cnt); // request에 저장
  mav.addObject("bmkno", bmkVO.getBmkno());
  mav.addObject("bmkgrpno", bmkVO.getBmkgrpno());
  mav.addObject("name", bmkVO.getName());
  mav.addObject("contents", bmkVO.getContent());
  mav.addObject("url", "update_msg");  // /cate/create_msg -> /cate/update_msg.jsp로 최종 실행됨.
  
  mav.setViewName("redirect:/bmk/msg.do");
  
  return mav;
}

/**
 * 조회 + 삭제폼 http://localhost:9092/bmk/read_delete.do
 * 
 * @return
 */
@RequestMapping(value = "/bmk/read_delete.do", method = RequestMethod.GET)
public ModelAndView read_delete(int bmkno, int bmkgrpno) {
  // int cateno = Integer.parseInt(request.getParameter("cateno"));            // 값 가져오기
  // int categrpno = Integer.parseInt(request.getParameter("categrpno"));    를 ModelAndView 사용함으로써 spring이 자동생성한다.
  ModelAndView mav = new ModelAndView();
  
  BmkgrpVO  bmkgrpVO = this.bmkgrpProc.read(bmkgrpno);
  mav.addObject("bmkgrpVO", bmkgrpVO);
  
  BmkVO bmkVO = this.bmkProc.read(bmkno);
  mav.addObject("bmkVO", bmkVO);           // request.setAttribute("cateVO",cateVO);       // 객체 저장

  List<BmkVO> list = this.bmkProc.list_by_bmkgrpno(bmkgrpno);
  mav.addObject("list", list);
  
  mav.setViewName("/bmk/read_delete"); // read_delete.jsp

  return mav; // forward
}

/**
 * 삭제 처리
 * 
 * @param bmkVO
 * @return
 */
@RequestMapping(value = "/bmk/delete.do", method = RequestMethod.POST)
public ModelAndView delete(int bmkno, int bmkgrpno) {
  ModelAndView mav = new ModelAndView();
  // 삭제될 레코드 정보를 삭제하기 전에 읽음.  (읽어오기)
  BmkVO bmkVO = this.bmkProc.read(bmkno); 

  int cnt = this.bmkProc.delete(bmkno);
  
  mav.addObject("cnt", cnt); // request에 저장
  mav.addObject("bmkno", bmkVO.getBmkno());
  mav.addObject("bmkgrpno", bmkVO.getBmkgrpno());
  mav.addObject("name", bmkVO.getName());
  mav.addObject("contents", bmkVO.getContent());
  mav.addObject("url", "delete_msg");  
  
  mav.setViewName("redirect:/bmk/msg.do");
  
  return mav;
}

  
  
}
