package dev.mvc.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.customer.CustomerProc")
public class CustomerProc implements CustomerProcInter {
  @Autowired
  private CustomerDAOInter customerDAO;
  
  public CustomerProc() {
    
  }

  @Override
  public List<CustomerVO> list() {
    List<CustomerVO> list = this.customerDAO.list();
    return list;
  }
  
  

}
