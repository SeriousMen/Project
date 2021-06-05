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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>

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

.wrapper {
	padding: 2rem 0 3rem 0;
}

#actionBtn {
	border-radius: 6px;
}

#actionBtn2 {
	border-radius: 6px;
}

.inputTag {
	margin: 0 auto;
	width: 50%;
}
.inputTag2{
	width: 33.333333%;
	float: left; 
	text-align: center;
	padding-left: 15px;
	padding-right: 15px;
}
.ptag{
	font-size: 0.8em; 
	text-align: left;
}

@media screen and (max-width: 1200px) {
	.heading {
		width: 100%;
	}
}

@media screen and (max-width: 980px) {
	.heading {
		width: 100%;
	}
}


@media screen and (max-width: 1200px) {
	.inputTag {
		width: 100%;
	}
}

@media screen and (max-width: 980px) {
	.inputTag {
		width: 100%;
	}
}



@media screen and (max-width: 980px) {
	.inputTag2 {
		width: 100%;
	}
}



@media screen and (max-width: 1200px) {
	.box {
		width: 100%;
	}
}

@media screen and (max-width: 980px) {
	.box {
		width: 100%;
	}
}

@media screen and (max-width: 736px) {
	.box {
		width: 100% !important;
	}
}

@media screen and (max-width: 480px) {
	.box {
		width: 100% !important;
	}
}



