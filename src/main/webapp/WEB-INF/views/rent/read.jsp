<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   <!-- 천단위 콤마 -->

<c:set var="rentno" value="${rentVO.rentno }" />
<c:set var="rentcargrpno" value="${rentVO.rentcargrpno }" />
<c:set var="maker" value="${rentVO.maker }" />
<c:set var="carname" value="${rentVO.carname }" />
<c:set var="kind" value="${rentVO.kind }" />
<c:set var="model" value="${rentVO.model }" />      
<c:set var="fuel" value="${rentVO.fuel }" />
<c:set var="hp" value="${rentVO.hp }" />
<c:set var="cc" value="${rentVO.cc }" />
<c:set var="mileage" value="${rentVO.mileage }" />
<c:set var="contents" value="${rentVO.contents }" />
<c:set var="recom" value="${rentVO.recom }" />
<c:set var="normal_price" value="${rentVO.normal_price }" />
<c:set var="weekend_price" value="${rentVO.weekend_price }" />

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">     <!-- static 폴더  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">

  $(function() {
    $('#btn_recom').on('click', function(){ recom_ajax(${rentno}); });
    $('#btn_login').on('click', login_ajax);
    $('#btn_loadDefault').on('click', loadDefault);
    $('#btn_order').on('click', function(){ order_ajax(${rentno}); });
  });

  <%-- 추천수 ajax --%>
  function recom_ajax(rentno){
    var params = "";
    params = 'rentno=' + rentno; 

    $.ajax({
        url: '/rent/update_recom_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          if (rdata.cnt == 1) {
            $('#btn_recom').html('<span class="glyphicon glyphicon-thumbs-up"></span> '+'('+rdata.recom+')'); 
          } else {
            $('#btn_recom').html('error');
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END
    
  }

  <%-- 관심모델에 상품 추가 --%>
  function cart_ajax(rentno) {
    var f = $('#frm_login');
    $('#rentno', f).val(rentno);  // 쇼핑카트 등록시 사용할 상품 번호를 저장.
    
    console.log('-> rentno: ' + $('#rentno', f).val()); 
    
    // console.log('-> id:' + '${sessionScope.id}');
    if ('${sessionScope.id}' == '') {  // 로그인이 안되어 있다면
      $('#div_login').show();    // 로그인폼 출력  
      
    } else {  // 로그인 한 경우
      cart_ajax_post();   // 쇼핑카트에 insert 처리 Ajax 호출 
    }
  }

  <%-- 관심모델 상품 등록 --%>
  function cart_ajax_post() {
    var f = $('#frm_login');
    var contentsno = $('#rentno', f).val();  // 쇼핑카트 등록시 사용할 상품 번호.
    
    var params = "";
    // params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params += 'rentno=' + contentsno;
    console.log('-> cart_ajax_post: ' + params);
    // return;
    
    $.ajax({
        url: '/cart/create.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          console.log('-> cart_ajax_post cnt: ' + rdata.cnt);  // 1: 관심모델 등록 성공
          
          if (rdata.cnt == 1) {
            var sw = confirm('해당 모델을 관심모델에 등록했습니다.\n관심모델 목록으로 이동하시겠습니까?');
            if (sw == true) {
              // 관심모델로 이동
              location.href='/cart/list_by_memberno.do';
            }else{
              location.reload(); 
            }  
          } else {
            alert('해당 모델을 관심모델에 등록하지 못했습니다.\n잠시후 다시 시도해주세요.');
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END
  }

  <%-- 로그인 --%>
  function login_ajax() {
    var params = "";
    params = $('#frm_login').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // params += '&${ _csrf.parameterName }=${ _csrf.token }';
    // console.log(params);
    // return;
    
    $.ajax({
        url: '/member/login_ajax.do',
        type: 'post',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우
          var str = '';
          console.log('-> login cnt: ' + rdata.cnt);  // 1: 로그인 성공
          
          if (rdata.cnt == 1) {
            if(rdata.grade == 99 ){
              alert('비회원입니다.');
            }else{
            $('#div_login').hide();
            // alert('로그인 성공');
            // 쇼핑카트에 insert 처리 Ajax 호출
            cart_ajax_post();            
            }
          } else {
            alert('로그인에 실패했습니다.\n잠시후 다시 시도해주세요.');
            
          }
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END
  }

 function loadDefault(){
    $('#id').val('admin');
    $('#passwd').val('1234');
  } 

 function order_ajax(rentno){
   var param='';
   param = 'rentno:' + rentno;
   console.log("-> rentno:" + rentno);
   
   var sw = confirm('렌트예약을 하시겠습니까?');
   if (sw == true) {
     if ('${sessionScope.id}' == ''){
       $('#div_login').show(); 
     }else{
       location.href='order_pay/create.do';
    }
   }else{
     location.reload(); 
   }  
}
</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href="/rentcargrp/list.do" class='title_link' >차량정보</A> >
  <A href="./list_by_rentcargrpno_search_paging.do?word=&now_page=1&rentcargrpno=${rentcargrpVO.rentcargrpno }" 
       class='title_link'>${rentcargrpVO.cate }</A> >
  ${maker } ${carname }
</DIV>  


<DIV class='content_body'>

  <ASIDE class="aside_right">
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <c:choose>
      <c:when test="${grade >=1 && grade <=10 }">   
      <A href="./create.do?rentcargrpno=${rentcargrpVO.rentcargrpno }">등록</A>
      <span class='menu_divide' >│</span>
      <A href="./update_text.do?rentno=${param.rentno}&now_page=${param.now_page}">수정</A>
      <span class='menu_divide' >│</span>
      <A href="./update_file.do?rentno=${param.rentno}">파일 수정</A>
      <span class='menu_divide' >│</span>
      <A href="./delete.do?rentno=${param.rentno}&now_page=${param.now_page}">삭제</A>
      <span class='menu_divide' >│</span>
      </c:when>
    </c:choose>
    <A href="./list_by_rentcargrpno_search_paging.do?rentcargrpno=${rentcargrpVO.rentcargrpno }">기본 목록형</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_rentcargrpno_grid_search_paging.do?now_page=1&rentcargrpno=${rentcargrpVO.rentcargrpno }">갤러리형</A>
  </ASIDE>
  
  <br> 
  
  <DIV style="text-align: right;">  
    <form name='frm' id='frm' method='get' action='./list_by_rentcargrpno_search_paging.do'>
      <input type='hidden' name='rentcargrpno' value='${rentcargrpVO.rentcargrpno }'>
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
         <%-- <button type='button' 
                     onclick="location.href='./list_by_rentcargrpno_search_paging.do?&word=&rentcargrpno=${rentcargrpVO.rentcargrpno}&now_page=1'">
                     검색 취소</button> --%>
                  <button type="button" onclick="history.back()">검색 취소 </button>
         <!-- <button type='button' onClick="history.back(); return false;" >검색 취소</button>     -->   
      </c:if>
    </form>
  </DIV>

  <DIV class='menu_line'></DIV>
  
  <%-- ******************** Ajax 기반 로그인 폼 시작 ******************** --%>
  <DIV id='div_login' style='width: 80%; margin: 0px auto; display: none;'>
  <FORM name='frm_login' id='frm_login' method='POST' action='/member/login.do' class="form-horizontal">
    <input type="hidden" name="rentno" id="rentno" value="rentno">
    
    <div class="form-group">
      <label class="col-md-4 control-label" style='font-size: 0.8em;'>아이디</label>    
      <div class="col-md-8">
        <input type='text' class="form-control" name='id' id='id' 
                   value='${ck_id }' required="required" 
                   style='width: 30%;' placeholder="아이디" autofocus="autofocus">
        <Label>   
          <input type='checkbox' name='id_save' value='Y' 
                    ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
        </Label>                   
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-4 control-label" style='font-size: 0.8em;'>패스워드</label>    
      <div class="col-md-8">
        <input type='password' class="form-control" name='passwd' id='passwd' 
                  value='${ck_passwd }' required="required" style='width: 30%;' placeholder="패스워드">
        <Label>
          <input type='checkbox' name='passwd_save' value='Y' 
                    ${ck_passwd_save == 'Y' ? "checked='checked'" : "" }> 저장
        </Label>
      </div>
    </div>   
 
    <div class="form-group">
      <div class="col-md-offset-4 col-md-8">
        <button type='button' id='btn_login' class="btn btn-primary btn-md">로그인</button>
        <button type='button' class="btn btn-primary btn-md" onclick="location.href='/member/create.do'">회원가입</button>
        <button type='button' id='btn_loadDefault' class="btn btn-primary btn-md">테스트 계정</button>
        <button type='button' id='btn_cancel' class="btn btn-primary btn-md" onclick="$('#div_login').hide();">취소</button>
      </div>
    </div>   
  </FORM>
  </DIV>
  <%-- ******************** Ajax 기반 로그인 폼 종료 ******************** --%>
  
  <fieldset class="fieldset_basic">
   <ul>
     <li class="li_none">
       <c:set var="file1saved" value="${rentVO.file1saved.toLowerCase() }" />    <!-- 실제로 이미지인지 확인 하는 부분 -->
       <c:if test="${file1saved.endsWith('jpg') || file1saved.endsWith('png') || file1saved.endsWith('gif')}"></c:if>
       <DIV style="width: 50%; float: left; margin-right: 10px;">   <!-- float: left -->
        <IMG src="/rent/storage/${rentVO.file1 }" style="width: 80%;"> <!-- width: 100%; 의 기준은 바로 위의 div -->
       </DIV>
  
       <DIV style="width: 47%; float: left;">
        <span style="font-weight: bold; font-size: 30px;">${carname }</span> &nbsp;
        <button type="button" id="btn_recom" class="btn btn-default btn-sm">
         <span class="glyphicon glyphicon-thumbs-up"></span> (${recom })
        </button><br><br>
        <span style="font-weight: bold; font-size: 20px;">모델명: ${model }</span><br><br>
        <span >${kind } · ${fuel } · ${hp } · ${cc } · 복합연비: ${mileage }</span><br><br>
        <!-- 보완하기  -->
        <span>${contents }</span><br><br>
       
       
        <button type='submit' id='btn_order' class="btn btn-primary">렌트예약</button>
        <!-- <button type='button' onclick="location.href='/order_pay/create.do'" class="btn btn-primary">렌트예약</button> -->
        <button type='button' id='btn_cart_ajax' class="btn btn-primary" onclick="cart_ajax(${rentno})">관심모델 등록</button>
        <button type='button' 
                    onclick="location.href='/rent/list_by_rentcargrpno_search_paging.do?now_page=${param.now_page}&rentcargrpno=${rentcargrpno }'" 
                    class="btn btn-primary">목록</button>
       </DIV>
     </li>   
    </ul>
  </fieldset>
  
</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>