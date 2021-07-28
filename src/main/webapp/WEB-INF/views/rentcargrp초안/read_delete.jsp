<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>예약 > ${rentcargrpVO.userna } 회원 예약 삭제</DIV>

<DIV class='content_body'>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">예약정보를 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='rentcargrpno' id='rentcargrpno' value='${rentcargrpVO.rentcargrpno }'>
       
      <label>순서</label>: ${rentcargrpVO.seqno } 
      <label>회원명</label>: ${rentcargrpVO.userna } 
      <label>차량명</label>: ${rentcargrpVO.carna }     
      <label>차량분류</label>: ${rentcargrpVO.kind }
      <label>렌트유형</label>: ${rentcargrpVO.rentype } 
      <label>반납상태</label>: ${rentcargrpVO.returnid }   
       
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
    </FORM>
  </DIV>
   
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 20%;'/>
      <col style='width: 5%;'/>
      <col style='width: 15%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">회원명</TH>
      <TH class="th_bs">차량명</TH>
      <TH class="th_bs">차량분류</TH>
      <TH class="th_bs">렌트유형</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">반납상태</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="rentcargrpVO" items="${list}">
      <c:set var="rentcargrpno" value="${rentcargrpVO.rentcargrpno }" />
      <TR>
        <TD class="td_bs">${rentcargrpVO.seqno }</TD>
        <TD class="td_bs">${rentcargrpVO.userna }</TD>
        <TD class="td_bs">${rentcargrpVO.carna }</TD>
        <TD class="td_bs">${rentcargrpVO.kind }</TD>
        <TD class="td_bs">${rentcargrpVO.rentype }</TD>
        <TD class="td_bs">${rentcargrpVO.rdate.substring(0, 10) }</TD>
        <TD class="td_bs">
          <c:choose>
            <c:when test="${rentcargrpVO.returnid == '반납대기'}">
              <IMG src="/rentcargrp/images/button_cancel.png" style='width: 18px;'>
            </c:when>
            <c:otherwise>
              <IMG src="/rentcargrp/images/button_ok.png" style='width: 18px;'>
            </c:otherwise>
          </c:choose>
        </TD>        
        
        <TD class="td_bs">
          <A href="./read_update.do?rentcargrpno=${rentcargrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?rentcargrpno=${rentcargrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
          <A href="./update_seqno_up.do?rentcargrpno=${rentcargrpno }" title="우선순위 상향"><span class="glyphicon glyphicon-arrow-up"></span></A>
          <A href="./update_seqno_down.do?rentcargrpno=${rentcargrpno }" title="우선순위 하향"><span class="glyphicon glyphicon-arrow-down"></span></A>         
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV> 

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>