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
 
<DIV class='title_line'>예약목록(차량등록)(렌트카 그룹(카테고리그룹))</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
       <label>순서</label>
       <input type='number' name='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>       
      
      <label>회원명</label>
      <input type='text' name='userna' value='' required="required" style='width: 10%;'
                 autofocus="autofocus">
  
      <label>차량명</label>
      <input type='text' name='carna' value='' required="required" 
                style='width: 10%;'>
                
      <label>차량분류</label>
      <select name='kind'>
        <option value='소형' selected="selected">소형</option>
        <option value='중형'>중형</option>
        <option value='대형'>대형</option>
      </select>           
  
      <label>렌트유형</label>
      <select name='rentype'>
        <option value='장기렌트' selected="selected">장기렌트</option>
        <option value='단기렌트'>단기렌트</option>
      </select>
      
      <!-- 반납상태 -->
      <input type="hidden" name='returnid' value='반납대기' required="required" 
                style='width: 10%;'>
       
      <button type="submit" id='submit'>등록</button>
      <button type="reset" onclick="cancel();">취소</button>
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
      <col style='width: 7%;'/>
      <col style='width: 13%;'/>
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
        <TD class="td_bs">
        <A href="../kindgrp/list_by_rentcargrpno.do?rentcargrpno=${rentcargrpno }">${rentcargrpVO.kind }</A>
        </TD>
        <TD class="td_bs">${rentcargrpVO.rentype }</TD>
        <TD class="td_bs">${rentcargrpVO.rdate.substring(0, 10) }</TD>
        <TD class="td_bs">
          <c:choose>
            <c:when test="${rentcargrpVO.returnid == '반납대기'}">
              <A href="./update_returnid.do?rentcargrpno=${rentcargrpno }&returnid=${rentcargrpVO.returnid }"><IMG src="/rentcargrp/images/button_cancel.png" style='width: 18px;'></A>
            </c:when>
            <c:otherwise>
              <A href="./update_returnid.do?rentcargrpno=${rentcargrpno }&returnid=${rentcargrpVO.returnid }"><IMG src="/rentcargrp/images/button_ok.png" style='width: 18px;'></A>
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