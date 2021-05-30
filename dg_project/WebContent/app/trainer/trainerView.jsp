<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->

<!--


-->
<html>
	<head>
	<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>트레이너 상세보기 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<style>
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
			input[type="search"], input[type="url"], select, textarea {
				background-color: white;
			}
			
			.wrapper {
				padding: 0;
			}
			
			@media screen and (max-width: 1680px){
				#imgSize {
					height: 825px !important; 
				}
				
				#imgDiv {
					width: 630px !important;
					margin-left: 5%;
				}
				
				.row > * {
					padding: 0;
				}
				
				#topDiv {
					margin-top: 137px !important;
				}
			}
			
			
			@media screen and (max-width: 1280px){
				#imgDiv {
					/* width: 600px !important; */
					width: 560px !important;
					margin-left: 1% !important;
				}
				
				#topDiv {
					margin-top: 100px !important;
				}
			}
			
			@media screen and (max-width: 980px){
				#imgDiv {
					width: 100% !important;
					position: inherit !important;
				}
				
				#imgSize {
					height: auto !important; 
				}
				
				#topDiv {
					margin-top: 0px !important;
				}
			}
			
			table tbody tr:nth-child(2n + 1) {
				background-color: white;
			}
			
			#mobile{display:none;}
			
			@media (max-width:480px){
				#desktop{display:none;}
				#mobile{display:block;}
				
				ul#mobile:not(.fixed) li .button {
				    width: 11%;
				}
				
				.col1 {
					width: 27% !important;
				}
				
				.col2 {
					width: 38% !important;
				}
				
				.col3 {
					width: 35% !important;
				}
			}
			
			.contentA {
				text-decoration: none;
				display: block;
				/* widows: 100%; */
				width: 100%;
				overflow: hidden; 
			}
			
			.col1 {
				width: 23%;
			}
			
			.col2 {
				width: 51%;
			}
			
			.col3 {
				width: 26%;
			}
		</style>
	</head>
	<body class="is-preload" style="font-family: 'BMHANNAAir';">
		<c:set var="list" value="${reviewList}"/>
		<c:set var="totalCnt" value="${totalCnt}"/>
		<c:set var="startPage" value="${startPage}"/>
		<c:set var="endPage" value="${endPage}"/>
		<c:set var="nowPage" value="${nowPage}"/>
		<c:set var="realEndPage" value="${realEndPage}"/>
		<c:set var="t_vo" value="${t_vo}"/>
		<c:set var="toTotal" value="${param.to}"/>
		
		<jsp:include page="../../header.jsp"/>

		<!-- Main -->
			<div id="main">
				<div class="wrapper">
					<div class="inner">
						<div class="row">
							<div class="col-6 col-12-medium" id="imgDiv" style="width: 600px; position: fixed; margin-left: 6%;">
								<div style="text-align: center;"><label style="font-size: 300%; font-family: 'BMHANNAAir';">${t_vo.getTrainerName()} 트레이너</label></div>
									<c:choose>
										<c:when test="${t_vo.getTrainerProfileImage() != null}">
											<div class="image fit">
												<img src="${pageContext.request.contextPath}/files/${t_vo.getTrainerProfileImage()}" alt="" />
											</div>
										</c:when>
										<c:otherwise>
											<div class="image fit">
												<img src="${pageContext.request.contextPath}/images/blackLogo.jpg" alt="" />
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							<div class="col-6 col-12-medium" id="textareaDiv" style="margin-left: auto;">
								<div id="topDiv" style="margin-top: 157px;">	
									<textarea name="demo-textarea" id="demo-textarea" rows="10" style="resize: none; font-size: 25px; border: 2px solid black;" readonly="readonly">${t_vo.getTrainerContent()}</textarea>
									<div style="margin-top: 5%;">
										<ul class="actions stacked">
											<li><a href="${pageContext.request.contextPath}/trainer/sns.tr?TrainerId=${t_vo.getTrainerId()}" class="button primary fit">구경하러 가기</a></li>
											<c:choose>
												<c:when test="${toTotal eq null}">
													<li><a href="javascript:propensity('consult')" class="button primary fit">상담하러 가기</a></li>
													<li><a href="javascript:propensity('payment')" class="button primary fit">결제하러 가기</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="javascript:trainerList('consult')" class="button primary fit">상담하러 가기</a></li>
													<li><a href="javascript:trainerList('payment')" class="button primary fit">결제하러 가기</a></li>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
								</div>
								<div class="table-wrapper">
									<table style="table-layout: fixed;">
										<caption></caption>
										<thead>
											<tr>
												<th class="col1">아이디</th>
												<th class="col2">내용</th>
												<th class="col3">날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${list != null and fn:length(list) > 0}">
													<c:forEach var="r_list" items="${list}">
														<tr>
															<td class="col1">${r_list.getMemberId()}</td>
															<td class="col2"><a href="${pageContext.request.contextPath}/review/ReviewView.rv?reviewNum=${r_list.getReviewNum()}&page=${nowPage}" class="contentA">${r_list.getReviewContent()}</a></td>
															<td class="col3">${fn:substring(r_list.getUpload(), 0, 16)}</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<td style="text-align: center;" colspan="3">등록된 리뷰가 없습니다.</td>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
								<div>
									<ul id="desktop" class="actions" style="justify-content:center;">
										<c:if test="${nowPage > 1}">
											<li><a href="${pageContext.request.contextPath}/review/ReviewList.rv?page=${nowPage - 1}&trainerId=${t_vo.getTrainerId()}" class="button primary small pages" id="prev" style="box-shadow:none;">&lt;</a></li>
										</c:if>
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:choose>
												<c:when test="${i eq nowPage}">
													<li><a href="#" class="button primary small pages" style="box-shadow:none; background-color: black; color: white !important;">${i}&nbsp;</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="${pageContext.request.contextPath}/review/ReviewList.rv?page=${i}&trainerId=${t_vo.getTrainerId()}" class="button primary small pages" style="box-shadow:none;">${i}&nbsp;</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${realEndPage != nowPage}">
											<li><a href="${pageContext.request.contextPath}/review/ReviewList.rv?page=${nowPage + 1}&trainerId=${t_vo.getTrainerId()}" class="button primary small pages" id="next" style="box-shadow:none;">&gt;</a></li>
										</c:if>
									</ul>
									
										<br>
									<ul id="mobile" class="actions" style="justify-content:center;">
										<li>
											<c:if test="${nowPage > 1}">
												<a href="${pageContext.request.contextPath}/review/ReviewList.rv?page=${nowPage - 1}&trainerId=${t_vo.getTrainerId()}" class="button primary small pages" id="prev" style="box-shadow:none;">&lt;</a>
											</c:if>
											<a href="#" class="button primary small pages" style="box-shadow:none; background-color: black; color: white !important;">${nowPage}&nbsp;</a>
											<c:if test="${realEndPage != nowPage}">
												<a href="${pageContext.request.contextPath}/review/ReviewList.rv?page=${nowPage + 1}&trainerId=${t_vo.getTrainerId()}" class="button primary small pages" id="next" style="box-shadow:none;">&gt;</a>
											</c:if>
										</li>
									</ul>
								</div>
								<!-- Footer -->
								<jsp:include page="../../footer.jsp"></jsp:include>
							</div>
						</div>
					</div>
				</div>
			</div>



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
		function propensity(sortation){
			<c:choose>
				<c:when test="${session_t_id != null}">
					alert("회원만 이용 가능한 서비스입니다.");
					location.replace("${pageContext.request.contextPath}/review/ReviewList.rv?trainerId=${t_vo.getTrainerId()}");
					return false;
				</c:when>
				<c:when test="${session_m_id eq null}">
					alert("로그인이 필요한 서비스입니다.");
					location.replace("${pageContext.request.contextPath}/app/public/login.jsp?propensity=false");
					return false;
				</c:when>
			</c:choose>
			movePage(sortation);
		}
		
		function trainerList(sortation){
			<c:choose>
				<c:when test="${session_t_id != null}">
					alert("회원만 이용 가능한 서비스입니다.");
					location.replace("${pageContext.request.contextPath}/review/ReviewList.rv?trainerId=${t_vo.getTrainerId()}");
					return false;
				</c:when>
				<c:when test="${session_m_id eq null}">
					alert("로그인이 필요한 서비스입니다.");
					location.replace("${pageContext.request.contextPath}/app/public/login.jsp?trainer=${t_vo.getTrainerId()}");
					return false;
				</c:when>
			</c:choose>
			movePage(sortation);
		}
		
		function movePage(sortation){
			var newWidth = 890;
			var newHeight = 738;
			var popX = (window.screen.width / 2) - (newWidth / 2);
			var popY = (window.screen.height / 2) - (newHeight / 2);
			if(sortation == 'consult'){
				window.open("${t_vo.getTrainerUrl()}");
				return false;
			}
			window.open('${pageContext.request.contextPath}/review/PaymentPopup.rv?m_id=${session_m_id}&trainerId=${t_vo.getTrainerId()}', 'payment', 'status=no, height='+newHeight+', width='+newWidth+', left='+ popX + ', top='+ popY);
		}
	</script>
</html>