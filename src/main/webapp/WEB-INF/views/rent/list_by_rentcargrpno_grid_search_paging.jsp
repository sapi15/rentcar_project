<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 천단위 콤마 -->
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">   <!-- static 폴더  -->
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
  <A href="../rentcargrp/list.do" class='title_link' >차량정보</A> >
  <A href="./list_by_rentcargrpno_grid.do?rentcargrpno=${rentcargrpVO.rentcargrpno }" 
    class='title_link' style="font-size: 30px" >${rentcargrpVO.cate }</A>
</DIV>  

  
<DIV class='content_body'>

  <ASIDE class="aside_right">
    <c:choose>
      <c:when test="${grade >=1 && grade <=10 }">      
        <A href="./create.do?rentcargrpno=${rentcargrpVO.rentcargrpno }">등록</A>
        <span class='menu_divide' >│</span>
      </c:when>
    </c:choose>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_rentcargrpno_search_paging.do?word=&now_page=1&rentcargrpno=${rentcargrpVO.rentcargrpno }">기본 목록형</A>
  </ASIDE>
  <br> 
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list_by_rentcargrpno_grid_search_paging.do'>
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
         <%-- <button type='button' 
                     onclick="location.href='./list_by_rentcargrpno_grid.do?&word=&rentcargrpno=${rentcargrpVO.rentcargrpno}&now_page=1'">
                     검색 취소</button> --%>
         <<button type='button' onClick="history.back();" >검색 취소</button>   
      </c:if>
    </form>
  </DIV>

  <DIV class='menu_line'></DIV>

  <fieldset>
   <ul>
     <li style="list-style: none;">
        <DIV style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
          <c:forEach var="rentVO" items="${list}" varStatus="status">
            <c:set var="rentcargrpno" value="${rentVO.rentcargrpno }" />
            <c:set var="rentno" value="${rentVO.rentno }" />
            <c:set var="maker" value="${rentVO.maker }" />
            <c:set var="carname" value="${rentVO.carname }" />
            <c:set var="kind" value="${rentVO.kind }" />
            <c:set var="model" value="${rentVO.model }" />      
            <c:set var="fuel" value="${rentVO.fuel }" />
            <c:set var="hp" value="${rentVO.hp }" />
            <c:set var="cc" value="${rentVO.cc }" />
            <c:set var="mileage" value="${rentVO.mileage }" />
            <c:set var="file1" value="${rentVO.file1 }" />
            <c:set var="thumb1" value="${rentVO.thumb1 }" />
            <c:set var="size1" value="${rentVO.size1 }" />
            <c:set var="file2" value="${rentVO.file2 }" />
            <c:set var="thumb2" value="${rentVO.thumb2 }" />
            <c:set var="size2" value="${rentVO.size2 }" />
            <c:set var="contents" value="${rentVO.contents }" />
            
            <%-- 하나의 행에 이미지를 4개씩 출력후 행 변경 --%>   <!--  이부분이 잘못 출력 되는 것 같은데... -->
            <c:if test="${status.index % 5 == 0 && status.index != 0 }"> 
              <HR class='menu_line'>
            </c:if>
            
            <!-- 하나의 이미지, 19 * 5 = 96% -->
            <DIV style='width: 19%; 
                    float: left; 
                    margin: 0.5%; padding: 0.5%; background-color: #EEEFFF; text-align: center;'>
              <c:choose>
                <c:when test="${size1 > 0}"> <!-- 파일이 존재하면 -->
                  <c:choose> 
                    <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <!-- 이미지 인경우 -->
                      <a href="./read.do?rentno=${rentno}&now_page=${param.now_page}">               
                        <IMG src="/rent/storage/${thumb1 }" style='width: 100%; height: 150px;'> <!-- height는 %을 줄 수 없다.  -->
                      </a><br>
                      
                      <span style="font-weight: bold;">${carname}</span><br>
                      <strong>${model }</strong><br>
                      <span>${maker }</span>
                
                      <!-- 간략 스펙 정보(제조사, 모델명, 가격? 마력? -->
                  
                    </c:when>
                    <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                      <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                        <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                          <a href="./read.do?rentno=${rentno}">${file1}</a><br>
                        </DIV>
                      </DIV>          
                    </c:otherwise>
                  </c:choose>
                </c:when>
                <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
                  <a href="./read.do?rentno=${rentno}">
                    <img src='/rent/images/none3.png' style='width: 100%; height: 150px;'>
                  </a><br>
                  이미지를 등록해주세요.
                </c:otherwise>
              </c:choose>         
            </DIV>  
          </c:forEach><br><br>
         </DIV><!-- 갤러리 Layout 종료 -->
      </li>   
    </ul>
  </fieldset>
  <DIV class='bottom_menu'>${paging_grid }</DIV>
 
</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>

</html>