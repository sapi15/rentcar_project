<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>
 
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
<script type="text/javascript">
$(function() { // 자동 실행
  $('#btn_send').on('click', send); 
});

function send() {
  $('#frm').submit();
}
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
  <DIV class='message'>
    <H3>관리자 권한이 필요한 페이지입니다.</H3>
    <br><br>
     <form id="frm" name="frm" action="/member/login.do" method="get">
     <input type="hidden" id="return_url" name="return_url" value="${param.return_url }">
       <button type="submit" class="btn btn-primary">로그인</button>  
    </form>     
    <!-- <button type='button' onclick="location.href='/member/login.do'" class="btn btn-info">로그인</button> -->
    <!-- <button type='button' onclick="location.href='/member/create.do'" class="btn btn-info">회원가입</button> -->
  </DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>