<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 천단위 콤마 -->

<c:set var="memberno" value ="${memberVO.memberno}" />
<c:set var="id" value ="${memberVO.id}" />
<c:set var="mname" value ="${memberVO.mname}" />
<c:set var="tel" value ="${memberVO.tel}" />
<c:set var="email1" value ="${memberVO.email1}" />
<c:set var="email2" value ="${memberVO.email2}" />
<c:set var="postcode" value ="${memberVO.postcode}" />
<c:set var="address1" value ="${memberVO.address1}" />
<c:set var="address2" value ="${memberVO.address2}" />
<c:set var="mdate" value ="${memberVO.mdate}" />
<c:set var="grade" value ="${memberVO.grade}" />
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
  // select에서 옵션 값을 email2에 값 넣기
  $(function(){  
    $(document).ready(function(){  // window.onload와 비슷한 기능?
  
       // readonly 속성: 읽기 전용으로 변경. form으로 값 전달 된다. boolean형
      // cf) disabled 속성 : readonly와 기능은 같으나 form으로 값 전달이 되지 않는다.
      $('select[name=email2_select]').change(function() {
        if($(this).val()=="non"){
          $('#email2').val('');
          $('#email2').attr("readonly", false); // 읽기 전용 해제
        } else {
          $('#email2').val($(this).val());
          $('#email2').attr("readonly",true);  // 읽기 전용 설정
        }
      });
      
    });
  });

</script>

</head>
<body>
 <jsp:include page="../menu/top.jsp" flush='false' />
 
  <DIV class='title_line'>
    회원 정보 조회(수정)
  </DIV>

  <DIV class='content_body'>
    <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href='./create.do'>회원 가입</A>
      <span class='menu_divide' >│</span>
      <c:choose>
       <c:when test="${sessionScope.id == memberVO.id}">  
          <A href='./passwd_update.do?memberno=${memberno }'>패스워드 변경</A>
          <span class='menu_divide' >│</span> 
        </c:when>
      </c:choose>
      <c:choose>
        <c:when test="${sessionScope.id == memberVO.id}"> 
          <A href="./leave.do?memberno=${memberno }">회원탈퇴</A>
          <span class='menu_divide' >│</span>
        </c:when>
      </c:choose>
      <A href='./list.do'>목록</A>
    </ASIDE> 
   
    <div class='menu_line'></div>
    
    <FORM name='frm' id='frm' method='POST' action='./update.do' class="form-horizontal">
    <input type="hidden" name="memberno" value="${memberno}">
     <div class="form-group">
        <label for="id" class="col-md-2 control-label" style='font-size: 0.9em;'>아이디</label>
        <div class="col-md-10">
          <input type="text" class="form-control" name='id' id='id' value='${id }' style='width: 10%;' readonly="readonly">
        </div>
      </div>                 
      
      <div class="form-group">
        <label for="name" class="col-md-2 control-label" style='font-size: 0.9em;'>성명</label>
        <div class="col-md-10">
          <input type="text" class="form-control" name='mname' id='mname' value='${mname }' style='width: 10%;' readonly="readonly">
        </div>
      </div>   
  
      <div class="form-group">
        <label for="tel" class="col-md-2 control-label" style='font-size: 0.9em;'>전화번호*</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='tel' id='tel' 
                     value='${tel}' required="required" style='width: 30%;' placeholder="전화번호"> 예) 010-0000-0000
        </div>
      </div>   
      
      <div class="form-group">
        <label for="email1 email2" class="col-md-2 control-label" style='font-size: 0.9em;'>이메일<br>(e-mail)*</label>    
        <div class="col-md-10">
          <input type="text" class="form-control" name='email1' id='email1' style="width: 15%; float: left;" placeholder="email1" required="required" value='${email1}'>  
          <p style="float: left;">@</p><input type="text" class="form-control" name="email2" id='email2' style="width: 15%; float: left;" placeholder=".com" required="required" value='${email2}'>
          <select name='email2_select' id='email2_select' class="form-control" onChange="" style="width: 20%;">
              <option value="non">직접입력</option>
              <option value="hanmail.net">hanmail.net</option>
              <option value="naver.com">naver.com</option>
              <option value="yahoo.co.kr">yahoo.co.kr</option>
              <option value="hotmail.com">hotmail.com</option>
              <option value="paran.com">paran.com</option>
              <option value="nate.com">nate.com</option>
              <option value="google.com">google.com</option>
              <option value="gmail.com">gmail.com</option>
              <option value="empal.com">empal.com</option>
              <option value="korea.com">korea.com</option>
              <option value="freechal.com">freechal.com</option>
          </select><br><!-- <input type="checkbox" name='email_yn' id='email_yn' value="Y" checked="checked"> --에서 발송하는 e-mail을 수신합니다. -->
        </div>
      </div>    
  
      <div class="form-group">
        <label for="postcode" class="col-md-2 control-label" style='font-size: 0.9em;'>우편번호</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='postcode' id='postcode' 
                     value='${postcode }' style='width: 30%;' placeholder="우편번호">
          <input type="button" id="btn_DaumPostcode" value="우편번호 찾기" class="btn btn-info btn-md">
        </div>
      </div>  
  
      <div class="form-group">
        <label for="address1" class="col-md-2 control-label" style='font-size: 0.9em;'>주소</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='address1' id='address1' 
                     value='${address1 }' style='width: 80%;' placeholder="주소">
        </div>
      </div>   
  
      <div class="form-group">
        <label for="address2" class="col-md-2 control-label" style='font-size: 0.9em;'>상세 주소</label>    
        <div class="col-md-10">
          <input type='text' class="form-control" name='address2' id='address2' 
                     value='${address2 }' style='width: 80%;' placeholder="상세 주소">
        </div>
      </div>   
  
      <div class="form-group">
      <div class="col-md-12">
      
