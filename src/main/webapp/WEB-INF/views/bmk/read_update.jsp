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
  <A href="../bmkgrp/list.do" class='title_link' >즐겨찾기 그룹</A> > 
  <A href="./list_by_bmkgrpno.do?bmkgrpno=${param.bmkgrpno }" class='title_link'>${bmkgrpVO.name }</A> > 
  ${bmkVO.name } 수정
</DIV> 

<DIV class='content_body'>

<DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./update.do'>
      <input type="hidden" name="bmkno" value="${param.bmkno }">  <!-- ★★★ 수정과 삭제시 필요하다.--> 
      
      <label>즐겨찾기 그룹 번호</label>
      <input type="number" name='bmkgrpno' value='${param.bmkgrpno }' 
                required="required" min="1" max="100" step="1" autofocus="autofocus">
      <label>차량명</label>
      <input type="text" name='name' value='${bmkVO.name }' required="required" style="width: 8%;">
      <label>내용</label>
      <input type="text" name='content' value='${bmkVO.content }' required="required" width="25%">             
                
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="location.href='./list_by_bmkgrpno.do?bmkgrpno=${bmkVO.bmkgrpno}'">취소</button>
    </FORM>
  </DIV>

  <TABLE class='table table-striped'>
     <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 25%;'/>
      <col style='width: 25%;'/>    
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
   </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">즐겨찾기<br> 번호(PK)</TH>
      <TH class="th_bs">즐겨찾기<br> 그룹 번호(FK)</TH>
      <TH class="th_bs">차량명</TH>
      <TH class="th_bs">내용</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">관련 자료 수<br>(추가)</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="bmkVO" items="${list}">
      <c:set var="bmkno" value="${bmkVO.bmkno }" />
      <c:set var="bmkgrpno" value="${bmkVO.bmkgrpno }" />
      <TR>
        <TD class="td_bs">${bmkVO.bmkno }</TD>
        <TD class="td_bs">${bmkVO.bmkgrpno }</TD>
        <TD class="td_bs">${bmkVO.name }</TD>
        <TD class="td_bs">${bmkVO.content }</TD>
        <TD class="td_bs">${bmkVO.rdate.substring(0, 10) }</TD> <!-- 년,월,일만 짤라낸 것 -->
        <TD class="td_bs"></TD> 
        <TD class="td_bs">
          <A href="./read_update.do?bmkno=${bmkno }&bmkgrpno=${bmkgrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?bmkno=${bmkno }&bmkgrpno=${bmkgrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>               
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>