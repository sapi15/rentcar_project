<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 스타일 -->
<link href="../assets/css/bootstrap-ko.css" rel="stylesheet">
<link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">
</head>

<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>
  <DIV class='top_img'>
    <DIV class='top_menu_label' style="float: left;">
      <A class='menu_link2'  href='/' >KCAR</A>
    </DIV>
      <c:choose>
        <c:when test="${sessionScope.id == null}"> <%-- 로그인 안 한 경 우 --%>
        <DIV style="float: right; width: 12%; margin-right: 10px;">
          <div class="join ">
            <A class='join_link'  href='/member/create.do' style="font-weight: bold;">회원가입</A>
          </div>
          <div class="login login_link">
            <A class ="login_link"href='/member/login.do' style="font-weight: bold; font-size: 15px;" >로그인</A>
          </div>
        </DIV>
        </c:when>
        <c:otherwise>
        <DIV style="float: right; width: 15%; ">
         <!-- <div class='cart'>
          <A class='menu_link'  href='/cart/list_by_memberno.do'>관심모델</A><span class='top_menu_sep'></span>  
         </div> -->
         <div class='cart'>
          <A class='logout_link'  href='/member/read.do?memberno=${memberno }' style="font-weight: bold;">회원정보</A>
         </div>
         <div class="logout">
            <A class='logout_link'  href='/member/logout.do' style="font-weight: bold;">로그아웃</A>
         </div>
         <div class="login_member">
           ${sessionScope.id }<span class='top_menu_sep'></span>
         </div> 
        </DIV>
        </c:otherwise>
      </c:choose>   
  </DIV>
  
  <NAV class="navbar top_menu" style="background-color: rgba( 102, 204, 255, 1);" >
    <DIV class="container-fluid">
      <DIV class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li><A href="/" style="background-color: rgba( 102, 204, 255, 1);"><i class="glyphicon glyphicon-home"></i> Home</A></li>
          <li class="dropdown">
            <A class="dropdown-toggle menu_link" data-toggle="dropdown" href="#">렌트예약 <span class="caret"></span></A>
            <ul class="dropdown-menu">
                <li><A href='#'>단기대여</A></li>
                <li><A href='#'>장기대여</A></li>
            </ul>
          </li>
          <li><A class='menu_link'  href='#' >예약확인</A></li>
          <li><A class='menu_link'  href='/rentcargrp/list.do' >차량정보</A></li>
          <li><A class='menu_link'  href='/customer/list.do' >고객센터</A></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
        <c:choose>
          <c:when test="${sessionScope.id == null}">
            <li><A class='menu_link'  href='/cart/list_by_memberno.do'>관심모델</A></li>  
          </c:when> 
        </c:choose>
        <c:choose>
          <c:when test="${grade > 10}">
            <li><A class='menu_link'  href='/cart/list_by_memberno.do'>관심모델</A></li>  
          </c:when> 
        </c:choose>
        <c:choose>
          <c:when test="${grade >= 1 and grade <= 10}">
            <li><A class='menu_link'  href='/member/list.do' ><i class ="glyphicon glyphicon-align-justify"></i> 회원목록</A></li> 
            <li><A class='menu_link'  href='/cart/list_by_memberno.do'>관심모델</A></li>  
          </c:when> 
        </c:choose>
          
          <!-- <li><A class='menu_link'  href='/bmkgrp/list.do'>즐겨찾기</A></li> -->
        </ul>
      </DIV>
    </DIV>
 </NAV>
 
  
  <%-- 내용 --%> 
  <DIV class='content'>