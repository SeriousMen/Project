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
		<title>비밀번호 변경</title>
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
			
			.inputTag {
				margin: 0 auto;
				width: 60%;
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
	
	<body class="is-preload">
	<c:set var="memberlist" value="${memberlist}"/>
	<c:set var="trainerlist" value="${trainerlist}"/>
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
					<form action="${pageContext.request.contextPath}/member/MemberChangePw.me" name="changePwForm">
						<div class="box" style="width: 50%; margin: 0 auto;">
							<label style="text-align: center; font-size: 200%;">비밀번호 변경</label>
							<div style="margin: 0 auto;">
								<div class="inputTag">
									<h4>아이디</h4>
									<c:choose>
										<c:when test="${session_m_id ne null}">
											<input type="text" name="id" id="id" value="${session_m_id}" readonly />
										</c:when>
											<c:when test="${memberlist ne null}">
											<input type="text" name="id" id="id" value="${fn:replace(fn:replace(memberlist,'[',''),']','')}" readonly />
										</c:when>
											<c:when test="${trainerlist ne null}">
											<input type="text" name="id" id="id" value="${fn:replace(fn:replace(trainerlist,'[',''),']','')}" readonly />
										</c:when>
									</c:choose>
								<br>
								</div>
								<br>
								
									<div class="inputTag">
										<h4>새로운 비밀번호</h4>
										<input type="password" name="newPw" id="newPw" value="" placeholder=""/>
										<p id="checkPw_msg" style="float: right; font-size: 0.8em"></p>
									<br>
									</div>
									<br>
								
									<div class="inputTag">
										<h4>비밀번호확인</h4>
										<input type="password" name="PwOk" id="PwOk" value="" placeholder=""/>
										<p id="equalPw_msg" style="float: right;"></p>
									</div>
									<br>
									<br>
								
								<div>
									<ul class="actions">
										<li style="margin: 0 auto;"><a href="javascript:changeformSubmit()" class="button">변경하기</a></li>
									</ul>
								</div>
							</div>
						</div>
						</form>
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
		<script src="${pageContext.request.contextPath}/app/public/changePw.js"></script>
		<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
		<script>
	
	
		</script>
	</body>
</html>