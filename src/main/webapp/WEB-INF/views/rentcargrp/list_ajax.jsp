<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="rentcargrpno" value="${rentcargrpVO.rentcargrpno }" />
<c:set var="seqno" value="${rentcargrpVO.seqno }" />
<c:set var="cate" value="${rentcargrpVO.cate }" />
<c:set var="rdate" value="${rentcargrpVO.rdate }" />
 
 
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
  $(function() {
    $('#btn_update_cancel').on('click', cancel);
    $('#btn_delete_cancel').on('click', cancel);
  });

  function cancel(){
    $('#panel_create').css('display', "");   // show, 숨겨진 태그 출력
    $('#panel_update').css('display', "none");  // hide, 태그 숨김
    $('#panel_delete').css('display', "none");  // hide, 태그 숨김
  }


  // 수정
  function read_update_ajax(rentcargrpno){
    $('#panel_create').css('display', "none");
    $('#panel_delete').css('display', "none");  
    $('#panel_update').css('display', ""); 
    
    var params = "";
    //console.log('-> rentcargrpno: ' + rentcargrpno);
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'rentcargrpno=' +  rentcargrpno; 
    $.ajax({
      url: '/rentcargrp/read_ajax.do',
      type: 'get',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 응답이 온경우
        var rentcargrpno = rdata.rentcargrpno;
        var seqno = rdata.seqno;
        var cate = rdata.cate;
        //var rdate = rdata.rdate;

        var frm_update = $('#frm_update');
        $('#rentcargrpno', frm_update).val(rentcargrpno);
        $('#seqno', frm_update).val(seqno);
        $('#cate', frm_update).val(cate);
        //$('#rdate', frm_update).val(rdate);
      },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      console.log(error);
    }
  });
  
      // $('#panel').html('급여를 조회 중입니다...');
      //$('#panel2').css('text-align', 'center');
      //$('#panel2').html("<img src='/ajax/images/ani04.gif' style='width: 10%;'>");
      //$('#panel2').show(); // 숨겨진 태그의 출력
 }  


  //삭제
  function read_delete_ajax(rentcargrpno){
    $('#panel_create').css('display', "none");   
    $('#panel_update').css('display', "none");  
    $('#panel_delete').css('display', ""); 
        
    var params = "";
    //console.log('-> rentcargrpno: ' + rentcargrpno);
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'rentcargrpno=' +  rentcargrpno; 
    $.ajax({
      url: '/rentcargrp/read_ajax.do',
      type: 'get',  // get, post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 응답이 온경우

        // data 읽어 와서 from에 넣기
        var rentcargrpno = rdata.rentcargrpno;
        var seqno = rdata.seqno;
        var cate = rdata.cate;
        //var rdate = rdata.rdate;

        var frm_delete = $('#frm_delete');
        $('#rentcargrpno', frm_delete).val(rentcargrpno);
        $('#frm_delete_seqno').html(seqno);
        $('#frm_delete_cate').html(cate);
        // data 읽어 와서 from에 넣기
        
      },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      console.log(error);
    }
  });
  
      // $('#panel').html('급여를 조회 중입니다...');
      //$('#panel2').css('text-align', 'center');
      //$('#panel2').html("<img src='/ajax/images/ani04.gif' style='width: 10%;'>");
      //$('#panel2').show(); // 숨겨진 태그의 출력
 }  
</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href="../rentcargrp/list.do" class='title_link' style="font-size: 30px" >차량정보</A>
</DIV>

<DIV class='content_body'>

