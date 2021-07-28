<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main' style="width: 100%;">
  <%-- 화면 상단 메뉴 --%>
  <DIV class="main_top_img">
    <DIV class='top_menu_label'><span><A class='menu_link2'  href='/' >KCAR</A></span></DIV>
    <NAV class='top_menu'>
      <!-- <span style='padding-left: 0.5%;'></span> -->
      <div style="float: left; font-weight:bold; padding: 0.2%;">     <!-- span을 공간 띄우기 용도로 사용중 -->
      <span class='glyphicon glyphicon-home'></span> <A class='menu_link'  href='/' >Home</A><span class='top_menu_sep'></span>
      <A class='menu_link'  href='/rent/list.do' >렌트예약</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='' >예약확인</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/rentcargrp/list.do' >차량정보</A><span class='top_menu_sep'> </span>
      <A class='menu_link'  href='/customer/list.do' >고객센터</A><span class='top_menu_sep'></span>
      <A class='menu_link'  href='' >차량등록</A><span class='top_menu_sep'> </span>
      </div>
      
      <div class='top_menu_member'>
      <span class='glyphicon glyphicon-user'></span> <A class='menu_link'  href='' >회원가입</A><span class='top_menu_sep'></span>
      <A class='menu_link'  href='' >로그인</A><span class='top_menu_sep'></span>
      <A class='menu_link'  href='/bmkgrp/list.do'>즐겨찾기</A><span class='top_menu_sep'> </span>
      </div> 
          
            
    </NAV>
   </DIV>
 
  
  <%-- 내용 --%> 
  <DIV class='content'>