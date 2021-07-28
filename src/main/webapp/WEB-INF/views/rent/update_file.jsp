<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 천단위 콤마 -->

<c:set var="rentno" value="${rentVO.rentno }" />
<c:set var="maker" value="${rentVO.maker }" />
<c:set var="carname" value="${rentVO.carname }" />
<c:set var="kind" value="${rentVO.kind }" />
<c:set var="model" value="${rentVO.model }" />      
<c:set var="fuel" value="${rentVO.fuel }" />
<c:set var="hp" value="${rentVO.hp }" />
<c:set var="cc" value="${rentVO.cc }" />
<c:set var="mileage" value="${rentVO.mileage }" />
<c:set var="contents" value="${rentVO.contents }" />
<c:set var="word" value="${rentVO.word }" />
 
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
<jsp:include page="../menu/top.jsp" flush='false'/>
 
<DIV class='title_line'>
  <A href="../rentcargrp/list.do" class='title_link' >차량정보</A> >
  <A href="./list_by_rentcargrpno_search_paging.do?rentcargrpno=${rentcargrpVO.rentcargrpno }" 
       class='title_link'>${rentcargrpVO.cate }</A> >
    ${carname } 수정
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
  </ASIDE>
  <br> 
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list_by_rentcargrpno_search_paging.do'>
      <input type='hidden' name='rentcargrpno' value='${rentcargrpVO.rentcargrpno }'>'

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
        <DIV style='text-align: center; width: 10%; float: left;'>
          <c:set var="file2saved" value="${rentVO.file2saved.toLowerCase() }" />
          <c:set var="thumb2" value="${rentVO.thumb2 }" />
          <c:choose>
            <c:when test="${thumb2.endsWith('jpg') || thumb2.endsWith('png') || thumb2.endsWith('gif')}">
              <IMG src="/info/storage/${file2saved }" style='width: 70%;'> 
            </c:when>
            <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
              첨부 파일: ${file2}
            </c:otherwise>
          </c:choose>
        </DIV>
        
        <DIV style='text-align: center; width: 50%; float: left;'>
          <c:set var="file1saved" value="${rentVO.file1saved.toLowerCase() }" />
          <c:set var="thumb1" value="${rentVO.thumb1 }" />
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <IMG src="/info/storage/${file1saved }" style='width: 70%;'> 
            </c:when>
            <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
              첨부 파일: ${file1}
            </c:otherwise>
          </c:choose>
        </DIV>

        <DIV style='text-align: left; width: 37%; float: left;'>
          <span style='font-size: 1.5em; font-weight: bold;'>${carname}</span>
          <br>
          <FORM name='frm' method='POST' action='./update_file.do' enctype="multipart/form-data">
            <input type="hidden" name="rentno" value="${rentno }">
            <input type="hidden" name="now_page" value="${param.now_page }">
            <br><br> 
            로고 이미지 변경<br>  
            <input type='file' name='file2MF' id='file2MF' value='' placeholder="파일 선택"><br>
            차량 이미지 변경<br>
            <input type='file' name='file1MF' id='file1MF' value='' placeholder="파일 선택"><br>
            <div style='margin-top: 20px; clear: both;'>  
              <button type="submit" class="btn btn-primary">파일 변경 처리</button>
              <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
            </div>  
          </FORM>
        </DIV>
      </li>
      <li class="li_none">

      </li>   
    </ul>
  </fieldset>
  
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false'/>
</body>
 
</html>