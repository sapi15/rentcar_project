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

  $(function() {
    
  });

  function recom_ajax(rentno, status_count){
    console.log("-> recom_" + status_count + ": " + $('#recom_' + status_count).html());  // A tag body   
       
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
     params = 'rentno=' + rentno; // 공백이 값으로 있으면 안됨.
    // params = rentno;  // -> 이렇게 하면 rentno가 입력이 안됨 -> why? ,json 형식이 아니라서?(키,값)
     console.log('-> ' + params);
    
    $.ajax(
      {
        url: '/rent/update_recom_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          if (rdata.cnt == 1) {
            // $('#span_animation_' + status_count).hide();   // SPAN 태그에 animation 출력
            $('#recom_' + status_count).html('<span class="glyphicon glyphicon-thumbs-up"></span> '+'Like ('+rdata.recom+')');     // A 태그에 animation 출력
          } else {
            // $('#span_animation_' + status_count).html("X");
            $('#recom_' + status_count).html('Like(X)');
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    // 애니메이션
    // $('#recom_' + status_count).html("<img src='/rent/images/ani04.gif' style='width: 10%;'>");
    // $('#span_animation_' + status_count).css('text-align', 'center');
    // $('#span_animation_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
    // $('#span_animation_' + status_count).show(); // 숨겨진 태그의 출력
  }
</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href="../rentcargrp/list.do" class='title_link' >차량정보</A> > 전체목록
</DIV>  

  
<DIV class='content_body'>

  <ASIDE class="aside_right">   
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="../rentcargrp/list.do">카테고리 목록</A>
  </ASIDE>
  
  <br> 
  
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' action='./list_all_join_search_paging.do' method='get' >
<%--  <input type='hidden' name='rentcargrpno' value='${rentcargrpVO.rentcargrpno }'> --%>
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
         <!-- <button type='button' onclick="history.back()">검색 취소</button> -->
         <button type='button' onclick="location.href='./list_all_join_search_paging.do'">검색 취소</button>
      </c:if>
    </form>
  </DIV>

  <DIV class='menu_line'></DIV>

  <TABLE class='table table-striped' style='width: 100%;'>
   <colgroup>
    <c:choose>
      <c:when test="${grade >=1 and grade <=10}">   
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 25%;'/>
      <col style='width: 25%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
     </c:when>
     <c:otherwise>
      <col style='width: 15%;'/>
      <col style='width: 20%;'/>
      <col style='width: 25%;'/>
      <col style='width: 25%;'/>
      <col style='width: 25%;'/>
     </c:otherwise>
    </c:choose>
   </colgroup>
   
    <thead>
     <c:choose>
      <c:when test="${grade >=1 and grade <=10}">   
        <TR>
          <TH class="th_bs">제조사</TH>    
          <TH class="th_bs">이미지</TH>
          <TH class="th_bs">차량명</TH>
          <TH class="th_bs">가격</TH>
          <TH class="th_bs">추천수</TH>
          <TH class="th_bs">기타</TH>
        </TR>
      </c:when>
      <c:otherwise>
        <TR>
          <TH class="th_bs">제조사</TH>    
          <TH class="th_bs">이미지</TH>
          <TH class="th_bs">차량명</TH>
          <TH class="th_bs">가격</TH>
          <TH class="th_bs">추천수</TH>
        </TR>
      </c:otherwise>
     </c:choose>
    </thead>
    
    <tbody>
    <c:forEach var="rentVO" items="${list}" varStatus="status">
      <c:set var="rentcargrpno" value="${rentVO.rentcargrpno }" />
      <c:set var="rentno" value="${rentVO.rentno }" />
      <c:set var="maker" value="${rentVO.maker }" />
      <c:set var="carname" value="${rentVO.carname }" />
      <c:set var="file1" value="${rentVO.file1 }" />
      <c:set var="thumb1" value="${rentVO.thumb1 }" />
      <c:set var="file2" value="${rentVO.file2 }" />
      <c:set var="thumb2" value="${rentVO.thumb2 }" />
      <c:set var="contents" value="${rentVO.contents }" />
      <c:set var="recom" value="${rentVO.recom }" />
      <c:set var="normal_price" value="${rentVO.normal_price }" />
      <c:set var="weekend_price" value="${rentVO.weekend_price }" />
      
      <tr> 
            <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${thumb2.endsWith('jpg') || thumb2.endsWith('png') || thumb2.endsWith('gif')}">
                            <!-- /static/rent/storage/ -->
                    <IMG src="/rent/storage/${thumb2 }" style="width: 50px; height: 30px;"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${file2}
                </c:otherwise>
              </c:choose>
            </td>
            
            <td style='vertical-align: middle; text-align: center;'>
              <c:choose>
                <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                            <!-- /static/rent/storage/ -->
                  <a href="./read.do?rentno=${rentno}&now_page=${param.now_page }">
                    <IMG src="/rent/storage/${thumb1 }" style="width: 300px; height: 150px;">
                  </a> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${file1}
                </c:otherwise>
              </c:choose>
            </td>  
            
            <td style='vertical-align: middle;  text-align: center;'>
              <a href="./read.do?rentno=${rentno}"><strong>${maker} ${carname}</strong><br>${contents }</a> 
            </td>
            
            <td style='vertical-align: middle;  text-align: center;'>
              <p>평일 24시간: ${normal_price}</p>
              <p>주말 24시간: ${weekend_price}</p>
            </td>
             
            <td style='vertical-align: middle;  text-align: center;'>
            <!-- https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_ref_glyph_thumbs-up&stacked=h 참고 -->
             <!-- <p><span class="glyphicon glyphicon-thumbs-up"></span> (0)</p>  -->
             <button type="button" id="recom_${status.count }" class="btn btn-default btn-sm" onclick="location.href='javascript:recom_ajax(${rentno}, ${status.count })'">
               <span class="glyphicon glyphicon-thumbs-up"></span> Like (${recom })
             </button> <!-- status.count을 쓰는 이유는 버튼 객체 구분을 위함 -->
            </td>
            
            <c:choose>
            <c:when test="${grade >=1 and grade <=10}"> 
              <td style='vertical-align: middle; text-align: center;'>
                <a href="./update_text.do?rentno=${rentno}&now_page=${now_page}" title="수정"><span class="glyphicon glyphicon-pencil"></span></a>
                <a href="./delete.do?rentno=${rentno}&now_page=${now_page}" title="삭제"><span class="glyphicon glyphicon-trash"></span></a>
              </td>
            </c:when>
            </c:choose>
            
          </tr>
        </c:forEach>
    </tbody>
  </TABLE>
  <%-- <DIV class='bottom_menu'>${paging_join }</DIV> --%>
  
</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>