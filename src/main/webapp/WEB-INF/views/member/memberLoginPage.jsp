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
			   			console.log("통신 실패");
			   		} 
	 	}); 

		return flag;
	}


    
    function loginCheck(){
    	var member_id = document.getElementById("member_id").value;
    	var member_pw = document.getElementById("member_pw").value;

    	if(member_id==''||member_id.length==0){
			alert("아이디를 입력해 주세요");
			return false;
			}

    	if(member_pw==''||member_pw.length==0){
			alert("비밀번호를 입력해 주세요");
			return false;
			}else if(member_pw.length<=2||member_pw.length>=11){
				alert("비밀번호는 3~10글자 입니다");
				return false;
			}

    	var flag = jquryCheck();

		if(!flag){
			alert("존재하지 않은 아이디 혹은 잘못된 비밀번호 입니다.");
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
                                        <li><a href="/info">공지사항</a></li>
                                        <li><a href="/service">이용안내</a></li>
                                    </ul>
                                </li>
                                <li><a href="/gallery">Gallery</a>
                                	<ul class="dropdown">
                                        <li><a href="/gallery">오픈 갤러리</a></li>
                                        <li><a href="/requestGallery">개인 갤러리 신청</a></li>
                                        <li><a href="/MarketAll">온라인 마켓</a></li>
                                    </ul>
                                </li>
                                <li><a href="/calender">Calender</a></li>
                                <li><a href="/myPage">My Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="/myPage">내 정보</a></li>
                                        <li><a href="/blog">내 전시회</a></li>
                                        <li><a href="/myWorkMarket">내 작품 마켓</a></li>
										<li><a href="/message/directMessage">쪽지함</a></li>
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
										<input type="text" name="member_id" id="member_id" placeholder="아이디">
                        			</td>
                        			<td rowspan="2">
                        				<input type="submit" value="로그인" style="width:150px; height:80px;background: #7c4df1;opacity: 70%;color:white;border:none;border-radius:10px;">
                        			</td>
                        		</tr>
                        		<tr>
                        			<td>
										<input type="password" name="member_pw" id="member_pw" placeholder="비밀번호" >
                        			</td>
                        		</tr>
                        		<tr>
                        			<td colspan="2">
										&nbsp<a href="/member/memberJoinForm" style="font-weight:bold">회원가입</a>&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp
										<a href="/member/memberFindForm" style="font-weight:bold">아이디 찾기</a>&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
										<a href="/member/pwFindForm" style="font-weight:bold">비밀번호 찾기</a> 
									</td>
								</tr>
                        	</table>
						</form>
						<br>
						<!-- 네이버 로그인 창으로 이동 -->
						<div id="naver_id_login" style="text-align:center"><a href="${url}">
						<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
						<a id="kakao-login-btn"></a></div>
						<a href="http://developers.kakao.com/logout"></a>
						<script type='text/javascript'>
						  //<![CDATA[
						    // 사용할 앱의 JavaScript 키를 설정해 주세요.
						    Kakao.init('64ee8ae4ffd93e00255b26611c1fec74');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
						    // 카카오 로그인 버튼을 생성합니다.
						    Kakao.Auth.createLoginButton({
						      container: '#kakao-login-btn',
						      success: function(authObj) {
						    	  Kakao.API.request({
				
						    	       url: '/v2/user/me',
				
						    	       success: function(res) {
				
						    	             /*alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
						    	             
						    	             alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
				
						    	             console.log(res);
						    	             console.log(authObj);
				
						    	             console.log(res.kakao_account.profile.nickname);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
				
						    	             console.log(res.kakao_account.email);//<---- 콘솔 로그에 email 정보 출력
				
						    	             console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력 */
				
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
                        <!-- 로그인 화면 섹션 -> 이부분 지우고 입력 -->
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