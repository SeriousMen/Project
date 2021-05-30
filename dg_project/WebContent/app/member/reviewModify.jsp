<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<!--
	수정하기 들어오면 첨부파일 등록된거 가져오지 말고 전부 없는 상태에서 새로 올리게 하기
-->
<html>
	<head>
<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>리뷰 수정하기 페이지</title>
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
			
			input[type="text"], input[type="password"], 
			input[type="email"], input[type="tel"], 
			input[type="search"], input[type="url"], 
			select, textarea {
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
				div #downButton{
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
			
			@media screen and (max-width: 480px){
				div #dLi {
					padding: 0 !important;
				}
				
				div .imgs_wrap {
					display: none;
				}
				
				div #ulTag {
					display: none;
				}
				
				#fileLb1, #fileLb2, #fileLb3{
					display: none;
				}
				
			}
			
		</style>
	</head>
	<body class="is-preload" style="font-family: 'BMHANNAAir';">
		<c:set var="r_vo" value="${r_vo}"/>
		<c:set var="page" value="${page}"/>
		<jsp:include page="../../header.jsp"/>
		<!-- Main -->
			<div id="main">
				<div class="wrapper special">
					<div class="inner">
						<header class="heading">
							<h1 style="margin-top: 10%; font-family: 'BMEULJIRO';">리뷰 수정하기</h1>
							<p>첨부파일은 다시 등록해주세요!</p>
						</header>
					</div>
				</div>
				<div class="wrapper">
					<div class="inner">
						<form method="post" action="${pageContext.request.contextPath}/review/ReviewModifyOk.rv" id="reviewForm" name="reviewForm" enctype="multipart/form-data">
							<input type="hidden" name="trainerId" value="test2">
							<input type="hidden" name="page" value="${page}">
							<input type="hidden" name="reviewNum" value="${r_vo.getReviewNum()}">
							<div class="row gtr-uniform">
								<div class="col-6 col-12-xsmall" style="margin: 0 auto;">
									<input type="text" name="memberId" id="memberId" value="${r_vo.getMemberId()}" readonly/>
									<textarea name="reviewContent" id="reviewContent" rows="6" style="margin-top: 30px; resize: none;" required="required">${r_vo.getReviewContent()}</textarea>
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
									<p style="color: red;">*이미지가 나오지 않을 시 삭제 후 다시 시도해주세요!</p>
									<ul class="actions fit">
										<li><a href="javascript:formSubmit()" class="button primary fit">리뷰 수정</a></li>
									</ul>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			
		<!-- Footer -->
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
			
			var form = $("#reviewForm")[0];
			var data = new FormData(form);
			var files = document.getElementsByName("file-Button");
			//파일 이름 얻어오는 부분
			file_name = this.files[0].name;
			$.ajax({
				url : "${pageContext.request.contextPath}/review/ReviewThumbnailOkAction.rv",
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
					//밀리초가 3초 미만이면 이미지 안불러와짐
					setTimeout(function(){
						//inputCnt를 매개변수로 넘겨주기
						showImages(cnt); 
						$("#fileLb"+cnt).text("사진수정");
					}, 3000);
				},
			})
		});		
		
		//썸네일
		//cnt를 통해서 일치하는 imgDiv로 넣는다.
		function showImages(cnt){
			var img_html = "<img src='${pageContext.request.contextPath}/temp/"+file_name+"' style='width: 100%; height: 100%; margin-bottom: 3%;'/>"
			+ "<input type='radio' id='rb"+cnt+"' name='radioName'>"
			+ "<label for='rb"+cnt+"' id='imgName'><span>"+file_name+"</span></label>";
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
					//console.log($(radios[i].parentNode));
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
		function formSubmit(){
			if(reviewForm.reviewContent.value.length == 0){
				alert('내용을 입력해주세요!');
				reviewForm.reviewContent.focus();
				return;
			}
			reviewForm.submit();
		}
	</script>
</html>