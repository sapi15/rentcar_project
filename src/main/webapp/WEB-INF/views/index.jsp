<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>KCAR</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="/css/style.css" rel="Stylesheet" type="text/css"><!-- /static 기준 -->
    
<!-- 스타일 -->
<link href="../assets/css/bootstrap-ko.css" rel="stylesheet">
<link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">
<style>


</style>
</head>
<body>
<jsp:include page="./menu/top.jsp" flush='false' />
 
  <!-- 회전광고판
    ================================================== -->
    <div id="myCarousel" class="carousel slide">
      <div class="carousel-inner">
      
        <div class="item active">
          <img src='../assets/img/examples/main_slide1.jpg'  alt="" style="min-width: 100%;">
            <div class="container">
             <div class="carousel-caption">
              <div class="swiper-slide" onclick="location.href='/rent/list?category='" style="cursor:pointer;"> <!-- 단기 대여 창으로 -->
               <div style="color: white;">
                  <h4>전국 최저가 최상의 서비스</h4>
                  <h1>KCAR의 단기 대여 프로그램</h1>
                  <p style="color: white;">원하는 곳까지 달려가는 딜리버리 서비스, 전차종 블랙박스, 쾌적한 차량 관리</p>
               </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="item">
         <img src='../assets/img/examples/main_slide2.jpg'  alt="" style="min-width: 100%;">
          <div class="container">
           <div class="carousel-caption">
            <div class="swiper-slide" onclick="location.href='/rent/list?category='" style="cursor:pointer;"> <!-- 장기 대여 창으로 -->
             <div style="color: white;">
                <h4>초기비용 No!, 비용절감!</h4>
                <h1>KCAR의 장기 대여 프로그램</h1>
                <p style="color: white;">차량 계약 이후 출고시 까지 동급 또는 상급 차량으로 지원</p>
               </div>
             </div>
            </div>
          </div>
        </div>
        
        <div class="item">
         <img src='../assets/img/examples/main_slide3.jpg'  alt="" style="min-width: 100%;">
          <div class="container">
            <div class="carousel-caption">
             <div class="swiper-slide" onclick="location.href='/rentcargrp/list.do'" style="cursor:pointer;"> <!-- 차량 정보 창으로 -->
                <div style="color: white;">
                    <h4>언제 어디서나 차가 필요할 땐</h4>
                    <h1>KCAR의 렌트카 프로그램</h1>
                    <p style="color: white;">최상의 상태의 다양한 차량 보유</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="en-font-family">&lsaquo;</span></a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="en-font-family">&rsaquo;</span></a>
    </div>
    <!-- /.carousel -->
 
<jsp:include page="./menu/bottom.jsp" flush='false' />
 
</body>
</html>