<c:choose>
  <c:when test="${grade >=1 and grade <=10}">
   <!-- 등록 -->
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
       <label>순서</label>
       <input type='number' name='seqno' id='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>       

      <label>카테고리</label>
      <input type='text' name='cate' id='cate' value='' required="required" style='width: 10%;'
                 autofocus="autofocus">
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
   </DIV>
   
    <!--  수정  -->
    <DIV id='panel_update' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
                                      text-align: center; display: none;'>
      <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
       <input type="hidden" name='rentcargrpno' id='rentcargrpno' value=''> 
         <label>순서</label>
         <input type='number' name='seqno' id='seqno' value='1' required="required" 
                  min='1' max='1000' step='1' style='width: 5%;'>     
                  
          <label>카테고리</label>
          <input type='text' name='cate' id='cate' value='' required="required" style='width: 10%;'
                     autofocus="autofocus">  
         
        <button type="submit" id='submit'>저장</button>
        <button type="button" id='btn_update_cancel'>취소</button>
      </FORM>
    </DIV>
    
    <!-- 삭제 -->
    <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; 
            width: 100%; text-align: center; display: none;'>
      <div class="msg_warning">정보를 삭제하면 복구 할 수 없습니다.</div>
      <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
        <input type='hidden' name='rentcargrpno' id='rentcargrpno' value=''>
        <label>순서</label>: <span id="frm_delete_seqno">${seqno }</span>  <!-- frm_delete_seqno 상속으로 적어준 것 -->
        <label>차량분류</label>: <span id="frm_delete_cate">${cate }</span>
       
        <button type="submit" id='submit'>삭제</button>
        <button type="button" id='btn_delete_cancel'>취소</button>
      </FORM>
    </DIV>
   </c:when>
  </c:choose>
   
    
  <TABLE class='table table-striped'>
    <c:choose>
      <c:when test="${grade >=1 and grade <=10}">
        <colgroup>
          <col style='width: 20%;'/>
          <col style='width: 35%;'/>
          <col style='width: 20%;'/>
          <col style='width: 25%;'/>
        </colgroup>
      </c:when>
      <c:otherwise>
        <colgroup>
          <col style='width: 20%;'/>
          <col style='width: 40%;'/>
          <col style='width: 40%;'/>
        </colgroup>
      </c:otherwise>
     </c:choose>
     
    <thead>
      <c:choose>
        <c:when test="${grade >=1 and grade <=10}">
          <TR>
            <TH class="th_bs">순서</TH>
            <TH class="th_bs">카테고리</TH>
            <TH class="th_bs">등록일</TH>
            <TH class="th_bs">기타</TH>
          </TR>
        </c:when>
        <c:otherwise>
          <TR>
            <TH class="th_bs">순서</TH>
            <TH class="th_bs">카테고리</TH>
            <TH class="th_bs">등록일</TH>
          </TR>
        </c:otherwise>
     </c:choose>  
    </thead>
    
    <tbody> <!-- var: 사용할 변수,   items: Collection객체(List, ArrayList) , varStatus:  반복 index 변수 -->
    <c:forEach var="rentcargrpVO" items="${list}">  <!-- for문 start -->
      <c:set var="rentcargrpno" value="${rentcargrpVO.rentcargrpno }" />
      <TR>
        <TD class="td_bs">${rentcargrpVO.seqno }</TD>
        
        <TD class="td_bs">
        <A href="../rent/list_by_rentcargrpno_search_paging.do?now_page=1&rentcargrpno=${rentcargrpno }">${rentcargrpVO.cate }</A>
        </TD>
        <TD class="td_bs">${rentcargrpVO.rdate.substring(0, 10) }</TD>
        
        <c:choose>
          <c:when test="${grade >=1 and grade <=10}">
           <TD class="td_bs">
            <A href="javascript: read_update_ajax(${rentcargrpno })" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
            <A href="javascript: read_delete_ajax(${rentcargrpno })" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
            <A href="./update_seqno_up.do?rentcargrpno=${rentcargrpno }" title="우선순위 상향"><span class="glyphicon glyphicon-arrow-up"></span></A>
            <A href="./update_seqno_down.do?rentcargrpno=${rentcargrpno }" title="우선순위 하향"><span class="glyphicon glyphicon-arrow-down"></span></A> 
           </TD>   
          </c:when>
        </c:choose>        
       
      </TR>   
    </c:forEach> <!-- for문 end -->
    </tbody>
  </TABLE>
  
  <div style="text-align: right; padding: 10px;"> 
     <button type='button' onclick="location.href='../rent/list_all_join_search_paging.do?now_page=1'" class="btn btn-primary">전체목록</button>
  </div>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>