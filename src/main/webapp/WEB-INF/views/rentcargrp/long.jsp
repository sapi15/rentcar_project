<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>
  <A href="./index_rent.do" class='title_link' >렌트예약</a> > 
  장기렌트
</DIV>
 
<DIV class='content_body'>
  <FORM name='frm' method='POST' action='./long_term.do' class="form-horizontal">    <!-- post 만들어야함 -->
    <div class="form-group" style="height: 100px;" >
       <label class="middle_title_line">기간/지점 선택</label>
       
       <div class="col-md-8">
         <input type='text' name='userna' value='' required="required" placeholder="이름"
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
      
    </div>
    <div class="form-group", style="height: 100px;">
       <label class="middle_title_line">차량 선택</label>
       <div class="col-md-8">
         <ul>
            
         </ul>
       </div>
    </div>
    <div class="form-group", style="height: 100px;">
       <label class="middle_title_line">계약자 정보 입력</label>
    </div>
    <div class="form-group">
       <label class="control-label col-md-4">예약자명</label>
       <div class="col-md-8">
         <input type='text' name='userna' value='' required="required" placeholder="이름"
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-4">차량명</label>
       <div class="col-md-8">
         <input type='text' name='carna' value='' required="required" 
                   placeholder="차량명"
                   style='width: 30%;' class="form-control" >
       </div>
  </div>
    <div class="form-group">
       <label class="control-label col-md-4">출력 순서</label> 
       <div class="col-md-8">
         <input type='number' name='seqno' value='1' required="required" 
                   placeholder="출력 순서" min="1" max="1000" step="1" 
                   style='width: 30%;' class="form-control" >   
       </div>
    </div>    
    <div class="form-group">
       <label class="control-label col-md-4">렌트유형</label>
       <div class="col-md-8">
          <select name='rentype' class="form-control" style='width: 20%;'>
            <option value='장기렌트' selected="selected">장기렌트</option>
            <option value='단기렌트'>단기렌트</option>
          </select>
       </div>
    </div>   
  
    <div class="content_body_bottom" style="padding-right: 20%;">
      <button type="submit" class="btn">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn">목록</button>
    </div>
  
  </FORM>
  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>