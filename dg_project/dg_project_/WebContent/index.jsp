<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->


<html>
<head>
<link href="images/blackLogo.png" rel="shortcut icon" type="image/x-icon">

<title>득근 득근</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/3.0.7/fullpage.css">

<style>

/* 한나(얇음) */
@font-face {
	font-family: 'BMHANNAAir';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/*을지로(두꺼움)*/
@font-face {
	font-family: 'BMEULJIRO';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

h4 {
	font-family: 'BMHANNAAir';
}

a {
	text-decoration: none;
}

div#sectionTwo {
	background-image:
		url('${pageContext.request.contextPath}/images/section2_bg.png');
	background-repeat: no-repeat;
}

div#sectionOne {
	background-image:
		url('${pageContext.request.contextPath}/images/section1_bg.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: contain;
}

#header.alt {
	max-width: 68%;
	margin-left: 17%;
	margin-top: 10px;
}

#banner .wrapper {
	padding-top: 16rem;
	padding-bottom: 25rem;
}

#banner {
	margin-top: -13rem;
}

.features-grid.special {
	background-color: #f5f5dce8;
}

.features-grid {
	max-width: 23rem;
	border-radius: 15px;
}

.features-grid .feature {
	width: 5rem;
	height: 6rem;
	padding: 0;
	border-style: none;
}

.features-grid .feature .icon {
	color: white;
}

.wrapper {
	padding: 17rem 0 7rem 0;
}

header.heading {
	margin: 0 auto 5rem auto;
	max-width: calc(100% - 0rem);
	text-align: center;
}

#menuDiv a {
	color: black;
	font-size: 18px;
	padding: 5px;
	margin-right: 8px;
	text-decoration: none;
}

#menuDiv a:hover {
	text-decoration: underline;
	color: #06f3ddf7;
}

.wrapper.style2 {
	background: #f7f7f7;
	padding: 10rem 0 7rem 0;
}

.inner {
	max-width: calc(100% - 10rem);
}

.features-grid .feature h4 {
	margin-bottom: -0.3rem;
}

.feature a img {
	vertical-align: bottom;
}

.wrapper.special {
	padding-bottom: 0;
	padding-top: 132px;
}

.footerP {
	margin: 0 0 1rem 0;
	max-width: 100%;
}

@font-face {
	font-family: 'paybooc-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'BMEULJIRO';
}

header {
	background: none;
}

#wrapper1 {
	padding-left: 12%;
	padding-top: 0;
	background: none;
}



#text {
	margin: 0 !important;
}

body {
	margin: 10px;
	padding: 10px;
	text-align: center;
}

.menuDiv {
	position: relative;
	display: inline-block;
}

.button {
	padding: 10px 40px;
	font-size: 20px;
	background-color: brown;
	color: wheat;
}

#drop-content {
    margin-left: 4rem;
	position: absolute;
	z-index: 1;
	line-height: 70%;
	    width: 12%;
	top: 70%;
}

#drop-content a {
	display: block;
	font-size: 15px;
	background-color: black;
	color: white;
	text-decoration: none;
	padding: 10px 36px;
	margin: 2px 0px 0px 0px;
	border: 1px solid white;
}

@media screen and (max-width: 768px) {
	.logo, #blackLogo {
		display: none;
	}
	#header.alt {
		max-width: 100%;
		margin: 0;
	}
	.reveal nav {
		margin: 0 auto;
	}
	#header {
		background: none;
	}
	.threeHeading {
		display: none;
	}
	#wrapper1 {
		padding: 0;
	}
	#wrapper1 div.inner {
		max-width: 80%;
	}
	#sectionFour {
		display: none;
	}
	div#one {
		margin-top: -76px;
	}
	#drop-content {
	    margin-left: 3rem;
	    width: 36%;
}
#drop-content a {

	margin: 0px 0px 0px 0px;
	
}
}
</style>

</head>
<body class="">



