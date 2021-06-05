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
		<title>검색 결과</title>
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
		</style>
	</head>
	<body class="is-preload" style="font-family: 'BMHANNAAir';">
		<c:set var="page" value="${page}"/>
		<c:set var="trainers" value="${trainers}"/>
		<c:set var="resultSize" value="${resultSize}"/>
		
		<jsp:include page="../../header.jsp"/>

		<!-- Main -->
			<div id="main">
				<div class="wrapper special">
					<div class="inner">
						<header class="heading">
							<h1 style="display:inline">"${keyword}"</h1>을 검색하셨나요?
							<c:choose>
								<c:when test="${flag}">
									<div class="stats">
										<div>
											<span class="num">${resultSize}</span>
											<span class="label">검색 결과</span>
										</div>
										<div>
											<span class="num">${searchCnt}</span>
											<span class="label">검색된 횟수</span>
										</div>
									</div>
									<div class="wrapper style2" style="">
										<div class="inner">
											<div class="spotlights">
												<c:forEach var="trainer" items="${trainers}">
													<div class="spotlight">
														<c:choose>
															<c:when test="${trainer.getTrainerProfileImage() != null}">
																<div class="image fit">
																	<img src="${pageContext.request.contextPath}/files/${trainer.getTrainerProfileImage()}" alt="" />
																</div>
															</c:when>
															<c:otherwise>
																<div class="image fit">
																	<img src="${pageContext.request.contextPath}/images/blackLogo.jpg" alt="" />
																</div>
															</c:otherwise>
														</c:choose>
														<div class="content">
															<h3>${trainer.getTrainerName()} 트레이너</h3>
															<p>누적 트레이닝 횟수 : ${trainer.getTrainerLike()}명</p>
															<p>${trainer.getTrainerContent()}</p>
															<ul class="actions">
															<!-- 수정 필요 -->
																<li style="margin-left: auto; margin-right: auto;"><a href="${pageContext.request.contextPath}/review/ReviewList.rv?trainerId=${trainer.getTrainerId()}" class="button">보러가기</a></li>
															</ul>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
										<ul id="desktop" class="actions" style="justify-content:center;">
											<c:if test="${page.page > 1}">
												<li><a href="${page.page - 1}" class="button primary small pages" id="prev">&lt;</a></li>
											</c:if>
											<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
												<c:choose>
													<c:when test="${page.page == i}">
														<li><a href="${i}" class="button small pages">${i}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${i}" class="button primary small pages">${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if test="${page.page < page.endPage}">
												<li><a href="${page.page + 1}" class="button primary small pages" id="next">&gt;</a></li>
											</c:if>
										</ul>
										<ul id="mobile" class="actions" style="justify-content:center;">
											<li>
												<a href="#" class="button primary small pages" id="prev">&lt;</a>
												<a href="#" class="button small">1</a>
												<a href="#" class="button primary small pages" id="next">&gt;</a>
											</li>
										</ul>
									</div>
								</c:when>
								<c:otherwise>
									<br>
									<span class="label" style="font-weight:bold;">죄송합니다. 검색결과가 없습니다.</span>
								</c:otherwise>
							</c:choose>
						</header>
					</div>
				</div>
			</div>
		<jsp:include page="../../footer.jsp"/>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	</body>
	<script>
		$(".pages").on("click", function(e){
			e.preventDefault();
			var page = $(this).attr("href");
			var keyword = "${keyword}";
			location.href="${pageContext.request.contextPath}/trainer/search.tr?keyword=" + keyword + "&page="+page;
		})
	</script>	
</html>



















