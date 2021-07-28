<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 천단위 콤마 -->
 
 
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
  <A href="../rentcargrp/list.do" class='title_link' >차량정보</A> >
    ${rentcargrpVO.cate }
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
    <A href="./list_by_rentcargrpno_grid.do?rentcargrpno=${rentcargrpVO.rentcargrpno }">갤러리형</A>
  </ASIDE>
  <br> 
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list_by_rentcargrpno_search.do'>
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
                     onclick="location.href='./list_by_rentcargrpno_search.do?rentcargrpno=${rentcargrpVO.rentcargrpno }&word='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>

  <DIV class='menu_line'></DIV>

  <TABLE class='table table-striped'>
   <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 40%;'/>
      <col style='width: 30%;'/>
      <col style='width: 10%;'/>    
   </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">제조사</TH>    
      <TH class="th_bs">사진</TH>
      <TH class="th_bs">내용</TH>
      <TH class="th_bs">세부정보</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="kindgrpVO" items="${list}">
      <c:set var="rentcargrpno" value="${kindgrpVO.rentcargrpno }" />
      <c:set var="kindgrpno" value="${kindgrpVO.kindgrpno }" />
      <c:set var="thumb1" value="${kindgrpVO.thumb1 }" />
      
      <tr> 
            <td style='vertical-align: middle; text-align: center;'>${kindgrpVO.maker}</td>
            <td style='vertical-align: middle; text-align: center;'>
            
            <!-- 고정 소스  -->
              <c:choose>
                <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                            <!-- /static/contents/storage/ -->
                  <a href="./read.do?kindgrpno=${kindgrpno}">
                    <IMG src="/contents/storage/${thumb1 }" style="width: 120px; height: 80px;">
                  </a> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${kindgrpVO.file1}
                </c:otherwise>
              </c:choose>
           <!-- 고정 소스  -->
      
     </td>  
            <td style='vertical-align: middle;'>
              <a href="./read.do?kindgrpno=${kindgrpno}"><strong>${kindgrpVO.carname}</strong><br>${kindgrpVO.content }</a> 
            </td>
            <td style='vertical-align: middle; text-align: center;'>
             
             <!-- 모델명, 마력 등 세부내용 -->
                
            </td>
            <td style='vertical-align: middle; text-align: center;'>
              <a href="./update_text.do?kindgrpno=${kindgrpno}&now_page=${now_page}" title="수정"><span class="glyphicon glyphicon-pencil"></span></a>
              <a href="./delete.do?kindgrpno=${kindgrpno}&now_page=${now_page}" title="삭제"><span class="glyphicon glyphicon-trash"></span></a>
            </td>
          </tr>
        </c:forEach>
    </tbody>
  </TABLE>
  
</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>