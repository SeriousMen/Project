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
<link href="/resources/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">

<title>득근 득근</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="/resources/assets/css/main.css" />
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
		url('${pageContext.request.contextPath}/resources/images/section2_bg.png');
	background-repeat: no-repeat;
}

div#sectionOne {
	background-image:
		url('${pageContext.request.contextPath}/resources/images/section1_bg.jpg');
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
	max-width: 7rem;
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





	<!-- Header -->
	<!-- Header -->
		<jsp:include page="header.jsp"/>

	<!-- Banner -->
	<div id="fullpage">
		<div class="section" id="sectionOne">
			<div id="banner">
				<div class="wrapper style1" style="background: none;">
					<div class="inner">

						<h1>득근득근</h1>
					
					</div>
				</div>
			</div>

			<!-- Features Grid -->
			<div id="one" class="features-grid special"
				style="background: white;">
				

		
				<div class="feature">
			
					<a href="/board/qa"><img
						src="/resources/images/qnaIcon.png"
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
											<img id="blackLogo" src="/resources/images/blackLogo.png"
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
		src="/resources/assets/js/jquery.min.js"></script>
	<script
		src="/resources/assets/js/jquery.scrollex.min.js"></script>
	<script
		src="/resources/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="/resources/assets/js/browser.min.js"></script>
	<script
		src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/3.0.7/fullpage.js"></script>




</body>
<script>





	
	function dp_menu() {
		let click = document.getElementById("drop-content");
		if (click.style.display === "none") {
			click.style.display = "block";

		} else {
			click.style.display = "none";

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
	
	
</script>
</html>