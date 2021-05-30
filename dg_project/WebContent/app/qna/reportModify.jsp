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
<title>게시글 수정하기</title>
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
	
	#adBtn {
		width: 40% !important;
	}
}

@media screen and (max-width: 736px) {
	#adDiv {
		width: 100% !important;
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
<body class="is-preload" style="font-family: 'paybooc-Bold';">

<%-- 		<c:choose>
	  		<c:when test="${session_m_id eq null and session_t_id eq null }">
	  			<script>
	  			alert("로그인 후에 이용해주세요.");
				location.replace("${pageContext.request.contextPath}/member/MemberLogin.me");
	  			</script>
	  		</c:when>
	  	</c:choose> --%>
	<c:set var="r_vo" value="${r_vo}"/>
	<c:set var="page" value="${page}"/>
		
	<jsp:include page="../../header.jsp" />
	<!-- Main -->
	<div id="main">
		<div class="wrapper special">
			<div class="inner">
				<header class="heading">
					<h1 style="margin-top: 10%;">신고 수정하기</h1>
					<p>첨부파일에는 신고 대상의 아이디가 명시되어 있는 파일이 필요합니다!</p>
				</header>
			</div>
		</div>
		<div class="wrapper">
			<div class="inner">
				<form method="post" action="${pageContext.request.contextPath}/report/ReportModifyOk.rp" id="reportForm" name="reportForm" enctype="multipart/form-data">
					<input type="hidden" name="page" value="${page}">
					<input type="hidden" name="reportNum" value="${r_vo.getReportNum()}">
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall" style="margin: 0 auto;">
							<c:choose>
								<c:when test="${session_a_id != null}">
									<input type="text" name="reportTitle" id="reportTitle" value="[처리 완료]${r_vo.getReportTitle()}"/>
									<br>
									<input type="text" name="reportId" id="reportId" value="${r_vo.getReportId()}" readonly/>
									<textarea name="reportContent" id="reportContent" rows="6" style="margin-top: 30px; resize: none;" required="required">${r_vo.getReportContent()}
---------------------------------------------------------------------------------------------</textarea>
									<div id="adDiv" style="width: 60%; margin: 0 auto; margin-top: 5%;">
										<input type="text" name="kick" value="" placeholder="제재 할 아이디" style="float: left; width: 60%; margin-top: 1.5%;"/>
										<div id="adBtn" style="width: 30%; float: left;">
											<ul class="actions fit" style="margin-top: 5%;">
												<li><a href="javascript:kickUser()" class="button primary fit" style="border-radius: 6px;">차단</a></li>
											</ul>
										</div>
									</div>
									<div>
										<ul class="actions fit" style="margin-top: 5%;">
											<li><a href="javascript:formSubmit()" class="button primary fit" style="border-radius: 6px;">조치하기</a></li>
										</ul>
									</div>
								</c:when>
								<c:otherwise>
									<input type="text" name="reportTitle" id="reportTitle" value="${r_vo.getReportTitle()}"/>
									<br>
									<input type="text" name="reportId" id="reportId" value="${r_vo.getReportId()}" readonly/>
									<textarea name="reportContent" id="reportContent" rows="6" style="margin-top: 30px; resize: none;" required="required">${r_vo.getReportContent()}</textarea>
									<div style="margin-top: 5%;">
										<ul class="actions" id="ulTag">
											<li id="lLi" style="margin-left: auto;"><input type="button" id="addBtn" name="addBtn" style="border-radius: 6px;" name="addBtn" value="첨부 추가" onclick="addInputTag()"></li>
											<li style="margin-right: auto;" id="dLi"><a href="javascript:cancleFile()" class="button primary fit" style="border-radius: 6px;">첨부 삭제</a></li>
										</ul>
										<div id="addFileDiv" style="text-align: center;"></div>
									</div>
									<div>
										<div class="imgs_wrap">
											<div id="imgDiv1" class="test" style="text-align: center; width: 30%; margin: 2%;"></div>
											<div id="imgDiv2" class="test" style="text-align: center; width: 30%; margin: 2%;"></div>
											<div id="imgDiv3" class="test" style="text-align: center; width: 30%; margin: 2%;"></div>
										</div>
									</div>
									<p><span style="color: red;">*</span>이미지가 나오지 않는다면 새로고침을 해주세요😀</p>
									<ul class="actions fit">
										<li><a href="javascript:formSubmit()" class="button primary fit">신고 수정</a></li>
									</ul>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
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
	<script src="assets/js/main.js"></script>

</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>
		var inputCnt = 1;
		var cnt = 0;
		
		//file-Button1,2,3과 imgDiv의 숫자를 통일 시킬 방법 찾기
		
		//<input type="file"> Div에 생성
		function addInputTag(){
			if(inputCnt == 4){return;}
			//accept로 첨부파일 선택 창에 jpg, png, gif, zip만 보이게 함
			var addInput = "<input type='file' id='file-Button"+inputCnt+"' name='file-Button"+inputCnt+"' accept='.jpg, .png, .gif, .zip' style='display: none;'>" + 
							"<label id='fileLb"+inputCnt+"' for='file-Button"+inputCnt+"' class='button icon solid fa-download' style='border-radius: 6px; margin: 2%;'>사진 첨부("+inputCnt+")</label>";
			/* console.log(inputCnt); */
			$("#addFileDiv").append(addInput);
			inputCnt = inputCnt + 1;
		}
		
		//모든 첨부파일 이름 input창에 출력
		//부모의 이벤트를 자식에게 위임한다.
		$("#addFileDiv").on("change", "input[type='file']", function () {
			/* console.log("들어옴"); */
			
			//인풋태그의 inputCnt 얻어오기
			cnt = this.id.substr(11,1);
			
			var form = $("#reportForm")[0];
			var data = new FormData(form);
			var files = document.getElementsByName("file-Button");
			//파일 이름 얻어오는 부분
			file_name = this.files[0].name;
			$.ajax({
				url : "${pageContext.request.contextPath}/report/ReportThumbnailOkAction.rp",
				enctype : "multipart/form-data",
				type : "post",
				data : data,
				processData : false,
				contentType : false,
				//timeout : jQuery를 사용하여 비동기 통신 AJAX를 사용할때 대기시간을 설정
				timeout : 600000,
				success : function(){
					//console.log("성공");
					$("#fileLb"+cnt).text("업로드 중...");
					//밀리초가 4초 미만이면 이미지 안불러와짐
					setTimeout(function(){
						//inputCnt를 매개변수로 넘겨주기
						showImages(cnt); 
						$("#fileLb"+cnt).text("업로드 완료");
					}, 4000);
				},
			})
		});		
		
		//썸네일
		//cnt를 통해서 일치하는 imgDiv로 넣는다.
		function showImages(cnt){
			$("#imgDiv"+cnt).empty();
			var img_html = "<img src='${pageContext.request.contextPath}/temp/"+file_name+"' style='width: 100%; height: 100%; margin-bottom: 3%;'/>"
			+ "<input type='radio' id='rb"+cnt+"' name='radioName'>"
			+ "<label for='rb"+cnt+"' id='imgName' style='width: 100%; overflow: hidden;'><span>"+file_name+"</span></label>";
			
			$("#imgDiv"+cnt).append(img_html);
		}		
		
		//첨부파일 삭제
		function cancleFile(){
			var radios = $("input[name='radioName']");
			for(let i = 0; i < radios.length; i++){
				//radio 버튼이 체크 되었을 경우
				if(radios[i].checked){
					//div의 내용만 비우기
					$(radios[i].parentNode).empty();
					//console.log($(radio s[i].parentNode));
					//console.log("삭제부분 : "+fileLabelId);
					
					//file태그 비워주기
					if($.browser.msie){
						$("input[name='file-Button"+(i+1)+"']").replaceWith($("input[name='file-Button"+(i+1)+"']").clone(true));
					}else{
						$("input[name='file-Button"+(i+1)+"']").val("");
					}
					
					//삭제된 라벨의 내용을 다시 원상복구
					$("#fileLb"+(i+1)).text("사진 첨부("+(i+1)+")");
					break;
				}
			}
		}
		
		//textarea 내용 입력 확인
		//textarea 내용 입력 확인
		function formSubmit(){
			
			if(reportForm.reportContent.value.length == 0){
				alert('내용을 입력해주세요!');
				reportForm.reportContent.focus();
				return;
			}
			reportForm.submit();
		}
		
		function kickUser(){
			var userId = $("input[name='kick']").val();
			if(userId == ""){
				alert("제재 할 아이디를 입력해주세요.");
				return false;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/AdminKick.ad?kick="+userId,
				type : "get",
				dataType : "text",
				success : function(){
					alert(userId+" 계정을 차단했습니다.");
				}
			});
		}
	</script>
</html>