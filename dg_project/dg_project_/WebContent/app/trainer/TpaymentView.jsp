<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
	<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>결제페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<style>
		.re{
		height: 66px;
		}
			.wrapper {
    			padding: 0;
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
			
			input[type="text"], input[type="password"], 
			input[type="email"], input[type="tel"], 
			input[type="search"], input[type="url"], 
			select, textarea {
				background-color: white;
			}
			
			
			div .imgs_wrap {
				width: 100%;
				margin-bottom: 20%;
				display: flex;
				justify-content: center;
			}
			
			/* 버튼 가운데 정렬로 바꾸기 */
			@media screen and (max-width: 980px) {
				div #downButton{
					display: none;
				}
								
				div #lLi {
					margin-left: auto;
				}
				
				div #dLi {
					padding: 0 0 0 1rem !important;
					margin-right: auto; 
				}
			}
			
			@media screen and (max-width: 1680px){
				#insertInput {
					width: 85% !important;
				}
				
				#file1 {
					width: 85% !important;
				}
			}
			
			@media screen and (max-width: 1359px){
				#ready{
				margin-left: 72%;
				}
			}
			@media screen and (max-width: 1280px){
				#insertInput {
					width: 81% !important;
				}
				
				#file1 {
					width: 81% !important;
				}
			}
			
			@media screen and (max-width: 980px){
				#insertInput {
					width: 73% !important;
				}
				
				#file1 {
					width: 73% !important;
				}
			}
			
			@media screen and (max-width: 736px){
				#qaViewDiv {
					width: 100% !important;
				}
			
				#insertInput {
					width: 84% !important;
				}
				
				#file1 {
					width: 84% !important;
				}
			}
			
			@media screen and (max-width: 480px){
				div #dLi {
					padding: 0 !important;
				}
				
				div .imgs_wrap {
					display: none;
				}
				
				div #ulTag {
					display: none;
				}
				
				#insertInput {
					width: 100% !important;
					float: none !important;
				}
				
				#insertUl {
					margin-top: 5% !important;
				}
				
				#file1 {
					width: 100% !important;
					float: none !important;
				}
				
				#downUl {
					margin-top: 5% !important;
				}
				
			}
			.modal{ position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;}
			table tbody tr:nth-child(2n + 1) {
				background-color: white;
			}
			#tdId{
				width: 20%;
			}
			
			#insertLi {
				padding: 0;
			}
			
			#downLi {
				padding: 0;
			}
			
			.logo {
				width: 40%;
				padding-left: 20% !important;
			}
			
			.logo img {
				width: 48px;
				height: 48px;
				vertical-align: sub;
				margin-right: 3%;
			}
			
			@media screen and (max-width: 980px){
				.logo img {
					width: 40px !important;
					height: 40px !important;
				}
			}
			
			@media screen and (max-width: 736px){
				.logo {
					padding-left: 4% !important;
				}
			}  			
		</style>
	</head>
	<body class="is-preload" style="font-family: 'BMHANNAAir';">

		<!-- Header -->
		<header id="header">
			<a class="logo" href="index.html"><img src=${pageContext.request.contextPath}/images/tplogo.png>득근득근</a>
			<nav>
				<a id="" href="#" style="font-size: 20px;">수정하기</a>
			</nav>
		</header>
		
		<c:set var="tr_vo" value="${tr_vo}"/>
	
		
		<!-- Main -->
		<div id="main">
			<div class="wrapper special">
				<div class="inner">
		<c:choose>
		<c:when test="${tr_vo.getUserId() eq null}">
					<header class="heading">
						<h1 style="margin-top: 10%;">${tr_vo.getTrainerId()}</h1>
						<p>회원님들의 댓글은 서비스 개선에 큰 도움이 됩니다!</p>
					</header>
		</c:when>
		<c:otherwise>
					<header class="heading">
						<h1 style="margin-top: 10%;">${tr_vo.getUserId()}</h1>
						<p>회원님들의 댓글은 서비스 개선에 큰 도움이 됩니다!</p>
					</header>
		</c:otherwise>
		</c:choose>
				</div>
			</div>
			
			
			<div class="wrapper">
				<div class="inner">
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall" id="qaViewDiv" style="margin: 0 auto;">
							<lable>고객 아이디</lable>
							<input type="text" name="demo-name" id="demo-name" value="${tr_vo.getUserId()}" readonly/>
							<lable>트레이너 아이디</lable>
							<input type="text" name="demo-name" id="demo-name" value="${tr_vo.getTrainerId()}" readonly/>
							<textarea name="demo-textarea" id="demo-textarea" rows="6" style="margin-top: 5%; resize: none;" readonly>${tr_vo.getUserId()}님이 ${tr_vo.getTradeContent()}</textarea>
							<div style="margin-top: 5%;">
										<a style="float:left;" class="button primary small" href="${pageContext.request.contextPath}/trainer/TpayMentBoard.tr?page=${page}&TrainerId=${t_vo.getTrainerId()}" >목록</a>
										<div style="margin-bottom: 3%;margin-left: 73%;">
										</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../../footer.jsp"/>
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>

		
	</body>
</html>