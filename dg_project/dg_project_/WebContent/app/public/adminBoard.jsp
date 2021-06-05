<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
	<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>관리자 게시판 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<style>
			.column1 {
				width: 20%;
			} 
			.column2 {
				width: 40%;
			} 
			.column3 {
				width: 20%;
			} 
			.column4 {
				width: 20%;
			} 
		
		
			#mobile{display:none;}
			
			@media (max-width:480px){
				#desktop{display:none;}
				#mobile{display:block;}
				
				ul#mobile:not(.fixed) li .button {
				    width: 11%;
				}
				
				.column4 {
					display: none;
				}
				
				table th {
					padding: 0.75rem 0.3rem;
				}
				
				table td {
					padding: 0.75rem 0.3rem;
				}
				
				#tableWidth {
				}
			}
			
			@media screen and (max-width: 736px) {
				#tableWidth {
					width: 100% !important;
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
			
			table tbody tr:nth-child(2n + 1) {
				background-color: white;
			}
			
			table a {
				text-decoration: none;
			}
			
			.wrapper {
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
		<c:set var="q_totalCnt" value="${q_totalCnt}"/>
		<c:set var="q_startPage" value="${q_startPage}"/>
		<c:set var="q_endPage" value="${q_endPage}"/>
		<c:set var="q_nowPage" value="${q_nowPage}"/>
		<c:set var="q_realEndPage" value="${q_realEndPage}"/>
		<c:set var="q_list" value="${q_list}"/>
		
		<c:set var="r_totalCnt" value="${r_totalCnt}"/>
		<c:set var="r_startPage" value="${r_startPage}"/>
		<c:set var="r_endPage" value="${r_endPage}"/>
		<c:set var="r_nowPage" value="${r_nowPage}"/>
		<c:set var="r_realEndPage" value="${r_realEndPage}"/>
		<c:set var="r_list" value="${r_list}"/>
		<c:set var="r_temp" value="${r_temp}"/>
		
	
		<%-- <c:if test="${session_a_id eq null}">
			<script>
				alert("관리자만 이용 가능한 있는 서비스입니다.");
				location.href("${pageContext.request.contextPath}/app/public/index.jsp");	
			</script>
		</c:if> --%>
		<!-- Header -->
		<header id="header">
			<a class="logo" href="${pageContext.request.contextPath}/index.jsp"><img src=${pageContext.request.contextPath}/images/tplogo.png>득근득근</a>
			<nav>
				<a id="changeButton" href="javascript:change()" style="font-size: 20px;">Report</a>
			</nav>
		</header>

		<!-- Main -->
			<div id="main">
				<div class="wrapper special" style="padding: 0rem 0 0rem 0 ;">
					<div class="inner">
						<header class="heading">
							<p style="margin: 0 0 0rem 0; font-size:40px; font-family: 'BMEULJIRO';">관리자 게시판</p>
						</header>
					</div>
				</div>
				
				<div class="wrapper">
					<div class="inner">
						<div class="row gtr-200">
							<div id="tableWidth" style="margin: 0 auto; width: 80%;">
								<div class="table-wrapper">
									<div id="qnaBoard">
										<table style="width: 100%; table-layout: fixed;">
											<caption style="font-size: 25px;">Q&A 게시판</caption>
											<thead>
												<tr>
													<th class="column1">번호</th>
													<th class="column2">제목</th>
													<th class="column3">아이디</th>
													<th class="column4">날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${q_list != null and fn:length(q_list)>0}">
														<c:forEach var="q" items="${q_list}">
															<tr>
																<td class="column1">
																	<div>${q.getQnaNum()}</div>
																</td>
																<td class="column2">
																	<div style="width: 100%;">
																		<a style="display: block; width: 100%; overflow: hidden;" href="${pageContext.request.contextPath}/qnaboard/BoardView.qn?boardNum=${q.getQnaNum()}&page=${q_nowPage}">${q.getQnaTitle()}</a>
																	</div>
																</td>
																<td class="column3">
																	<div>${q.getMemberId()}</div>
																</td>
																<td class="column4">
																	<div>${q.getUpload()}</div>
																</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<td style="text-align: center;" colspan="4">등록된 게시물이 없습니다.</td>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
										<div>
											<ul id="desktop" class="actions" style="justify-content:center;">
												<c:if test="${q_nowPage > 1}">
													<li><a href="${pageContext.request.contextPath}/admin/AdminList.ad?q_page=${q_nowPage - 1}" class="button primary small pages" id="prev" style="box-shadow:none;">&lt;</a></li>
												</c:if>
												<c:forEach var="i" begin="${q_startPage}" end="${q_endPage}">
													<c:choose>
														<c:when test="${i eq q_nowPage}">
															<li><a href="#" class="button primary small pages" style="box-shadow:none; background-color: black; color: white !important;">${i}&nbsp;</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="${pageContext.request.contextPath}/admin/AdminList.ad?q_page=${i}" class="button primary small pages" style="box-shadow:none;">${i}&nbsp;</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if test="${q_realEndPage != q_nowPage}">
													<li><a href="${pageContext.request.contextPath}/admin/AdminList.ad?q_page=${q_nowPage + 1}" class="button primary small pages" id="next" style="box-shadow:none;">&gt;</a></li>
												</c:if>
											</ul>
											
												<br>
											<ul id="mobile" class="actions" style="justify-content:center;">
												<li>
													<c:if test="${q_nowPage > 1}">
														<a href="${pageContext.request.contextPath}/admin/AdminList.ad?q_page=${q_nowPage - 1}" class="button primary small pages" id="prev" style="box-shadow:none;">&lt;</a>
													</c:if>
													<a href="#" class="button primary small pages" style="box-shadow:none; background-color: black; color: white !important;">${q_nowPage}&nbsp;</a>
													<c:if test="${q_realEndPage != q_nowPage}">
														<a href="${pageContext.request.contextPath}/admin/AdminList.ad?q_page=${q_nowPage + 1}" class="button primary small pages" id="next" style="box-shadow:none;">&gt;</a>
													</c:if>
												</li>
											</ul>
										</div>
									</div>
									<div id="reportBoard" style="display: none;">
										<table style="width: 100%; table-layout: fixed;">
											<caption style="font-size: 25px;">신고 게시판</caption>
											<thead>
												<tr>
													<th class="column1">번호</th>
													<th class="column2">제목</th>
													<th class="column3">아이디</th>
													<th class="column4">날짜</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${r_list != null and fn:length(r_list) > 0}">
														<c:forEach var="r" items="${r_list}">
															<tr>
																<td class="column1">
																	<div>${r.getReportNum()}</div>
																</td>
																<td class="column2">
																	<div style="width: 100%;">
																		<a style="display: block; width: 100%; overflow: hidden;" href="${pageContext.request.contextPath}/report/ReportViewOkAction.rp?reportNum=${r.getReportNum()}&page=${r_nowPage}">${r.getReportTitle()}</a>
																	</div>
																</td>
																<td class="column3">
																	<div>${r.getReportId()}</div>
																</td>
																<td class="column4">
																	<div>${r.getUpload()}</div>
																</td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<td style="text-align: center;" colspan="4">등록된 게시물이 없습니다.</td>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
										<div>
											<ul id="desktop" class="actions" style="justify-content:center;">
												<c:if test="${r_nowPage > 1}">
													<li><a href="${pageContext.request.contextPath}/admin/AdminList.ad?r_page=${r_nowPage - 1}" class="button primary small pages" id="prev" style="box-shadow:none;">&lt;</a></li>
												</c:if>
												<c:forEach var="i" begin="${r_startPage}" end="${r_endPage}">
													<c:choose>
														<c:when test="${i eq r_nowPage}">
															<li><a href="#" class="button primary small pages" style="box-shadow:none; background-color: black; color: white !important;">${i}&nbsp;</a></li>
														</c:when>
														<c:otherwise>
															<li><a href="${pageContext.request.contextPath}/admin/AdminList.ad?r_page=${i}" class="button primary small pages" style="box-shadow:none;">${i}&nbsp;</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if test="${r_realEndPage != r_nowPage}">
													<li><a href="${pageContext.request.contextPath}/admin/AdminList.ad?r_page=${r_nowPage + 1}" class="button primary small pages" id="next" style="box-shadow:none;">&gt;</a></li>
												</c:if>
											</ul>
											
												<br>
											<ul id="mobile" class="actions" style="justify-content:center;">
												<li>
													<c:if test="${r_nowPage > 1}">
														<a href="${pageContext.request.contextPath}/admin/AdminList.ad?r_page=${r_nowPage - 1}" class="button primary small pages" id="prev" style="box-shadow:none;">&lt;</a>
													</c:if>
													<a href="#" class="button primary small pages" style="box-shadow:none; background-color: black; color: white !important;">${r_nowPage}&nbsp;</a>
													<c:if test="${r_realEndPage != r_nowPage}">
														<a href="${pageContext.request.contextPath}/admin/AdminList.ad?r_page=${r_nowPage + 1}" class="button primary small pages" id="next" style="box-shadow:none;">&gt;</a>
													</c:if>
												</li>
											</ul>
										</div>										
									</div>
								</div>
							</div>
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
		function change(){
			var qna = $("#qnaBoard");
			var report = $("#reportBoard");
			var test = $("#changeButton");
			
			if (qna.css('display') === 'none') { 
				qna.show();
				report.hide();
				test.text("Report");	
			} else { 
				qna.hide(); 
				report.show();
				test.text("Qna");	
			}
		}
		
		var r_temp = "${r_temp}";
		
		$(document).ready(function(){
			var qna = $("#qnaBoard");
			var report = $("#reportBoard");
			var test = $("#changeButton");
			
			if(r_temp != ""){
				qna.hide(); 
				report.show();
			}
		});
	</script>
</html>