<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
<title>개인정보수정</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
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

body {
	font-family: 'BMHANNAAir';
}

#div2 {
	margin-left: 27%;
}

#phoneDiv {
	margin: 0 auto;
	width: 50%;
	display: none;
}

#memberPhonenumber {
	width: 40%;
	margin-left: 25%;
}

#memberNewPhonenumber {
	width: 40%;
	margin-left: 25%;
}

#memberPhonenumberOk {
	width: 40%;
	margin-left: 25%;
}

#pwDiv {
	display: none;
	margin: 0 auto;
	width: 50%;
}

@media screen and (max-width: 480px) {
	h4 {
		font-size: 23px;
	}
	.col-6 .col-12-xsmall {
		width: 100%;
	}
	#div2 {
		margin-left: 9%;
	}
	#phoneDiv {
		width: 100%;
	}
	#memberPhonenumber {
	margin-left: 18%;
		width: 50%;
	}
	#memberNewPhonenumber {
	margin-left: 18%;
		width: 50%;
	}
	#memberPhonenumberOk {
	margin-left: 18%;
		width: 50%;
	}
	#pwDiv {
		width: 100%;
	}
}
</style>
</head>
<body class="is-preload">
	<c:set var="m_vo" value="${m_vo}" />
	<c:set var="m_phone" value ="${m_vo.getMemberPhone()}"/>
	
	<!-- Header -->
	<jsp:include page="../../header.jsp" />


	<!-- Main -->
	<div id="main">
		<div id="div1" class="wrapper special" style="padding: 0rem 0 0rem 0;">
			<input type="file" accept="" style="display: none;" id="fileInput">
			<div class="inner">
				<header class="heading"
					style="font-size: 30px; margin: 0 auto 0rem auto; text-align: center;">
					내 정보 수정 </header>
				
			</div>
		</div>
		<div id="div2" class="image major" data-position="center">
			<span
				style="margin: 0 auto; font-size: 20px; font-weight: bold; color: gray;">ID</span>
			<div id="nameModify" style="margin: 0 auto;">
				<span style="font-size: 25px; display: inline;"><img
					src="${pageContext.request.contextPath}/images/sns2.png"
					style="width: 25px; height: 25px; display: inline; margin-right: 1%;">${m_vo.getMemberId()}</span>
			</div>

			<hr width="50%"
				style="margin-left: -3%; margin-top: 1%; margin-bottom: 0%;">
			<br> <span
				style="margin: 0 auto; font-size: 20px; font-weight: bold; color: gray;">휴대폰
				번호</span>
			<div id="emailModify" style="margin: 0 auto; cursor: pointer;">
				<span style="font-size: 25px; display: inline;"><img
					src="${pageContext.request.contextPath}/images/sns2.png"
					style="width: 25px; height: 25px; display: inline; margin-right: 1%;">${fn:substring(m_phone,0,3)}-${fn:substring(m_phone,3,7)}-****<img
					src="${pageContext.request.contextPath}/images/next.png"
					style="margin-left: 25%; display: inline; width: 25px; height: 25px;"></span>
			</div>
			<hr width="50%"
				style="margin-left: -3%; margin-top: 1%; margin-bottom: 0%;">
			<br> <span
				style="margin: 0 auto; font-size: 20px; font-weight: bold; color: gray;">비밀번호</span>
			<div id="pwModify" style="margin: 0 auto; cursor: pointer;">
				<span style="font-size: 25px; display: inline;"><img
					src="${pageContext.request.contextPath}/images/sns2.png"
					style="width: 25px; height: 25px; display: inline; margin-right: 1%;">********<img
					src="${pageContext.request.contextPath}/images/next.png"
					style="margin-left: 28%; display: inline; width: 25px; height: 25px;"></span>
			</div>
			<hr width="50%"
				style="margin-left: -3%; margin-top: 1%; margin-bottom: 0%;">
			<br>
		</div>

		<ul id="mainBack" class="actions fit"
			style="display: inherit; padding-top: 5%;">
			<li style="text-align: center;"><a href="${pageContext.request.contextPath}/member/MemberPageOk.me"
				style="width: 50%" class="button fit">뒤로가기</a></li>
		</ul>

		<div class="wrapper" style="padding: 2rem 0 5rem 0;">
			<div class="inner">

				<div class="col-6 col-12-xsmall" id="phoneDiv">
					<h4 style="text-align: center; font-size: 35px;">휴대폰번호 변경</h4>
					<form style="margin: 37px 0 2rem 0;" name="phoneForm" action="${pageContext.request.contextPath}/member/MemberChangePhoneOk.me">
						<div style="display: flex;">
							<input type="text" id="memberPhoneNumber" class="phoneInput"
								name="memberPhoneNumber" placeholder="기존 휴대폰 번호"> <a
								href="javascript:void(0)" onclick="selectMemberPhone();" class="button primary" style="border-radius: 6px">확인</a>
						</div>

						<div style="display: flex;">
							<input type="text" id="memberNewPhoneNumber" class="phoneInput"
								name="memberNewPhoneNumber" placeholder="새 휴대폰 번호"> <a
								href="javascript:sms()" id="actionBtn" class="button primary"
								style="border-radius: 6px"">전송</a>
						</div>

						<div style="display: flex;">
							<input type="text" placeholder="인증번호 입력" class="phoneInput"
								name="memberPhoneNumberOk" id="memberPhoneNumberOk" readonly> <a
								href="javascript:certifiedCheck()" class="button primary disabledbutton"
								style="border-radius: 6px; display:hidden;" >인증</a>
						</div>
						<ul class="actions fit"
							style="display: inherit; padding-top: 5%; text-align: center;">
							<li
								style="display: inline-block; max-width: 33%; padding-left: 0px;"><a
								href="javascript:phoneFormSubmit()" class="button primary fit">수정</a></li>

							<li
								style="display: inline-block; max-width: 33%; padding-left: 0px; padding-top: 0px;"><a
								href="${pageContext.request.contextPath}/member/MemberModify.me" class="button fit">뒤로가기</a></li>
						</ul>
					</form>
				</div>

				<!--비번변경 (안씀) -->
				<div class="col-6 col-12-xsmall" id="pwDiv">
					<h4 style="text-align: center; font-size: 35px;">비밀번호 변경</h4>
					<form style="margin: 37px 0 2rem 0;" name="pwForm" action="${pageContext.request.contextPath}/member/MemberChangePw.me">
						<div style="display: flex;">
							<input type="password" id="memberPw" name="memberPw" placeholder="기존비밀번호" style="width: 40%;margin-left: 24%;"> 
							<a href="#" class="button primary" onclick="" style="border-radius: 6px">확인</a>
						</div>

						<div style="display: flex;">
							<input type="password" id="memberNewPw" name="newPw" placeholder="새 비밀번호" style="width: 51%;margin-left: 24%;">

						</div>

						<div style="display: flex;">
							<input type="password" placeholder="비밀번호 확인" name="memberPwOk" id="memberPwOk "  style="width: 51%;margin-left: 24%;">

						</div>
						<ul class="actions fit" style="display: inherit; padding-top: 5%; text-align: center;">
							<li style="display: inline-block; max-width: 33%; padding-left: 0px;"><a href="javascript:pwFormSubmit();" class="button primary fit">수정</a></li>

							<li style="display: inline-block; max-width: 33%; padding-left: 0px; padding-top: 0px;"><a href="${pageContext.request.contextPath}/member/MemberModify.me" class="button fit">뒤로가기</a></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="../../footer.jsp" />

	<!-- Footer -->
	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script>
	var contextPath = "${pageContext.request.contextPath}";
	
		$(function() {
		
			$("#backBtn").click(function() {
				window.history.back();
			});

			$("#emailModify").click(function() {
				$("#div1").hide();
				$("#div2").hide();
				$("#mainBack").hide();
				$("#phoneDiv").show();
			});
			$("#pwModify").click(function() {
				location.href = "${pageContext.request.contextPath}/app/public/changePw.jsp"; 
				
				/* $("#div1").hide();
				$("#div2").hide();
				$("#mainBack").hide();
				$("#pwDiv").show(); */
			});
		});
		
		selectCheck = false;
		function selectMemberPhone(){
			var memberPhoneNumber = $("input[name='memberPhoneNumber']").val();
			check = false;
			if(memberPhoneNumber.length != 11 || memberPhoneNumber == ""){
				alert("휴대폰 번호를 다시확인해주세요.");
				return false;
			}else{
				
				$.ajax({
					
					url:contextPath + "/member/MemberPhoneCheckOk.me?memberPhoneNumber="+memberPhoneNumber,	
					type:"get",
					dataType:"text", 
					success:function(result){	
						if(result.trim() == "ok"){
							check = true;
							selectCheck = true;
							alert("확인되었습니다.");
						}else if(result.trim() == "not-ok"){
							alert("기존의 휴대폰번호와 다릅니다.");
						}
					},
					error:function(){	//통신 오류 시
						console.log("오류");
					}
				});
			}
		}

		
		

		
		var temp;

		function sms() {
			check = false;
			var phone = $("#memberNewPhoneNumber").val();

			if (phone.length != 11 || phone == "") {
				alert("핸드폰 번호를 다시 확인해주세요.");
				return false;
			} else {
				$("#memberPhoneNumberOk").removeAttr("readonly");
				$(".disabledbutton").show();
				$.ajax({
					url:contextPath+"/member/MemberSms.me?phone="+phone,
					type : "get",
					dataType : "text",
					success : function(result) {
						check = true;
						temp = result.trim();
						console.log("result: " + result.trim());
						console.log("성공");
					},
					error : function(a, b, c) {
						console.log("sms오류");
					}
				});
			}
		}
		
		

		numberCheck = false;
		function certifiedCheck() {
			
			var checkPhone = $("input[name='memberPhoneNumberOk']").val();
			console.log("temp : " + temp);
			console.log("memberPhoneNumberOk : " + checkPhone);
			
				
			
			if (temp == checkPhone) {
				alert("인증되었습니다.");
				numberCheck = true;
				return false;
			} else {
				alert("인증번호가 틀렸습니다.");
				return false;
			}
		}
		
		
		function phoneFormSubmit(){
			var form = document.phoneForm;
			//아이디는 4자 이상, 16자 이하로 입력
		
			
			
			if(!numberCheck){
				alert("인증번호 확인을 진행해주세요.");
				return false;
				
			}if(!selectCheck){
				alert("기존휴대폰번호를 확인해주세요.");	
				return false;
			}else{
				form.submit();
			}
		}
		
		
		//기존비밀번호확인
		
			
		
		
		//비번 변경
	
		
	</script>

</body>
</html>