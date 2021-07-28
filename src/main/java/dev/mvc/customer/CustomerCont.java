package dev.mvc.customer;

import java.lang.annotation.Repeatable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerCont {
   @Autowired
   @Qualifier("dev.mvc.customer.CustomerProc")
   private CustomerProcInter customerProc;
   
   public CustomerCont() {
     //생성자
   }
   
   @RequestMapping(value = "/customer/list.do",  method = RequestMethod.GET)
   public ModelAndView list() {
     ModelAndView mvc = new ModelAndView();
     
     List<CustomerVO> list = this.customerProc.list();
     mvc.addObject("list", list);
     
     mvc.setViewName("/customer/h_form");
     return mvc;
     
   }
}
