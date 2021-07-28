<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>

  <!-- static 폴더  -->
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
<A href="../bmkgrp/list.do" class='title_link'>즐겨찾기 그룹</A> >
      전체 즐겨찾기(join)
 </DIV>
  
<DIV class='content_body'>
   <TABLE class='table table-striped'>
     <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>    
      <col style='width: 25%;'/>
      <col style='width: 10%;'/>
     <%--  <col style='width: 10%;'/> --%>
      <col style='width: 15%;'/>
   </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">즐겨찾기<br>번호(PK)</TH>
      <TH class="th_bs">즐겨찾기<br>그룹 명</TH>
      <TH class="th_bs">즐겨찾기<br>그룹 번호(FK)</TH>
      <TH class="th_bs">차량명</TH>
      <TH class="th_bs">내용</TH>
      <TH class="th_bs">등록일</TH>
     <!--  <TH class="th_bs">관련 자료 수<br>(추가)</TH> -->
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="bmkgrp_BmkVO" items="${list}">
      <c:set var="bmkno" value="${bmkgrp_BmkVO.bmkno }" />
      <c:set var="g_bmkgrpno" value="${bmkgrp_BmkVO.g_bmkgrpno }" />
      <c:set var="g_name" value="${bmkgrp_BmkVO.g_name }" />
      <c:set var="name" value="${bmkgrp_BmkVO.name }" />
      <c:set var="content" value="${bmkgrp_BmkVO.content }" />
      <c:set var="rdate" value="${bmkgrp_BmkVO.rdate }" />
      <%-- <c:set var="cnt" value="${bmkgrp_BmkVO. }" /> --%>
      <TR>
        <TD class="td_bs">${bmkno }</TD>
        <TD class="td_bs">${g_name }</TD>
        <TD class="td_bs">${g_bmkgrpno }</TD>
        <TD class="td_bs">${name }</TD>
        <TD class="td_bs">${content }</TD>
        <TD class="td_bs">${rdate.substring(0, 10) }</TD> <!-- 년,월,일만 짤라낸 것 -->
        <!-- <TD class="td_bs"></TD>  -->
        <TD class="td_bs">
          <A href="./read_update.do?bmkno=${bmkno }&bmkgrpno=${g_bmkgrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?bmkno=${bmkno }&bmkgrpno=${g_bmkgrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>               
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>