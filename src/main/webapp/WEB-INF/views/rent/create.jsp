<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <c:set var="carname" value="${kindgrpVO.carname }" /> --%>


<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css"> <!-- static -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript" src="/ckeditor/ckeditor.js"></script> <!-- /static 기준 -->
<script type="text/JavaScript">
  // window.onload=function(){
  //  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  // };

  $(function() {
    CKEDITOR.replace('contents');  // <TEXTAREA>태그 id 값
  });
 
</script>
 
</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>
  <A href="../rentcargrp/list.do" class='title_link' >차량정보</A> > 
  <A href="./list_by_rentcargrpno_search_paging.do?word=&now_page=1&rentcargrpno=${rentcargrpVO.rentcargrpno }" 
       class='title_link'>${rentcargrpVO.cate }</A> > 
  <span style="font-size: 30px;">차량 등록</span>
</DIV>  
 
 
<DIV class='content_body'>
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal" enctype="multipart/form-data">
    <input type="hidden" name="rentcargrpno" value="${param.rentcargrpno }">
    <%-- <input type="hidden" name="adminno" value="${param.adminno }"> --%>
    <input type="hidden" name="adminno" value="1">
    
    <div class="form-group">
       <label class="control-label col-md-2">차량명</label>
       <div class="col-md-9">
          <input type="text" name='carname'  value="NIRO HEV" required="required" class="form-control" style='width: 15%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">제조사</label>
       <div class="col-md-9">
         <input type="text" name='maker'  value="기아" required="required" class="form-control" style='width: 20%;'>
         <input type='file' class="form-control" name='file2MF' id='file2MF' 
                     value='' placeholder="파일 선택" style="width: 20%"> 
       </div>
    </div>
<!--
    <div class="form-group">
       <label class="control-label col-md-2">차량분류</label>
       <div class="col-md-9">
         <input type="text" name='kind'  value="소형" required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">모델명</label>
       <div class="col-md-9">
         <input type="text" name='model'  value="1.6가솔린HEV" required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">연료종류</label>
       <div class="col-md-9">
         <input type="text" name='fuel'  value="하이브리드, 가솔린, 전기" required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">마력</label>
       <div class="col-md-9">
         <input type="text" name='hp'  value="141hp" required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">배기량</label>
       <div class="col-md-9">
         <input type="text" name='cc'  value="1,600cc" required="required" class="form-control" style='width: 20%;'>
       </div>
    </div>
     <div class="form-group">
       <label class="control-label col-md-2">복합연비</label>
       <div class="col-md-9">
         <input type="text" name='mileage'  value="19.5km/ℓ" required="required" class="form-control" style='width: 20%;'>
       </div>
    </div> 
 -->
    <div class="form-group">
       <label class="control-label col-md-2">내용</label>
       <div class="col-md-9">
         <textarea name='contents' required="required" class="form-control" rows="20" style='width: 100%;'>하이브리드 suv</textarea> 
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">검색어</label>
       <div class="col-md-9">
         <input type='text' name='word' value='소형, 기아, suv' required="required" 
                  class="form-control" style='width: 100%;'>  <!-- value='1234' 테스트를 위한 값임. -->
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">이미지</label>
       <div class="col-md-9">
       <input type='file' class="form-control" name='file1MF' id='file1MF' 
                 value='' placeholder="파일 선택" style="width: 100%">           
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">패스워드</label>
       <div class="col-md-9">
         <input type='password' name='passwd' value='1234' required="required" 
                  class="form-control" style='width: 10%;'>  <!-- value='1234' 테스트를 위한 값임. -->
       </div>
    </div>             

    <div class="content_body_bottom" style="padding-right: 10%;">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list_by_rentcargrpno_search_paging.do?word=&now_page=1&rentcargrpno=${param.rentcargrpno}'" 
                  class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>