<!--회원탈퇴 성공시  -->
<c:if test="${not empty param.ok}">
   	<c:if test ="${param.ok}">
   		<script> alert("그동안 감사했습니다. 회원탈퇴가 이루어졌습니다.");</script>
   	</c:if>
   </c:if>

	<!-- Header -->
	<header id="header" class="reveal alt">
		<a class="logo" href="${pageContext.request.contextPath}/index.jsp"
			style="font-family: 'BMHANNAAir'; width: 40%;"><img
			src="${pageContext.request.contextPath}/images/newLogo.png"
			style="width: 48px; height: 48px; vertical-align: sub; margin-right: 3%;">득근득근</a>
		<nav>
			<c:choose>

				<c:when test="${session_m_id eq null and session_t_id eq null and session_a_id eq null}">
					<div id="menuDiv">
						<a href="${pageContext.request.contextPath}/app/public/login.jsp"
							style="color: white"> 로그인 </a> <a href="#" onclick="dp_menu()"
							style="color: white">회원가입 </a>
						<div style="display: none;" id="drop-content">
							<a
								href="${pageContext.request.contextPath}/app/member/memberJoin.jsp"><span>회원</span></a>
							<a
								href="${pageContext.request.contextPath}/app/trainer/trainerCheck.jsp">트레이너</a>
						</div>
					</div>
				</c:when>

				<c:when test="${session_m_id ne null}">
					<div id="menuDiv">
						<a
							href="${pageContext.request.contextPath}/member/MemberLogout.me"
							style="color: white"> 로그아웃 </a> <a href="javascript:void(0);"
							onclick="dg_page()" style="color: white">마이페이지 </a>

					</div>
				</c:when>
				<c:when test="${session_t_id ne null}">
					<div id="menuDiv">
						<a
							href="${pageContext.request.contextPath}/member/MemberLogout.me"
							style="color: white"> 로그아웃 </a> <a href="javascript:void(0);"
							onclick="dg_page()" style="color: white">마이페이지 </a>

					</div>
				</c:when>

				<c:when test="${session_a_id ne null}">
					<div id="menuDiv">
						<a
							href="${pageContext.request.contextPath}/member/MemberLogout.me"
							style="color: white"> 로그아웃 </a> <a href="javascript:void(0);"
							onclick="dg_page()" style="color: white">마이페이지 </a>

					</div>
				</c:when>

			</c:choose>




			<!-- <a href="#" style="color:white"> 로그아웃 </a>
         <a href="#" style="color:white"> 마이페이지 </a> -->
		</nav>
	</header>

	<!-- Banner -->
	<div id="fullpage">
		<div class="section" id="sectionOne">
			<div id="banner">
				<div class="wrapper style1" style="background: none;">
					<div class="inner">

						<h1>득근득근</h1>
						<form method="post" action="${pageContext.request.contextPath}/trainer/search.tr" class="combined">
							<input type="hidden" name="searchFlag" value="true">
							<input type="text" name="keyword" id="keyword"
								placeholder="관심 키워드를 검색하세요" class="invert" style="height: 50px;">
							<input type="submit" class="special"
								style="height: 50px; line-height: 0;" value="검색">
						</form>
					</div>
				</div>
			</div>

			<!-- Features Grid -->
			<div id="one" class="features-grid special"
				style="background: white;">
				<div class="feature">

					<a
						href="${pageContext.request.contextPath}/review/TotalTrainerList.rv"><img
						src="${pageContext.request.contextPath}/images/trainerIcon.png"
						style="width: 60px">
						<h4 style="font-size: 1rem;">트레이너</h4></a>

				</div>
				<div class="feature">

					<a
						href="${pageContext.request.contextPath}/member/MemberBoard.me"><img
						src="${pageContext.request.contextPath}/images/memberIcon.png"
						style="width: 60px">
						<h4 style="font-size: 1rem;">멤버</h4></a>

				</div>
				<div class="feature">

					<a href="${pageContext.request.contextPath}/app/public/propensity.jsp"><img
						src="${pageContext.request.contextPath}/images/findIcon.png"
						style="width: 60px">
						<h4 style="font-size: 1rem;">운동성향</h4></a>

				</div>
				<div class="feature">
			
					<a href="${pageContext.request.contextPath}/report/ReportListOkAction.rp"><img
						src="${pageContext.request.contextPath}/images/qnaIcon.png"
						style="width: 60px">
						<h4 style="font-size: 1rem;">QnA</h4></a>
			
			
				</div>

			</div>

		</div>
		<!--여기  section1-> 
	
	<!-- Two -->

		<div class="section" id="sectionTwo">
			<div id="two">
				<div class="wrapper style1" id="wrapper1">
					<div class="inner">
						<header class="heading" style="text-align: left;">
							<h2 id="text" style="color: red;">득근(得筋)</h2>
							<p id="text">'얻을 득', '힘줄 근'을 쓰며 말 그대로 근육을 얻는 것을 의미합니다.</p>
							<h2 id="text">'득근'하시길 원하십니까?</h2>
							<p id="text">저희 '득근득근'은 본인의 취향과 상황에 맞게</p>
							<p id="text">적절한 트레이너를 매치시켜주는 매칭 시스템을 가지고 있습니다.</p>
						</header>
					</div>
				</div>

			</div>

		</div>
		<!--여기 -->
		<!-- Three -->
		<div class="section">
			<div id="three">
				<div class="wrapper" style="padding: 9rem 0 4rem 0;">
					<div class="inner">
						<header class="heading threeHeading">
							<h2>"나한테 딱 맞는 트레이너를 어떻게 찾지?"</h2>
							<p>'득근득근'은 단순 영업보다는 고객님의 취향조사 설문을 받고 고객님을 기준으로 트레이닝 시스템이
								구성됩니다. 뿐만아니라 원하시는 트레이너를 직접 선택하실 수 있습니다.</p>
						</header>
						<div class="stats">
						
							<div>
								<span id="memberCnt"class="num">${sessionScope.todayVisit}</span> <span class="label">일일 
									접속 회원</span>
							</div>
							<div>
								<span id="tradeToday"class="num"></span> <span class="label"> 당일
									거래  </span>
							</div>
							<div>
								<span id="totalTrainer"class="num"></span> <span class="label">보유
									트레이너</span>
							</div>
							<div>
								<span id="totalMember"class="num"></span> <span class="label">보유
									회원</span>
							</div>
							<div>
								<span class="num">전 지역</span> <span class="label">지역</span>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Footer -->



		</div>
		<!--여기  -->
		<!-- Four -->
		<div class="section" id="sectionFour" style="background-color: black;">
			<div id="four">
				<div class="wrapper style2"
					style="padding: 0rem 0 0rem 0; height: 657px;">
					<div class="inner">
						<div id="footer">
							<div class="wrapper" style="padding: 0rem 0 0rem 0">
								<div class="inner"
									style="max-width: calc(100% - 0rem); display: flex;">
									<div
										style="padding: 1rem 0rem 0; text-align: left; width: 85%; margin-left: 21%;">
										<div
											style="max-width: 100%; padding-top: 7%; padding-left: 0%;">
											<img id="blackLogo" src="images/blackLogo.png"
												style="width: 94px; margin-left: 5%; vertical-align: bottom;">
											<p class="footerP"
												style="font-size: x-large; width: 100%; padding-top: 0%; margin-bottom: 0; text-align: left; line-height: 1.3; padding-bottom: 4%; padding-left: 2%;">(주)득근득근</p>

										</div>

										서울특별시 강남구 테헤란로 146
										<p class="footerP">사업자번호: 120-88-00000</p>
										<a href="#">사업자정보확인 </a>
										<p class="footerP">대표전화:0000-0000</p>
										<p class="footerP">대표메일:0000@dgdg.com</p>

									</div>

								</div>
								<div>
									<ul class="icons" style="padding-top: 2%;">
										<li><a href="#" class="icon brands fa-twitter"><span
												class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span
												class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span
												class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-pinterest"><span
												class="label">Pinterest</span></a></li>
										<li><a href="#" class="icon solid fa-envelope"><span
												class="label">Email</span></a></li>
									</ul>
									<div class="copyright">©  득근득근 Corp. All rights
										reserved.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!--여기 위아래  -->
	</div>





	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/3.0.7/fullpage.js"></script>

