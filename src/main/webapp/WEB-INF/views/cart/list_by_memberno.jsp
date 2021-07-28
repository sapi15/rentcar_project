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

function delete_func(cartno) {  // GET -> POST 전송, 상품 삭제
  var frm = $('#frm_post');
  frm.attr('action', './delete.do');
  $('#cartno',  frm).val(cartno);
  
  frm.submit();
}  

</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
<form name='frm_post' id='frm_post' action='' method='post'>
  <input type='hidden' name='cartno' id='cartno'>
</form>
 
<DIV class='title_line'>
  관심모델
</DIV>  

<DIV class='content_body'>

  <ASIDE class="aside_right">   
    <A href="javascript:location.reload();">새로고침</A>
  </ASIDE>
  <br> 

  <DIV class='menu_line'></DIV>

  <TABLE class='table table-striped'>
   <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 30%;'/>
      <col style='width: 20%;'/>
      <col style='width: 15%;'/> 
      <col style='width: 5%;'/>    
   </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">제조사</TH>    
      <TH class="th_bs">이미지</TH>
      <TH class="th_bs">차량명</TH>
      <TH class="th_bs">가격</TH>
      <TH class="th_bs">등록날짜</TH>
      <TH class="th_bs">삭제</TH>
    </TR>
    </thead>
    
    <tbody style="border-bottom: 1px dotted;">
    <c:choose>
      <c:when test="${list.size() > 0 }">
        <c:forEach var="cartVO" items="${list}">
          <c:set var="cartno" value="${cartVO.cartno }" />
          <c:set var="memberno" value="${cartVO.memberno }" />
          <c:set var="rentno" value="${cartVO.rentno }" />
          <c:set var="maker" value="${cartVO.maker }" />
          <c:set var="carname" value="${cartVO.carname }" />
          <c:set var="model" value="${cartVO.model }" />
          <c:set var="thumb1" value="${cartVO.thumb1 }" />
          <c:set var="thumb2" value="${cartVO.thumb2 }" />
          <c:set var="normal_price" value="${cartVO.normal_price }" />
          <c:set var="weekend_price" value="${cartVO.weekend_price }" />
          <c:set var="rdate" value="${cartVO.rdate }" />
        
        <tr> 
              <td style='vertical-align: middle; text-align: center;'>
                <c:choose>
                  <c:when test="${thumb2.endsWith('jpg') || thumb2.endsWith('png') || thumb2.endsWith('gif')}">
                              <!-- /static/rent/storage/ -->
                      <IMG src="/rent/storage/${thumb2 }" style="width: 50px; height: 30px;"> 
                  </c:when>
                  <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                    ${rentVO.file2}
                  </c:otherwise>
                </c:choose>
              </td>
              
              <td style='vertical-align: middle; text-align: center;'>
                <c:choose>
                  <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                              <!-- /static/rent/storage/ -->
                    <a href="/rent/read.do?rentno=${rentno}">
                      <IMG src="/rent/storage/${thumb1 }" style="width: 300px; height: 150px;">
                    </a> 
                  </c:when>
                  <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                    ${rentVO.file1}
                  </c:otherwise>
                </c:choose>
              </td>  
              
              <td style='vertical-align: middle;  text-align: center;'>
                <a href="/rent/read.do?rentno=${rentno}"><strong>${maker} ${carname}</strong><br>${model }</a> 
              </td>
              
              <td style='vertical-align: middle;  text-align: center;'>
                <p>평일 24시간: ${normal_price}</p>
                <p>주말 24시간: ${weekend_price}</p>
              </td>
               
              <td style='vertical-align: middle; text-align: center;'>
                <p>${rdate.substring(0, 16) }</p> 
              </td>
              
              <td style='vertical-align: middle; text-align: center;'>
                <A href="javascript: delete_func(${cartno })"><IMG src="/cart/images/delete4.PNG" title="삭제"></A>
              </td>
         </tr>
       </c:forEach>
     </c:when>
     <c:otherwise>
      <tr>
        <td colspan="6"  style="text-align: center; font-size: 1.3em; padding: 50px;">관심모델이 없습니다.</td>
      </tr>
     </c:otherwise>
     </c:choose>
     
     
     
   </tbody>
 </TABLE>

</DIV>

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>