package dev.mvc.rent;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.rentcargrp.RentcargrpProcInter;
import dev.mvc.rentcargrp.RentcargrpVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class RentCont {
  @Autowired
  @Qualifier("dev.mvc.rentcargrp.RentcargrpProc")
  private RentcargrpProcInter rentcargrpProc;

  @Autowired
  @Qualifier("dev.mvc.rent.RentProc")
  private RentProcInter rentProc;

  public RentCont() {
  }

  //아래 코드가 없으면, 장바구니에 같은 상품이 계속 담기는 현상이 발생. , (없으면 404에러가 발생한다.?)
  /**
   * 새로고침 방지
   * 
   * @return
   */
  @RequestMapping(value = "/rent/msg.do", method = RequestMethod.GET)
  public ModelAndView msg(String url) {
    ModelAndView mav = new ModelAndView();

    mav.setViewName("/rent/" + url); // forward

    return mav; // forward
  }

  /**
   * 등록폼
   * 
   * http://localhost:9092/rent/create.do?rentcargrpno=2
   * 
   * @return
   */
  @RequestMapping(value = "/rent/create.do", method = RequestMethod.GET)
  public ModelAndView create(int rentcargrpno, HttpSession session) {
    ModelAndView mav = new ModelAndView();

    if(this.rentProc.isAdmin(session)) {
      RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentcargrpno); // 부모테이블 정보 읽어오기
      mav.addObject("rentcargrpVO", rentcargrpVO); // 저장
    
      mav.setViewName("/rent/create"); // /webapp/WEB-INF/views/contents/create.jsp
      // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
      // mav.addObject("content", content);
    } else {
      mav.addObject("url", "login_need"); // login_need.jsp, redirect parameter 적용
      
      mav.setViewName("redirect:/member/msg.do");      
    }

    return mav; // forward
  }
  
  /**
   * 등록 처리 http://localhost:9092/rent/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/rent/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, RentVO rentVO) {
    ModelAndView mav = new ModelAndView();
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String file1 = ""; // 원본 파일명 image
    String file1saved = ""; // 저장된 파일명, image
    String thumb1 = ""; // preview image
    
    String file2 = ""; 
    String file2saved = ""; 
    String thumb2 = ""; 

    // 기준 경로 확인
    String user_dir = System.getProperty("user.dir");
    System.out.println("--> User dir: " + user_dir);
    // --> User dir: F:\ai8\ws_frame\resort_v1sbm3a

    // 파일 접근임으로 절대 경로 지정, static지정 ★★★
    // 완성된 경로
    // F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/contents/storage/main_images
    String upDir = user_dir + "/src/main/resources/static/rent/storage/"; // 절대 경로
    // 외부에서 파일을 가져와야 하기 때문에 static를 지정해야 한다.(보안)

    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF'
    //           value='' placeholder="파일 선택"> => 파일을 선택하는 태그
    MultipartFile mf1 = rentVO.getFile1MF(); // 파일정보를 저장하기 위함.

    file1 = mf1.getOriginalFilename(); // 원본 파일명
    long size1 = mf1.getSize(); // 파일 크기

    if (size1 > 0) { // 파일 크기 체크 , (0보다 크다는 것은 파일이 존재하다는 의미)
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg... (-> spring.jsp,
      // spring_1.jpg... 처럼 중복파일은 자동 이름변경이 된다.)
      file1saved = Upload.saveFileSpring(mf1, upDir); // 중복된 파일명 저장

      if (Tool.isImage(file1saved)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
        thumb1 = Tool.preview(upDir, file1saved, 360, 180); // 파일을 300x200 사이즈로
      }

    }
    rentVO.setFile1(file1);
    rentVO.setFile1saved(file1saved);
    rentVO.setThumb1(thumb1);
    rentVO.setSize1(size1);
    
    
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF'
    //           value='' placeholder="파일 선택"> => 파일을 선택하는 태그
    MultipartFile mf2 = rentVO.getFile2MF(); // 파일정보를 저장하기 위함.

    file2 = mf2.getOriginalFilename(); // 원본 파일명
    long size2 = mf2.getSize(); // 파일 크기

    if (size2 > 0) { // 파일 크기 체크 , (0보다 크다는 것은 파일이 존재하다는 의미)
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg... (-> spring.jsp,
      // spring_1.jpg... 처럼 중복파일은 자동 이름변경이 된다.)
      file2saved = Upload.saveFileSpring(mf2, upDir); // 중복된 파일명 저장

      if (Tool.isImage(file2saved)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
        thumb2 = Tool.preview(upDir, file2saved, 200, 135); // 파일을 200x150 사이즈로
      }

    }
    rentVO.setFile2(file2);
    rentVO.setFile2saved(file2saved);
    rentVO.setThumb2(thumb2);
    rentVO.setSize2(size2);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    // 파일 전송 코드는 공식이다.

    // Call By Reference: 메모리 공유, Hashcode 전달
    int cnt = this.rentProc.create(rentVO);

    // -------------------------------------------------------------------
    // PK의 return ,상품정보가 입력될때 쓰인다?
    // -------------------------------------------------------------------
    // System.out.println("--> contentsno: " + contentsVO.getContentsno());
    // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect
    // parameter 적용
    // -------------------------------------------------------------------

//    if (cnt == 1) {
//      cateProc.increaseCnt(contentsVO.getCateno()); // 글수 증가
//    }
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    // System.out.println("--> cateno: " + contentsVO.getCateno());
    // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
    mav.addObject("rentcargrpno", rentVO.getRentcargrpno()); // redirect parameter 적용
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter 적용

    // 연속 입력 지원용 변수, Call By Reference에 기반하여 contentsno를 전달 받음
    mav.addObject("rentno", rentVO.getRentno());
    
    mav.setViewName("redirect:/rent/msg.do");   // redirect를 안하면 F5할 때마다 이미지가 계속 올라간다.

    return mav; // forward
  }
  
  
  /**
   * 카테고리별 목록 http://localhost:9092/rent/list_by_rentcargrpno.do?rentno=2
   * 
   * @return
   */
   @RequestMapping(value = "/rent/list_by_rentcargrpno.do", method = RequestMethod.GET)
    public ModelAndView list_by_rentcargrpno(int rentcargrpno) { 
      ModelAndView mav = new  ModelAndView(); 
  
      RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentcargrpno);
      mav.addObject("rentcargrpVO", rentcargrpVO);
      
      List<RentVO> list = this.rentProc.list_by_rentcargrpno(rentcargrpno);
      mav.addObject("list", list);
      
      // 테이블 이미지 기반, list_by_cateno.jsp
      mav.setViewName("/rent/list_by_rentcargrpno");  // ../views/contents/list_by_cateno.jsp 
      
      return mav; // forward 
    }
   
   
   /**
    * 목록 + 검색 지원
    * http://localhost:9092/rent/list_by_rentcargrpno_search.do?rentno=1&word=스위스
    * @param cateno
    * @param word
    * @return
    */
     @RequestMapping(value = "/rent/list_by_rentcargrpno_search.do", method = RequestMethod.GET)
     public ModelAndView list_by_rentcargrpno_search(
               @RequestParam(value="rentcargrpno", defaultValue="1") int rentcargrpno,
               @RequestParam(value="word", defaultValue="") String word ) {
     ModelAndView mav = new ModelAndView(); 
          
     // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용 
     HashMap<String, Object> map = new HashMap<String, Object>(); 
     map.put("rentcargrpno", rentcargrpno); 
     map.put("word", word); 
     
     // 검색 목록 
     List<RentVO> list = rentProc.list_by_rentcargrpno_search(map);
     mav.addObject("list", list);
     
     // 검색된 레코드 갯수 
     int search_count = rentProc.search_count(map);
     mav.addObject("search_count", search_count);
     
     RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentcargrpno);
     mav.addObject("rentcargrpVO", rentcargrpVO);
     
     mav.setViewName("/rent/list_by_rentcargrpno_search");   
     
     return mav; 
   }
     
     /**
      * 목록 + 검색 + 페이징 지원
      * http://localhost:9092/rent/list_by_rentcargrpno_search_paging.do?rentcargrpno=1&word=스위스&now_page=1
      * 
      * @param rentcargrpno
      * @param word
      * @param now_page
      * @return
      */
     @RequestMapping(value = "/rent/list_by_rentcargrpno_search_paging.do", method = RequestMethod.GET)
     public ModelAndView list_by_rentcargrpno_search_paging(
               @RequestParam(value = "rentcargrpno", defaultValue = "1") int rentcargrpno,
               @RequestParam(value = "word", defaultValue = "") String word,
               @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
       //System.out.println("--> now_page: " + now_page);

       ModelAndView mav = new ModelAndView();

       // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
       HashMap<String, Object> map = new HashMap<String, Object>();
       map.put("rentcargrpno", rentcargrpno); 
       map.put("word", word);
       map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

       // 검색 목록
       List<RentVO> list = rentProc.list_by_rentcargrpno_search_paging(map);
       mav.addObject("list", list);

       // 검색된 레코드 갯수
       int search_count = rentProc.search_count(map);
       mav.addObject("search_count", search_count);

       RentcargrpVO rentcargrpVO = rentcargrpProc.read(rentcargrpno);
       mav.addObject("rentcargrpVO", rentcargrpVO);

       /*
        * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
        * 18 19 20 [다음]
        * @param list_file 목록 파일명
        * @param rentcargrpno 카테고리번호
        * @param search_count 검색(전체) 레코드수
        * @param now_page 현재 페이지
        * @param word 검색어
        * @return 페이징 생성 문자열
        */
       String paging = rentProc.pagingBox("list_by_rentcargrpno_search_paging.do", rentcargrpno, search_count, now_page, word);
       mav.addObject("paging", paging);

       mav.addObject("now_page", now_page);

       mav.setViewName("/rent/list_by_rentcargrpno_search_paging");

       return mav;
     }
     
     /**
      * Grid 형태의 화면 구성 http://localhost:9092/rent/list_by_rentcargrpno_grid.do
      * 
      * @return
      */
     @RequestMapping(value = "/rent/list_by_rentcargrpno_grid_search_paging.do", method = RequestMethod.GET)
     public ModelAndView list_by_rentcargrpno_grid_search_paging(
         @RequestParam(value="rentcargrpno", defaultValue="1") int rentcargrpno,
         @RequestParam(value="word", defaultValue="") String word,
         @RequestParam(value="now_page", defaultValue="1") int now_page) {
       ModelAndView mav = new ModelAndView();
       
       // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용 
       HashMap<String, Object> map = new HashMap<String, Object>(); 
       map.put("rentcargrpno", rentcargrpno); 
       map.put("word", word);
       map.put("now_page", now_page); 
       
       // 검색 목록 
       List<RentVO> list = rentProc.list_by_rentcargrpno_grid_search_paging(map);
       mav.addObject("list", list);
       
       // 검색된 레코드 갯수 
       int search_count = rentProc.search_count(map);
       mav.addObject("search_count", search_count);
       
       RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentcargrpno);
       mav.addObject("rentcargrpVO", rentcargrpVO);
       
       /*
        * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
        * 18 19 20 [다음]
        * @param list_file 목록 파일명
        * @param rentcargrpno 카테고리번호
        * @param search_count 검색(전체) 레코드수
        * @param now_page 현재 페이지
        * @param word 검색어
        * @return 페이징 생성 문자열
        */
       String paging_grid = rentProc.pagingBox_grid("list_by_rentcargrpno_grid_search_paging.do", rentcargrpno, search_count, now_page, word);
       mav.addObject("paging_grid", paging_grid);

       mav.addObject("now_page", now_page);

       mav.setViewName("/rent/list_by_rentcargrpno_grid_search_paging");

       return mav; // forward
     }

     // http://localhost:9092/rent/read.do
     /**
      * 조회
      * @return
      */
     @RequestMapping(value="/rent/read.do", method=RequestMethod.GET )
     public ModelAndView read(int rentno, HttpServletRequest request,
         @RequestParam(value = "now_page", defaultValue = "1") int now_page) {   // spring 기능상 now_page는 이미 전달 받는다.?
       /* public ModelAndView read(int contentsno, int now_page) { */   
       ModelAndView mav = new ModelAndView();
       //System.out.println("->now_page: " + now_page);

       RentVO rentVO = this.rentProc.read(rentno);      
       mav.addObject("rentVO", rentVO); // request.setAttribute("contentsVO", contentsVO);

       RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentVO.getRentcargrpno());
       mav.addObject("rentcargrpVO", rentcargrpVO); 
       
       mav.setViewName("/rent/read"); // /WEB-INF/views/rent/read.jsp
       
       //----------------------------------------------------------------------
       // 쇼핑카트 장바구니에 상품 등록 전 로그인 폼 출력 관련 쿠키
       //----------------------------------------------------------------------
        Cookie[] cookies = request.getCookies();
        Cookie cookie = null;

        String ck_id = ""; // id 저장
        String ck_id_save = ""; // id 저장 여부를 체크
        String ck_passwd = ""; // passwd 저장
        String ck_passwd_save = ""; // passwd 저장 여부를 체크

        if (cookies != null) {    // Cookie 변수가 있다면
          for (int i=0; i < cookies.length; i++){
            cookie = cookies[i]; // 쿠키 객체 추출
            
            if (cookie.getName().equals("ck_id")){
              ck_id = cookie.getValue();                                        // Cookie에 저장된 id
            }else if(cookie.getName().equals("ck_id_save")){
              ck_id_save = cookie.getValue();                                // Cookie에 id를 저장할 것인지의 여부( Y, N )
            }else if (cookie.getName().equals("ck_passwd")){
              ck_passwd = cookie.getValue();                                // Cookie에 저장된 password
            }else if(cookie.getName().equals("ck_passwd_save")){
              ck_passwd_save = cookie.getValue();                         // Cookie에 password를 저장할 것인지의 여부( Y, N )
            } 
          }
        }
        System.out.println("-> ck_id: " + ck_id);
        
        mav.addObject("ck_id", ck_id); 
        mav.addObject("ck_id_save", ck_id_save);
        mav.addObject("ck_passwd", ck_passwd);
        mav.addObject("ck_passwd_save", ck_passwd_save);
           
       return mav;
     }
     
     /**
      * 세부정보 수정 폼
      * 사전 준비된 레코드: 관리자 1번, rentcargrpno 1번을 사용하는 경우 테스트 URL
      * http://localhost:9092/rent/create.do?rentcargrpno=1
      * 
      * @return
      */
     @RequestMapping(value = "/rent/product_update.do", method = RequestMethod.GET)
     public ModelAndView product_update(int rentno) {
       ModelAndView mav = new ModelAndView();
       
       RentVO rentVO = this.rentProc.read(rentno);
       RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentVO.getRentcargrpno());
       
       mav.addObject("rentVO", rentVO);
       mav.addObject("rentcargrpVO", rentcargrpVO);
       
       mav.setViewName("/rent/product_update"); // /views/contents/product_update.jsp

       return mav; // forward
     }
     
     /**
      * 세부정보 수정 처리 http://localhost:9092/rent/product_update.do
      * 
      * @return
      */
     @RequestMapping(value = "/rent/product_update.do", method = RequestMethod.POST)
     public ModelAndView product_update(RentVO rentVO) {
       ModelAndView mav = new ModelAndView();
       
       // Call By Reference: 메모리 공유, Hashcode 전달
       int cnt = this.rentProc.product_update(rentVO);
       
       mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
       mav.addObject("rentcargrpno", rentVO.getRentcargrpno()); // redirect parameter 적용

       // 연속 입력 지원용 변수, Call By Reference에 기반하여 rentno를 전달 받음
       mav.addObject("rentno", rentVO.getRentno());
       
       mav.addObject("url", "product_update_msg"); // product_update_msg.jsp

       mav.setViewName("redirect:/rent/msg.do"); 
       
       return mav; // forward
     }
     
     /**
      * 수정 폼
      * http://localhost:9092/rent/update_text.do?rentno=1
      * 
      * @return
      */
     @RequestMapping(value = "/rent/update_text.do", method = RequestMethod.GET)
     public ModelAndView update_text(HttpSession session, int rentno) {
       ModelAndView mav = new ModelAndView();
       
       if (this.rentProc.isAdmin(session)) {
         RentVO rentVO = this.rentProc.read_update_text(rentno);
         RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentVO.getRentcargrpno());
         
         mav.addObject("rentVO", rentVO);
         mav.addObject("rentcargrpVO", rentcargrpVO);
         
         mav.setViewName("/rent/update_text"); // /WEB-INF/views/contents/update_text.jsp
         // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
         // mav.addObject("content", content);
       }else {
         mav.addObject("url", "login_need"); // login_need.jsp, redirect parameter 적용
         
         mav.setViewName("redirect:/member/msg.do");   
       }

       return mav; // forward
     }

     /**
      * 수정 처리
      * http://localhost:9092/rent/update_text.do?rentno=1
      * 
      * @return
      */
     @RequestMapping(value = "/rent/update_text.do", method = RequestMethod.POST)
     public ModelAndView update_text(RentVO rentVO,
         @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
       ModelAndView mav = new ModelAndView();
       
       int cnt = this.rentProc.update_text(rentVO); // 수정 처리
       
       mav.addObject("rentno", rentVO.getRentno());
       mav.addObject("now_page", now_page);
       
       mav.setViewName("redirect:/rent/read.do"); 

       return mav; // forward
     }
     

     /**
      * 삭제 폼
      * @param rentno
      * @return
      */
     @RequestMapping(value="/rent/delete.do", method=RequestMethod.GET )
     public ModelAndView delete(HttpSession session, int rentno) { 
       ModelAndView mav = new  ModelAndView();
       
       if (this.rentProc.isAdmin(session)) {
         // 삭제할 정보를 조회하여 확인
         RentVO rentVO = this.rentProc.read(rentno);
         mav.addObject("rentVO", rentVO);     
         
         RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentVO.getRentcargrpno());
         mav.addObject("rentcargrpVO", rentcargrpVO); 
         
         mav.setViewName("/rent/delete");  // contents/delete.jsp
       }else {
         mav.addObject("url", "login_need"); // login_need.jsp, redirect parameter 적용
         
         mav.setViewName("redirect:/member/msg.do");   
       }
       
       return mav; 
     }
     
     /**
      * 삭제 처리 http://localhost:9092/rent/delete.do
      * 
      * @return
      */
     @RequestMapping(value = "/rent/delete.do", method = RequestMethod.POST)
     public ModelAndView delete(HttpServletRequest request,
                                              int rentno,
                                              int rentcargrpno,
                                              int now_page,
                                              String word) {
       ModelAndView mav = new ModelAndView();

       // -------------------------------------------------------------------
       // 파일 삭제 코드 시작
       // -------------------------------------------------------------------
       // 삭제할 파일 정보를 읽어옴.
       RentVO vo = rentProc.read(rentno);
      //    System.out.println("rentno: " + vo.getRentno());
      //    System.out.println("file1: " + vo.getFile1());
             
       String file1saved = vo.getFile1saved();
       String thumb1 = vo.getThumb1();
       long size1 = 0;
       
       String file2saved = vo.getFile2saved();
       String thumb2 = vo.getThumb2();
       long size2 = 0;
       
       boolean sw = false;
       
       // 완성된 경로 F:/ai8/ws_frame/rentcar/src/main/resources/static/rent/storage/
       String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/rent/storage/"; // 절대 경로

       sw = Tool.deleteFile(upDir, file1saved);  // Folder에서 1건의 파일 삭제
       sw = Tool.deleteFile(upDir, thumb1);     // Folder에서 1건의 파일 삭제
       sw = Tool.deleteFile(upDir, file2saved);  
       sw = Tool.deleteFile(upDir, thumb2);     
       // System.out.println("sw: " + sw);
       // -------------------------------------------------------------------
       // 파일 삭제 종료
       // -------------------------------------------------------------------
       
       // ★★★ 공식과도 같은 소스
       int cnt = this.rentProc.delete(rentno); //DBMS 삭제
       if (cnt == 1) {
         // -------------------------------------------------------------------------------------
         // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리
         HashMap<String, Object> map = new HashMap<String, Object>();
         map.put("rentcargrpno", rentcargrpno);
         map.put("word", word);
         // 10번째 레코드를 삭제 후 
         // 하나의 페이지가 3개의 레코드로 구성되는 경우 현재 9개의 레코드가 남아 있으면
         // 페이지수를 4 -> 3으로 감소시켜야 함.
         if (rentProc.search_count(map) % Contents.RECORD_PER_PAGE == 0) {
           now_page = now_page - 1;
           if (now_page < 1) {
             now_page = 1; // 시작 페이지
           }
         }
         // -------------------------------------------------------------------------------------// ★★★
       }
       //System.out.println("->delete now_page: " + now_page);
       mav.addObject("now_page", now_page);                  // redirect 때문에 사용
       mav.addObject("rentcargrpno", rentcargrpno);         // redirect 때문에 사용
       
       mav.setViewName("redirect:/rent/list_by_rentcargrpno_search_paging.do"); 

       return mav; // forward
     }   

     
     /**
      * 파일 수정 폼
      * http://localhost:9092/rent/update_file.do?rentno=1
      * 
      * @return
      */
     @RequestMapping(value = "/rent/update_file.do", method = RequestMethod.GET)
     public ModelAndView update_file(HttpSession session,int rentno) {
       ModelAndView mav = new ModelAndView();
       
       if (this.rentProc.isAdmin(session)) {
         RentVO rentVO = this.rentProc.read(rentno);
         RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentVO.getRentcargrpno());
         
         mav.addObject("rentVO", rentVO);
         mav.addObject("rentcargrpVO", rentcargrpVO);
         
         mav.setViewName("/rent/update_file"); // /WEB-INF/views/rent/update_file.jsp
       }else {
         mav.addObject("url", "login_need"); // login_need.jsp, redirect parameter 적용
         
         mav.setViewName("redirect:/member/msg.do");   
       }

       return mav; // forward
     }

     /**
      * 파일 수정 처리 http://localhost:9092/rent/update_file.do
      * 
      * @return
      */
     @RequestMapping(value = "/rent/update_file.do", method = RequestMethod.POST)
     public ModelAndView update_file(HttpServletRequest request, RentVO rentVO,
                                                   @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
       ModelAndView mav = new ModelAndView();

       // -------------------------------------------------------------------
       // 파일 삭제 코드 시작
       // -------------------------------------------------------------------
       // 삭제할 파일 정보를 읽어옴.
       RentVO vo = rentProc.read(rentVO.getRentno());
        //       System.out.println("rentno: " + vo.getRentno());
        //       System.out.println("file1: " + vo.getFile1());
       
       String file1saved = vo.getFile1saved();
       String thumb1 = vo.getThumb1();
       long size1 = 0;
       
       String file2saved = vo.getFile2saved();
       String thumb2 = vo.getThumb2();
       long size2 = 0;
       
       boolean sw = false;
       
       // 완성된 경로 F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/rent/storage/
       String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/rent/storage/"; // 절대 경로

       sw = Tool.deleteFile(upDir, file1saved);  // Folder에서 1건의 파일 삭제
       sw = Tool.deleteFile(upDir, thumb1);     // Folder에서 1건의 파일 삭제
       sw = Tool.deleteFile(upDir, file2saved);  
       sw = Tool.deleteFile(upDir, thumb2);     
       // System.out.println("sw: " + sw);
       // -------------------------------------------------------------------
       // 파일 삭제 종료
       // -------------------------------------------------------------------
       
       // -------------------------------------------------------------------
       // 파일 전송 코드 시작
       // -------------------------------------------------------------------
       String file1 = "";          // 원본 파일명 image
       String file2 = ""; 

       // 완성된 경로 F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/contents/storage/
       // String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/contents/storage/"; // 절대 경로
       
       // 전송 파일이 없어도 fnamesMF 객체가 생성됨.
       // <input type='file' class="form-control" name='file1MF' id='file1MF' 
       //           value='' placeholder="파일 선택">
       MultipartFile mf1 = rentVO.getFile1MF();
       
       file1 = mf1.getOriginalFilename(); // 원본 파일명
       size1 = mf1.getSize();  // 파일 크기
       
       if (size1 > 0) { // 파일 크기 체크
         // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
         file1saved = Upload.saveFileSpring(mf1, upDir); 
         
         if (Tool.isImage(file1saved)) { // 이미지인지 검사
           // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
           thumb1 = Tool.preview(upDir, file1saved, 360, 180); 
         }
         
       }   
       
       MultipartFile mf2 = rentVO.getFile2MF();
       
       file2 = mf2.getOriginalFilename(); // 원본 파일명
       size2 = mf2.getSize();  // 파일 크기
       
       if (size2 > 0) { // 파일 크기 체크
         // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
         file2saved = Upload.saveFileSpring(mf2, upDir); 
         
         if (Tool.isImage(file2saved)) { // 이미지인지 검사
           // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
           thumb2 = Tool.preview(upDir, file2saved, 200, 135); 
         }
         
       }    
       
       rentVO.setFile1(file1);
       rentVO.setFile1saved(file1saved);
       rentVO.setThumb1(thumb1);
       rentVO.setSize1(size1);
       
       rentVO.setFile2(file2);
       rentVO.setFile2saved(file2saved);
       rentVO.setThumb2(thumb2);
       rentVO.setSize2(size2);
       // -------------------------------------------------------------------
       // 파일 전송 코드 종료
       // -------------------------------------------------------------------
       
       // Call By Reference: 메모리 공유, Hashcode 전달
       int cnt = this.rentProc.update_file(rentVO);
       
       mav.addObject("rentno", rentVO.getRentno());
       mav.addObject("now_page", now_page);
       
       mav.setViewName("redirect:/rent/read.do"); 

       return mav; // forward
     }   
     
     /**
      *  차량 전체 목록(join)
      * http://localhost:9092/rent/list_all_join_search_paging.do 
      * @return
      */
     @RequestMapping(value="/rent/list_all_join_search_paging.do", method=RequestMethod.GET )
     public ModelAndView list_all_join_search_paging(
         @RequestParam(value="rentcargrpno", defaultValue="1") int rentcargrpno,
         @RequestParam(value="word", defaultValue="") String word,
         @RequestParam(value="now_page", defaultValue="1") int now_page) {
       ModelAndView mav = new ModelAndView();
       
       // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용 
       HashMap<String, Object> map = new HashMap<String, Object>(); 
       map.put("rentcargrpno", rentcargrpno); 
       map.put("word", word);
       map.put("now_page", now_page); 
       
       // 검색 목록 
       List<Rentcargrp_RentVO> list = rentProc.list_all_join_search_paging(map);
       mav.addObject("list", list);
       
       // 검색된 레코드 갯수 
       int search_count = rentProc.search_count(map);
       mav.addObject("search_count", search_count);
       
       RentcargrpVO rentcargrpVO = this.rentcargrpProc.read(rentcargrpno);
       mav.addObject("rentcargrpVO", rentcargrpVO);
       
       /*
        * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
        * 18 19 20 [다음]
        * @param list_file 목록 파일명
        * @param rentcargrpno 카테고리번호
        * @param search_count 검색(전체) 레코드수
        * @param now_page 현재 페이지
        * @param word 검색어
        * @return 페이징 생성 문자열
        */
       String paging_join = rentProc.pagingBox_join("list_all_join_search_paging.do", rentcargrpno, search_count, now_page, word);
       mav.addObject("paging_join", paging_join);

       mav.addObject("now_page", now_page);

       mav.setViewName("/rent/list_all_join_search_paging");

       return mav; // forward
     }
     
     /**
      * 추천수 Ajax 수정 처리
      * http://localhost:9091/contents/update_recom_ajax.do?contentsno=30
      * 
      * @return
      */
     @RequestMapping(value = "/rent/update_recom_ajax.do", method = RequestMethod.POST)
     @ResponseBody
     public String update_recom_ajax(int rentno) {
       try {
         Thread.sleep(500);
       } catch (InterruptedException e) {
         e.printStackTrace();
       }

       int cnt = this.rentProc.update_recom(rentno); // 추천수 증가
       int recom = this.rentProc.read(rentno).getRecom(); // 새로운 추천수 읽음
           
      JSONObject json = new JSONObject();
       json.put("cnt", cnt);
       json.put("recom", recom);
       
       return json.toString();
     }
   

}
