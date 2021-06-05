<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<title>운동 성향 결과</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<style>
			a.pages{
				box-shadow:none !important;
			}
		
			#prev{
				border-radius:0;
			}
			
			#next{
				border-radius:0;
			}
			
			.stats{
				margin-top:30px;
			}
			
			.spotlights .spotlight .image {
				min-width:20% !important;
			}
		
			.spotlights .spotlight .content {
				min-width:70% !important;
			}
			#mobile{display:none;}
			
			@media (max-width:480px){
				#desktop{display:none;}
				#mobile{display:block;}
				ul#mobile:not(.fixed) li .button {
				    width: 11%;
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
			
			.image.fit {
				padding: 10px 10px 0px 10px;
			}
		</style>
	</head>
	<body class="is-preload" style="font-family: 'BMHANNAAir';">
		<c:set var="totalCnt" value="${totalCnt}"/>
		<c:set var="trainerCnt" value="${trainerCnt}"/>
		<c:set var="totalPage" value="${totalPage}"/>
		<c:set var="startPage" value="${startPage}"/>
		<c:set var="endPage" value="${endPage}"/>
		<c:set var="nowPage" value="${nowPage}"/>
		<c:set var="realEndPage" value="${realEndPage}"/>
		<c:set var="resultList" value="${resultList}"/>
		<jsp:include page="../../header.jsp"/>

		<!-- Main -->
			<div id="main">
				<div class="wrapper special">
					<div class="inner">
						<header class="heading">
							<h1 style="display:inline">득근득근의 트레이너는</h1>
							<div class="stats">
								<div>
									<span class="num">${trainerCnt}</span>
									<span class="label">총 트레이너 수</span>
								</div>
								<div>
									<span class="num">${totalCnt}</span>
									<span class="label">검색 결과</span>
								</div>
							</div>
						</header>
					</div>
				</div>
				<c:choose>
					<c:when test="${empty resultList}">
						<div style="text-align: center; font-size: 1.5rem;">
							<span class="label" style="font-weight:bold;">죄송합니다. 검색결과가 없습니다.</span>
						</div>
					</c:when>
					<c:otherwise>
						<div class="wrapper style2" style="">
							<div class="inner">
								<div class="spotlights">
									<%-- <input type="hidden" name="listtest" value="${resultList}"/> --%>
									<c:forEach var="i" items="${resultList}">
										<div class="spotlight">
											<div class="image fit">
												<%-- 트레이너 사진 넣는 곳 --%>
												<c:choose>
													<c:when test="${i.getTrainerProfileImage() != null}">
														<div class="image fit" style="width: 100%; height: 100%;">
															<img src="${pageContext.request.contextPath}/files/${i.getTrainerProfileImage()}" style="object-fit: contain;" alt="" />
														</div>
													</c:when>
													<c:otherwise>
														<div class="image fit">
															<img src="${pageContext.request.contextPath}/images/blackLogo.jpg" alt="" />
														</div>
													</c:otherwise>
												</c:choose>
											</div>
											<div class="content" style="width: 30%;">
												<h3>${i.getTrainerName()} 트레이너</h3>
												<p class="memberCnt">누적 트레이닝 횟수 : ${i.getTrainerLike()}명</p>
												<p>${i.getTrainerContent()}</p>
												<ul class="actions">
													<li><a href="${pageContext.request.contextPath}/review/ReviewList.rv?trainerId=${i.getTrainerId()}" class="button">트레이너 보러가기</a></li>
												</ul>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div>
								<ul id="desktop" class="actions" style="justify-content:center;">
									<c:if test="${nowPage > 1}">
										<li><a href="${pageContext.request.contextPath}/review/Propensity.rv?page=${nowPage - 1}" class="button primary small pages" id="prev" style="box-shadow:none;">&lt;</a></li>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:choose>
											<c:when test="${i eq nowPage}">
												<li><a href="#" class="button primary small pages" style="box-shadow:none; background-color: black; color: white !important;">${i}&nbsp;</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="${pageContext.request.contextPath}/review/Propensity.rv?page=${i}" class="button primary small pages" style="box-shadow:none;">${i}&nbsp;</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${realEndPage != nowPage}">
										<li><a href="${pageContext.request.contextPath}/review/Propensity.rv?page=${nowPage + 1}" class="button primary small pages" id="next" style="box-shadow:none;">&gt;</a></li>
									</c:if>
								</ul>
									<br>
								<ul id="mobile" class="actions" style="justify-content:center;">
									<li>
										<c:if test="${nowPage > 1}">
											<a href="${pageContext.request.contextPath}/review/Propensity.rv?page=${nowPage - 1}" class="button primary small pages" id="prev" style="box-shadow:none;">&lt;</a>
										</c:if>
										<a href="#" class="button primary small pages" style="box-shadow:none; background-color: black; color: white !important;">${nowPage}&nbsp;</a>
										<c:if test="${realEndPage != nowPage}">
											<a href="${pageContext.request.contextPath}/review/Propensity.rv?page=${nowPage + 1}" class="button primary small pages" id="next" style="box-shadow:none;">&gt;</a>
										</c:if>
									</li>
								</ul>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<%-- <form method="post" id="listTest" name="listTest" action="${pageContext.request.contextPath}/review/Propensity.rv">
				<input type="hidden" name="list" value="${resultList}"> 
			</form> --%>
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
	</body>
</html>