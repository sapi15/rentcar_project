package dev.mvc.order_pay;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cart.CartProcInter;
import dev.mvc.cart.CartVO;
import dev.mvc.rent.RentProcInter;
import dev.mvc.rent.RentVO;

@Controller
public class Order_payCont {
  @Autowired
  @Qualifier("dev.mvc.order_pay.Order_payProc")
  private Order_payProcInter order_payProc;
  
  @Autowired
  @Qualifier("dev.mvc.rent.RentProc")
  private RentProcInter rentProc;
  
  public Order_payCont() {
    System.out.println("->Order_payCont created.");
  }
  
//http://localhost:9091/order_pay/create.do
 /**
 * 등록 폼
 * @return
 */
 @RequestMapping(value="/order_pay/create.do", method=RequestMethod.GET )
 public ModelAndView create(HttpSession session, int rentno) {
   ModelAndView mav = new ModelAndView();
   
   int discount = 0;        // 할인 금액(할인 쿠폰)
   int tot = 0;               // 대여금액=1일 금액 * 일수
   int tot_sum = 0;        // 최종금액 = tot - discount
   int point = 0;           // 포인트
   
   int memberno = (int)session.getAttribute("memberno");
   
   RentVO rentVO = this.rentProc.read(rentno);
   int normal_price = rentVO.getNormal_price();
   
   
   
   
   mav.addObject("tot_sum", tot_sum);
   mav.addObject("point", point);
   mav.addObject("normal_price", normal_price);
   
   mav.setViewName("/order_pay/create"); // webapp/WEB-INF/views/order_pay/create.jsp
     
   return mav; // forward
 }

  
  // http://localhost:9091/order_pay/create.do
  /**
   * 주문 결재 등록 처리
   * @param order_payVO
   * @return
   */
  @RequestMapping(value="/order_pay/create.do", method=RequestMethod.POST )
  public ModelAndView create(HttpSession session, Order_payVO order_payVO) { // order_payVO 자동 생성, Form -> VO
    ModelAndView mav = new ModelAndView();
    
    int memberno = (int)session.getAttribute("memberno");
    order_payVO.setMemberno(memberno); // 회원 번호 저장
    
    int cnt = this.order_payProc.create(order_payVO);
    
    mav.addObject("cnt", cnt);
    
    return mav;
  }
    
    /**
     * 회원별 전체 목록, 로그인이 안되어 있으면 로그인 후 목록 출력
     * http://localhost:9091/order_pay/list_by_memberno.do 
     * @return
     */
    @RequestMapping(value="/order_pay/list_by_memberno.do", method=RequestMethod.GET )
    public ModelAndView list_by_memberno(HttpSession session) {
      ModelAndView mav = new ModelAndView();
      
      if (session.getAttribute("memberno") != null) { // 회원으로 로그인을 했다면 쇼핑카트로 이동
        int memberno = (int)session.getAttribute("memberno");
        
        List<Order_payVO> list = this.order_payProc.list_by_memberno(memberno);
        mav.addObject("list", list); // request.setAttribute("list", list);

        mav.setViewName("/order_pay/list_by_memberno"); // /views/order_pay/list_by_memberno.jsp   
        
      } else { // 회원으로 로그인하지 않았다면
        mav.addObject("return_url", "/order_pay/list_by_memberno.do"); // 로그인 후 이동할 주소 ★
        
        mav.setViewName("redirect:/member/login.do"); // /WEB-INF/views/member/login_ck_form.jsp
      }

      return mav;
    }
  
  
  
 

}
