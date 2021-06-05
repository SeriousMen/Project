<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
	<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>로그인</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<style>
		
			/* 한나(얇음) */
			@font-face {
			    font-family: 'BMHANNAAir';
				src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
				font-weight: normal;
				font-style: normal;
			}
		
			body{
				font-family: 'BMHANNAAir';
			}
			
			@font-face {
	    		font-family: 'paybooc-Bold';
	    		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff') format('woff');
	    		font-weight: normal;
	    		font-style: normal;
			}
		
		
			h4{
				text-align: left;
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
	<c:if test="${not empty param.login }">
   		<c:if test="${not param.login}">
   				<script>alert("아이디 또는 비밀번호를 다시 확인해주세요.");</script>
   		</c:if>
   	</c:if>
	
	<body class="is-preload">

		<!-- Header -->
			<jsp:include page="../../header.jsp"/>

		

		<!-- Main -->
			<div id="main">
				<div class="wrapper special">
					<form name="loginForm" action="${pageContext.request.contextPath}/member/MemberLoginOk.me" method="post">
						<input type="hidden" name="propensity" value="${param.propensity}">
						<input type="hidden" name="trainer" value="${param.trainer}">
						<div class="inner">
							<header class="heading">
								<h3>로그인</h3>
								<div class="box" style="width: 50%; margin: 0 auto;">
									<div class="inputTag">
										<h4>아이디</h4>
										<input type="text" name="Id" id="Id" value="" style="margin: 0 auto" placeholder="아이디를 입력하세요" required />
									</div> 
									<br>
									<div class="inputTag">
								 		<h4>비밀번호</h4>
										<input type="password" name="Pw" id="Pw" value="" style="margin: 0 auto"placeholder="비밀번호를 입력하세요" required/>
								 	</div>
									<div class="inputTag">
								 		<a href="${pageContext.request.contextPath}/app/public/findIdPw.jsp" style="text-decoration: none;">아이디 및 비밀번호 찾기</a>
								 	</div>
									<br>	
									<div class="col-6 col-12-medium">
										<ul class="actions stacked">
											<li><a href="javascript:loginForm.submit()" class="button fit">로그인하기</a></li>		
										</ul>				
										<div>
											<a href="${pageContext.request.contextPath}/member/MemberJoin.me" style="text-decoration: none">회원가입을 원하시나요?</a>
											<br>
											<a href="${pageContext.request.contextPath}/app/trainer/trainerCheck.jsp" style="text-decoration: none">트레이너 가입을 원하시나요?</a>
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
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
			<script>
				function temp() {
					var memberPhoneNumber=$("#memberPhoneNumber").val();
					var checkButton=$("#disableAtag");
					var checkNum=$("#memberPhoneNumberOk");
		
					if(memberPhoneNumber !="" && memberPhoneNumber!= null){
						checkButton.removeAttr("disabled");
						checkNum.removeAttr("readonly");
					}
				}
			</script>
		


	</body>
</html>