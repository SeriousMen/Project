<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>아이디 및 비밀번호 찾기</title>
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
	
	body{
		font-family: 'BMHANNAAir';
	}
		@font-face {
    			font-family: 'paybooc-Bold';
    			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff') format('woff');
    			font-weight: normal;
    			font-style: normal;
	}
	
	
	#actionBtn{
		border-radius: 6px;
	}


			
	@media screen and (max-width: 980px){
				.box {
					width: 60% !important;
				}
				
				.icons {
					margin-bottom: 5%;
				}
			}
			
	@media screen and (max-width: 480px){
				.box {
					width: 100% !important;
				}
				
			}
	@media screen and (max-width: 980px){
				#actionBtn {
					width: 100%;
				}
			}
	
	</style>
	</head>
	
	<body class="is-preload">
	
		<c:if test="${!empty param.check}">
			<c:if test="${param.check == 'false'}">
				<script>alert("등록된 핸드폰번호로 된 계정이 없습니다.");</script>
			</c:if>
		</c:if>
	
		<c:if test="${!empty param.checkpw}">
			<c:if test="${param.checkpw == 'false'}">
				<script>alert("등록된 ID와 핸드폰번호로 된 계정이 없습니다.");</script>
			</c:if>
		</c:if>
		<!-- Header -->
			<jsp:include page="../../header.jsp"/>

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
				<div class="wrapper special">
					
					<div class="inner">
						
							<div style="overflow: hidden; text-align: center;">
								<a id="actionBtn1" href="javascript:showIdDiv()" class="button" >아이디 찾기</a>
								<a id="actionBtn2" href="javascript:showPwDiv()" class="button primary">비밀번호 찾기</a>
							</div>
							<br>
							
							<div class="box" style="width: 40%; margin: 0 auto;">
								
								<div style="text-align: center;">
								<label id="ID">아이디 찾기</label>
								<label id="PW" style="display: none;">비밀번호 찾기</label>
								</div>
							
							<div id="findIdDiv" style="width: 70%; margin: 0 auto;">
								<form action="${pageContext.request.contextPath}/member/MemberFindId.me" name="findIdForm">
									<div style="margin: 0 auto;">
										<label style="text-align: left; font-size: 80%">핸드폰 번호</label>
										<input type="text"  class="findInput" name="PhoneNum" id="PhoneNum" value=""  style="float: left;  margin: 0 auto; width: 60%;"placeholder="핸드폰 번호 입력"/>
										<a href="javascript:sms()" id="actionBtn" class="button primary disableAtag" style="width: 40%" >발송</a>
									</div>
									
									<br>
										<div style="margin: 0 auto;">
										<label style="text-align: left; font-size: 80%">인증 번호</label>
										<input type="text" class="findInput" name="checkNum" id="checkNum" placeholder="인증번호 입력" value=""  readonly  style="float: left; margin: 0 auto;width: 60%;" />
										<input type="button" id="actionBtn" class="button primary disableAtag" style="width: 40%;" value="확인" disabled onclick="certifiedCheck()">
										
										
											</div>
									<br>
								
								<div style="text-align: center; margin: 0 auto;">
									<a href="${pageContext.request.contextPath}/index.jsp" id="actionBtn" class="button" >돌아가기</a>
									<a href="javascript:formSubmit()" id="actionBtn" class="button primary" >다음 단계</a>
								</div>	
								</form>	
							</div>
							
							<div id="findPwDiv" style="width: 60%; margin: 0 auto; display: none;">
								<form action="${pageContext.request.contextPath}/member/MemberFindPw.me" name="findPwForm">
									<div style="margin: 0 auto; ">
										<label style="text-align: left; font-size: 80%">아이디</label>
										<input type="text" class="findInput" name="id" id="id" value="" placeholder="" style="margin: 0 auto;"/>
									</div>
									<br>
									<div style="margin: 0 auto;">
										<label style="text-align: left; font-size: 80%">핸드폰 번호</label>
										<input type="text"  class="findInput" name="PhoneNum2" id="PhoneNum2"value=""  style="float: left; width: 60%;margin: 0 auto;"placeholder="핸드폰 번호 입력"/>
										<a href="javascript:sns()" id="actionBtn" class="button primary disableAtag" style="width: 40%;">발송</a>
									</div>
									<br>
									<div style="margin: 0 auto; ">
										<label style="text-align: left; font-size: 80%">인증 번호</label>
										<input type="text" class="findInput" name="checkNum2" id="checkNum2" placeholder="인증번호 입력" value="" readonly  style="float: left; margin: 0 auto; width: 60%;" />
										<input type="button" id="actionBtn" class="button primary disableAtag2" style="width: 40%;" value="확인" disabled onclick="certifiedCheck2()">
										</div>
									<br>
								<div style="text-align: center; margin: 0 auto;">
									<a href="${pageContext.request.contextPath}/index.jsp" id="actionBtn" class="button" >돌아가기</a>
									<a href="javascript:pwformSubmit()"   id="actionBtn" class="button primary" >다음 단계</a>
								</div>	
								</form>
							</div>
							</div>
							
							
					
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
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	<script src="${pageContext.request.contextPath}/app/public/findId.js"></script>
	<script src="${pageContext.request.contextPath}/app/public/findPw.js"></script>
	<script>
	var idDiv = $("#findIdDiv");
	var pwDiv = $("#findPwDiv");
	var pwLabel = $("#PW");
	var idLabel = $("#ID");

	//아이디 찾기 DIV
	function showIdDiv(){
		$("#actionBtn1").attr('class','button');
		$("#actionBtn2").attr('class','button primary');
		idDiv.show();
		idLabel.show();
		pwDiv.hide();
		pwLabel.hide();
	}
	
	//비밀번호 찾기 DIV
	function showPwDiv(){
		$("#actionBtn1").attr('class','button primary');
		$("#actionBtn2").attr('class','button');
		idDiv.hide();
		idLabel.hide();
		pwDiv.show();
		pwLabel.show();
	}
	
	function temp(){
		var phoneNum = $("#phoneNum").val();
		var checkButton = $(".disableAtag");
		var checkNum = $("#checkNum");
		
		if(phoneNum != "" && phoneNum != null){
			checkButton.removeAttr("disabled");
			checkNum.removeAttr("readonly");
		}
	}
	function temp2(){
		var phoneNum = $("#phoneNum2").val();
		var checkButton = $(".disableAtag");
		var checkNum = $("#checkNum2");
		
		if(phoneNum != "" && phoneNum != null){
			checkButton.removeAttr("disabled");
			checkNum.removeAttr("readonly");
		}
	}
	
	</script>

	</body>
</html>