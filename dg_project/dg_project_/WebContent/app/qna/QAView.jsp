<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>게시글 상세보기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
.re {
	height: 66px;
}

.wrapper {
	padding: 0;
}

@font-face {
	font-family: 'BMHANNAAir';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'BMEULJIRO';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff')
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

@media screen and (max-width: 1680px) {
	#insertInput {
		width: 85% !important;
	}
	#file1 {
		width: 85% !important;
	}
}

@media screen and (max-width: 1359px) {
	#ready {
		margin-left: 72%;
	}
}

@media screen and (max-width: 1280px) {
	#insertInput {
		width: 81% !important;
	}
	#file1 {
		width: 81% !important;
	}
}

@media screen and (max-width: 980px) {
	#insertInput {
		width: 73% !important;
	}
	#file1 {
		width: 73% !important;
	}
}

@media screen and (max-width: 736px) {
	#qaViewDiv {
		width: 100% !important;
	}
	#insertInput {
		width: 84% !important;
	}
	#file1 {
		width: 84% !important;
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
	#insertInput {
		width: 100% !important;
		float: none !important;
	}
	#insertUl {
		margin-top: 5% !important;
	}
	#file1 {
		width: 100% !important;
		float: none !important;
	}
	#downUl {
		margin-top: 5% !important;
	}
}

.modal {
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	top: 0;
	left: 0;
	display: none;
}

table tbody tr:nth-child(2n + 1) {
	background-color: white;
}

#tdId {
	width: 20%;
}

#insertLi {
	padding: 0;
}

#downLi {
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

@media screen and (max-width: 980px) {
	.logo img {
		width: 40px !important;
		height: 40px !important;
	}
}

