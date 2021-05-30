<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
<title>회원사진게시판</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
.wrapper {
	padding: 5rem 0 7rem 0;
}

.inner {
	max-width: calc(100% - 26rem);
}

header.heading {
	margin: 0 auto 4rem auto;
}

.col-4 img {
	border-radius: 10px;
}

.image.fit {
	margin: 0 0 1rem 0;
}

.mb-title {
	margin: 0;
}

.mb-id {
	margin: 0;
}


   

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

.innerA {
	display: inline-block;
	max-width: 130px;
	height: 120px
}

.image.fit {
	max-width: 130px;
	max-height: 120px;
	margin: 0 auto;
}

.image.fit img {
	max-height: inherit;
}

.row.gtr-50>* {
	padding: 0px 0.8rem 0px 0.8rem;
}

body {
	font-family: 'BMHANNAAir';
}

.row>.col-4 {
	max-width: 230px;
	border: 2px solid #cec7c7;
	border-radius: 10px;
	margin: 2px;
	text-align: center;
	padding: 6px;
	width: 19%;
	height: 50%;
}

.row>.col-4:hover {
	border: 2px solid #61c5e0;
}

#aList {
	margin-left: 86%;
	margin-bottom: 4%;
	list-style: none;
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
	ul#mobile:not (.fixed ) li .button {
		width: 11%;
	}
}

@media screen and (max-width: 768px) {
    
	.row>.col-4 {
		width: 32%;
	}
	.row.gtr-50.gtr-uniform {
		margin-right: 0px;
		margin-left: 2%;
	}
	.inner {
		max-width: calc(100% - 0rem);
	}
	#aList {
		margin-left: 69%;
	}
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
	<c:set var="files" value="${files}" />
	


	<!-- Header -->
	<jsp:include page="../../header.jsp" />

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
		<div class="wrapper">
			<div class="inner">

				<!-- Elements -->
				<header class="heading">
					<h3 style="color: black;">회원 게시판</h3>

				</header>
				<li id="aList"><a href="${pageContext.request.contextPath}/app/member/memberWrite.jsp" class="button primary">작성하기</a></li>
				<div class="box alt">
					<div class="row gtr-50 gtr-uniform" style="max-width: 100%;">
						
						<c:choose>
							<c:when test="${list !=null and fn:length(list)>0}">
								<c:forEach var="b_bean" items="${list}" varStatus="status">

									<div class="col-4">
										<a href="${pageContext.request.contextPath}/member/MemberBoardDetail.me?photoBoardNum=${b_bean.getPhotoBoardNum()}&page=${nowPage}"
											style="text-decoration: none;">
											<div class="innerA">
												<span class="image fit"> <img
													src="${pageContext.request.contextPath}/files/${files[status.index]}"
													onerror=this.src="${pageContext.request.contextPath}/images/blackLogo.png" >

												</span>
											</div>
											<div>
												<h5 class="mb-title">${b_bean.getPhotoBoardTitle()}</h5>
												<p class="mb-id">${b_bean.getMemberId()}</p>
												<p class="mb-counts" style="margin-bottom: 0px;">
													<span> 조회수 ${b_bean.getReadCount()} </span>·<span> 댓글 ${b_bean.getReplyNum()}
														</span>
												</p>
											</div>
										</a>
									</div>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<br>
								<h2 style="margin:0 auto; padding-top: 3rem;"> 등록된 게시물이 없습니다.</h2>
							</c:otherwise>
						</c:choose>



					</div>
				</div>

			</div>
		</div>
	</div>

	<!--페이징처리  -->
	<div>
		<br>
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
							href="${pageContext.request.contextPath}/member/MemberBoard.me?page=${i}"
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
	<jsp:include page="../../footer.jsp" />

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

</body>
</html>