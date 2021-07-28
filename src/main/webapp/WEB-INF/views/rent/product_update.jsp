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
    
<script type="text/javascript">
 
  
</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>
  <A href="../rentcargrp/list.do" class='title_link' >차량정보</A> >
  <A href="./list_by_rentcargrpno_search_paging.do?rentcargrpno=${rentcargrpVO.rentcargrpno }" 
       class='title_link'>${rentcargrpVO.cate }</A> >
   ${rentVO.carname } 세부 정보 등록
</DIV>  


<DIV class='content_body'>
  <DIV class='menu_line'></DIV>
   <FORM name='frm' method='POST' action='./product_update.do' class="form-horizontal">
    <input type='hidden' name="rentno" value='${rentVO.rentno }'>                  <!-- 자기 자신에게 form할 때 값을 전달하는 방법이다. -->
    <input type="hidden" name="rentcargrpno" value="${rentcargrpVO.rentcargrpno }">
    
    <div class="form-group">
       <label class="control-label col-md-2">차량명</label>
       <div class="col-md-10">
          ${rentVO.carname }
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">차량분류</label>
       <div class="col-md-10">
         <input type="text" name='kind'  value='' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">모델명</label>
       <div class="col-md-10">
         <input type="text" name='model'  value='' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">연료종류</label>
       <div class="col-md-10">
         <input type="text" name='fuel'  value='' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">마력</label>
       <div class="col-md-10">
         <input type="text" name='hp'  value='' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">배기량</label>
       <div class="col-md-10">
         <input type="text" name='cc'  value='' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">복합연비</label>
       <div class="col-md-10">
         <input type="text" name='mileage'  value='' required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="content_body_bottom" style="padding-right: 10%;">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" onclick="location.href='./read.do?rentno=${param.rentno}&rentcargrpno=${param.rentcargrpno }'" 
                  class="btn btn-primary">취소</button>
    </div>
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false'/>
</body>
 
</html>