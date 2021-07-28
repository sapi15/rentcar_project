package dev.mvc.member;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.member.MemberProc")
public class MemberProc implements MemberProcInter {
  @Autowired
  private MemberDAOInter memberDAO;
  
  public MemberProc() {}

  @Override
  public int create(MemberVO memberVO) {
    AES256Util aes256Util = null;
    String password = null;

    try {
      aes256Util = new AES256Util();
    } catch (UnsupportedEncodingException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    try {
      password = aes256Util.aesEncode(memberVO.getPasswd()); //암호화
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    memberVO.setPasswd(password);
    
    int cnt = this.memberDAO.create(memberVO);
    return cnt;
  }

  @Override
  public int checkID(String id) {
   int cnt = this.memberDAO.checkID(id);
    return cnt;
  }

  @Override
  public List<MemberVO> list() {
    List<MemberVO> list = this.memberDAO.list();
    return list;
  }

  @Override
  public MemberVO read(int memberno) {
    MemberVO memberVO = this.memberDAO.read(memberno);
    return memberVO;
  }

  @Override
  public MemberVO readByid(String id) {
    MemberVO memberVO = this.memberDAO.readByid(id);
    return memberVO;
  }

  @Override
  public int update(MemberVO memberVO) {
    int cnt = this.memberDAO.update(memberVO);
    return cnt;
  }

  @Override
  public int delete(int memberno) {
    int cnt = this.memberDAO.delete(memberno);
    return cnt;
  }


  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    String passwd = (String)map.get("passwd");
    AES256Util aes256Util = null;
    
    try {
      aes256Util = new AES256Util();
    } catch (UnsupportedEncodingException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    String password = null;
    try {
      password = aes256Util.aesEncode(passwd); //암호화
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    map.put("passwd", password);
    
    int cnt = this.memberDAO.passwd_check(map);
    return cnt;
  }

  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    String passwd = (String)map.get("passwd");
    AES256Util aes256Util = null;
    
    try {
      aes256Util = new AES256Util();
    } catch (UnsupportedEncodingException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    String new_passwd = null;
    try {
      new_passwd = aes256Util.aesEncode(passwd); //암호화
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    map.put("passwd", new_passwd);
    
    int cnt = this.memberDAO.passwd_update(map);
    return cnt;
  }

  @Override
  public int login(Map<String, Object> map) {
    String passwd = (String) map.get("passwd");
    AES256Util aes256Util = null;

    try {
      aes256Util = new AES256Util();
    } catch (UnsupportedEncodingException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    String password = null;
    try {
      password = aes256Util.aesEncode(passwd); //암호화
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    map.put("passwd", password);
    
    int cnt = this.memberDAO.login(map);
    return cnt;
  }

  @Override
  public MemberVO readById(String id) {
    MemberVO memberVO = this.memberDAO.readByid(id);
    return memberVO;
  }
  
  @Override
  public boolean isMember(HttpSession session){
    boolean sw = false; // 로그인하지 않은 것으로 초기화
    int grade = 99;
    
    // System.out.println("-> grade: " + session.getAttribute("grade"));
    if (session != null) {
      String id = (String)session.getAttribute("id");
      if (session.getAttribute("grade") != null) {
        grade = (int)session.getAttribute("grade");
      }
      
      if (id != null && grade <= 20){ // 관리자 + 회원
        sw = true;  // 로그인 한 경우
      }
    }
    
    return sw;
  }

  @Override
  public boolean isAdmin(HttpSession session) {
    boolean sw = false; // 로그인하지 않은 것으로 초기화
    int grade = 99;
    
    // System.out.println("-> grade: " + session.getAttribute("grade"));
    if (session != null) {
      String id = (String)session.getAttribute("id");
      if (session.getAttribute("grade") != null) {
        grade = (int)session.getAttribute("grade");
      }
      
      if (id != null && grade <= 10){ // 관리자
        sw = true;  // 로그인 한 경우
      }
    }
    
    return sw;
  }  
  
  @Override
  public int id_personal_check(HashMap<Object, Object> map) {
    int cnt = this.memberDAO.id_personal_check(map);
    return cnt;
  }
  
  @Override
  public int id_memberno_check(HashMap<Object, Object> map) {
   int memberno = this.memberDAO.id_memberno_check(map);
    return memberno;
  }

  @Override
  public String id_find(int memberno) {
    String id = this.memberDAO.id_find(memberno);
    return id;
  }

  @Override
  public int passwd_personal_check(HashMap<Object, Object> map) {
    int cnt = this.memberDAO.passwd_personal_check(map);
    return cnt;
  }
  
  @Override
  public int passwd_memberno_check(HashMap<Object, Object> map) {
    int memberno = this.memberDAO.passwd_memberno_check(map);
    return memberno;
  }

  @Override
  public String passwd_find(int memberno) {
    String find_passwd = this.memberDAO.passwd_find(memberno);
    AES256Util aes256Util = null;
    
    try {
      aes256Util = new AES256Util();
    } catch (UnsupportedEncodingException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    String passwd = null;
    try {
      passwd = aes256Util.aesDecode(find_passwd); // 복호화
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    return passwd;
  }

  @Override
  public int grade_update(HashMap<Object, Object> map) {
    int cnt = this.memberDAO.grade_update(map);
    return cnt;
  }


  
}
