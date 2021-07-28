<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>
 
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
<jsp:include page="../menu/top.jsp" flush='false' />    <!-- top.jsp 가져오기 -->
 
<DIV class='title_line'>즐겨찾기 > 등록</DIV>

<DIV class='content_body'> 
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    <input type="hidden" name="bmkgrpno" value="${param.bmkgrpno }">  <!-- hidden, FK -->
    
    <div class="form-group">
       <label class="control-label col-md-5">자동차명</label>
       <div class="col-md-7">
         <input type='text' name='name' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 30%;'>       
       </div>
    </div>
    <div class="form-group">
    <label class="control-label col-md-5">내용</label>
       <div class="col-md-7">
         <input type='text' name='content' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 30%;'>
                   (부모 카테고리 번호: ${param.bmkgrpno })        
       </div>
    </div>
    <div class="content_body_bottom" style="padding-right: 20%;">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn btn-primary">목록</button>
    </div>
  </FORM>

</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>