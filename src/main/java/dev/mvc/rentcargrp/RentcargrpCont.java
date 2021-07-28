package dev.mvc.rentcargrp;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RentcargrpCont {
  @Autowired
  @Qualifier("dev.mvc.rentcargrp.RentcargrpProc")
  private RentcargrpProcInter rentcargrpProc;

  public RentcargrpCont() {
    System.out.println("-> RentcargrpCont created.");
  }
  
  //아래 코드가 없으면, 장바구니에 같은 상품이 계속 담기는 현상이 발생. , (없으면 404에러가 발생한다.?)
//  /**
//   * 새로고침 방지
//   * 
//   * @return
//   */
//  @RequestMapping(value = "/rentcargrp/msg.do", method = RequestMethod.GET)
//  public ModelAndView msg(String url) {
//    ModelAndView mav = new ModelAndView();
//
//    mav.setViewName("/rentcargrp/" + url); // forward
//
//    return mav; // forward
//  }

  // http://localhost:9091/rentcargrp/create.do
  /**
   * 등록 폼
   * 
   * @return
   */
  @RequestMapping(value = "/rentcargrp/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/rentcargrp/create");

    return mav; // forward
  }

  // http://localhost:9091/rentcargrp/create.do
  /**
   * 등록 처리
   * 
   * @param rentcargrpVO
   * @return
   */
  @RequestMapping(value = "/rentcargrp/create.do", method = RequestMethod.POST)
  public ModelAndView create(RentcargrpVO rentcargrpVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.rentcargrpProc.create(rentcargrpVO); // 등록 처리
    mav.addObject("cnt", cnt); // request에 저장, request.setAttribute("cnt", cnt)

    if(cnt==1) {
      mav.setViewName("redirect:/rentcargrp/list.do");
    }else {
      mav.setViewName("/rentcargrp/create_msg");
    }
    return mav; // forward
  }

  /**
   * 목록 출력
   * 
   * @return
   */
//   http://localhost:9091/rentcargrp/list.do
//  @RequestMapping(value = "/rentcargrp/list.do", method = RequestMethod.GET)
//  public ModelAndView list() {
//    ModelAndView mav = new ModelAndView();
//
//    // 등록 순서별 출력
//    // List<RentcargrpVO> list = this.rentcargrpProc.list_reserno_asc();
//
//    // 출력 순서별 출력
//    List<RentcargrpVO> list = this.rentcargrpProc.list_seqno_asc();
//    mav.addObject("list", list); // request.setAttribute("list", list);
//
//    mav.setViewName("/rentcargrp/list"); // /webapp/WEB-INF/views/categrp/list.jsp
//    return mav;
//  }

  
  // http://localhost:9091/rentcargrp/read_update.do
  /**
   * 조회 + 수정폼
   * 
   * @param categrpno 조회할 카테고리 번호
   * @return
   */
//  @RequestMapping(value = "/rentcargrp/read_update.do", method = RequestMethod.GET)
//  public ModelAndView read_update(int rentcargrpno) {
//    // request.setAttribute("reserno", int reserno) 작동 안됨.
//
//    ModelAndView mav = new ModelAndView();
//
//    RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentcargrpno);
//    mav.addObject("rentcargrpVO", rentcargrpVO); // request 객체에 저장
//
//    List<RentcargrpVO> list = this.rentcargrpProc.list_rentcargrpno_asc();
//    mav.addObject("list", list); // request 객체에 저장
//
//    mav.setViewName("/rentcargrp/read_update"); // /WEB-INF/views/rentcargrp/read_update.jsp
//    return mav; // forward
//  }
  
  
  /**
   * Ajax 기반 목록
   * http://localhost:9092/rentcargrp/list.do
   * @return
   */
  @RequestMapping(value="/rentcargrp/list.do", method=RequestMethod.GET )
  public ModelAndView list_ajax() {
    ModelAndView mav = new ModelAndView();
    
    // 등록 순서별 출력    
    // List<RentcargrpVO> list = this.rentcargrpProc.list_rentcargrpno_asc();
    
    // 출력 순서별 출력
    List<RentcargrpVO> list = this.rentcargrpProc.list_seqno_asc();
        
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/rentcargrp/list_ajax"); // /WEB-INF/views/rentcargrp/list_ajax.jsp
    return mav;
  }

  /**
   *  mariaDB에서는 안되는 방법인듯..
   *  
   * 조회 + 수정폼 + Ajax, VO 전체를 JSON으로 변환하는 경우
   * http://localhost:9092/rentcargrp/read_update_ajax.do?rentcargrpno=1
   * 
   * @param categrpno 조회할 카테고리 번호
   * @return
   */
