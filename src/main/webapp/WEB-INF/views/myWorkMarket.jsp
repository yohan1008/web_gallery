<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    	#member_info{
    		color:white;	
    	}
    
    </style>
    
    <script src="/resources/js/jquery-3.5.1.min.js"></script>
    
    <script type="text/javascript">
	    function marketWorkList(searchText){
		    var arr;
		    
		    $.ajax({
		        contentType:'application/json',
		        dataType:'json',
		        url:'/marketWorkList',
		        type:'get',
		        data:{
		        	searchText : searchText
				},
		        async: false,
		        success:function(resp){
					console.log(resp);
		        	arr = resp;
		        }
		    });
		    
		    return arr;
		}

    
    	$(function(){

			var searchText = document.getElementById("text").value;
			var flag = true;
    		var list = marketWorkList(searchText);
		    var i = 6;
		    var j = 12;
		    var rowitem="";

		    if(list.length<7){
				flag = false;
			}
		    
			//스크롤 창의 끝(scroll) == 문서 높이(document) - 브라우저창높이(window)
		    $(window).scroll(function() {
		        if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			        if(flag){
						for(; i<j ; i++){
							var work_seq = list[i].work_seq;
							var gallery_seq = list[i].gallery_seq;
							var work_name = list[i].work_name;
	
							rowitem += 			'<div class="col-lg-4 col-md-6 col-sm-6">';
					        rowitem += 	    		'<div class="discography__item">';
					        rowitem += 	    			'<div class="discography__item__pic">';
					        rowitem +=      				'<img src="/download?work_seq='+work_seq+'&id='+gallery_seq+'" style="width: 100px; height: 300px;">';
					        rowitem +=      			'</div>';
					        rowitem +=      			'<div class="discography__item__text">';
							rowitem +=	  					'<input type="checkbox" name="work" style="width:30px; height: 30px;" value="'+work_seq +'+'+ gallery_seq+'">';
							rowitem +=	    				'<h3>'+work_name+'</h3>'
				            rowitem +=      			'</div>'
				            rowitem +=      		'</div>'
				            rowitem +=      	'</div>'
	
				            if(list.length-1 == i){
								flag = false;
								break;
					        }
						}
			        }

					rowitem += '<div id="inputItem"></div>';

			        $("#inputItem").replaceWith(rowitem);
			        j += 6;
			        rowitem = "";
				}
		    });
       	})
    
	    function pagingFormSubmit() {
	    	var form = document.getElementById('pagingForm');
	    	form.submit();
	    }

	</script>
    
    
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
                                        <li><a href="/info">공지사항</a></li>
                                        <li><a href="/service">이용안내</a></li>
                                    </ul>
                                </li>
                                <li class="active"><a href="/gallery">Gallery</a>
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
                                <c:choose>
									<c:when test="${sessionScope.loginID != null }">
										<li id="member_info">'${sessionScope.loginNickName }'님</li>
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
                        <span>Gallery</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
    <!-- Discography Section Begin -->
    <section class="discography spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title center-title">
                        <h2>My Work Market</h2>
                        <h1>My Work Market</h1>
                        <h4>내 작품 마켓</h4>
                    </div>
                </div>
            </div>
            
			<div>
				<button type="button" onclick="myWorkSellRecord();" class="btn btn-outline-secondary" style="position: absolute; left: 1350px; top:350px;">
					판매이력
				</button>
            </div>
            
            <div>
				<button type="button" onclick="myWorkBuyRecord();" class="btn btn-outline-secondary" style="position: absolute; left: 1450px; top:350px;">
					구매이력
				</button>
            </div>
            
         	<form id="marketForm" action="/marketForm" method="get" onsubmit="return checkCount();">
	            <div class="row">
	            	<c:forEach items="${marketlist_6 }" var="list" varStatus="status">
		                <div class="col-lg-4 col-md-6 col-sm-6">
		                    <div class="discography__item">
		                        <div class="discography__item__pic">
		                            <img src="/download?work_seq=${list.work_seq }&id=${list.gallery_seq }" style="width: 100px; height: 300px;">
		                        </div>
		                        <div class="discography__item__text">
									<input type="checkbox" name="work" style="width:30px; height: 30px;" value="${list.work_seq }+${list.gallery_seq}">
									<h3>${list.work_name }</h3>
		                        </div>
		                    </div>
		                </div>
	                </c:forEach>
	            	<div id="inputItem"></div>
	        	</div>
				<div style="position: absolute; left: 350px; top:350px;">
					<button type="submit" class="btn btn-outline-secondary">판매 정보 등록하기</button>
				</div>
         	</form>

	        <div class="col-lg-12">
	        	<div class="pagination__links" style="">
					<!-- 검색폼 -->
					<form id="pagingForm" method="get" action="myWorkMarket" style="text-align: center; padding-right: 185px;">
						<input type="text" id="text"  name="searchText" value="${searchText }"  placeholder="제목" style="height: 50px; width:700px; margin-left:160px; margin-top: 100px;margin-bottom: 40px;"/>
						<input type="button" class="btn btn-outline-secondary" onclick="pagingFormSubmit()" value="검색" style="height: 50px; width:100px;">
					</form>
					<!-- 검색 끝 -->
    			</div>
			</div>
			
		</div>
    </section>
    <!-- Discography Section End -->
    
    <script type="text/javascript">
		function myWorkSellRecord(){

			location.href = "/myWorkSellRecord";
			
		}

		function myWorkBuyRecord(){

			location.href = "/myWorkBuyRecord";
			
		}
    
		function checkCount(){

			var work = document.getElementsByName("work");
			var cnt = 0;

			for(var i = 0 ; i<work.length ; i++){
				if(work[i].checked == true){
					cnt++;
				}
			}

			if(cnt>5){
				alert("판매 품목은 5개까지만 선택 가능합니다.");
				return false;
			}else if(cnt==0){
				alert("판매 품목을 선택해주세요.");
				return false;
			}
			
			return true;
		}
    </script>
    
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
                        <h2>DJoz</h2>
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
                        <h4>Stay With me</h4>
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