<!-- ----- DAUM 우편번호 API 시작 ----- -->
  <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
    <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" 
            style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
  </div>
   
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
      // 우편번호 찾기 화면을 넣을 element
      var element_wrap = document.getElementById('wrap');
   
      function foldDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_wrap.style.display = 'none';
      }
   
      function DaumPostcode() {
          // 현재 scroll 위치를 저장해놓는다.
          var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
   
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullAddr = data.address; // 최종 주소 변수
                  var extraAddr = ''; // 조합형 주소 변수
   
                  // 기본 주소가 도로명 타입일때 조합한다.
                  if(data.addressType === 'R'){
                      //법정동명이 있을 경우 추가한다.
                      if(data.bname !== ''){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있을 경우 추가한다.
                      if(data.buildingName !== ''){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                      fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                  }
   
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                  document.getElementById('address1').value = fullAddr;
   
                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_wrap.style.display = 'none';
   
                  // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                  document.body.scrollTop = currentScroll;
                  
                  $('#address2').focus();
              },
              // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
              onresize : function(size) {
                  element_wrap.style.height = size.height+'px';
              },
              width : '100%',
              height : '100%'
          }).embed(element_wrap);
   
          // iframe을 넣은 element를 보이게 한다.
          element_wrap.style.display = 'block';
      }
  </script>
  <!-- ----- DAUM 우편번호 API 종료----- -->
   
        </div>
      </div>
      <div class="form-group">
        <div class="col-md-offset-2 col-md-10">
         <button type="submit" class="btn btn-primary btn-md">수정</button>
          <button type="reset" class="btn btn-primary btn-md">다시입력</button>
          <c:choose>
            <c:when test="${sessionScope.id == memberVO.id}"> 
              <button type="button" onclick ="location.href='./passwd_update.do?memberno=${memberno}'"
                          class="btn btn-primary btn-md">패스워드 변경</button>
            </c:when>
          </c:choose>
         <button type="button" onclick="history.back()" class="btn btn-primary btn-md">취소</button>
        </div>
       </div>
    
    </FORM>
  </DIV>
    
    <jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>