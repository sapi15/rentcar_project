package dev.mvc.bmkgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.rentcargrp.RentcargrpProcInter;
import dev.mvc.rentcargrp.RentcargrpVO;

@Controller
public class BmkgrpCont {
  @Autowired
  @Qualifier("dev.mvc.bmkgrp.BmkgrpProc")
  private BmkgrpProcInter bmkgrpProc;
  
 // http://localhost:9092/bmkgrp/create.do?bmkgrpno=1
 /**
  * 등록 폼
  * 
  * @return
  */
 @RequestMapping(value = "/bmkgrp/create.do", method = RequestMethod.GET)
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/bmkgrp/create");

   return mav; // forward
 }
 
 /**
  * 등록처리
  * http://localhost:9092/bmkgrp/create.do?rentcargrpno=1
  * 
  * @return
  */
 @RequestMapping(value = "/bmkgrp/create.do", method = RequestMethod.POST)
 public ModelAndView create(BmkgrpVO bmkgrpVO) {
   ModelAndView mav = new ModelAndView();

   int cnt = this.bmkgrpProc.create(bmkgrpVO);
   mav.addObject("cnt", cnt);
   
   //mav.setViewName("redirect:/bmkgrp/msg.do");
   mav.setViewName("/bmkgrp/create_msg");
   
   return mav;
 }
  
   // http://localhost:9091/bmkgrp/list.do
   /**
   * 목록 출력
   * @return
   */
  @RequestMapping(value="/bmkgrp/list.do", method=RequestMethod.GET )
  public ModelAndView list_bmkgrpno_asc() {
    ModelAndView mav = new ModelAndView();
  
    List<BmkgrpVO> list = this.bmkgrpProc.list_bmkgrpno_asc();
    mav.addObject("list", list); 
  
    mav.setViewName("/bmkgrp/list"); 
    return mav;
  }
  
   /**
    * 조회 + 수정폼 http://localhost:9092/bmkgrp/read_update.do
    * 
    * @return
    */
 @RequestMapping(value = "/bmkgrp/read_update.do", method = RequestMethod.GET)
 public ModelAndView read_update(int bmkgrpno) {
   ModelAndView mav = new ModelAndView();
   
   BmkgrpVO bmkgrpVO = this.bmkgrpProc.read(bmkgrpno);
   mav.addObject("bmkgrpVO", bmkgrpVO);           // request.setAttribute("cateVO",cateVO);       // 객체 저장

   List<BmkgrpVO> list = this.bmkgrpProc.list_bmkgrpno_asc();
   mav.addObject("list", list);

   mav.setViewName("/bmkgrp/read_update"); // read_update.jsp
   
   return mav; // forward
 }
 
 /**
  * 수정 처리
  * 
  * @param bmkgrpVO
  * @return
  */
 @RequestMapping(value = "/bmkgrp/update.do", method = RequestMethod.POST)
 public ModelAndView update(BmkgrpVO bmkgrpVO) {
   ModelAndView mav = new ModelAndView();

   int cnt = this.bmkgrpProc.update(bmkgrpVO);   
   mav.addObject("cnt", cnt); // request에 저장

   mav.setViewName("/bmkgrp/update_msg");
   
   return mav;
 }
 
 /**
  * 조회 + 삭제폼 http://localhost:9092/bmkgrp/read_delete.do
  * 
  * @return
  */
 @RequestMapping(value = "/bmkgrp/read_delete.do", method = RequestMethod.GET)
 public ModelAndView read_delete(int bmkgrpno) {
   // int cateno = Integer.parseInt(request.getParameter("cateno"));            // 값 가져오기
   // int categrpno = Integer.parseInt(request.getParameter("categrpno"));    를 ModelAndView 사용함으로써 spring이 자동생성한다.
   ModelAndView mav = new ModelAndView();
   
   BmkgrpVO bmkgrpVO = this.bmkgrpProc.read(bmkgrpno);
   mav.addObject("bmkgrpVO", bmkgrpVO);           // request.setAttribute("cateVO",cateVO);       // 객체 저장

   List<BmkgrpVO> list = this.bmkgrpProc.list_bmkgrpno_asc();
   mav.addObject("list", list);
   
   mav.setViewName("/bmkgrp/read_delete"); // read_delete.jsp

   return mav; // forward
 }
 
 /**
  * 삭제 처리
  * 
  * @param bmkgrpno 조회할 카테고리 번호
  * @return
  */
 @RequestMapping(value = "/bmkgrp/delete.do", method = RequestMethod.POST)
 public ModelAndView delete(int bmkgrpno) {
   ModelAndView mav = new ModelAndView();
   // 삭제될 레코드 정보를 삭제하기 전에 읽음.  (읽어오기)
   BmkgrpVO bmkgrpVO = this.bmkgrpProc.read(bmkgrpno);
   mav.addObject("bmkgrpVO", bmkgrpVO); // request 객체에 저장

   int cnt = this.bmkgrpProc.delete(bmkgrpno);
   mav.addObject("cnt", cnt); // request에 저장
 
   mav.setViewName("/bmkgrp/delete_msg");
   
   return mav;
 }
 
}
