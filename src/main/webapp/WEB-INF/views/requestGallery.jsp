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
										<li><a href="/MarketAll">????????? ??????</a></li>
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
		<h1>Gallery Information</h1>
	</div>
	
	<form action="/workWrite" method="post" enctype="multipart/form-data" onsubmit="return formCheck();">
		<table id="galleryTable" class="table table-bordered" style=" margin-top: 100px; width: 1200px; height: 100px;">
			<tr>
				<td style="text-align: center">????????????</td>
				<td colspan="2"><input type="text" id="checkTitle" name="title" style="display: block; margin : 0 auto; width:820px; height:50px;"></td>
			</tr>
			<tr>
				<td style="text-align: center">?????? ??????</td>
				<td style="text-align: center" colspan="2">
					<input type="date" id="checkStart" name="start" style="block; width:400px; height:50px;">
					~
					<input type="date" id="checkEnd" name="end" style="block; width:400px; height:50px;">
				</td>
			</tr>
			<tr>
				<td style="text-align: center">????????? ?????????</td>
				<td style="text-align: center" colspan="2">
					<input type="radio" name="gallery_template" value="1">
					<span class="templeteView" onclick="viewOpenCube();">3D Cube Effect</span> 
					<input type="radio" name="gallery_template" value="2">
					<span class="templeteView" onclick="viewOpenCover();">3D Coverflow Effect</span>
					<input type="radio" name="gallery_template" value="3">
					<span class="templeteView" onclick="viewOpenFlip();">3D Flip Effect</span>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">?????? ??????</td>
				<td colspan="2" style="text-align: center;">
					<select id="countCheck" onchange="addTd(value);">
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select>
				</td>
			</tr>
		</table>
		<div style="text-align: center; margin-top: 50px;">
			<button type="submit" class="btn btn-outline-secondary">????????????</button>
		</div>
	</form>
	
	<script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		var flag = true;

		function viewOpenCover(){
			window.open("/viewOpenCover","popUp","width=1000,height=500");
		}
		function viewOpenCube(){
			window.open("/viewOpenCube","popUp","width=1000,height=500");
		}
		function viewOpenFlip(){
			window.open("/viewOpenFlip","popUp","width=1000,height=500");
		}

		function minusTd(){
			$('#galleryTable').on("click", "button", function() {
			    $(this).closest("tr").remove()
			});
		}

		function addTd(value){
			if(flag){
				for(var i = 0 ; i < value ; i++){
					var	rowItem = "<tr class='temp'>"
						rowItem += "<td style='text-align: center;'>????????? ??? ??????</td>"
						rowItem += "<td style='text-align: center;'>"
						rowItem += "<div class='preview' style='border: 1px solid; width: 500px; height: 255px;'></div><br>"
						rowItem += "<input type='file' name='upload' accept='image/*' onchange='previewImage(this,"+ i +")' style='width: 130px;'/></td>"
						rowItem += "<td style='text-align: center;'>"
						rowItem += "<input type='text' name='work_name' style='width: 500px;' placeholder='please enter the title'>"
						rowItem += "<br><br>"
						rowItem += "<textarea name='work_description' style='width: 500px; height: 200px;' placeholder='please enter the description'></textarea>"
						rowItem += "<br><br>"
						rowItem += "<button type='button' class='btn btn-danger' onclick='minusTd();'><i class='fa fa-minus'></i></button>"
						rowItem += "</tr>"
						$("#galleryTable").append(rowItem);
				}
				flag = false;
			}else{
				$(".temp").remove();
				for(let i = 0 ; i < value ; i++){
					var	rowItem = "<tr class='temp'>"
						rowItem += "<td style='text-align: center;'>????????? ??? ??????</td>"
						rowItem += "<td style='text-align: center;'>"
						rowItem += "<div class='preview' style='border: 1px solid; width: 500px; height: 255px;'></div><br>"
						rowItem += "<input type='file' name='upload' accept='image/*' onchange='previewImage(this,"+ i +")' style='width: 130px;' /></td>"
						rowItem += "<td style='text-align: center;'>"
						rowItem += "<input type='text' name='work_name' style='width: 500px;' placeholder='please enter the title'>"
						rowItem += "<br><br>"
						rowItem += "<textarea name='work_description' style='width: 500px; height: 200px;' placeholder='please enter the description'></textarea>"
						rowItem += "<br><br>"
						rowItem += "<button type='button' class='btn btn-danger' onclick='minusTd();'><i class='fa fa-minus'></i></button>"
						rowItem += "</tr>"
						$("#galleryTable").append(rowItem);
				}
			}
		}

		
		function previewImage(f,index){

			var file = f.files;
			
			// ????????? ??????
			if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
				alert('gif, jpg, png ????????? ????????? ?????????.\n\n?????? ?????? : ' + file[0].name);

				// ????????? ?????? ?????????
				f.outerHTML = f.outerHTML;

				document.getElementsByClassName('preview')[index].innerHTML = '';

			} else {

				// FileReader ?????? ??????
				var reader = new FileReader();

				// ?????? ????????? ?????????????????? ??????
				reader.onload = function(rst){
					document.getElementsByClassName('preview')[index].innerHTML = "<img src=" + rst.target.result + " style = 'width: 500px; height: 253px;'>";
				}

				// ????????? ?????????
				reader.readAsDataURL(file[0]);

			}
		}
	</script>
	
	<script type="text/javascript">
		function formCheck(){
			var title = document.getElementById('checkTitle').value;
			var start = document.getElementById('checkStart').value;
			var end = document.getElementById('checkEnd').value;
			var count = document.getElementById('countCheck').value;
			var chkRadio = document.getElementsByName('gallery_template');
			var name = document.getElementsByName('work_name');
			var description = document.getElementsByName('work_description');
			var image = document.getElementsByName('upload');

			var date = new Date(); 
			var year = date.getFullYear(); 
			var month = new String(date.getMonth()+1); 
			var day = new String(date.getDate()); 

			var yearS = Number(start.substr(0,4)); // ????????? ?????? 0~4???????????? (???) 
			var monthS = Number(start.substr(5,2)); // ????????? ?????? 4?????? ???????????? 2?????? ?????? (???) 
			var dayS = Number(start.substr(8)); // ????????? ??? 6?????? ???????????? 2?????? ?????? (???)

			var yearE = Number(end.substr(0,4)); // ????????? ?????? 0~4???????????? (???) 
			var monthE = Number(end.substr(5,2)); // ????????? ?????? 4?????? ???????????? 2?????? ?????? (???) 
			var dayE = Number(end.substr(8)); // ????????? ??? 6?????? ???????????? 2?????? ?????? (???)
			
			var cnt = 0;

			//???????????? ?????? ??????
			if(title==""){
				alert("??????????????? ??????????????????.");
				return false;
			}
	
			//?????? ????????? ??????
			var flag = false;

			if(yearS<year || yearE<year || yearE<yearS ){
				flag = true;
			}

			if(yearS==year && yearE==year && yearS==yearE){
				if(monthS<month || monthE<month || monthE<monthS){
					flag = true;
				}
			}

			if(yearS==year && yearE==year && yearS==yearE){
				if(monthS==month && monthE==month && monthE==monthS){
					if(dayS<day || dayE<day || dayE<dayS){
						flag = true;
					}
				}
			}
				
			if(flag){
				alert("????????? ?????? ????????? ???????????????.");
				flag = false;
				return false;
			}

			//????????? ?????? ??????
			for(var i=0 ; i<chkRadio.length ; i++){
				if(chkRadio[i].checked == true){ 
					cnt++;
				}
			}
			
			if(cnt<1){
				alert("????????? ???????????? ??????????????????.");
				return false;
			}

			//?????? ?????? ??????
			if(count==0){
				alert("?????? ????????? ????????????.");
				return false;
			}

			//????????? ?????? ??????
			for(var i=0 ; i<name.length ; i++){
				if(name[i].value==""){
					alert(i+1+"?????? ????????? ???????????? ??????????????????.");
					return false;
				}
			}

			//???????????? ?????? ??????
			for(var i=0 ; i<description.length ; i++){
				if(description[i].value==""){
					alert(i+1+"?????? ????????? ??????????????? ??????????????????.");
					return false;
				}
			}

			//?????? ?????? ??????
			for(var i=0 ; i<image.length ; i++){
				if(image[i].value==""){
					alert(i+1+"?????? ?????? ????????? ??????????????????.");
					return false;
				}
			}

			alert("??????????????? ????????? ???????????????.");
			return true;
		}
	</script>
	
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