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
<title>신고 상세보기 페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
.wrapper {
	padding: 0;
}

@font-face {
	font-family: 'paybooc-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff')
		format('woff');
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
table tbody tr:nth-child(2n + 1) {
      background-color: white;
   }
 
</style>
</head>
<body class="is-preload" style="font-family:'BMHANNAAir';">

		<c:choose>
	  		<c:when test="${session_m_id eq null and session_t_id eq null and session_a_id eq null}">
	  			<script>
	  			alert("로그인 후에 이용해주세요.");
				location.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
	  			</script>
	  		</c:when>
	  	</c:choose>
	<c:set var="re_vo" value="${re_vo}"/>
	<c:set var="page" value="${page}"/>
	<c:set var="files" value="${files}"/>
	<jsp:include page="../../header.jsp" />
	<!-- Main -->
	<div id="main">
			<div class="wrapper">
				<div class="inner">
					<header class="heading">
						<h1 style="margin-top: 10%; font-family: 'BMEULJIRO';">${re_vo.getReportTitle()}</h1>
						<p>첨부파일에는 신고 대상의 아이디가 명시되어 있는 파일이 필요합니다!</p>
					</header>
					<form>
						<div class="row gtr-uniform">
							<div class="col-6 col-12-xsmall" style="margin: 0 auto;">
								<div>
									<c:choose>
										<c:when test="${session_a_id != null}">
											<ul class="actions" id="adminUl">
												<li style="margin-left: auto;"><a href="${pageContext.request.contextPath}/report/ReportModify.rp?reportNum=${re_vo.getReportNum()}&page=${page}" class="button primary small" style="border-radius: 6px;">관리자</a></li>
											</ul>
										</c:when>
										<c:when test="${re_vo.getReportId() eq session_m_id}">
										<ul class="actions" id="basic">
											<li style="margin-left: auto;"><a href="${pageContext.request.contextPath}/report/ReportModify.rp?reportNum=${re_vo.getReportNum()}&page=${page}" class="button primary small" style="border-radius: 6px;">수정</a></li>
												<li><a href="javascript:deleteForm.submit()" class="button small" style="border-radius: 6px;">삭제</a></li> 
												<li><a href="${pageContext.request.contextPath}/report/ReportListOkAction.rp?page=${page}" class="button primary small" style="border-radius: 6px;">목록</a></li>
											</ul>
										</c:when>
										<c:when test="${re_vo.getReportId() eq session_t_id}">
										<ul class="actions" id="basic">
											<li style="margin-left: auto;"><a href="${pageContext.request.contextPath}/report/ReportModify.rp?reportNum=${re_vo.getReportNum()}&page=${page}" class="button primary small" style="border-radius: 6px;">수정</a></li>
												<li><a href="javascript:deleteForm.submit()" class="button small" style="border-radius: 6px;">삭제</a></li> 
												<li><a href="${pageContext.request.contextPath}/report/ReportListOkAction.rp?page=${page}" class="button primary small" style="border-radius: 6px;">목록</a></li>
											</ul>
										</c:when>
										
										<c:otherwise>
											<ul class="actions" id="basic">
											<%-- 	<li style="margin-left: auto;"><a href="${pageContext.request.contextPath}/report/ReportModify.rp?reportNum=${re_vo.getReportNum()}&page=${page}" class="button primary small" style="border-radius: 6px;">수정</a></li>
												<li><a href="javascript:deleteForm.submit()" class="button small" style="border-radius: 6px;">삭제</a></li> --%>
												<li style="margin-left: auto;"><a href="${pageContext.request.contextPath}/report/ReportListOkAction.rp?page=${page}" class="button primary small" style="border-radius: 6px;">목록</a></li>
											</ul>
										</c:otherwise>
									</c:choose>									
								</div>
								<input type="text" name="demo-name" id="demo-name" value="${re_vo.getReportTitle()}" readonly>
								<br>
								<input type="text" name="demo-name" id="demo-name" value="${re_vo.getReportId()}" readonly>
								<span style="font-size: small;">${re_vo.getUpload()}</span>
								<!--작성자가 실제로  작성하는 textarea  -->
								<textarea name="demo-textarea" id="rta" rows="6" style="margin-top: 3%; border: none; padding: 0px; overflow-y: hidden; resize: none; height: 30px; margin-bottom: 3%; font-family: 'BMHANNAAir';" readonly><c:out value="여기 누르면 신고 내용이 나옵니다!"/>
${re_vo.getReportContent()}</textarea>
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
					<form name="deleteForm" method="post" action="${pageContext.request.contextPath}/report/ReportDeleteOkAction.rp" enctype="multipart/form-data">
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="ReportNum" value="${re_vo.getReportNum()}">
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

	
var fileNames = new Array();
var cnt = 0;
//모든 첨부파일 이름 input창에 출력
$(document).ready(function() {
	$("input[type=file]").change(function() {
		console.log("들어옴!");
		var fileInput = document.getElementById("file-Button");
		var files = fileInput.files;
		var file;
		console.log(files);
		for (var i = 0; i < files.length; i++) {
			file = files[i];
			fileNames[i] = file.name;
		}
		showImages();
	});
});

//썸네일
function showImages() {
	var img_html = "<div id='imgDiv" + cnt
			+ "' class='test' style='text-align: center; width: 30%;'>"
			+ "<img src=\"" + fileNames[cnt]/*이미지 경로*/
			+ "\" style='width: 100%; height: 100%; margin-bottom: 3%;'/>"
			+ "<input type='radio' id='rb"+cnt+"' name='radioName'>"
			+ "<label for='rb"+cnt+"' id='imgName'><span>" + fileNames[cnt]
			+ "</span></label></div>";
	$(".imgs_wrap").append(img_html);
}

//첨부 파일 미리보기()
var sel_files = [];
$(document).ready(function() {
	$("#file-Button").on("change", handleImgsFilesSelect);
});

//파일첨부된거 다운받기
$(function() {
	$("#file1").click(function() {
		$(".modal").fadeIn();
	});
	$(".modal_content").click(function() {
		$(".modal").fadeOut();
	});
});

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

//댓글목록
function viewReply() {
	if ($("#viewR").css("display") == "none") {

		$("#viewR").show();
	} else
		$("#viewR").hide();

}
	


</script>
</html>