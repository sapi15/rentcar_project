package dev.mvc.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.rent.RentProcInter;
import dev.mvc.rent.RentVO;

@Controller
public class CartCont {
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  public CartCont() {
    System.out.println("-> CartCont created.");
  }
  
//http://localhost:9093/cart/create.do
 /**
  * Ajax 등록 처리
  * INSERT INTO cart(cartno, contentsno, memberno, cnt, rdate)
  * VALUES(cart_seq.nextval, #{contentsno}, #{memberno}, #{cnt}, sysdate)
  * @param categrpVO
  * @return
  */
 @RequestMapping(value="/cart/create.do", method=RequestMethod.POST )
 @ResponseBody
 public String create(HttpSession session, int rentno) {
   CartVO cartVO = new CartVO();
   cartVO.setRentno(rentno);
   
   int memberno = (Integer)session.getAttribute("memberno");
   cartVO.setMemberno(memberno);
   
   int cnt = this.cartProc.create(cartVO); // 등록 처리
   
   JSONObject json = new JSONObject();
   json.put("cnt", cnt);
   
   System.out.println("-> cartCont create: " + json.toString());

   return json.toString();
 }
 
 /**
  * 회원별 관심목록
  * http://localhost:9092/cart/list_by_memberno.do
  * @return
  */
 @RequestMapping(value="/cart/list_by_memberno.do", method=RequestMethod.GET )
 public ModelAndView list_by_memberno(HttpSession session,
                      @RequestParam(value="cartno", defaultValue="0") int cartno ) {
   ModelAndView mav = new ModelAndView();
 
   if (session.getAttribute("memberno") != null) { // 회원으로 로그인을 했다면
     int memberno = (int)session.getAttribute("memberno");
     
     // 출력 순서별 출력
     List<CartVO> list = this.cartProc.list_by_memberno(memberno);
     
     mav.addObject("list", list);
     mav.addObject("cartno", cartno);
 
     mav.setViewName("/cart/list_by_memberno"); 
     
   } else { // 회원으로 로그인하지 않았다면
     mav.addObject("return_url", "/cart/list_by_memberno.do"); // 로그인 후 이동할 주소 ★
     
     mav.setViewName("redirect:/member/login.do"); 
   }
   return mav;
 }
  
 /**
  * 상품 삭제
  * http://localhost:9091/cart/delete.do
  * @return
  */
 @RequestMapping(value="/cart/delete.do", method=RequestMethod.POST )
 public ModelAndView delete(HttpSession session,
     @RequestParam(value="cartno", defaultValue="0") int cartno ) {
   ModelAndView mav = new ModelAndView();
   
   this.cartProc.delete(cartno);      
   mav.setViewName("redirect:/cart/list_by_memberno.do");
   
   return mav;
 }
  

}
