<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  $(function() { // 자동 실행
    $('#btn_myinfo').on('click', myinfo); 
    $('#btn_order_pay').on('click', send);
  });

  // 나의 주소 가져오기, jQuery ajax 요청
  function myinfo() {
    // $('#btn_close').attr("data-focus", "이동할 태그 지정");
    
    // var frm = $('#frm'); // id가 frm인 태그 검색
    // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
    var params = '';
    var msg = '';

    $.ajax({
      url: '/member/read_ajax.do', // spring execute
      type: 'get',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";

        $('#rname').val(rdata.rname);
        $('#rtel').val(rdata.rtel);
        
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    });

  }

  function check_null(str) {
    var sw = false;
    if (str == "" || str.trim().length == 0 || str == null || str == undefined || typeof str == "object") {
      sw = true;  // 값이 없는 경우  
    }
    return sw;
  }
  
  function send() {
    if (check_null($('#rname').val()))  {
      alert('운전자 성명을 입력해주세요.');
      $('#rname').focus();
      return;
    } 

    if (check_null($('#rtel').val()))  {
      alert('운전자 전화번호를 입력해주세요.');
      $('#rtel').focus();
      return;
    } 

    frm.submit();
  }
</script>
</head> 


<body>
<jsp:include page="../menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    예약결제
  </DIV>

  <DIV class='content_body'>

  <ASIDE class="aside_left">
    대여 차량
  </ASIDE> 

  <div class='menu_line'></div>
  
  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 10%;"></col>
      <col style="width: 40%;"></col>
      <col style="width: 20%;"></col>
      <col style="width: 10%;"></col> <%-- 수량 --%>
      <col style="width: 10%;"></col> <%-- 합계 --%>
      <col style="width: 10%;"></col>
    </colgroup>
   
    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="cartVO" items="${list }">
        <c:set var="cartno" value="${cartVO.cartno }" />
        <c:set var="contentsno" value="${cartVO.contentsno }" />
        <c:set var="title" value="${cartVO.title }" />
        <c:set var="thumb1" value="${cartVO.thumb1 }" />
        <c:set var="price" value="${cartVO.price }" />
        <c:set var="dc" value="${cartVO.dc }" />
        <c:set var="saleprice" value="${cartVO.saleprice }" />
        <c:set var="point" value="${cartVO.point }" />
        <c:set var="memberno" value="${cartVO.memberno }" />
        <c:set var="cnt" value="${cartVO.cnt }" />
        <c:set var="tot" value="${cartVO.tot }" />
        <c:set var="rdate" value="${cartVO.rdate }" />
        
        <tr> 
          <td style='vertical-align: middle; text-align: center;'>
            <c:choose>
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                <%-- /static/contents/storage/ --%>
                <a href="/contents/read.do?contentsno=${contentsno}"><IMG src="/contents/storage/${thumb1 }" style="width: 120px; height: 80px;"></a> 
              </c:when>
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                ${contentsVO.file1}
              </c:otherwise>
            </c:choose>
          </td>  
          <td style='vertical-align: middle;'>
            <a href="/contents/read.do?contentsno=${contentsno}"><strong>${title}</strong></a> 
          </td> 
          <td style='vertical-align: middle; text-align: center;'>
            <del><fmt:formatNumber value="${price}" pattern="#,###" /></del><br>
            <span style="color: #FF0000; font-size: 1.2em;">${dc} %</span>
            <strong><fmt:formatNumber value="${saleprice}" pattern="#,###" /></strong><br>
            <span style="font-size: 0.8em;">포인트: <fmt:formatNumber value="${point}" pattern="#,###" /></span>
          </td>
          <td style='vertical-align: middle; text-align: center;'>
            수량: ${cnt }
          </td>
          <td style='vertical-align: middle; text-align: center;'>
            <fmt:formatNumber value="${tot}" pattern="#,###" />
          </td>
          <td style='vertical-align: middle; text-align: center;'>
            <A href="../cart/list_by_memberno.do"><IMG src="/cart/images/delete3.png" title="쇼핑카트로 이동합니다."></A>
          </td>
        </tr>
      </c:forEach>
      
    </tbody>
  </table>
  
  <form name='frm' id='frm' style='margin-top: 50px;' action="/order_pay/create.do" method='post'>
    <input type="hidden" name="payment" value=" ${tot_sum }">   <%-- 전체 주문 금액 --%>
   
  <ASIDE class="aside_left">
    운전자 정보<span style="font-size: 0.7em;"></span>
  <!--   <button type="button" id="btn_myinfo" class="btn" style="margin-bottom: 2px;">나의 정보 가져오기</button> 
    <button type="reset" id="btn_reset" class="btn" style="margin-bottom: 2px;">정보 지우기</button> -->
  </ASIDE>

  <div class='menu_line'></div>

    <div class="form-group">
      <label for="mname" class="col-md-2 control-label" style='font-size: 0.9em;'>운전자 성명</label>    
      <div class="col-md-9">
        <input type='text' class="form-control" name='rname' id='rname' readonly="readonly"
                   value='' required="required" style='width: 20%;' placeholder="운전자 성명">
      </div>
    </div>   

    <div class="form-group">
      <label for="tel" class="col-md-2 control-label" style='font-size: 0.9em;'>운전자 전화번호</label>    
      <div class="col-md-9">
        <input type='text' class="form-control" name='rtel' id='rtel' readonly="readonly"
                   value='' required="required" style='width: 20%;' placeholder="운전자 전화번호"><br>
      </div>
    </div>   

  
  <div style='margin-top: 20px; width: 100%; clear: both;'> </div>  
  <ASIDE class="aside_left">
    결제 정보<br>
  </ASIDE> 

  <div class='menu_line'></div>
  <div style=" text-align: left;">
    <label style="cursor: pointer;"><input type="radio" name="paytype" id="paytype" value="1" checked="checked"> 신용 카드</label>  
    <label style="cursor: pointer;"><input type="radio" name="paytype" id="paytype" value="2"> 모바일</label>  
    <label style="cursor: pointer;"><input type="radio" name="paytype" id="paytype" value="3"> 포인트</label>  
    <label style="cursor: pointer;"><input type="radio" name="paytype" id="paytype" value="4"> 계좌 이체</label>  
    <label style="cursor: pointer;"><input type="radio" name="paytype" id="paytype" value="5"> 직접 입금</label>  
  </div>
  
  <table class="table table-striped" style='margin-top: 20px; margin-bottom: 50px; width: 100%; clear: both;'>
    <tbody>
      <tr>
        <td style='width: 50%;'>
          <div class='cart_label'>대여요금</div>
          <div class='cart_price'><fmt:formatNumber value="${tot }" pattern="#,###" /> 원</div>
          
          <div class='cart_label'>예정 포인트</div>
          <div class='cart_price'><fmt:formatNumber value="${point }" pattern="#,###" /> 원 </div>
          
        </td>
        <td style='width: 50%;'>
          <div class='cart_label' style='font-size: 2.0em;'>요금정보</div>
          <div class='cart_price'  style='font-size: 2.0em; color: #FF0000;'><fmt:formatNumber value="${tot_sum }" pattern="#,###" /> 원</div>
          
            <button type='button' id='btn_order_pay' class='btn btn-info' style='font-size: 1.5em;'>${tot_sum }원 결제하기</button>
        </td>
      </tr>
    </tbody>
  </table>   
     
  </FORM>
  </DIV>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>