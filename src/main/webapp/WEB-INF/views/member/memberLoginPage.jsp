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
    
    <script src="/resources/js/kakao.min.js"></script>
    <script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
	function jquryCheck(){
		var flag = true;
		
		$.ajax({ 
            type : 'POST'
           , url : '/member/Login_Ck'
           , data : {
        	   			id:$('#member_id').val() 
        	   			,pw:$('#member_pw').val()	
					}
		   , async: false
		   , dataType : "text"
           , success : function(data) { 
               				if (data == 'F') { 
                       			flag = false; 
                       		} 
               			}
		   , error : function(error) {
			   			console.log("?????? ??????");
			   		} 
	 	}); 

		return flag;
	}


    
    function loginCheck(){
    	var member_id = document.getElementById("member_id").value;
    	var member_pw = document.getElementById("member_pw").value;

    	if(member_id==''||member_id.length==0){
			alert("???????????? ????????? ?????????");
			return false;
			}

    	if(member_pw==''||member_pw.length==0){
			alert("??????????????? ????????? ?????????");
			return false;
			}else if(member_pw.length<=2||member_pw.length>=11){
				alert("??????????????? 3~10?????? ?????????");
				return false;
			}

    	var flag = jquryCheck();

		if(!flag){
			alert("???????????? ?????? ????????? ?????? ????????? ???????????? ?????????.");
			$("#member_pw").val("");
			return false;
		}
    	
    	return true;
    }
	
    
    </script>
    
    <style type="text/css">
    	#login_st{
    	margin-left: auto;
    	margin-right: auto;
    	margin: 0px auto;
    	}
    	a:hover{
    		color:blue;
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
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
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
                                <li class="active"><a href="/member/memberJoinForm">Login</a></li>
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
                        <span>Login</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Video Section Begin -->
    <section class="videos spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title center-title">
                    <br>
                        <h2>Login</h2>
                        <h1>Welcome!</h1>
                    </div>
                    <div>
                    	<form action="/member/Login" method="post" onsubmit="return loginCheck();">
                        	<table id="login_st">
                        		<tr>
                        			<td>
										<input type="text" name="member_id" id="member_id" placeholder="?????????">
                        			</td>
                        			<td rowspan="2">
                        				<input type="submit" value="?????????" style="width:150px; height:80px;background: #7c4df1;opacity: 70%;color:white;border:none;border-radius:10px;">
                        			</td>
                        		</tr>
                        		<tr>
                        			<td>
										<input type="password" name="member_pw" id="member_pw" placeholder="????????????" >
                        			</td>
                        		</tr>
                        		<tr>
                        			<td colspan="2">
										&nbsp<a href="/member/memberJoinForm" style="font-weight:bold">????????????</a>&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp
										<a href="/member/memberFindForm" style="font-weight:bold">????????? ??????</a>&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
										<a href="/member/pwFindForm" style="font-weight:bold">???????????? ??????</a> 
									</td>
								</tr>
                        	</table>
						</form>
						<br>
						<!-- ????????? ????????? ????????? ?????? -->
						<div id="naver_id_login" style="text-align:center"><a href="${url}">
						<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
						<a id="kakao-login-btn"></a></div>
						<a href="http://developers.kakao.com/logout"></a>
						<script type='text/javascript'>
						  //<![CDATA[
						    // ????????? ?????? JavaScript ?????? ????????? ?????????.
						    Kakao.init('64ee8ae4ffd93e00255b26611c1fec74');  //????????? ?????? ???????????? ??? ??? javascript?????? ???????????????.
						    // ????????? ????????? ????????? ???????????????.
						    Kakao.Auth.createLoginButton({
						      container: '#kakao-login-btn',
						      success: function(authObj) {
						    	  Kakao.API.request({
				
						    	       url: '/v2/user/me',
				
						    	       success: function(res) {
				
						    	             /*alert(JSON.stringify(res)); //<---- kakao.api.request ?????? ????????? ????????? json????????? ??????
						    	             
						    	             alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton?????? ????????? ????????? json????????? ??????
				
						    	             console.log(res);
						    	             console.log(authObj);
				
						    	             console.log(res.kakao_account.profile.nickname);//<---- ?????? ????????? id ?????? ??????(id??? res?????? ?????? ?????????  res.id ??? ????????????)
				
						    	             console.log(res.kakao_account.email);//<---- ?????? ????????? email ?????? ??????
				
						    	             console.log(authObj.access_token);//<---- ?????? ????????? ????????? ?????? */
				
						    	             location.href="/member/memberJoinForm?kakaoName=" + res.kakao_account.profile.nickname + "&kakaoEmail=" + res.kakao_account.email;
						    	    	}
				
									})
						      },
						      fail: function(err) {
						         alert(JSON.stringify(err));
						      }
						    });
						  //]]>
						</script>
						<br><br>
                        <!-- ????????? ?????? ?????? -> ????????? ????????? ?????? -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Video Section End -->

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
                                <h6>DJ.Music@gmail.com</h6>
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