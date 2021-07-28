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
 
<DIV class='title_line'>즐겨찾기 그룹 > ${bmkgrpVO.name } > 그룹명 수정</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='rentcargrpno' id='rentcargrpno' value='${rentcargrpVO.rentcargrpno }'>
      <label>즐겨찾기 그룹 명</label>
      <input type='text' name='name' value="${bmkgrpVO.name }" required="required" 
                 autofocus="autofocus" style='width: 10%;'>
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
    </FORM>
  </DIV>
   
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 25%;'/>
      <col style='width: 25%;'/>
      <col style='width: 25%;'/>
      <col style='width: 25%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">즐겨찾기 그룹 명</TH>
      <TH class="th_bs">등록일</TH>
      <TH class="th_bs">관련 자료 수(추가)</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="bmkgrpVO" items="${list}">
      <c:set var="bmkgrpno" value="${bmkgrpVO.bmkgrpno }" />
      <TR>
        <TD class="td_bs">${bmkgrpVO.name }</TD>
        <TD class="td_bs">${bmkgrpVO.rdate.substring(0, 10) }</TD>
        <TD class="td_bs"></TD>
        <TD class="td_bs">
          <A href="./read_update.do?bmkgrpno=${bmkgrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?bmkgrpno=${bmkgrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>