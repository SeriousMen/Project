<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
	<link href="/resources/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>회원 회원가입</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
	<style>
		@font-face {
    			font-family: 'paybooc-Bold';
    			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff') format('woff');
    			font-weight: normal;
    			font-style: normal;
	}
		/* 한나(얇음) */
	@font-face {
	    font-family: 'BMHANNAAir';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	
	span.elements{
		font-size: 200%;
		color: red;
	}
	.wrapper {
  	  padding: 2rem 0 3rem 0;
	}
	
	h4{
		text-align: left;
	}

	
	#actionBtn{
		border-radius: 6px;
	}
	
	.inputTag {
				margin: 0 auto;
				width: 80%;
			}
			
	@media screen and (max-width: 980px){
				.inputTag {
					width: 100%;
				}
			}
	@media screen and (max-width: 980px){
				#actionBtn {
					width: 100%;
				}
			}
			
	@media screen and (max-width: 736px){
				.box {
					width: 60% !important;
				}
				
				.icons {
					margin-bottom: 5%;
				}
			}
			
	@media screen and (max-width: 480px){
				.box {
					width: 100% !important;
				}
				
			}
	
	</style>
	</head>
	
	<body class="is-preload" style="font-family: 'BMHANNAAir';">

		<!-- Header -->
			<jsp:include page="../../header.jsp"/>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.html">Home</a></li>
					<li><a href="generic.html">Generic</a></li>
					<li><a href="elements.html">Elements</a></li>
				</ul>
			</nav>

		<!-- Main -->
			<div id="main">
				<div class="wrapper special">
					   <form name="joinForm" action="/member/memberJoin" method="post">
					<div class="inner">
						<header class="heading">
						
							<h3>
							<span class="elements">"힘"</span>을 원하는가?</h3>
					
							<div class="box" style="width: 50%; margin: 0 auto;">
								
								<div class="inputTag">
								<h4>아이디</h4>
								<input type="text" name="memberId" id="memberId" value="" style="margin: 0 auto" placeholder="아이디를 입력하세요" required />
								 <h5  style="float: right; font-size: 0.8em; color: red" id="idCheck_text"></h5>
								 </div> 
								<br>
								 
								<div class="inputTag">
								 <h4>비밀번호</h4>
								<input type="password" name="memberPw" id="memberPw" value="" style="margin: 0 auto"placeholder="비밀번호를 입력하세요" required/>
								 <br>
								 </div>
								 
								<div class="inputTag">
								<h4>휴대폰번호</h4>
								<input type="text" name="memberPhone" id="memberPhone" value=""  style="float: left; width: 70%;"placeholder="핸드폰 번호 입력"/>
								<a href="javascript:sms()" id="actionBtn" class="button primary" style="width: 30%" >발송</a>
								<!-- F12 콘솔에서 전송된 코드를 입력후 인증해주세요 -->
								</div>
								<br>
								
								<div class="inputTag">
								<input type="text" name="memberPhoneOk" id="memberPhoneOk" placeholder="인증번호 입력" value="" readonly  style="float: left; width: 70%;" />
								<input type="button" id="actionBtn" class="button primary disabledbutton" style="width: 30%;" value="확인" disabled onclick="certifiedCheck()">
								</div>
								<br>
								
							<div style="text-align: center">
							<p style="font-size:0.9rem">유저의 허락없이 게시물을 올리지않습니다.</p>
							<p style="font-size:0.9rem">득근득근의 <a href="javascript:movePage1()" style="color: red">이용약관</a> 및 
							<a href="javascript:movePage2()" style="color: red">개인정보 처리방침</a>에 동의합니다</p>
							</div>
							<br>
							
							<div class="col-6 col-12-medium">
							<ul class="actions stacked">
								<li><a href="javascript:formSubmit()" class="button fit">가입하기</a></li>		
							</ul>				
							<div>
								<a href="/app/trainer/trainerCheck.jsp">트레이너로 가입하시나요?</a>
							</div>
							</div>
							</div>
							
					</header>
					</div>
					</form>
				</div>
				
				
			</div>

		

		<!-- Footer -->
         <jsp:include page="../../footer.jsp"></jsp:include>

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/join.js"></script>
	<script>
	function movePage1() {
		var newWidth = 480;
		var newHeight = 730;
		var popX = (window.screen.width / 2) - (newWidth / 2);
		var popY = (window.screen.height / 2) - (newHeight / 2);
		
		window.open("${pageContext.request.contextPath}/app/public/serviceCheck.jsp");
	}
	function movePage2() {
		var newWidth = 480;
		var newHeight = 730;
		var popX = (window.screen.width / 2) - (newWidth / 2);
		var popY = (window.screen.height / 2) - (newHeight / 2);
		
		window.open("${pageContext.request.contextPath}/app/public/serviceCheck2.jsp");
	}
	</script>

	</body>
</html>