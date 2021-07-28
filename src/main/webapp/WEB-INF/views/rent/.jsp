<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 천단위 콤마 -->
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">  <!-- static 폴더  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href="../rentcargrp/list.do" class='title_link' >차량정보</A> > 전체 목록
</DIV>  

  
<DIV class='content_body'>

  <ASIDE class="aside_right">   
    <A href="./create.do?rentcargrpno=${rentcargrpVO.rentcargrpno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE>
  <br> 
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list_all_join_search_paging.do'>
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
         <button type='button' onclick="history.back()">검색 취소</button>
      </c:if>
    </form>
  </DIV>

  <DIV class='menu_line'></DIV>

  <TABLE class='table table-striped'>
   <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 50%;'/>
      <col style='width: 20%;'/>    
   </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">제조사</TH>    
      <TH class="th_bs">이미지</TH>
      <TH class="th_bs">차량명</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="infoVO" items="${list}">
      <c:set var="rentcargrpno" value="${infoVO.rentcargrpno }" />
      <c:set var="infono" value="${infoVO.infono }" />
      <c:set var="maker" value="${infoVO.maker }" />
      <c:set var="carname" value="${infoVO.carname }" />
      <c:set var="file1" value="${infoVO.file1 }" />
      <c:set var="thumb1" value="${infoVO.thumb1 }" />
      <c:set var="file2" value="${infoVO.file2 }" />
      <c:set var="thumb2" value="${infoVO.thumb2 }" />
      <c:set var="contents" value="${infoVO.contents }" />

      <tr> 
            <td style='vertical-align: middle; text-align: center;'>
             <!-- 고정 소스  -->
              <c:choose>
                <c:when test="${thumb2.endsWith('jpg') || thumb2.endsWith('png') || thumb2.endsWith('gif')}">
                            <!-- /static/contents/storage/ -->
                    <IMG src="/info/storage/${thumb2 }" style="width: 50px; height: 30px;"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${file2}
                </c:otherwise>
              </c:choose>
            <!-- 고정 소스  -->
            
            </td>
            <td style='vertical-align: middle; text-align: center;'>
            <!-- 고정 소스  -->
              <c:choose>
                <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                            <!-- /static/contents/storage/ -->
                  <a href="./read.do?infono=${infono}&now_page=${param.now_page }">
                    <IMG src="/info/storage/${thumb1 }" style="width: 190px; height: 130px;">
                  </a> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${file1}
                </c:otherwise>
              </c:choose>
            <!-- 고정 소스  -->
            </td>  
            <td style='vertical-align: middle;  text-align: center;'>
              <a href="./read.do?infono=${infono}&now_page=${param.now_page }"><strong>${maker} ${carname}</strong><br>${content }</a> 
            </td> 
            <td style='vertical-align: middle; text-align: center;'>
              <a href="./update_text.do?infono=${infono}&now_page=${now_page}" title="수정"><span class="glyphicon glyphicon-pencil"></span></a>
              <a href="./delete.do?infono=${infono}&now_page=${now_page}" title="삭제"><span class="glyphicon glyphicon-trash"></span></a>
            </td>
          </tr>
        </c:forEach>
    </tbody>
  </TABLE>
  <DIV class='bottom_menu'>${paging }</DIV>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>