/* 한나(얇음) */
@font-face {
    font-family: 'BMHANNAAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

/*을지로(두꺼움)*/
@font-face {
    font-family: 'BMEULJIRO';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


</style>
</head>

<body class="is-preload" >

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
			<div class="inner">
				<header class="heading" style="margin: 0 auto 0rem auto;  font-family: BMEULJIRO;">
					<p style="font-size: 1.4em;">
						<strong><span style="margin: 0 0 0rem 0;">왜 득근득근일까요?</span></strong>
					</p>
				</header>
					<div style="width: 80%; margin: 0 auto;">
						<div class="inputTag2"> 
						<img src="${pageContext.request.contextPath}/images/knowledge.png" style="width:30%;">	
							<h4>지식을 함부러 다루지 않습니다</h4>
							<p class="ptag">너무 크고 잦은 할인은 결과적으로 콘텐츠의 질을 떨어뜨리고, 지식의 가치를 존중하지 않는 일이라 생각합니다. 득근득근은 합리적인 가격 정책으로  회원에게 도움이 되는 생태계를 만들어 가고 있습니다.</p>
						
						</div>
						<div class="inputTag2"> 
							
						<img src="${pageContext.request.contextPath}/images/revenue.png" style="width:30%;">	
						<h4>수익이 가능한 유일한 곳</h4>
							<p class="ptag">득근득근은 트레이닝으로 의미 있는 보상을 가질 수 있는 유일한 플랫폼 입니다. 득근득근이 PT를 신청할 때마다 수익을 얻으세요. 지속가능한 수익과 명예를 가져가세요. </p>
							
						
						</div>
						<div class="inputTag2"> 
							
						<img src="${pageContext.request.contextPath}/images/value.png" style="width:30%; ">	
						<h4>사회적 가치를 실현하세요</h4>
							<p class="ptag">오직 득근득근에서만 가능합니다. 자신의 지식으로 지속가능한 수익을 올리면서도, 많은 사람들에게 경제적인 배움의 기회를 줄 수 있습니다. 사람들이 건강해지고, 자신의 능력을 향상하도록 득근득근과 함께해주세요.</p>
							
						</div>
					</div>
					
					<div style="width: 80%; margin: 0 auto;">
						<div class="inputTag2"> 
							
						<img src="${pageContext.request.contextPath}/images/operation.png" style="width:30%;">	
							<h4>자유로운 PT 운영</h4>
							<p class="ptag">마음껏 자신의 PT를 운영해 보세요. 회원추가, 트레이너페이지 등 자유롭게  운영할 수 있습니다. 폭 넓은 활용 방법을 이용해서 자신만의 강의 영역을 확대해 보세요.</p>
							
						</div>
						<div class="inputTag2"> 
							
						<img src="${pageContext.request.contextPath}/images/network.png" style="width:30%; ">	
						<h4>네트워크 & 인프라</h4>
							<p class="ptag">득근득근의 네트워크를 활용하세요. 수많은 IT 기업에서 이미 득근득근과 연계를 맺고 함께 성장하고 있어요. 득근득근에 PT를 개설한다면, 수많은 사람들과 기업들이 당신의 PT를 보게될 거에요.</p>
							
						</div>
						<div class="inputTag2"> 
							
						<img src="${pageContext.request.contextPath}/images/knowhow.png" style="width:30%; ">	
						<h4>득근득근 만의 노하우</h4>
							<p class="ptag">PT에 필요한 노하우와 지식이 없다고 걱정하지 마세요.기본적인 준비를 함께하며, 노하우를 알려드립니다. 좋은 지식을 나누실 분들은 오피스를 찾아주세요. 부담없이 이야기 나누며 PT를 함께 만들어요!</p>
							
						</div>
					</div>
					
					
				
				<header class="heading" style="margin: 0 auto; width: 80%; font-family: BMEULJIRO; ">
					<p style="font-size: 1.4em;">
						<strong><span style="margin: 0 0 0rem 0;">득근득근 트레이너가 되어 주세요!</span></strong>
					</p>
					<p style="font-size: 180%; display: inline; margin-right: 10%;">
						<span id="span1" style="cursor: pointer;">절차</span>
					</p>
					<p style="font-size: 125%; display: inline;">
						<span id="span2" style="cursor: pointer; font-size: 75%;">FAQ</span>
					</p>

				</header>
					
					<div class="inputTag" id="ul1" >

						<div class="box" >
							<p>
								<strong>1.득근득근에 가입하세요.</strong><br> 참여하기를 눌러 득근득근 트레이너
								회원가입을 해주세요! 득근득근 매니저가 노하우를 공유해드려요.
							</p>
						</div>
						<div class="box" >
							<p>
								<strong>2.트레이너 사진을 업로드하고 소개글을 작성해주세요.</strong><br> 득근득근
								매니지가 트레이너 소개글과 이미지 최적화를 도와드립니다.
							</p>
						</div>
						<div class="box" >
							<p>
								<strong>3.자기만의 커뮤니티를 만들어보세요.</strong><br> 득근득근 매니저가 홍보와 연결을
								도와드립니다.
							</p>
						</div>
						<div class="box" >
							<p>
								<strong>4.이제 합당한 보상을 받으세요.</strong><br> 득근득근 매니지가 정산 내역을
								알려드립니다.
							</p>
						</div>
					</div>

					<div class="box" id="ul2"
						style="display: none ;width: 50%; margin:0 auto; margin-bottom: 2rem;">

						<div>
							<p>
								<strong>1.정산비율은 어떻게 되나요?</strong><br> 득근득근 정산 비율은 기본적으로
								70:30으로 지식공유자분이 70%의 수익을 가져가세요 정산은 매 10영업일 이내에 지급됩니다.
							</p>
						</div>
						<div>
							<p>
								<strong>2.수익이 얼마나 될까요?</strong><br> PT에 따라 매월 수천만원에서 수십만원
								까지 천차만별 이라 예측하긴 어렵습니다. 다만 좋은 PT를 하시면 그에 맞는 수익을 가져가실 수 있습니다.
							</p>
						</div>
						<div>
							<p>
								<strong>3.내 수익을 투명하게 알 수 있나요?.</strong><br> 네.득근득근의 결제기록을
								보시면 확인할 수 있습니다.
							</p>
						</div>
						<div>
							<p>
								<strong>4.트레이너 확인 절차는 어느정도 소요가 되나요?.</strong><br> 가입 하실 때
								트레이너 증명서를 올려주면 득근득근 운영팀에서 간단한 심사가 진행돼요 심사에는 영업일 기준 일주일 까지 걸릴 수
								있어요.
							</p>
						</div>
					
					</div>
				<div style="width: 30%;margin:0 auto"> 
					<a href="${pageContext.request.contextPath}/app/trainer/trainerJoin.jsp" class="button fit">가입하기</a>
				</div>
		</div>
	</div>
	</div>

	<br>
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
	<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>


	<script>
		$("#span1").click(function() {
			$("#ul2").hide();
			$("#span2").css('font-size', '75%');
			$("#span1").css('font-size', '100%');
			$("#ul1").show();
		});
		$("#span2").click(function() {
			$("#ul1").hide();
			$("#span1").css('font-size', '50%');
			$("#span2").css('font-size', '125%');
			$("#ul2").show();
		});
	</script>

</body>
</html>