<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
<title>트레이너 회원가입</title>
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

body {
	font-family: 'BMHANNAAir';
}

@font-face {
	font-family: 'paybooc-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

span.elements {
	font-size: 200%;
	color: red;
}

.wrapper {
	padding: 2rem 0 3rem 0;
}

h4 {
	text-align: left;
}

#actionBtn {
	border-radius: 6px;
}

#actionBtn2 {
	border-radius: 6px;
}

.inputTag {
	margin: 0 auto;
	width: 80%;
}

@media screen and (max-width: 980px) {
	.inputTag {
		width: 100%;
	}
}

@media screen and (max-width: 736px) {
	.box {
		width: 60% !important;
	}
	.icons {
		margin-bottom: 5%;
	}
}

@media screen and (max-width: 480px) {
	.box {
		width: 100% !important;
	}
}
</style>
</head>

<body class="is-preload">

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
		<div class="wrapper special">
			<form name="joinForm" id="joinForm"
				action="${pageContext.request.contextPath}/trainer/TrainerJoinOk.tr" enctype="multipart/form-data"
				method="post">
				<div class="inner">
					<header class="heading">

						<h3>
							<span class="elements">"힘"</span>을 나눠주세요
						</h3>

						<div id="trainerJoin1" class="box"
							style="width: 60%; margin: 0 auto;">

							<div class="inputTag">
								<h4>아이디</h4>
								<input type="text" name="trainerId" id="trainerId" value=""
									style="margin: 0 auto" placeholder="아이디를 입력하세요" required />
								<h5  style="float: right; font-size: 0.8em; color: red" id="idCheck_text"></h5>
							</div>
							<br>

							<div class="inputTag">
								<h4>비밀번호</h4>
								<input type="password" name="trainerPw" id="trainerPw" value=""
									style="margin: 0 auto" placeholder="비밀번호를 입력하세요" required /> <br>
							</div>

							<div class="inputTag">
								<h4>이름</h4>
								<input type="text" name="trainerName" id="trainerName" value=""
									style="margin: 0 auto" placeholder="이름을 입력하세요"  /> <br>
							</div>

							<div class="inputTag">
								<h4>휴대폰번호</h4>
								<input type="text" name="trainerPhoneNum" id="trainerPhoneNum"
									value="" style="float: left; width: 70%;"
									placeholder="핸드폰 번호 입력"  /> <a href="javascript:sms()"
									id="actionBtn" class="button primary" style="width: 30%;">발송</a>
							</div>
							<br>

							<div class="inputTag">
								<input type="text" name="trainerPhoneNumberOk"
									id="trainerPhoneNumberOk" placeholder="인증번호 입력" value=""
									readonly style="margin: 0 auto; float: left; width: 70%;" /> <input
									type="button" id="actionBtn" onclick="certifiedCheck();"
									class="button primary disabledbutton" style="width: 30%;"
									value="확인" disabled>
							</div>
							<br>

							<div class="inputTag">
								<h4>성별</h4>
								<select name="trainerGender" id="trainerGender" >
									<option value="">- 성별 -</option>
									<option value="남자">남자</option>
									<option value="여자">여자</option>
								</select>
							</div>
							<br>


							<div>
								<ul class="actions">
									<li style="margin: 0 auto"><a href="javascript:move()"
										class="button">다음</a></li>
								</ul>
							</div>


							<div>
								<a href="memberJoin.jsp">회원으로 가입하시나요?</a>
							</div>
						</div>


						<div id="trainerJoin2" class="box"
							style="width: 60%; margin: 0 auto; display: none">
							<div class="inputTag">
								<h4>이메일</h4>
								<input type="text" name="trainerEmail" id="trainerEmail"
									value=""  />
							</div>

							<br>

							<div class="inputTag">
								<h4>트레이닝경력</h4>
								<select name="trainerAccount" id="trainerAccount" >
									<option value="">- 트레이닝경력 -</option>
									<option value="0">0년</option>
									<option value="1">1년</option>
									<option value="2">2년</option>
									<option value="3">3년</option>
									<option value="4">4년</option>
									<option value="5">5년</option>
									<option value="6">6년</option>
									<option value="7">7년</option>
									<option value="8">8년</option>
									<option value="9">9년</option>
									<option value="10">10년</option>
									<option value="11">11년</option>
									<option value="12">12년</option>
									<option value="13">13년</option>
									<option value="14">14년</option>
									<option value="15">15년</option>
									<option value="16">16년</option>
									<option value="17">17년</option>
									<option value="18">18년</option>
									<option value="19">19년</option>
									<option value="20">20년</option>

								</select>
							</div>
							<br>

							<div class="inputTag">
								<h4>우편번호</h4>
								<input type="text" name="trainerAddressZipCode"
									id="trainerAddressZipCode" class="postcodify_postcode5"
									value="" style="float: left; margin: 0 auto; width: 60%"
									readonly /> <input type="button" id="actionBtn2"
									class="button primary postcodify_search_button"
									style="width: 40%" value="검색">
							</div>
							<br>

							<div class="inputTag">
								<h4>주소</h4>
								<input type="text" name="trainerAddress" id="trainerAddress"
									class="postcodify_address" value="" readonly  />
							</div>
							<br>

							<div class="inputTag">
								<h4>상세주소</h4>
								<input type="text" name="trainerAddressDetail"
									id="trainerAddressDetail" class="postcodify_details"
									class="postcodify_address" value=""  />
							</div>
							<br>

							<div class="inputTag">
								<h4>
									트레이너 오픈카톡url<span style="color: red">(필수)</span>
								</h4>
								<input type="text" name="trainerUrl" id="trainerUrl" value="" />
							</div>
							<br>


							<div class="inputTag">
								<h4>트레이너 경력 인증</h4>
								<input type="file" name="trainerFileName">
							</div>
							<br>
							<div>
								<input type="button" onclick="cancleFile('trainerFileName')"
									value="첨부 삭제">
							</div>
							<br>

							<div style="text-align: center">
								<p style="font-size: 0.9rem">유저의 허락없이 게시물을 올리지않습니다.</p>
								<p style="font-size: 0.9rem">
									득근득근의 <a href="javascript:movePage1()" style="color: red">이용약관</a> 및
									<a href="javascript:movePage2()" style="color: red">개인정보 처리방침</a>에
									동의합니다
								</p>
							</div>

							<div class="col-6 col-12-medium">
								<ul class="actions stacked">
									<li><a href="javascript:formSubmit()" class="button fit">가입하기</a></li>
								</ul>
							</div>
							<div>
								<a href="memberJoin.jsp">회원으로 가입하시나요?</a>
							</div>


							<div>
								<ul class="actions">
									<li style="margin: 0 auto"><a href="javascript:move2()"
										class="button primary">이전</a></li>
								</ul>
							</div>

						</div>
					</header>
				</div>
			</form>
		</div>


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

	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

	<script>
		$(function() {
			$(".postcodify_search_button").postcodifyPopUp();
		});
	
	</script>
	<script>
		function cancleFile(fileTagName) {
			if ($.browser.msie) {
				$("input[name='" + fileTagName + "']").replaceWith(
						$("input[name='" + fileTagName + "']").clone(true));
			} else {
				$("input[name='" + fileTagName + "']").val("");
			}
		}
	</script>
	<script>
		var trainerDiv1 = $("#trainerJoin1");
		var trainerDiv2 = $("#trainerJoin2");

		function move() {
			trainerDiv1.hide();
			trainerDiv2.show();
		}

		function move2() {
			trainerDiv1.show();
			trainerDiv2.hide();
		}
	</script>
	<script>
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<script
		src="${pageContext.request.contextPath}/app/trainer/trainerJoin.js"></script>
		
	<script>
	function movePage1() {
		var newWidth = 480;
		var newHeight = 730;
		var popX = (window.screen.width / 2) - (newWidth / 2);
		var popY = (window.screen.height / 2) - (newHeight / 2);
		
		window.open("${pageContext.request.contextPath}/app/public/serviceCheck.jsp");
	}
	function movePage2() {
		var newWidth = 480;
		var newHeight = 730;
		var popX = (window.screen.width / 2) - (newWidth / 2);
		var popY = (window.screen.height / 2) - (newHeight / 2);
		
		window.open("${pageContext.request.contextPath}/app/public/serviceCheck2.jsp");
	}
	</script>	
</body>
</html>