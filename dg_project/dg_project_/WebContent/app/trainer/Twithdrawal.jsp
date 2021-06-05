<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
<title>회원탈퇴</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
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

body {
	font-family: 'BMHANNAAir';
}

@media screen and (max-width: 480px) {
	h4 {
		font-size: 23px;
	}
	.col-6 .col-12-xsmall {
		width: 100%;
	}
}
</style>
</head>
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="../../header.jsp" />
	<c:set var="t_vo" value="${t_vo}"/>
	
	<div id="main">
		<div class="wrapper" style="padding: 2rem 0 5rem 0;">
			<div class="inner">

				<div class="col-6 col-12-xsmall" id="pwDiv"
					style="margin: 0 auto; width: 50%;">
					<h4 style="text-align: center; font-size: 35px;">트레이너 탈퇴</h4>
					<form style="margin: 37px 0 2rem 0;" action="${pageContext.request.contextPath}/trainer/TrainerMypageDrawal.tr">
						<div style="display: flex;">
							<input type="text" id="memberId" name="memberId"
								value="${session_t_id}" style="width: 60%; margin-left: 18%;" readonly>
						</div>

						<div style="display: flex;">
							<input type="password" id="memberPw" name="memberPw" placeholder="비밀번호" style="width: 60%; margin-left: 18%;">
						</div>
						<P
							style="padding-top: 6%; margin: 0; text-align: center; font-size: 24px;">탈퇴
							이후에는 소지하신 포인트 및 게시물 등이 사라집니다.</P>

						<ul class="actions fit" style="display: inherit; padding-top: 5%;">
							<li style="padding-bottom: 3px;"><button class="button primary fit" >탈퇴신청</button></li>
							<li><a href="${pageContext.request.contextPath}/trainer/TrainerMypageView.tr?t_id=${t_vo.getTrainerId()}" class="button fit">탈퇴취소</a></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- CTA -->
	<div id="cta">
		<div class="wrapper style1">
			<div class="inner">
				<header class="heading small"> </header>
			</div>
		</div>
	</div>

<!-- Footer -->
<jsp:include page="../../footer.jsp"/>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	
	<script>
	function okMsg(){
		
		window.alert("탈퇴 신청이 완료되었습니다.");
		location.href="index.jsp";
	}
	</script>
</body>
</html>