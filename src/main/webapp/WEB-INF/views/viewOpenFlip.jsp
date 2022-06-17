<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>3D Flip Effect</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

  <!-- Demo styles -->
  <style>
    body {
      background: #fff;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper-container {
      width: 300px;
      height: 300px;
      padding: 50px;
    }

    .swiper-slide {
      background-position: center;
      background-size: cover;
      width: 300px;
      height: 300px;
    }
  </style>
</head>

<body>
  <!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="/resources/images/image1.jpg" style="width:300px; height: 300px"></div>
      <div class="swiper-slide"><img src="/resources/images/image2.jpg" style="width:300px; height: 300px"></div>
      <div class="swiper-slide"><img src="/resources/images/image3.jpg" style="width:300px; height: 300px"></div>
      <div class="swiper-slide"><img src="/resources/images/image4.jpg" style="width:300px; height: 300px"></div>
      <div class="swiper-slide"><img src="/resources/images/image5.jpg" style="width:300px; height: 300px"></div>
    </div>

    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>

    <!-- Add Arrows -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  </div>

  <!-- Swiper JS -->
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      effect: 'flip',
      grabCursor: true,
      pagination: {
        el: '.swiper-pagination',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
</body>

</html>