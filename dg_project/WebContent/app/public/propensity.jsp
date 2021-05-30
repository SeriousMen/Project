<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->

<!--
	수업날짜와 관심분야는 다중체크가 가능하기 때문에
	값을 여러개 넘겨야함
-->
<html>
	<head>
	<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>운동 성향 알아보기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<style>
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
			
			.wrapper {
				padding: 4rem 0 0 0;
			}
			
			.col-12-medium{
				margin: 0 auto 26% auto;
			}

			#checkTable td{
				padding: 0;
			}
			
			#checkTable label{
				width: 100%; 
				margin: 0;
				padding: 17px 15px 15px 70px;
			}
			
			input[type="checkbox"] + label:before {
				left: 20px;
				top: 20px; 
			}
			
			table tbody tr:nth-child(2n + 1){
				background-color: white;
				
			}
			
			#checkTable select{
				background-color: white;
			}
			
			@media screen and (max-width: 1680px){
				#zipcode {
					width: 73% !important;
				}
				
				#address, #addressDetail, #addressEtc {
					width: 87% !important;
				}				
			}
			
			@media screen and (max-width: 1280px){
				#zipcode {
					width: 72% !important;
				}
			}
			
			@media screen and (max-width: 980px){
				#zipcode {
					width: 77% !important;
				}
			}
			
			@media screen and (max-width: 736px){
				#zipcode {
					width: 74% !important;
				}
			}
			
			@media screen and (max-width: 480px){
				.row.gtr-200 > * {
					padding: 0;	
				}
				#zipcode {
					width: 80% !important;
				}
				
				#address, #addressDetail, #addressEtc {
					width: 100% !important;
				}				
			}
			
			input[type="text"]{
				background-color: white;
			}
			
			 .areaTr{
			 	border: 0;
			 }			
		</style>
	</head>
	<body class="is-preload" style="font-family: 'BMHANNAAir';">

		<jsp:include page="../../header.jsp"/>

		<!-- Main -->
			<div id="main">
				<div class="wrapper special">
					<div class="inner">
						<header class="heading">
							<h1 style="font-family: 'BMEULJIRO';">운동 성향 알아보기</h1>
						</header>
					</div>
				</div>
				<div class="wrapper" style="padding-top: 0;">
					<div class="inner">
						<form method="post" action="${pageContext.request.contextPath}/review/Propensity.rv" id="checkForm" name="checkForm">
							<div class="row gtr-200" style="height: 900px; padding-top: 23px; margin:0 auto;">
								<!-- 회원 성별 -->
								<div class="col-6 col-12-medium" style="margin: 0 auto;" id="memberGender">
									<table id="checkTable">
										<caption style="text-align: left; font-size: 18px;">회원님의 <span style="color: red;">성별</span>은 무엇인가요?</caption>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="memberMan" name="mgCheck" value="남자" onclick="multiCheck1(this)">
													<label for="memberMan">남성</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="memberWoman" name="mgCheck" value="여자" onclick="multiCheck1(this)">
													<label for="memberWoman">여성</label>
												</div>
											</td>
										</tr>
									</table>
									<div>
										<ul class="actions">
											<li style="margin: 0 auto;"><a href="javascript:nextDiv()" class="button primary">다음 단계</a></li>
										</ul>
									</div>
								</div>
								<!-- 트레이너 성별 -->
								<div class="col-6 col-12-medium" style="margin: 0 auto; display: none;" id="trainerGender">
									<table id="checkTable">
										<caption style="text-align: left; font-size: 18px;">선호하는 트레이너의 <span style="color: red;">성별</span>은 무엇인가요?</caption>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="trainerMan" name="tgCheck" value="남자" onclick="multiCheck2(this)">
													<label for="trainerMan">남성</label>
												</div>
												
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="trainerWoman" name="tgCheck" value="여자" onclick="multiCheck2(this)">
													<label for="trainerWoman">여성</label>
												</div>
											</td>
										</tr>
									</table>
									<div>
										<ul class="actions">
											<li style="margin-left: auto;"><a href="javascript:previousDiv()" class="button primary">이전 단계</a></li>
											<li style="margin-right: auto;"><a href="javascript:nextDiv()" class="button primary">다음 단계</a></li>
										</ul>
									</div>
								</div>
								<!-- 회원 나이 -->
								<div class="col-6 col-12-medium" style="margin: 0 auto; display: none;" id="memberAge">
									<table id="checkTable">
										<caption style="text-align: left; font-size: 18px;">회원님의 <span style="color: red;">연령</span>은 어떻게 되나요?</caption>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="age9" name="ageCheck" value="10대미만" onclick="multiCheck3(this)">
													<label for="age9">10대미만</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="age10" name="ageCheck" value="10대" onclick="multiCheck3(this)">
													<label for="age10">10대</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="age20" name="ageCheck" value="20대" onclick="multiCheck3(this)">
													<label for="age20">20대</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="age30" name="ageCheck" value="30대" onclick="multiCheck3(this)">
													<label for="age30">30대</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="age40" name="ageCheck" value="40대" onclick="multiCheck3(this)">
													<label for="age40">40대</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="age50" name="ageCheck" value="50대" onclick="multiCheck3(this)">
													<label for="age50">50대 이상</label>
												</div>
											</td>
										</tr>
									</table>
									<div>
										<ul class="actions">
											<li style="margin-left: auto;"><a href="javascript:previousDiv()" class="button primary">이전 단계</a></li>
											<li style="margin-right: auto;"><a href="javascript:nextDiv()" class="button primary">다음 단계</a></li>
										</ul>
									</div>
								</div>
								<!-- 지역 선택 -->
								<div class="col-6 col-12-medium" style="margin: 0 auto; display: none;" id="memberArea">
									<table id="checkTable">
										<caption style="text-align: left; font-size: 18px;">회원님의 <span style="color: red;">지역</span>은 어떻게 되나요?</caption>
										<tr class="areaTr">
											<td>
												<div>
													<input type="text" id="zipcode" name="zipCode" class="postcodify_postcode5" value="" readonly placeholder="우편번호" style="width: 70%; float: left; margin-top: 5%; margin-bottom: 5%;"/>
			               							<input type="button" id="postcodify_search_button" value="검색" style="float: left; border-radius: 6px; margin-top: 5%; margin-bottom: 5%;"><br />
		               							</div>
											</td>
										</tr>
										<tr class="areaTr">
											<td>
												<input type="text" id="address" name="address" class="postcodify_address" value="" style="width:87%;" readonly placeholder="주소"/><br />
											</td>
										</tr>
									</table>
									<div>
										<ul class="actions">
											<li style="margin-left: auto;"><a href="javascript:previousDiv()" class="button primary">이전 단계</a></li>
											<li style="margin-right: auto;"><a href="javascript:nextDiv()" class="button primary">다음 단계</a></li>
										</ul>
									</div>
								</div>
								<!-- 회원 관심 분야 -->
								<div class="col-6 col-12-medium" style="margin: 0 auto; display: none;" id="memberAttention">
									<table id="checkTable">
										<caption style="text-align: left; font-size: 18px;"><span style="color: red;">관심 분야</span>는 무엇인가요?</caption>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="diet" name="attentionCheck" value="다이어트">
													<label for="diet">다이어트</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="strength" name="attentionCheck" value="근력강화">
													<label for="strength">근력 강화</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="weight" name="attentionCheck" value="체중증가">
													<label for="weight">체중 증가</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="stamina" name="attentionCheck" value="체력증진">
													<label for="stamina">체력 증진</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="bodyType" name="attentionCheck" value="체형교정">
													<label for="bodyType">체형 교정</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="care" name="attentionCheck" value="재활/통증 케어">
													<label for="care">재활/통증 케어</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="bodyProfile" name="attentionCheck" value="바디프로필">
													<label for="bodyProfile">바디프로필</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="contest" name="attentionCheck" value="대회준비">
													<label for="contest">대회준비</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="etc" name="attentionCheck" value="기타">
													<label for="etc">기타</label>
												</div>
											</td>
										</tr>
									</table>
									<div>
										<ul class="actions">
											<li style="margin-left: auto;"><a href="javascript:previousDiv()" class="button primary">이전 단계</a></li>
											<li style="margin-right: auto;"><a href="javascript:nextDiv()" class="button primary">다음 단계</a></li>
										</ul>
									</div>
								</div>
								<!-- 수강 요일 -->
								<div class="col-6 col-12-medium" style="margin: 0 auto; display: none;" id="classDate">
									<table id="checkTable">
										<caption style="text-align: left; font-size: 18px;">레슨 가능한 <span style="color: red;">날짜</span>를 모두 선택해주세요.</caption>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="afterChoice" name="dateCheck" value="상담">
													<label for="afterChoice">상담 후 결정</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="monday" name="dateCheck" value="월">
													<label for="monday">월요일</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="tuesday" name="dateCheck" value="화">
													<label for="tuesday">화요일</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="wednesday" name="dateCheck" value="수">
													<label for="wednesday">수요일</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="thursday" name="dateCheck" value="목">
													<label for="thursday">목요일</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="friday" name="dateCheck" value="금">
													<label for="friday">금요일</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="saturday" name="dateCheck" value="토">
													<label for="saturday">토요일</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="sunday" name="dateCheck" value="일">
													<label for="sunday">일요일</label>
												</div>
											</td>
										</tr>
									</table>
									<div>
										<ul class="actions">
											<li style="margin-left: auto;"><a href="javascript:previousDiv()" class="button primary">이전 단계</a></li>
											<li style="margin-right: auto;"><a href="javascript:nextDiv()" class="button primary">다음 단계</a></li>
										</ul>
									</div>
								</div>
								<!-- 수강 시간 -->
								<div class="col-6 col-12-medium" style="margin: 0 auto; display: none;" id="classTime">
									<table id="checkTable">
										<caption style="text-align: left; font-size: 18px;">희망하는 <span style="color: red;">시간대</span>를 모두 선택해주세요.</caption>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="am09" name="timeCheck" value="이른 오전">
													<label for="am09">이른 오전(09시 이전)</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="am0912" name="timeCheck" value="오전">
													<label for="am0912">오전(09~12시)</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="pm1215" name="timeCheck" value="오후">
													<label for="pm1215">오후(12~15시)</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="pm1518" name="timeCheck" value="늦은 오후">
													<label for="pm1518">늦은 오후(15~18시)</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="pm1821" name="timeCheck" value="저녁">
													<label for="pm1821">저녁(18~21시)</label>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="pm21" name="timeCheck" value="늦은 저녁">
													<label for="pm21">늦은 저녁(21시 이후)</label>
												</div>
											</td>
										</tr>
									</table>
									<div>
										<ul class="actions">
											<li style="margin-left: auto;"><a href="javascript:previousDiv()" class="button primary">이전 단계</a></li>
											<li style="margin-right: auto;"><a href="javascript:nextDiv()" class="button primary">나의 트레이너는?</a></li>
										</ul>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		

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
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>
	<script src="${pageContext.request.contextPath}/app/member/join.js"></script>
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	<script>
		var memberGender = $("#memberGender");
		var trainerGender = $("#trainerGender");
		var memberAge = $("#memberAge");
		var memberArea = $("#memberArea");
		var memberAttention = $("#memberAttention");
		var classDate = $("#classDate");
		var classTime = $("#classTime");

		function nextDiv(){
			if(memberGender.is(':visible') == true){
				if($("input[name='mgCheck']").is(":checked")){
					memberGender.hide();
					trainerGender.show();
				}else{
					alert('알맞은 항목을 체크해주세요.');
				}
			}else if(trainerGender.is(':visible') == true){
				if($("input[name='tgCheck']").is(":checked")){
					trainerGender.hide();
					memberAge.show();
				}else{
					alert('알맞은 항목을 체크해주세요.');
				}
			}else if(memberAge.is(':visible') == true){
				if($("input[name='ageCheck']").is(":checked")){
					memberAge.hide();
					memberArea.show();
				}else{
					alert('알맞은 항목을 체크해주세요.');
				}
			}else if(memberArea.is(':visible') == true){
				if($("input[name='zipCode']").val() != ""){
					memberArea.hide();
					memberAttention.show();				
				}else{
					alert('알맞은 항목을 체크해주세요.');
				}
			}else if(memberAttention.is(':visible') == true){
				if($("input[name='attentionCheck']").is(":checked")){
					memberAttention.hide();
					classDate.show();
				}else{
					alert('알맞은 항목을 체크해주세요.');
				}
			}else if(classDate.is(':visible') == true){
				if($("input[name='dateCheck']").is(":checked")){				
					classDate.hide();
					classTime.show();
				}else{
					alert('알맞은 항목을 체크해주세요.');
				}
			}else if(classTime.is(':visible') == true){
				if($("input[name='timeCheck']").is(":checked")){
					checkForm.submit();
				}else{
					alert('알맞은 항목을 체크해주세요.');
					return false;
				}
			}
		}
		
		function previousDiv(){
			if(classTime.is(':visible') == true){
				classTime.hide();
				classDate.show();
			}else if(classDate.is(':visible') == true){
				classDate.hide();
				memberAttention.show();
			}else if(memberAttention.is(':visible') == true){
				memberAttention.hide();
				memberArea.show();
			}else if(memberArea.is(':visible') == true){
				memberArea.hide();
				memberAge.show();
			}else if(memberAge.is(':visible') == true){
				memberAge.hide();
				trainerGender.show();
			}else if(trainerGender.is(':visible') == true){
				trainerGender.hide();
				memberGender.show();
			}
			
		}
		
		//중복체크
		function multiCheck1(chk){
		    var obj = document.getElementsByName("mgCheck");
		    for(var i=0; i<obj.length; i++){
		        if(obj[i] != chk){
		            obj[i].checked = false;
		        }
		    }
		}
		
		function multiCheck2(chk){
		    var obj = document.getElementsByName("tgCheck");
		    for(var i=0; i<obj.length; i++){
		        if(obj[i] != chk){
		            obj[i].checked = false;
		        }
		    }
		}
		
		function multiCheck3(chk){
		    var obj = document.getElementsByName("ageCheck");
		    for(var i=0; i<obj.length; i++){
		        if(obj[i] != chk){
		            obj[i].checked = false;
		        }
		    }
		}
	</script>
</html>