<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
	<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>트레이너 마이페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	</head>
	<style>
		select {
			background-color: rgb(255 255 255 / 8%);
		}
		
		@media screen and (max-width: 1680px){
			#caBtn {
				margin-left: 68% !important;
			}
			
			#ptBtn {
				margin-left: 68% !important;
			}
			
			#contentBtn {
				margin-left: 70% !important;
			}
			
			#urlBtn {
				margin-left: 70% !important;
			}
		}
		
	@media screen and (max-width: 480px){
			#contentSpan {
				margin-left: 32% !important;
			}
			
			#contentBtn {
				margin-left: 45% !important;
			}
			
			#caBtn {
				margin-left: 43% !important;
			}
			
			#caSpan {
				margin-left: 34% !important;
			}
			
			#ptSpan {
				margin-left: 29% !important;
			}
			
			#ptBtn {
				margin-left: 43% !important;
			}
			
			#urlSpan {
				margin-left: 33% !important;
			}
			
			#urlBtn {
				margin-left: 43% !important;
			}
			
	
			#nextBtn{
			display:none !important;
			}
			#profile{
			width: 150px !important;
			height: 150px !important;
			}
			#nameSpan{
			    font-size: 20px !important;
			    }
			    #TMyPageDiv{
			    margin-left: 21% !important;
			    }
			}
				@font-face {
			    font-family: 'BMHANNAAir';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			
			@font-face {
			    font-family: 'BMEULJIRO';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}	
			body {
	font-family: 'BMHANNAAir' !important;
}
	</style>
	<body class="is-preload">

		<!-- Header -->
	<jsp:include page="../../header.jsp" />

			
 
	
	<c:set var="t_vo" value="${t_vo}"/>
	<c:set var="trainerId" value="${t_vo.getTrainerId()}"/>
	
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
				<div class="wrapper special" style="padding: 0rem 0 0rem 0;">
					<div class="inner">
					<header class="heading" style="font-size: 40px; margin: 0 auto 0rem auto; text-align: center;">
							마이페이지
				</header>
				<div style="cursor: pointer; margin-left: 24%;" id="TMyPageDiv">
				<img id="profile" src="${pageContext.request.contextPath}/files/${t_vo.getTrainerProfileImage()}"onerror=this.src="${pageContext.request.contextPath}/images/blackLogo.jpg" style="width: 180px; height:180px; float: left; margin-right: 3%;">
				<span id="nameSpan" style="font-size: 35px; font-weight: bold; ">${t_vo.getTrainerName()} 트레이너님</span><br><span style="font-weight:bold; font-size: 20px;">경력:<span style="font-size: 15px; margin-left: 1%;">${t_vo.getTrainerAccount()}</span><span style="font-size: 15px">년</span>
				<img id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:38%; display:inline; width:30px; height:30px;">
				</span><br>
				<span style="font-size: 150%;">현재 포인트 : ${t_vo.getTrainerPoint()}</span>
				</div>
				</div>
				<div>
				</div>
				</div><br>
				<hr width="50%" style="margin: 0 auto;"><br>
				
				<div class="image major" data-position="center" style="margin-left: 27%;">
				<span style="margin: 0 auto; font-size: 40px; font-weight: bold;">SNS</span>
				<div>
				<div style="margin: 0 auto; cursor: pointer;" id="snsDiv1">
				<span style="font-size: 30px; display: inline; color:#29b6f6;"><img src="${pageContext.request.contextPath}/images/sns2.png" style="width: 40px; height: 40px; display: inline; margin-right: 1%;">SNS 이동<img id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:33%; display:inline; width:30px; height:30px;"></span>
				</div>
				</div>
				<br>
				<hr width="50%" style="margin-left: -2%;"><br>
				<span style="margin: 0 auto; font-size: 40px; font-weight: bold;">거래 정보</span>
				<div>
				<div style="margin: 0 auto; cursor: pointer;" id="payMentBoard">
				<span style="font-size: 30px; display: inline; color:#29b6f6;"><img src="${pageContext.request.contextPath}/images/icon1.png" style="width: 40px; height: 40px; display: inline; margin-right: 1%;">결제 내역<img id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:33%; display:inline; width:30px; height:30px;"></span>
				</div>
				<div style="margin: 0 auto; cursor: pointer;" id="point">
				<span style="font-size: 30px; display: inline; color:#29b6f6;"><img src="${pageContext.request.contextPath}/images/icon7.png" style="width: 40px; height: 40px; display: inline; margin-right: 1%;">포인트 환전<img  id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:32%; display:inline; width:30px; height:30px;"></span>
				</div>
				<div style="margin: 0 auto; cursor: pointer;" id="PriceModify">
				<span style="font-size: 30px; display: inline; color:#29b6f6;"><img src="${pageContext.request.contextPath}/images/icon7.png" style="width: 40px; height: 40px; display: inline; margin-right: 1%;">PT 가격<img  id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:32%; display:inline; width:30px; height:30px;"></span>
				</div>
				</div>
				<br>
				<hr width="50%" style="margin-left: -2%;"><br>
				<span style="margin: 0 auto; font-size: 40px; font-weight: bold;">회원 정보</span>
				<div>
				<div style="margin: 0 auto; cursor: pointer;" id="TwithdrawalDiv">
				<span style="font-size: 30px; display: inline; color:#29b6f6;"><img src="${pageContext.request.contextPath}/images/icon2.png" style="width: 40px; height: 40px; display: inline; margin-right: 1%;">회원 탈퇴<img id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:33%; display:inline; width:30px; height:30px;"></span>
				</div>
				<div id="careerModify" style="margin: 0 auto; cursor: pointer;">
				<span style="font-size: 30px; display: inline; color:#29b6f6;"><img src="${pageContext.request.contextPath}/images/icon8.png" style="width: 40px; height: 40px; display: inline; margin-right: 1%;">경력 수정<img id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:33%; display:inline; width:30px; height:30px;"></span>
				</div>
				<div id="contentModify" style="margin: 0 auto; cursor: pointer;">
				<span style="font-size: 30px; display: inline; color:#29b6f6;"><img src="${pageContext.request.contextPath}/images/icon8.png" style="width: 40px; height: 40px; display: inline; margin-right: 1%;">컨텐츠 작성<img id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:33%; display:inline; width:30px; height:30px;"></span>
				</div>
				</div>
				<hr width="50%" style="margin-left: -2%;"><br>
				<span style="margin: 0 auto; font-size: 40px; font-weight: bold;">상담 정보</span>
				<div>
				<div style="margin: 0 auto; cursor: pointer;" id="URLModify">
				<span style="font-size: 30px; display: inline; color:#29b6f6;"><img src="${pageContext.request.contextPath}/images/icon5.png" style="width: 40px; height: 40px; display: inline; margin-right: 1%;">URL 수정<img id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:32%; display:inline; width:30px; height:30px;"></span>
				</div>
				</div>
				</div>
				
				</div>
				<div class="wrapper">
					<div class="inner">
					<div id="URLDiv" style="display: none;">
					<span id="urlSpan" style="margin-left: 41%;font-size: 35px">URL 수정</span>
					<form style="margin: 37px 0 2rem 0;"  action="${pageContext.request.contextPath}/trainer/TrainerMypageURLModify.tr">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">URL</span>
					<input type="text" name="TrainerId" value="${t_vo.getTrainerId()}" style="display:none;">
					<input type="text" name="URL" value="${t_vo.getTrainerUrl()}" style="width: 60%;margin-left: 18%; background-color: white;">
					<button id="urlBtn" class="button small" style="    border-radius: 6px; margin-left: 64.5%;margin-top: 1%; ">수정 완료</button>
					<a href="${pageContext.request.contextPath}/trainer/TrainerMypageView.tr?t_id=${t_vo.getTrainerId()}" id="backBtn" class="button small" style="border-radius: 6px;">취소</a>
					</form>
					</div>
					<div id="careerDiv" style="display: none;">
					<span id="caSpan" style="margin-left: 41%;font-size: 35px">경력 수정</span>
					<form style="margin: 37px 0 2rem 0;" action="${pageContext.request.contextPath}/trainer/TrainerMypageAccountModify.tr">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">경력</span>
					<input type="text" name="TrainerId" value="${t_vo.getTrainerId()}" style="display:none;">
					<select name="Account" style="width: 60%;margin-left: 18%;">
						<option value="${t_vo.getTrainerAccount()}">${t_vo.getTrainerAccount()}년이상</option>
						<option value="0">0년</option>
						<option value="1">1년</option>
						<option value="2">2년</option>
						<option value="3">3년</option>
						<option value="4">4년</option>
						<option value="5">6년</option>
						<option value="7">8년</option>
						<option value="9">9년</option>
						<option value="10">10년</option>
						<option value="11">11년</option>
						<option value="12">12년</option>
						<option value="13">13년</option>
						<option value="14">14년</option>						
						<option value="15">15년</option>						
						<option value="16">16년</option>						
						<option value="17">17년</option>						
						<option value="18">18년</option>						
						<option value="19">19년</option>						
						<option value="20">20년</option>						
					</select>
					<button id="caBtn" class="button small" style="border-radius: 6px; margin-left: 64.5%;margin-top: 1%; ">수정 완료</button>
					<a href="${pageContext.request.contextPath}/trainer/TrainerMypageView.tr?t_id=${t_vo.getTrainerId()}" id="backBtn" class="button small" style="border-radius: 6px;">취소</a>
					</form>
					</div>
					<div id="PTDiv" style="display: none;">
					<span id="ptSpan" style="margin-left: 41%;font-size: 35px">PT가격 설정</span>
					<form style="margin: 37px 0 2rem 0;" action="${pageContext.request.contextPath}/trainer/TrainerMypagePriceModify.tr">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">PT 가격</span>
					<input type="text" name="TrainerId" value="${t_vo.getTrainerId()}" style="display:none;">
					<input type="text" name="price" value="${t_vo.getTrainerPrice()}" style="width: 60%;margin-left: 18%; background-color: white;">
					<button id="ptBtn" class="button small" style="border-radius: 6px; margin-left: 64.5%;margin-top: 1%; ">수정 완료</button>
					<a href="${pageContext.request.contextPath}/trainer/TrainerMypageView.tr?t_id=${t_vo.getTrainerId()}" id="backBtn" class="button small" style="border-radius: 6px;">취소</a>
					</form>
					</div>
					<div id="contentDiv" style="display: none;">
					<span id="contentSpan" style="margin-left: 41%;font-size: 35px">컨텐츠 설정</span>
					<form style="margin: 37px 0 2rem 0;" action="${pageContext.request.contextPath}/trainer/TrainerMypageContentModify.tr">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">컨텐츠 설정</span>
					<input type="text" name="TrainerId" value="${t_vo.getTrainerId()}" style="display:none;">
					<textarea name="content" style="width: 60%; margin: 0 auto; resize: none; background: white; height: 300px">${t_vo.getTrainerContent()}</textarea>
					<button id="contentBtn" class="button small" style="border-radius: 6px; margin-left: 67%;margin-top: 1%; ">수정 완료</button>
					<a href="${pageContext.request.contextPath}/trainer/TrainerMypageView.tr?t_id=${t_vo.getTrainerId()}" id="backBtn" class="button small" style="border-radius: 6px;">취소</a>
					</form>
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
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
				<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
					<script>
				
			$(function(){
				var pageContext = "${pageContext.request.contextPath}";
				var id='<c:out value="${trainerId}"/>';
				var t_vo='<c:out value="${t_vo}"/>'
				
				$("#URLModify").click(function(){
					$("#main").hide();
					$("#URLDiv").show();
					});
				$("#contentModify").click(function(){
					$("#main").hide();
					$("#contentDiv").show();
					});
				$("#PriceModify").click(function(){
					$("#main").hide();
					$("#PTDiv").show();
					});
				$("#careerModify").click(function(){
					$("#main").hide();
					$("#careerDiv").show();
					});
				$("#TMyPageDiv").click(function(){
					location.href=pageContext+"/trainer/TMypageModify.tr?TrainerId="+id;
				});
				$("#snsDiv1").click(function(){
					location.href=pageContext+"/trainer/sns.tr?TrainerId="+id;
				});
				$("#payMentBoard").click(function(){
					location.href=pageContext+"/trainer/TpayMentBoard.tr?TrainerId="+id;
				});	
				$("#point").click(function(){
					location.href=pageContext+"/trainer/Tpay.tr?TrainerId="+id;
				});
				$("#TwithdrawalDiv").click(function(){
					location.href=pageContext+"/trainer/Tdrawal.tr?TrainerId="+id;
				});
				
				
			});
			</script>

	</body>
</html>