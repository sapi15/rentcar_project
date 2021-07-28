<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 천단위 콤마 -->

<c:set var="maker" value="${rentVO.maker }" />
<c:set var="carname" value="${rentVO.carname }" />

 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href="../rentcargrp/list.do" class='title_link' >차량정보</A> >
  <A href="./list_by_rentcargrpno_search_paging.do?word=&now_page=1&rentcargrpno=${rentcargrpVO.rentcargrpno }" 
    class='title_link'>${rentcargrpVO.cate }</A> >
    ${carname } 삭제
</DIV>  

  
<DIV class='content_body'>

  <ASIDE class="aside_right">   
    <A href="./create.do?rentcargrpno=${rentcargrpVO.rentcargrpno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_rentcargrpno_search_paging.do?rentcargrpno=${rentcargrpVO.rentcargrpno }">기본 목록형</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_rentcargrpno_grid.do?rentcargrpno=${rentcargrpVO.rentcargrpno }">갤러리형</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?rentno=${param.rentno}&now_page=${param.now_page}">수정</A>
  </ASIDE>
  <br>
    <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list_by_rentcargrpno_search_paging.do'>
      <input type='hidden' name='rentcargrpno' value='${rentcargrpVO.rentcargrpno }'>
      <c:choose>
        <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='word' id='word' value='${param.word }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='word' id='word' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_rentcargrpno_search_paging.do?rentcargrpno=${rentcargrpVO.rentcargrpno}&word='">
                     검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  
  <DIV class='menu_line'></DIV>

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <DIV style='text-align: center; width: 50%; float: left;'>
          <c:set var="file1saved" value="${rentVO.file1saved.toLowerCase() }" />
          <c:set var="thumb1" value="${rentVO.thumb1 }" />
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <IMG src="/rent/storage/${file1saved }" style='width: 70%;'> 
            </c:when>
            <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
              첨부 파일: ${file1}
            </c:otherwise>
          </c:choose>
        </DIV>

        <DIV style='text-align: left; width: 47%; float: left;'>
          <span style='font-size: 1.5em; font-weight: bold;'>${carname}</span>
          <br>
          <FORM name='frm' method='POST' action='./delete.do'>
                <input type='hidden' name='rentno' value='${param.rentno}'>
                <input type="hidden" name="now_page" value="${param.now_page }">
                <input type="hidden" name="rentcargrpno" value="${rentVO.rentcargrpno }">
                <input type="hidden" name="word" value="${param.word }">
                
                <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto;"></DIV>
                      
                <div class="form-group">   
                  <div class="col-md-12" style='text-align: center; margin: 10px auto;'>
                    <span style="font-weight: bold; color: red;">삭제 되는글: ${carname }</span><br><br>
                    삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>
                    
                    <button type = "submit" class="btn btn-primary">삭제 진행</button>
                    <button type = "button" onclick = "history.back()" class="btn btn-primary">취소</button>
                  </div>
                </div>   
            </FORM>
        </DIV>
      </li>
      <li class="li_none"></li>   
    </ul>
  </fieldset>
  
</DIV>

 <jsp:include page="../menu/bottom.jsp" />
</body>
</html>