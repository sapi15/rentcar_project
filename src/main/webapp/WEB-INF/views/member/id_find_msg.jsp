<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
  <DIV class='title_line'>
    아이디 찾기 결과
  </DIV>

  <DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE> 

  <div class='menu_line'></div>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
    <c:choose>
        <c:when test="${param.cnt == 0 }">
          <LI class='li_none'>
            <span class='span_success'>회원정보를 잘못 입력했습니다.</span>
          </LI>
          <LI class='li_none'> 
           <button type='button' onclick="location.href='./id_find.do'" class="btn btn-primary">다시 시도</button>
           <button type='button' onclick="location.href='/'" class="btn btn-primary">확인</button>                    
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>
            <span class='span_success'>회원님의 아이디는 '${param.id }' 입니다.</span>
          </LI> 
          <LI class='li_none'> 
           <button type='button' onclick="location.href='./login.do'" class="btn btn-primary">로그인</button>
           <button type='button' onclick="location.href='/'" class="btn btn-primary">확인</button>                    
          </LI>
          </c:otherwise>
         </c:choose>
     </UL>
  </fieldset>
 
</DIV>
</DIV> <%--  <DIV class='content_body'> END --%>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>