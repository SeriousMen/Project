<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
<title>마이페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />

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

#reviewTd {
	width: 10%;
}

#mobile {
	display: none;
}

#imgDiv {
	cursor: pointer;
	margin-left: 24%;
}

#btnDiv {
	padding-top: 40px;
}

#tableWidth {
	margin: 0 auto;
	width: 80%;
}

#tNum {
	
}

#innerImg {
	width: 180px;
	height: 180px;
	float: left;
	margin-right: 3%;
}

  table tbody tr:nth-child(2n + 1) {
      background-color: white;
   } 
   
@media screen and (max-width: 480px) {
	#desktop {
		display: none;
	}
	#mobile {
		display: block;
	}
	ul#mobile:not (.fixed ) li .button {
		width: 11%;
	}
	#imgDiv {
		margin-left: 0;
		text-align: center;
	}
	#btnDiv {
		text-align: center;
	}
	#tableWidth {
		width: 100%;
	}
	#tNum {
		width: 45px;
	}
	#innerImg {
		float: none;
	}
}

body {
	font-family: 'BMHANNAAir';
}
</style>
</head>
<body class="is-preload">

<!--컨트롤러에서 담아준 값을 jstl로가져와준다.  -->
	<c:set var="list" value="${boardList}" />
	<c:set var="totalCnt" value="${totalCnt}" />
	<c:set var="startPage" value="${startPage}" />
	<c:set var="endPage" value="${endPage}" />
	<c:set var="nowPage" value="${nowPage}" />
	<c:set var="realEndPage" value="${realEndPage}" />
	
	<!-- Header -->
	<jsp:include page="../../header.jsp" />

	<!-- Main -->
	<div id="main">
		<div class="wrapper special" style="padding: 0rem 0 0rem 0;">
			<div class="inner">
				<header class="heading"
					style="font-size: 40px; margin: 0 auto 0rem auto; text-align: center;">
					마이페이지 </header>
				<div id="imgDiv">
					<img id="innerImg"
						src="${pageContext.request.contextPath}/images/blackLogo.jpg">
				</div>
				<div id="btnDiv">
					<span style="font-size: 35px; font-weight: bold;">${session_m_id} 님</span> <br>
					<a href="${pageContext.request.contextPath}/member/MemberModify.me"
						class="button primary">정보수정</a> <a href="javascript:void(0);"
						class="button" onclick="withdrawal();">회원탈퇴</a>
				</div>
			</div>
			<div></div>
		</div>


		<br>
		<hr width="50%" style="margin: 0 auto;">
		<br>
		<div id="tableWidth">
			<div class="table-wrapper">
				<div id="qnaBoard">
			
					<table>
						<caption style="font-size: 25px;">결제내역</caption>
						
						<thead>
							<tr>
								<th id="tNum">번호</th>
								<th style="text-align: center;">결제내역</th>

								<th class="column4">날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:choose> 
							<c:when test="${list !=null and fn:length(list)>0}">
								<c:forEach var="b_bean" items="${list}">
							<tr>
								<td>
									<div>${b_bean.getTradeNum()}</div>
								</td>
								<td align="center">
									<div>
										<a href="#" style="text-decoration: none;">${b_bean.getTradeContent()}</a>
									</div>
								</td>

								<td class="column4">
									<div>${b_bean.getUpload()}</div>
								</td>
								
								<c:if test="${b_bean.getTrainerId() ne null and b_bean.getCheckReview() != 1}">
								<td id="reviewTd">
								<a href="${pageContext.request.contextPath}/app/member/reviewWrite.jsp?trainerId=${b_bean.getTrainerId()}&&tradeNum=${b_bean.getTradeNum()}"
									class="button primary" >리뷰작성</a></td>
								</c:if>
								<c:if test="${b_bean.getCheckReview() ==1}">
								<td id="reviewTd">
								<a href="${pageContext.request.contextPath}/review/ReviewList.rv?trainerId=${b_bean.getTrainerId()}"
									class="button">리뷰보기</a></td>
								</c:if>
								
								
									
							</tr>
						</c:forEach>
						</c:when>
							<c:otherwise>
								<br>
								<tr>
								<td>
									<div></div>
								</td>
								<td align="center">
									<div>
										결제 내역이 없습니다.
									</div>
								</td>

								<td class="column4">
									<div></div>
								</td>
								<td>
								</td>
							</tr>
							</c:otherwise>
						</c:choose>

							
							

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div>
		<br>
		<!--페이징처리  -->
		<ul id="desktop" class="actions" style="justify-content: center;">
		<c:if test="${nowPage>1}">
			<li><a href="#" class="button primary small pages" id="prev"
				style="box-shadow: none;">&lt;</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${i eq nowPage}">
			<li><a href="#" class="button small pages"
				style="box-shadow: none;">${i}</a></li>
				</c:when>
							<c:otherwise>
						<li><a
							href="${pageContext.request.contextPath}/member/MemberPageOk.me?page=${i}"
							class="button primary small pages" style="box-shadow: none;">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${realEndPage != nowPage }">
				<li><a href="#" class="button primary small pages" id="next"
					style="box-shadow: none;">&gt;</a></li>
			</c:if>
			
		</ul>
		<ul id="mobile" class="actions" style="justify-content: center;">
			<li><a href="#" class="button primary small pages" id="prev">&lt;</a>
				<a href="#" class="button small">1</a> <a href="#"
				class="button primary small pages" id="next">&gt;</a></li>
		</ul>
	</div>
	<!-- Footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>



	<script>
		$(function() {
			$("#backBtn").click(function() {
				window.history.back();
			});
			$("#URLModify").click(function() {
				$("#main").hide();
				$("#URLDiv").show();
			});
			$("#careerModify").click(function() {
				$("#main").hide();
				$("#careerDiv").show();
			});
		});

		function withdrawal() {
			var result = confirm("정말 탈퇴하시겠습니까? 하시겠어요 ?");

			if (result) {

				location.href = "${pageContext.request.contextPath}/app/member/memberWithdrawal.jsp";

			} else {
				return;
			}
		}
	</script>

</body>
</html>