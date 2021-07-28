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
<c:set var="passwd" value="${rentVO.passwd }" />
<c:set var="normal_price" value="${rentVO.normal_price }" />
<c:set var="weekend_price" value="${rentVO.weekend_price }" />
 
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
    
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
  // window.onload=function(){
  //  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  // };

  $(function() {
    CKEDITOR.replace('contents');  // <TEXTAREA>태그 id 값
  });
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
   <FORM name='frm' method='POST' action='./update_text.do' class="form-horizontal">
    <input type="hidden" name="now_page" value="${param.now_page }">        <!-- POST 방식에 값을 보내는 방법 -->
    <input type='hidden' name="rentno" value='${rentno }'>                  <!-- 자기 자신에게 form할 때 값을 전달하는 방법이다. -->
    <input type="hidden" name="rentcargrpno" value="${rentcargrpVO.rentcargrpno }">
    <input type="hidden" name="adminno" value="1"> <%-- 관리자 개발후 변경 필요 --%>
    
    <div class="form-group">
       <label class="control-label col-md-2">차량명</label>
       <div class="col-md-10">
         <input type='text' name='carname' value='${carname }' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 15%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">제조사</label>
       <div class="col-md-10">
         <input type="text" name='maker'  value='${maker }' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">차량분류</label>
       <div class="col-md-10">
         <input type="text" name='kind'  value='${kind }' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">모델명</label>
       <div class="col-md-10">
         <input type="text" name='model'  value='${model }' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">연료종류</label>
       <div class="col-md-10">
         <input type="text" name='fuel'  value='${fuel }' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">마력</label>
       <div class="col-md-10">
         <input type="text" name='hp'  value='${hp }' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">배기량</label>
       <div class="col-md-10">
         <input type="text" name='cc'  value='${cc }' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">복합연비</label>
       <div class="col-md-10">
         <input type="text" name='mileage'  value='${mileage }' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">내용</label>
       <div class="col-md-10">
         <textarea name='contents' required="required" class="form-control" rows="20" style='width: 90%;'>${contents }</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">검색어</label>
       <div class="col-md-10">
         <input type='text' name='word' value='${word }' required="required" class="form-control" style='width: 90%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">평일가격</label>
       <div class="col-md-10">
         <input type="text" name='normal_price'  value='${normal_price }' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">주말가격</label>
       <div class="col-md-10">
         <input type="text" name='weekend_price'  value='${weekend_price }' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">패스워드</label>
       <div class="col-md-10">
         <input type='password' name='passwd' value='${passwd }' required="required" class="form-control" style='width: 15%;'>
       </div>
    </div>   
    <div class="content_body_bottom" style="padding-right: 10%;">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false'/>
</body>
 
</html>