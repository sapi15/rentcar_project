<%@ page contentType="text/html; charset=UTF-8" %>

<%-- 
0315_과제 : 주제를 자유롭게 선정하여 HTML 페이지를 제작하여 등록할 것.
 1. HTML form 제작
   -> DIV, INPUT, TEXTAREA, SELECT, CHECKBOX, RADIO 
 
 2. 처리 페이지 제작
  -> 폼에서 입력받은 내용 출력
  
 3. 등록 시 성명은 실명으로 할 것.
--%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의 내용 처리</title>
<style type="text/css">
  *{ font-family: Malgun Gothic; font-size: 26px;}
</style>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<%
 String service = request.getParameter("service");
 String name = request.getParameter("name");
 String anonymity = request.getParameter("anonymity");
 String title = request.getParameter("title");
 String email = request.getParameter("email");
 String anony_email = request.getParameter("anony_email");
 String tel = request.getParameter("tel");
 String moblie = request.getParameter("moblie");
 String content = request.getParameter("content");
 
//out.println(anonymity);
//out.println(anony_email);
%>
 
  <h2>문의 접수 확인</h2>
  <div>
    <ul>
        <li> 문의 유형: <%=service %></li>
        <%
            if( anonymity != null) {
           %>
              <li>작성자: <%=anonymity %></li>
            <%
            }  else { %>
        <li> 작성자: <%=name %></li>
        <%
        }%>
        <li> 글제목: <%=title %></li>
         <%
           if( anony_email != null ){
           %>
            <li> 이메일: <%=anony_email %></li>
         <% 
           } else {
        %>
         <li> 이메일: <%=email %></li>
        <%
         }%>
        <li> 연락처: <%=tel %> <%=moblie %></li>
        <li style="background: yellow; width: 30%;"> 문의내용: <%=content %></li>
   </ul>
  </div>

 <A href='./h_form.jsp'>다시문의</A><br>
 <A href='./h_form.jsp'>제출하기</A> 
 
</body>
</html>