<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>

 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>고객센터 > 1:1문의</DIV>

<DIV class='content_body'>
  <form name='fm' action='./h_proc.jsp' method='POST'>
    <span style="font-weight: bold;">불편 및 건의사항, 궁금한 사항을 올려 주시면 성심을 다해 답변해 드리겠습니다.</span><br><br>
    
    문의 유형 <select name="service">
    <option value="서비스 문의" >서비스 문의</option>
    <option value="서비스 칭찬" >서비스 칭찬</option>
    <option value="서비스 개선의견" >서비스 개선의견</option>
    <option value="시스템 오류제보" >시스템 오류제보</option>
    <option value="서비스 불편사항" >서비스 불편사항 </option>
    </select>
    <br>
    작성자 <input type="text" name="name"  style="width: 10%;"> 
            <label style="cursor: pointer;">
          <input type="checkbox" name='anonymity' value="익명" checked="checked"> 익명문의
          </label><br>
    글제목 <input type="text" name="title"  style="width: 30%;"><br>
    이메일 <input type="text" name="email"  style="width: 30%;">
            <label style="cursor: pointer;">
           <input type="checkbox" name='anony_email' value="이메일 없이 문의" checked="checked"> 이메일없이 문의
            </label><br>
    통신사 <label style="cursor: pointer;">
          <input type="radio" name='tel' value="SKT"> SKT
          </label>
          <label style="cursor: pointer;">
          <input type="radio" name='tel'  value="KT"> KT
          </label>    
          <label style="cursor: pointer;">
          <input type="radio" name='tel' value="LGU+"> LGU+
          </label><br>          
    연락처 <input type="text" name="moblie" placeholder="ex) 010-1234-5678" style="width: 20%;"><br>
    내용<br>
    <textarea  name="content" rows="10" cols="40" style="width: 70%;" ></textarea><br>
    <button type="submit">확인</button> <button type="reset">취소</button>
     
 </form>
  
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>