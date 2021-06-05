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
		<title>결제내역</title>
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

/*을지로(두꺼움)*/
@font-face {
    font-family: 'BMEULJIRO';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#reviewTd{
	width:10%;
}
#mobile {
	display: none;
}

@media screen and (max-width: 480px) {
	#desktop {
		display: none;
	}
	#mobile {
		display: block;
	}
	ul#mobile:not(.fixed ) li .button {
		width: 11%;
	}
}

body{
	font-family: 'BMHANNAAir';
}

</style>
	</head>
	<body class="is-preload">
 	 <c:set var="list" value="${boardList}"/>
	  <c:set var="totalCnt" value="${totalCnt}"/>
      <c:set var="startPage" value="${startPage}"/>
      <c:set var="endPage" value="${endPage}"/>
      <c:set var="nowPage" value="${nowPage}"/>
      <c:set var="realEndPage" value="${realEndPage}"/>
      <c:set var="tr_vo" value="${tr_vo}"/>
      <c:set var="t_vo" value="${t_vo}"/>
		<jsp:include page="../../header.jsp"/>

		<!-- Main -->
			<div id="main">
				<div class="wrapper special" style="padding: 0rem 0 0rem 0;">
					<div class="inner">
						<header class="heading">
						</header>
						<div id="tableWidth" style="margin: 0 auto; width: 80%;">
			<div class="table-wrapper">
				<div id="qnaBoard">
					<p style="font-size:55px; text-align: center; font-family: 'BMEULJIRO';"><span style="margin: 0 0 0rem 0;">결제 내역</span></p>
					<div>
					<ul class="actions">
						<li style="margin-left: auto;"><a href="${pageContext.request.contextPath}/trainer/TrainerMypageView.tr?t_id=${t_vo.getTrainerId()}" id="backBtn" class="button primary" style="border-radius: 6px;">돌아가기</a></li>
						<li><a href="${pageContext.request.contextPath}/review/ReviewList.rv?trainerId=${t_vo.getTrainerId()}" class="button" style="border-radius: 6px;">리뷰보기</a></li>
					</ul>
					</div>
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th style="text-align: center;">결제내역</th>
								<th class="column4">날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
										<c:when test="${list != null and fn:length(list) > 0}">
										<c:forEach var="b_bean" items="${list}">
												<tr>
													<td>
														${b_bean.getTradeNum()}</td>
													<td align="center">
														<div>
															<a  style="text-decoration:none" href="${pageContext.request.contextPath}/trainer/TpayMent.tr?TradeNum=${b_bean.getTradeNum()}&page=${nowPage}&TrainerId=${t_vo.getTrainerId()}">
																${b_bean.getUserId()} 님이 ${b_bean.getTradeContent()} </a>
														</div>
													</td>
													<td>
														<div>${b_bean.getUpload()}</div>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="5" align="center">결제 내역이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	 <table border="0" cellpadding="0" cellspacing="0" width="900px">
         	<tr align="center" valign="middle">
         		<td>
         			<c:if test="${nowPage >1}">
         				<a class="button small" href="${pageContext.request.contextPath}/trainer/TpayMentBoard.tr?page=${nowPage - 1}&TrainerId=${t_vo.getTrainerId()}">이전</a>
         			</c:if>
	         		<c:forEach var="i" begin="${startPage}" end="${endPage}">
	         			<c:choose>
	         				<c:when test="${i eq nowPage}">
	         					<a class="button primary small">
	         					${i}
	         					</a>
	         				</c:when>
	         				<c:otherwise>
	         					<a class="button small" href="${pageContext.request.contextPath}/trainer/TpayMentBoard.tr?page=${i}&TrainerId=${t_vo.getTrainerId()}">${i}&nbsp;</a>
	         				</c:otherwise>
	         			</c:choose>
	         		</c:forEach>
         			<c:if test="${realEndPage != nowPage}">
         				<a class="button small" href="${pageContext.request.contextPath}/trainer/TpayMentBoard.tr?page=${nowPage + 1}&TrainerId=${t_vo.getTrainerId()}">다음</a>
         			</c:if>
         		</td>
         	</tr>
         </table>
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
			$(function(){	
				$("#backBtn").click(function(){
					window.history.back();
			});
				
			});
		
			
			</script>

	</body>
</html>