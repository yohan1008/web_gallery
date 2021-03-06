<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="DJoz Template">
    <meta name="keywords" content="DJoz, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Onex</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nowfont.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/rockville.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
    <style type="text/css">
        table{
            width: 1000px;
            height: 500px;
            margin: auto;  
        }
        
        .templeteView:hover{
            color: blue;
            cursor: pointer;
        }
        
        #member_info{
        	color: white;
        }
    </style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header header--normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2">
                    <div class="header__logo">
                        <a href="/"><img src="/resources/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-10 col-md-10">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li><a href="/">Home</a></li>
                                <li><a href="/info">Info</a>
                                	<ul class="dropdown">
                                        <li><a href="/info">????????????</a></li>
                                        <li><a href="/service">????????????</a></li>
                                    </ul>
                                </li>
                                <li><a href="/gallery">Gallery</a>
                                	<ul class="dropdown">
                                        <li><a href="/gallery">?????? ?????????</a></li>
                                        <li><a href="/requestGallery">?????? ????????? ??????</a></li>
										<li><a href="">????????? ??????</a></li>
                                    </ul>
                                </li>
                                <li><a href="/calender">Calender</a></li>
                                <li><a href="/myPage">My Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="/myPage">??? ??????</a></li>
                                        <li><a href="/blog">??? ?????????</a></li>
                                        <li><a href="/myWorkMarket">??? ?????? ??????</a></li>
                                        <li><a href="/message/directMessage">?????????</a></li>
                                    </ul>
                                </li>
                                <c:choose>
									<c:when test="${sessionScope.loginNickName != null }">
										<li id="member_info">'${sessionScope.loginNickName }'???</li>
										<li><a href="/logout">LOGOUT</a></li>
									</c:when>
									<c:otherwise>
		                                <li><a href="member/memberLoginPage">Login</a></li>
									</c:otherwise>
								</c:choose>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header Section End -->
    
    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>Contact</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
    
	<div style="text-align: center; margin-top: 100px;">
		<h1>Sale Information</h1>
	</div>
	
	<form action="/marketWrite" method="post" onsubmit="return formCheck();">
		<table id="galleryTable" class="table table-bordered" style=" margin-top: 100px; width: 1200px; height: 100px;">
			<c:forEach items="${list }" var="list" varStatus="status">
				<input type="hidden" name="work_description" value="${list.work_description }">
				<input type="hidden" name="work_seq" value="${list.work_seq }">
				<input type="hidden" name="gallery_seq" value="${list.id }">
				<tr>
					<td style="width:100px;">No.${status.count }</td>
					<td style="text-align: center">
						<img src="/download?work_seq=${list.work_seq }&id=${list.id }" style="width: 400px; height: 360px;">
					</td>
					<td>
						?????????:
						<input type="text" name="work_name" value="${list.work_name }" readonly="readonly" style="display: block; margin : 0 auto; width:750px; height:50px;"><br>
						??????:
						<div style="display: block;">
							<input type="text" name="height" placeholder="??????" style="margin : 0 auto; width:354px; height:50px;"> &nbsp; x &nbsp; <input type="text" name="width" placeholder="??????" style="margin : 0 auto; width:354px; height:50px;"> 
						</div>
						<br>
						????????????:
						<input type="text" name="market_amount" placeholder="??????????????? ??????????????????." style="display: block; margin : 0 auto; width:750px; height:50px;">
						<br>
						??????:
						<input type="text" name="market_price" placeholder="???????????? ??????????????????." style="display: block; margin : 0 auto; width:750px; height:50px;">
					</td>
				</tr>
			</c:forEach>
		</table>
		<div style="text-align: center; margin-top: 50px;">
			<button type="submit" class="btn btn-outline-secondary">????????????</button>
		</div>
	</form>
	
	<script type="text/javascript">
		function formCheck(){
			var amount = document.getElementsByName("market_amount");
			var price = document.getElementsByName("market_price");
			var name = document.getElementsByName("work_name");
			var height = document.getElementsByName("height");
			var width  = document.getElementsByName("width");
			var announce = "";

			
			for(var i = 0 ; i<amount.length ; i++){
				if(isNaN(amount[i].value)){
					alert(name[i].value+"??? ???????????? ?????? ????????? ?????? ???????????????.");
					return false;
				}
				
				if(isNaN(price[i].value)){
					alert(name[i].value+"??? ?????? ?????? ????????? ?????? ???????????????.");
					return false;
				}

				if(isNaN(height[i].value)){
					alert(name[i].value+"??? ?????? ?????? ???????????? ????????? ?????? ???????????????.");
					return false;
				}

				if(isNaN(width[i].value)){
					alert(name[i].value+"??? ?????? ?????? ???????????? ????????? ?????? ???????????????.");
					return false;
				}

				if(amount[i].value==""){
					alert(name[i].value+"??? ??????????????? ??????????????????.");
					return false;
				}

				if(price[i].value==""){
					alert(name[i].value+"??? ????????? ??????????????????.");
					return false;
				}
				
				if(height[i].value==""){
					alert(name[i].value+"??? ?????? ?????? ???????????? ??????????????????.");
					return false;
				}

				if(width[i].value==""){
					alert(name[i].value+"??? ?????? ?????? ???????????? ??????????????????.");
					return false;
				}
			}

			for(var i = 0 ; i<amount.length ; i++){
				announce += "?????????:"+name[i].value+"\n";
				announce += "????????????:"+amount[i].value+"???\n";
				announce += "??????:"+price[i].value+"???\n";
				announce += "?????? ??????:"+height[i].value+" X "+width[i].value+"\n";
				announce += "\n"
			}

			if(confirm(announce+"?????? ????????? ????????? ?????? ???????????????????")==true){
				alert("??????????????? ?????? ????????? ???????????????.");
				return true;
			}else{
				return false;
			}
		}
	</script>
	
	<script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
	
    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact__address">
                        <div class="section-title">
                            <h2>Contact info</h2>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore.</p>
                        <ul>
                            <li>
                                <i class="fa fa-map-marker"></i>
                                <h5>Address</h5>
                                <p>Los Angeles Gournadi, 1230 Bariasl</p>
                            </li>
                            <li>
                                <i class="fa fa-phone"></i>
                                <h5>Hotline</h5>
                                <span>1-677-124-44227</span>
                                <span>1-688-356-66889</span>
                            </li>
                            <li>
                                <i class="fa fa-envelope"></i>
                                <h5>Email</h5>
                                <p>Support@gamail.com</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="contact__form">
                        <div class="section-title">
                            <h2>Get in touch</h2>
                        </div>
                        <p> ???????????? ???????????? ??????????????? ?????? ??????????????????! </p>
                        <form action="#">
                            <div class="input__list">
                                <input type="text" placeholder="Name">
                                <input type="text" placeholder="Email">
                                <input type="text" placeholder="Website">
                            </div>
                            <textarea placeholder="Comment"></textarea>
                            <button type="submit" class="site-btn">SEND MESSAGE</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer footer--normal spad set-bg" data-setbg="/resources/img/footer-bg.png">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="footer__address">
                        <ul>
                            <li>
                                <i class="fa fa-phone"></i>
                                <p>Phone</p>
                                <h6>1-677-124-44227</h6>
                            </li>
                            <li>
                                <i class="fa fa-envelope"></i>
                                <p>Email</p>
                                <h6>Onex@gmail.com</h6>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1 col-md-6">
                    <div class="footer__social">
                        <div class="footer__social__links">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-dribbble"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1 col-md-6">
                    <div class="footer__newslatter">
                        <h4>Contact Us</h4>
                        <form action="#">
                            <input type="text" placeholder="Email">
                            <button type="submit"><i class="fa fa-send-o"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="/resources/js/jquery-3.5.1.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="/resources/js/jquery.nicescroll.min.js"></script>
    <script src="/resources/js/jquery.barfiller.js"></script>
    <script src="/resources/js/jquery.countdown.min.js"></script>
    <script src="/resources/js/jquery.slicknav.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/main.js"></script>

    <!-- Music Plugin -->
    <script src="/resources/js/jquery.jplayer.min.js"></script>
    <script src="/resources/js/jplayerInit.js"></script>
</body>

</html>