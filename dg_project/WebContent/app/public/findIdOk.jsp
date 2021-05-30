<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<title>아이디 찾기완료</title>
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
	
	
	#actionBtn{
		border-radius: 6px;
	}

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
	
	<body class="is-preload">
	<c:set var="memberlist" value="${memberlist}"/>
	<c:set var="trainerlist" value="${trainerlist}"/>
	
		<c:if test="${param.check == 'true'}">
			<script>
			alert("해당하신 정보로 아이디를 찾았습니다.");</script>
		</c:if>
		
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
					
					<div class="inner">
							<div class="box" style="width: 60%; margin: 0 auto;">
								
								<div style="text-align: center;">
								<c:choose>
								<c:when test="${memberlist eq null and trainerlist eq null}">
								<p>회원님의 아이디는 입니다</p>
								</c:when>
								<c:when test="${memberlist ne null }">
								<p>회원님의 아이디는<c:out value="${memberlist}" />입니다</p>
								</c:when>
								
								
								<c:when test="${trainerlist ne null}">
								<p>강사님의 아이디는<c:out value="${trainerlist}" />입니다</p>
								</c:when>	
									
							
								</c:choose>
								</div>
							
			
									
						
								<div style="text-align: center; margin: 0 auto;">
									<a href="${pageContext.request.contextPath}/index.jsp" id="actionBtn" class="button" >돌아가기</a>
									<a href="${pageContext.request.contextPath}/app/public/login.jsp"   id="actionBtn" class="button primary" >로그인하러가기!</a>
								</div>	
								
							</div>
							
							
							</div>
							
							
					
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
	

	</body>
</html>