//  @RequestMapping(value="/rentcargrp/read_update_ajax.do", method=RequestMethod.GET )
//  @ResponseBody
//  public String read_update_ajax(int rentcargrpno) {
//    RentcargrpVO rentcargrpVO= this.rentcargrpProc.read(rentcargrpno); 
//    
//    JSONObject json = new JSONObject();
//    json.put("rentcargrpVO", rentcargrpVO);
//    
//    return json.toString();
//  }
  
  
  /**
   * 조회 + 수정폼 + Ajax, VO에서 필드를 추출하여 JSON으로 변환하는 경우
   * http://localhost:9092/rentcargrp/read_update_ajax.do?rentcargrpno=1
   * 
   * @param categrpno 조회할 카테고리 번호
   * @return
   */
//  @RequestMapping(value="/rentcargrp/read_update_ajax.do", method=RequestMethod.GET )
//  @ResponseBody
//  public String read_update_ajax(int rentcargrpno) {
//    RentcargrpVO rentcargrpVO= this.rentcargrpProc.read(rentcargrpno); 
//    
//    JSONObject json = new JSONObject();
//    json.put("rentcargrpno", rentcargrpVO.getRentcargrpno());
//    json.put("seqno", rentcargrpVO.getSeqno());
//    json.put("cate", rentcargrpVO.getCate());
//    json.put("rdate", rentcargrpVO.getRdate());
//    
//    return json.toString();
//  }
  


  // http://localhost:9091/rentcargrp/read_delete.do
  /**
   * 조회 + 삭제폼
   * 
   * @param categrpno 조회할 카테고리 번호
   * @return
   */