@media screen and (max-width: 736px) {
	.logo {
		padding-left: 4% !important;
	}
}
</style>
</head>
<body class="is-preload" style="font-family: 'BMHANNAAir';">

	<jsp:include page="../../header.jsp"></jsp:include>

	<c:set var="q_vo" value="${q_vo}" />
	<c:set var="replies" value="${replies}" />
	<c:set var="files" value="${files}" />


	<!-- Main -->
	<div id="main">
		<div class="wrapper special">
			<div class="inner">
				<header class="heading">
				<h1 style="margin-top: 10%;">${q_vo.getMemberId()}</h1>
				<p>회원님들의 댓글은 서비스 개선에 큰 도움이 됩니다!</p>
				</header>
			</div>
		</div>


		<div class="wrapper">
			<div class="inner">
				<div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall" id="qaViewDiv"
						style="margin: 0 auto;">
						<input type="text" name="demo-name" id="demo-name"
							value="${q_vo.getQnaTitle()}" readonly />
						<textarea name="demo-textarea" id="demo-textarea" rows="6"
							style="margin-top: 5%; resize: none;" readonly>${q_vo.getQnaContent()}</textarea>
						<div style="margin-top: 5%;">
							<c:choose>
								<c:when test="${session_a_id != null}">
									<ul class="actions">
										<li style="margin-left: auto;"><a
											href="${pageContext.request.contextPath}/qnaboard/BoardModify.qn?boardNum=${q_vo.getQnaNum()}&page=${page}"
											class="button primary small" style="border-radius: 6px;">답변</a></li>
										<li><a class="button primary small"
											style="border-radius: 6px;"
											href="${pageContext.request.contextPath}/admin/AdminList.ad?q_page=${page}">목록</a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<ul class="actions">
										<li><a style="border-radius: 6px;"
											class="button primary small"
											href="${pageContext.request.contextPath}/qnaboard/BoardList.qn?page=${page}">목록</a></li>

										<c:if
											test="${session_m_id eq q_vo.getMemberId() || session_t_id eq q_vo.getMemberId()}">


											<li style="margin-left: auto;"><a
												style="border-radius: 6px;" class="button primary small"
												href="${pageContext.request.contextPath}/qnaboard/BoardModify.qn?boardNum=${q_vo.getQnaNum()}&page=${page}">수정</a></li>
											<li><a style="border-radius: 6px;"
												class="button primary small"
												href="${pageContext.request.contextPath}/qnaboard/BoardDelete.qn?boardNum=${q_vo.getQnaNum()}&page=${page}">삭제</a></li>
										</c:if>

									</ul>
								</c:otherwise>
							</c:choose>
							<c:if test="${files != null}">
								<c:forEach var="file" items="${files}">
									<input type="text" readonly="readonly" id="file1"
										style="width: 80%; cursor: pointer; float: left; color: #29b6f6; font-size: 25px;"
										value="${file.getFileName()}">
									<ul class="actions" id="downUl">
										<li id="downLi"><a
											href="${pageContext.request.contextPath}/qnaboard/FileDownload.qn?fileName=${file.getFileName()}"
											class="button primary" id="file" style="border-radius: 6px;">다운로드</a></li>
									</ul>
								</c:forEach>
							</c:if>
						</div>
						<!-- 댓글 -->
						<table id="replyTable"></table>

						<!-- 	<form method="post" action="#" enctype="multipart/form-data">
								<div>
									<input type="text" name="demo-name" id="insertInput" style="width: 80%; float: left;">
									<ul class="actions" id="insertUl">
										<li id="insertLi"><a href="#" class="button primary" style="border-radius: 6px;">댓글 등록</a></li>
									</ul>
								</div>
							</form> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../footer.jsp" />
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
	<script
		src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>

	<script>
		$(document).ready(function() {
			getList();
		});

		var check = false;
		var pageContext = "${pageContext.request.contextPath}";
		var boardNum = "${q_vo.getQnaNum()}";
		 var t_session = '${session_t_id}';
	      var m_session = '${session_m_id}';
		
		function insertReply() {
			var replyContent = $("textarea[name='replyContent']").val();
			 var textLimit = /^.{1,200}$/ ; //모든 글자 5이상 200이하 
		      if(!replyContent.match(textLimit)){
		         alert("댓글은 최소 1자에서 200자까지 입력이 가능합니다.")
		         return false;
		      }
			$.ajax({
				url : pageContext + "/qnaboard/BoardReplyOk.qn",
				type : "post",
				data : {
					"replyContent" : replyContent,
					"boardNum" : boardNum
				},
				dataType : "text",
				success : function(result) {
					alert(result);
					getList();
				}
			});

		}
		//댓글 목록
		function getList() {
			$.ajax({
				url : pageContext + "/qnaboard/BoardReplyList.qn?boardNum="
						+ boardNum,
				type : "get",
				//				dataType : "text",
				dataType : "json",
				//				success : function(result){
				//					var replys = JSON.parse(result);
				//					console.log(replys);
				//				success : function(replys){
				//					console.log(replys);
				success : showList
			});
		}

		function showList(replys) {
			//			console.log(replys);
			var insertReply_HTML = "<tr height='200px'>	<td align='center' width='80px'><div align='center'>댓 글</div></td>"
					+ "<td style='padding-left:10px'><textarea name='replyContent' style='width:100%; height:66px; resize:none;''></textarea>"
					+ "<ul class='actions'><li style='margin-left: auto; margin-top: 1%;'><a style='border-radius:6px;' class='button primary' href='javascript:insertReply()''>등록</a></li></ul></td></tr>";

			var text = insertReply_HTML;

			if (replys != null && replys.length != 0) {
				$
						.each(
								replys,
								function(index, reply) {
									text += "<tr><td align='center' style='width:7rem;'>"
											+ reply.memberId + "</td>";
									text += "<td valign='top' style='padding-left:10px;'>";
									text += "<textarea name='content"
											+ (index + 1)
											+ "' id='"
											+ (index + 1)
											+ "' class='re' style='width:100%; height:66px; resize:none;' readonly>"
											+ reply.replyContent
											+ "</textarea>";

								if ("${session_m_id}" == reply.memberId || "${session_t_id}"==reply.memberId) {
									text += "<ul class='actions' style='margin-top: 1%;'><li style='margin-left: auto;'><a style='border-radius: 6px;' class='button primary small' id='ready"
											+ (index + 1)
											+ "' href='javascript:updateReply("
											+ (index + 1) + ")'>수정</a></li>";
									text += "<li><a style='border-radius: 6px; display:none;' class='button primary small' id='ok"
											+ (index + 1)
											+ "' href='javascript:updateOkReply("
											+ reply.replyNum
											+ ", "
											+ (index + 1)
											+ ")'>[수정 완료]</a></li>";
									text += "<li><a style='border-radius: 6px;'class='button primary small' href='javascript:deleteReply("
											+ reply.replyNum
											+ ")'>삭제</a></li></ul>"
									
									}
									text += "</td></tr>";
								});
			} else {
				text += "<tr align='center'><td align='center' width='150px' colspan='2'>댓글이 없습니다.</td></tr>";
			}

			$("#replyTable").html(text);
			autosize($("textarea.re"));
		}

		function deleteReply(replyNum) {
			$.ajax({
				url : pageContext + "/qnaboard/BoardReplyDeleteOk.qn",
				type : "post",
				data : {
					"replyNum" : replyNum
				},
				dataType : "text",
				success : function(result) {
					alert(result);
					getList();
				}
			});
		}
		//댓글 수정
		function updateReply(num) {
			if (!check) {
				var textarea = $("textarea#" + num);
				var a_ready = $("a#ready" + num);
				var a_ok = $("a#ok" + num);

				textarea.removeAttr("readonly");
				a_ready.hide();
				a_ok.show();
				check = true;
			} else {
				alert("수정 중인 댓글이 있습니다.");
			}
		}

		//댓글 수정 완료
		function updateOkReply(replyNum, seq) {
			var content = $("textarea#" + seq).val();
			$.ajax({
				url : pageContext + "/qnaboard/BoardReplyModifyOk.qn",
				type : "post",
				data : {
					"replyNum" : replyNum,
					"content" : content
				},
				dataType : "text",
				success : function(result) {
					alert(result);
					check = false;
					getList();
				}
			});
		}
	</script>
</body>
</html>