<%-- 	<nav id="menu">
		<ul class="links">
			<li><a href="index.jsp"
				style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Home</a></li>
			<li><a href="generic.html"
				style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Generic</a></li>
			<li><a href="elements.html"
				style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Elements</a></li>
		</ul>
		<a href="#menu" class="close"
			style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></a>
	</nav> --%>


</body>
<script>



$(document).ready(function() {
	

	$.ajax({
			
			url:"${pageContext.request.contextPath}/admin/IndexCal.ad",	
			type:"post",
			dataType:"json", 
			success:function(result){	
				console.log("IndexCal 가져오기 성공");
				
				var tradeToday = result.tradeToday;
				var totalMember = result.totalMember;
				var totalTrainer = result.totalTrainer;
				$("#tradeToday").text(tradeToday);
				$("#totalMember").text(totalMember);
				$("#totalTrainer").text(totalTrainer);
			},
			error: function(jqXHR, exception) {
				console.log('ajax 에러');
		   /*      if (jqXHR.status === 0) {
		            alert('Not connect.\n Verify Network.');
		        } 
		        else if (jqXHR.status == 400) {
		            alert('Server understood the request, but request content was invalid. [400]');
		        } 
		        else if (jqXHR.status == 401) {
		            alert('Unauthorized access. [401]');
		        } 
		        else if (jqXHR.status == 403) {
		            alert('Forbidden resource can not be accessed. [403]');
		        } 
		        else if (jqXHR.status == 404) {
		            alert('Requested page not found. [404]');
		        } 
		        else if (jqXHR.status == 500) {
		            alert('Internal server error. [500]');
		        } 
		        else if (jqXHR.status == 503) {
		            alert('Service unavailable. [503]');
		        } 
		        else if (exception === 'parsererror') {
		            alert('Requested JSON parse failed. [Failed]');
		        } 
		        else if (exception === 'timeout') {
		            alert('Time out error. [Timeout]');
		        } 
		        else if (exception === 'abort') {
		            alert('Ajax request aborted. [Aborted]');
		        } 
		        else {
		            alert('Uncaught Error.n' + jqXHR.responseText);
		        } */
		    }
		}); 
 	});

	
	function dp_menu() {
		let click = document.getElementById("drop-content");
		if (click.style.display === "none") {
			click.style.display = "block";

		} else {
			click.style.display = "none";

		}
	}

	function dg_page() {
		var t_session = '${session_t_id}';
		var m_session = '${session_m_id}';
		var a_session = '${session_a_id}';
		
		if ( t_session == "" && a_session =="" ) {
			 location.href = "${pageContext.request.contextPath}/member/MemberPageOk.me";
		}else if ( m_session =="" &&  a_session =="") {
			
			 location.href = "${pageContext.request.contextPath}/trainer/TrainerMypageView.tr";
		}else if(  t_session == "" &&  m_session ==""){
			location.href = "${pageContext.request.contextPath}/admin/AdminList.ad";
		}
	}
	
	if (matchMedia("screen and (max-width: 768px)").matches) {
		document.getElementById("keyword").placeholder = "";
		document.getElementById("sectionFour").className = "disable";
	}
	new fullpage('#fullpage', {
		//하단은 옵션
		autoScrolling : true,
		scrollHorizontally : true,
		sectionsColor : [ '#000', '#61c5e0', '#C0C0C0', '#000' ]
	});
	console.log(data);
	
</script>
</html>