//  @RequestMapping(value = "/rentcargrp/read_delete.do", method = RequestMethod.GET)
//  public ModelAndView read_delete(int rentcargrpno) {
//    ModelAndView mav = new ModelAndView();
//
//    RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentcargrpno); // 삭제할 자료 읽기
//    mav.addObject("rentcargrpVO", rentcargrpVO); // request 객체에 저장
//
//    List<RentcargrpVO> list = this.rentcargrpProc.list_rentcargrpno_asc();
//    mav.addObject("list", list); // request 객체에 저장
//
//    mav.setViewName("/rentcargrp/read_delete"); // read_delete.jsp
//    return mav;
//  }
  
  // http://localhost:9092/rentcargrp/read_ajax.do?rentcargrpno=1
  /**
   * 조회 + 수정/ 삭제 폼 + ajax
   * 
   * @param categrpno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value = "/rentcargrp/read_ajax.do", method = RequestMethod.GET)
  @ResponseBody
  public String read_delete_ajax(int rentcargrpno) {
    RentcargrpVO rentcargrpVO= this.rentcargrpProc.read(rentcargrpno); 
    
    JSONObject json = new JSONObject();
    json.put("rentcargrpno", rentcargrpVO.getRentcargrpno());
    json.put("seqno", rentcargrpVO.getSeqno());
    json.put("cate", rentcargrpVO.getCate());
    json.put("rdate", rentcargrpVO.getRdate());
    
    return json.toString();
  }
  
  //http://localhost:9092/rentcargrp/update.do
   /**
    * 수정 처리
    * 
    * @param categrpVO
    * @return
    */
 @RequestMapping(value = "/rentcargrp/update.do", method = RequestMethod.POST)
 public ModelAndView update(RentcargrpVO rentcargrpVO) {
   // RentcargrpVO rentcargrpVO <FORM> 태그의 값으로 자동 생성됨.
   // request.setAttribute("rentcargrpVO", rentcargrpVO); 자동 실행

   ModelAndView mav = new ModelAndView();

   int cnt = this.rentcargrpProc.update(rentcargrpVO);
   mav.addObject("cnt", cnt); // request에 저장
   
   if(cnt==1) {   // 정상처리가 안될 시에만 msg 출력
     mav.setViewName("redirect:/rentcargrp/list.do");
   }else {
     mav.setViewName("/rentcargrp/update_msg"); // update_msg.jsp
   }
   
   return mav;
 }

  // http://localhost:9092/rentcargrp/delete.do?
  /**
   * 삭제 처리
   * 
   * @param categrpno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value = "/rentcargrp/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int rentcargrpno) {
    ModelAndView mav = new ModelAndView();

    RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentcargrpno); // 삭제 정보
    mav.addObject("rentcargrpVO", rentcargrpVO); // request 객체에 저장

    int cnt = this.rentcargrpProc.delete(rentcargrpno); // 삭제 처리
    mav.addObject("cnt", cnt); // request 객체에 저장

    if(cnt == 1) {
      mav.setViewName("redirect:/rentcargrp/list.do");
    }else {
      mav.setViewName("/rentcargrp/delete_msg"); // delete_msg.jsp
    }
    return mav;
  }

  // http://localhost:9091/rentcargrp/update_seqno_up.do?categrpno=1
  // http://localhost:9091/rentcargrp/update_seqno_up.do?categrpno=1000
  /**
   * 우선순위 상향 up 10 ▷ 1
   * 
   * @param categrpno 카테고리 번호
   * @return
   */
  @RequestMapping(value = "/rentcargrp/update_seqno_up.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_up(int rentcargrpno) {
    ModelAndView mav = new ModelAndView();

    RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentcargrpno); // 카테고리 그룹 정보
    mav.addObject("rentcargrpVO", rentcargrpVO); // request 객체에 저장

    int cnt = this.rentcargrpProc.update_seqno_up(rentcargrpno); // 우선 순위 상향 처리
    mav.addObject("cnt", cnt); // request 객체에 저장

    // mav.setViewName("/rentcargrp/update_seqno_up_msg"); //
    // update_seqno_down_msg.jsp
    mav.setViewName("redirect:/rentcargrp/list.do");

    return mav;
  }

  // http://localhost:9091/rentcargrp/update_seqno_down.do?categrpno=1
  // http://localhost:9091/rentcargrp/update_seqno_down.do?categrpno=1000
  /**
   * 우선순위 하향 up 1 ▷ 10
   * 
   * @param categrpno 카테고리 번호
   * @return
   */
  @RequestMapping(value = "/rentcargrp/update_seqno_down.do", method = RequestMethod.GET)
  public ModelAndView update_seqno_down(int rentcargrpno) {
    ModelAndView mav = new ModelAndView();

    RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentcargrpno); // 카테고리 그룹 정보
    mav.addObject("rentcargrpVO", rentcargrpVO); // request 객체에 저장

    int cnt = this.rentcargrpProc.update_seqno_down(rentcargrpno);
    mav.addObject("cnt", cnt); // request 객체에 저장

    // mav.setViewName("/rentcargrp/update_seqno_down_msg"); //
    // update_seqno_down_msg.jsp
    mav.setViewName("redirect:/rentcargrp/list.do");

    return mav;
  }

  /*    *//**
           * 출력 모드의 변경
           * 
           * @param rentcargrpVO
           * @return
           *//*
              * @RequestMapping(value="/rentcargrp/update_returnid.do",
              * method=RequestMethod.GET ) public ModelAndView update_returnid(RentcargrpVO
              * rentcargrpVO) { ModelAndView mav = new ModelAndView();
              * 
              * int cnt = this.rentcargrpProc.update_returnid(rentcargrpVO);
              * 
              * mav.setViewName("redirect:/rentcargrp/list.do"); // request 객체 전달 안됨.
              * 
              * return mav; }
              */


  /**
   *  예약 메인화면
   * @return
   */
  @RequestMapping(value = "/rentcargrp/index_rent.do", method = RequestMethod.GET)
    public ModelAndView index_rent() {
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("/rentcargrp/index_rent");

      return mav; // forward
    }
  
  /**
   * 단기렌트 화면
   * @return
   */
  @RequestMapping(value = "/rentcargrp/rent.do", method = RequestMethod.GET)
  public ModelAndView rent() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/rentcargrp/rent");

    return mav; // forward
  } 

  /**
   * 장기렌트 화면
   * @return
   */
  @RequestMapping(value = "/rentcargrp/long.do", method = RequestMethod.GET)
  public ModelAndView long_term() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/rentcargrp/long");

    return mav; // forward
  }
  
 }

