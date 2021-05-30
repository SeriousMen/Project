<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
	<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>리뷰 상세보기 페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<style>
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
			
			input[type="text"], input[type="password"], input[type="email"], input[type="tel"],
				input[type="search"], input[type="url"], select, textarea {
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
				div #downButton {
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
			
			@media screen and (max-width: 480px) {
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
		</style>
	</head>
	<body class="is-preload" style="font-family: 'BMHANNAAir';">
		<c:set var="r_vo" value="${r_vo}"/>
		<c:set var="page" value="${page}"/>
		<c:set var="files" value="${files}"/>
		<jsp:include page="../../header.jsp" />
		<!-- Main -->
		<div id="main">
			<div class="wrapper">
				<div class="inner">
					<header class="heading">
						<h1 style="margin-top: 10%; font-family: 'BMEULJIRO';">${r_vo.getTrainerId()} 트레이너님</h1>
						<p>소중한 리뷰는 다른 회원님들에게 큰 도움이 됩니다!</p>
					</header>
					<form>
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall" style="margin: 0 auto;">
								<div>
									<ul class="actions">
										<c:choose>
											<c:when test="${session_m_id eq r_vo.getMemberId()}">
												<li style="margin-left: auto;"><a href="${pageContext.request.contextPath}/review/ReviewModify.rv?reviewNum=${r_vo.getReviewNum()}&page=${page}" class="button primary small" style="border-radius: 6px;">수정</a></li>
												<li><a href="javascript:deleteForm.submit()" class="button small" style="border-radius: 6px;">삭제</a></li>
												<li><a href="${pageContext.request.contextPath}/review/ReviewList.rv?page=${page}&trainerId=${r_vo.getTrainerId()}" class="button primary small" style="border-radius: 6px;">목록</a></li>
											</c:when>
											<c:otherwise>
												<li style="margin-left: auto; "><a href="${pageContext.request.contextPath}/review/ReviewList.rv?page=${page}&trainerId=${r_vo.getTrainerId()}" class="button primary small" style="border-radius: 6px;">목록</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
								<input type="text" name="demo-name" id="demo-name" value="${r_vo.getMemberId()}" readonly>
								<span style="font-size: small;">${r_vo.getUpload()}</span>
								<!--작성자가 실제로  작성하는 textarea  -->
								<textarea name="demo-textarea" id="rta" rows="6" style="margin-top: 3%; border: none; padding: 0px; overflow-y: hidden; resize: none; height: 30px; margin-bottom: 3%; font-family: 'BMHANNAAir';" readonly><c:out value="여기 누르면 리뷰 내용이 나옵니다!"/>
${r_vo.getReviewContent()}</textarea>
								<!--내용에 따라 자동으로 textarea넓히기위한 textarea  -->
								<textarea id="fta"
									style="height: 1px; overflow-y: hidden; position: absolute; top: -35px;" disabled></textarea>
								<div style="margin: 0 auto;">
									<p><span style="color: red;">*</span>이미지가 나오지 않는다면 새로고침을 해주세요😀</p>
									<c:if test="${files != null}">
										<c:forEach var="i" items="${files}">
											<img style="width: 100%; height: 100%; margin-bottom: 3%;" src="${pageContext.request.contextPath}/files/${i.getFileName()}">
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
					</form>
					<form name="deleteForm" method="post" action="${pageContext.request.contextPath}/review/ReviewDelete.rv?trainerId=${r_vo.getTrainerId()}" enctype="multipart/form-data">
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="reviewNum" value="${r_vo.getReviewNum()}">
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
	</body>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<script>
		//텍스트 에어리어 스크롤 막기/자동 크기조절
		function xSize(e) {
			var xe = document.getElementById('fta'), t;
	
			e.onfocus = function() {
				t = setInterval(function() {
					xe.value = e.value;
					e.style.height = (xe.scrollHeight + 12) + 'px';
				}, 100);
			}
	
			e.onblur = function() {
				clearInterval(t);
			}
		}

		xSize(document.getElementById('rta'));
	</script>
</html>