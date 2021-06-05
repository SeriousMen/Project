<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>트레이너마이페이지 수정</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>


	@media screen and (max-width: 480px){
			#nextBtn{
			display:none !important;
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
			body {
	font-family: 'BMHANNAAir' !important;
}
</style>
	</head>
	<body class="is-preload">
	<c:set var="t_vo" value="${t_vo}"/>
	<c:set var="p_vo" value="${p_vo}"/>

		<jsp:include page="../../header.jsp"/>
		<!-- Main -->
			<div id="main">
				<div id="div1"  class="wrapper special"  style="padding: 0rem 0 0rem 0;">
				<form name="profileModifyForm" id="profileModifyForm" method="post" action="${pageContext.request.contextPath}/trainer/TrainerMypageProfileModify.tr?TrainerId=${t_vo.getTrainerId()}" enctype="multipart/form-data" >
				<input name="profileInput" id="profileInput" type="file"  style="display:none;" >
				<input name="TrainerId" id="TrainerId" type="text"  style="display:none;" value="${t_vo.getTrainerId()}" > 
					</form>
					<div class="inner">
							<header class="heading" style="font-size: 30px; margin: 0 auto 0rem auto; text-align: center;">
							계정 설정
							</header>
							<div style="cursor: pointer; margin-left: 24%; position: relative; display:inline;" id="profileModifyDiv">
							<img style="width: 40px; height: 40px; margin-left: 118px; position: absolute; margin-top: 112px " src="${pageContext.request.contextPath}/images/icon4.png">
							<c:choose>
								<c:when test="${p_vo.getFileName() == 'bjh'}">
									<img src="${pageContext.request.contextPath}/images/blackLogo.jpg" style="width: 150px;  height: 150px; border-radius: 70%; overflow: hidden; ">
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/files/${p_vo.getFileName()}" style="width: 150px;  height: 150px; border-radius: 70%; overflow: hidden; ">
								</c:otherwise>
							</c:choose>
							</div>
							<input type="button" value="완료" id="profileModify" style="display:none; margin-left: 3%;" onclick="javascript:profileModifyJS()">
							<input type="button" value="취소" id="profileModifycancel" style="display:none;" onclick="location.href='${pageContext.request.contextPath}/trainer/TMypageModify.tr?TrainerId=${t_vo.getTrainerId()}'">
					</div>
				</div>
				
				<div id="div2" class="image major" data-position="center" style="margin-left: 27%;">
				<span style="margin: 0 auto; font-size: 20px; font-weight: bold; color: gray;">이름</span>
				<div id="nameModify" style="margin: 0 auto; cursor: pointer;">
				<span style="font-size: 25px; display: inline; color:#29b6f6;"><img src="${pageContext.request.contextPath}/images/icon2.png" style="width: 25px; height: 25px; display: inline; margin-right: 1%;">${t_vo.getTrainerName()}<img id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:30%; display:inline; width:25px; height:25px;"></span>
				</div>
				<hr width="50%" style="margin-left: -3%; margin-top: 1%; margin-bottom: 0%;"><br>
				<span style="margin: 0 auto; font-size: 20px; font-weight: bold; color: gray;">아이디</span>
				<div id="emailModify" style="margin: 0 auto; cursor: pointer;">
				<span style="font-size: 25px; display: inline; color:#29b6f6;"><img src="${pageContext.request.contextPath}/images/icon2.png" style="width: 25px; height: 25px; display: inline; margin-right: 1%;"><span>${t_vo.getTrainerId()}</span><img id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:24%; display:inline; width:25px; height:25px;"></span>
				</div>
				<hr width="50%" style="margin-left: -3%; margin-top: 1%;     margin-bottom: 0%;"><br>
				<span style="margin: 0 auto; font-size: 20px; font-weight: bold; color: gray;">비밀번호</span>
				<div id="pwModify" style="margin: 0 auto; cursor: pointer;">
				<span style="font-size: 25px; display: inline; color:#29b6f6;"><img src="${pageContext.request.contextPath}/images/icon2.png" style="width: 25px; height: 25px; display: inline; margin-right: 1%;">*********<img id="nextBtn" src="${pageContext.request.contextPath}/images/next.png" style="margin-left:26%; display:inline; width:25px; height:25px;"></span>
				</div>
				<hr width="50%" style="margin-left: -3%; margin-top: 1%; margin-bottom: 0%;"><br>
				</div>
				
				<div class="wrapper" style="padding: 2rem 0 5rem 0;">
					<div class="inner">
					<div id="nameDiv" style="display: none;">
					<span style="margin-left: 41%;font-size: 35px">이름 수정</span>
					<form style="margin: 37px 0 2rem 0;" action="${pageContext.request.contextPath}/trainer/TmypageNameModify.tr?TrainerId=${t_vo.getTrainerId()}">
					
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">이름</span>
					<input name="Modifyname" id="Modifyname" type="text" value="${t_vo.getTrainerName()}" style="width: 60%;margin-left: 18%;">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">아이디</span>
					<input name="TrainerId" id="TrainerId" type="text" placeholder="기존 아이디를 입력하세요" style="width: 60%;margin-left: 18%;">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">비밀번호</span>
					<input name="pw" id="pw" type="password" placeholder="비밀번호를 입력하세요" style="width: 60%;margin-left: 18%;">
					<button class="button small" style="border-radius: 6px; margin-left: 64.5%; margin-top: 1%; ">수정 완료</button>
					<a href="${pageContext.request.contextPath}/trainer/TMypageModify.tr?TrainerId=${t_vo.getTrainerId()}" class="button small" style="border-radius: 6px;">취소</a>
				

					</form>
					</div>
					<div id="emailDiv" style="display: none;">
					<span style="margin-left: 41%;font-size: 35px">아이디 변경</span>
					<form style="margin: 37px 0 2rem 0;" action="${pageContext.request.contextPath}/trainer/TmypageIdModify.tr?TrainerId=${t_vo.getTrainerId()}">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">기존 아이디</span>
					<input name="TrainerId" id="TrainerId" type="text" value="${session_t_id}" style="width: 60%;margin-left: 18%;" readonly="readonly">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">비밀번호</span>
					<input name="pw" id="pw" type="password" placeholder="비밀번호를 입력하세요" style="width: 60%;margin-left: 18%;">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">변경 아이디</span>
					<input name="ModifyId" id="ModifyId" type="text" placeholder="변경할 아이디를 입력해주세요" style="width: 60%;margin-left: 18%;">
					<h5  style="float: right; font-size: 0.8em; width:80%; color:red" id="idCheck_text" ></h5>
					<br>
					<button  name="modifybutton"id="modifybutton" class="button small" style="border-radius: 6px; margin-left: 64.5%; margin-top: 1%; ">수정 완료</button>
					<a href="${pageContext.request.contextPath}/trainer/TMypageModify.tr?TrainerId=${t_vo.getTrainerId()}" class="button small" style="border-radius: 6px;">취소</a>
					</form>
					</div>
					
					
					<div id="pwDiv" style="display: none;">
					<span style="margin-left: 41%;font-size: 35px">비밀번호 변경</span>
					<form style="margin: 37px 0 2rem 0;" action="${pageContext.request.contextPath}/trainer/TmypagePwModify.tr?TrainerId=${t_vo.getTrainerId()}">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">기존비밀번호</span>
					<input name="pw" id="pw" type="password"type="text" placeholder="기존 비밀번호" style="width: 60%;margin-left: 18%;">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">아이디</span>
					<input name="TrainerId" id="TrainerId" type="text" placeholder="아이디를 입력하세요" style="width: 60%;margin-left: 18%;">
					<span style="margin-left: 19%;font-size: 16px;font-weight: bold;">새 비밀번호</span>
					<input name="ModifyPw" id="ModifynPw" type="password" value="" style="width: 60%;margin-left: 18%;">
					<button  class="button small" style="border-radius: 6px; margin-left: 64.5%; margin-top: 1%; ">수정 완료</button>
					<a href="${pageContext.request.contextPath}/trainer/TMypageModify.tr?TrainerId=${t_vo.getTrainerId()}" class="button small" style="border-radius: 6px;">취소</a>
					</form>
					</div>
					</div>
				</div>
			</div>

		<!-- CTA -->
			<div id="cta">
				<div class="wrapper style1">
					<div class="inner">
						<header class="heading small">
						</header>
					</div>
				</div>
			</div>

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
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
			<script>var contextPath = "${pageContext.request.contextPath}";</script>
			<script>
			function profileModifyJS(){
				profileModifyForm.submit();
			}
			</script>
			<script>
			$(function(){
				
				$("#profileModifyDiv").click(function(){
					$("#profileInput").trigger("click");
					$("#profileModify").show();
					$("#profileModifycancel").show();
					});
				$("#nameModify").click(function(){
					$("#div1").hide();
					$("#div2").hide();
					$("#nameDiv").show();
					});
				$("#emailModify").click(function(){
					$("#div1").hide();
					$("#div2").hide();
					$("#emailDiv").show();
					});
				$("#pwModify").click(function(){
					$("#div1").hide();
					$("#div2").hide();
					$("#pwDiv").show();
					});
			});
			
			</script>
	<script>
	var check = false;


	numberCheck = false;
	
	function checkId(id){

		check = false;
		if(id == ""){
			$("#idCheck_text").text("아이디를 작성해주세요.");
		}else{
			
			$.ajax({
				
				url:contextPath + "/member/MemberCheckIdOk.me?id="+id,	
				type:"get",
				dataType:"text", 
				success:function(result){	
					if(result.trim() == "ok"){
						check = true;
						$("#idCheck_text").text("사용할 수 있는 아이디입니다.");
						$("#modifybutton").prop("disabled",false);
					}else{
						$("#idCheck_text").text("중복된 아이디입니다.");
						$("#modifybutton").prop("disabled",true);
					}
				},
				error:function(){	//통신 오류 시
					console.log("오류");
				}
			});
		}
	}


	$("input[name='ModifyId']").keyup(function(event){
		var id = $("input[name='ModifyId']").val();
		checkId(id);
	});
	
	</script>
	</body>
</html>