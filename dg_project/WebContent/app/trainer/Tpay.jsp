<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
	<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>환전하기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<style>
			@font-face {
			   font-family: 'paybooc-Bold';
			   src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff') format('woff');
			   font-weight: normal;
			   font-style: normal;
			}	
			
			input[type="text"], input[type="password"], 
			input[type="email"], input[type="tel"], 
			input[type="search"], input[type="url"], select, textarea {
    			background-color: white;				
    		}
    		
    		@media screen and (max-width: 1280px){
    			#coinBox {
    				width: 51% !important;
    			}
    		}
    		
    		@media screen and (max-width: 980px){
				.row > .col-12-medium {
					width: 71% !important; 
				}
			}
			@media screen and (max-width: 736px){
				.row.gtr-200 > * {
					width: 100% !important;	
				}
			}
    		@media screen and (max-width: 480px){
    			#coinBox {
    				width: 75% !important;
    			}    		
    		}
    		
    		.wrapper {
    			padding: 0;
    		}
		</style>
	</head>
	<body class="is-preload" style="font-family: 'paybooc-Bold';">
	

		<!-- Header -->
		<jsp:include page="../../header.jsp" />
			
		<jsp:include page="../../header.jsp"/>
			<c:set var="t_vo" value="${t_vo}"/>
			<c:set var="Pwcheck" value="${Pwcheck}"/>

		<!-- Main -->
			<div id="main">
				<div class="wrapper special" style="padding: 0rem 0 0rem 0 ;">
					<div class="inner">
						<header class="heading">
							<p style="margin: 0 0 0rem 0; font-size:40px; color:#29b6f6; ">노력의 땀방울 환전하기</p>
						</header>
					</div>
				</div>
				
				<div class="wrapper">
					<div class="inner">
						<div class="row gtr-200">
							<div class="col-6 col-12-medium" id="coin" style="text-align: center; margin: 0 auto;">
								<div class="box">
									<div id="coinBox" style="margin: 5% auto; text-align: left; width: 60%;">
										<input type="radio" id="coin100" name="demo-radio" value="100">
										<label for="coin100"><img src="${pageContext.request.contextPath}/images/coin3.png" style="vertical-align: middle;"/><span> x 100개 - 10,000원</span></label>
										<input type="radio" id="coin300" name="demo-radio" value="300">
										<label for="coin300"><img src="${pageContext.request.contextPath}/images/coin3.png" style="vertical-align: middle;"/><span> x 300개 - 30,000원</span></label>
										<input type="radio" id="coin500" name="demo-radio" value="500">
										<label for="coin500"><img src="${pageContext.request.contextPath}/images/coin3.png" style="vertical-align: middle;"/><span> x 500개 - 50,000원</span></label>
										<input type="radio" id="coin1000" name="demo-radio" value="1000">
										<label for="coin1000"><img src="${pageContext.request.contextPath}/images/coin3.png" style="vertical-align: middle;"/><span> x 1000개 - 100,000원</span></label>
										<input type="radio" id="coinChoice" name="demo-radio">
										<label for="coinChoice" ><img src="${pageContext.request.contextPath}/images/coin3.png" style="vertical-align: middle;"/><span> 직접 입력</span></label>
										<input type="text" name="choiceInput" id="choiceInput" value="" style="margin-left: 16%; width: 70%; display: none;" onkeypress="if ( isNaN( String.fromCharCode(event.keyCode) )) return false;"/>
									</div>
									<div style="margin-top: 5%;">
										<ul class="actions">
											<li style="text-align: center; margin: 0 auto;"><a id="coinChoiceReady" href="javascript:nextStep()" class="button primary">환전 하기</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-6 col-12-medium" id="payment" style="text-align: center; margin: 0 auto; display: none;">
								<div class="box">
									<div id="coinBox" style="margin: 5% auto; text-align: left; width: 60%;">
									<form action="">
										<label style="width: 100%;" for="phone"><img src="${pageContext.request.contextPath}/images/icon9.png" style="width: 48px; height: 48px; vertical-align: middle;"/><span>은행명 입력</span></label>
										<input type="text" id="phone"  value=""><br>
										<label style="width: 100%;" for="credit"><img src="${pageContext.request.contextPath}/images/creditcard.png" style="width: 48px; height: 48px; vertical-align: middle;"/><span>계좌번호 입력</span></label>
										<input type="text" id="credit"  value="credit"><br>
										<label style="width: 100%;" for="voucher"><img src="${pageContext.request.contextPath}/images/icon2.png" style="width: 48px; height: 48px; vertical-align: middle;"/><span>비밀번호 확인</span></label>
										<input type="password" id="pw" name="pw"><br>
									</form>
									</div>
									<div style="margin-top: 5%;">
										<ul class="actions">
												<li style="text-align: center; margin-left: auto;"><a href="javascript:backstep()" class="button primary">뒤로 가기</a></li>
											<li style="text-align: center; margin: 0 auto;"><a id="pay" class="button primary">환전 하기</a></li>
										</ul>
									</div>
								</div>
							</div>
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
	<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
	 <script>
	 
	var radioVal;
	var choice;
	var Pwcheck;
	
	Pwcheck='<c:out value="${Pwcheck}"/>';
	
	if(Pwcheck=='true'){
		alert("잘못된 비밀번호입니다");
	}
	
      $(document).ready(function () {
    	 
    	  
        $('#coinChoiceReady').click(function () {
          // getter
          radioVal = $('input[name="demo-radio"]:checked').val();
          
          
          if(radioVal=='on'){
        	  choice = $('#choiceInput').val(); 
          }
          
        });

      });
  	
   
      

		//직접 입력 창
		$("input[name='demo-radio']:radio").change(function () {
        	var choiceRadio = $("#coinChoice");
			if(choiceRadio.is(':checked') == true){
				$("input:text[name=choiceInput]").show();
			}else if(choiceRadio.is(':checked') == false){
				$("input:text[name=choiceInput]").hide();
			}
		});
		
		function backstep(){
			$("#payment").hide();
			$("#coin").show();
		}
		
		
		function nextStep(){
			if(choice != null){
				$("#payment").show();
				$("#coin").hide(); 
			}else if(radioVal != null){
				$("#payment").show();
				$("#coin").hide();
			}
			else{
				alert("환전하실 금액을 선택해주세요😀");
			}
		} 
		 
		$(function(){
				$("#pay").click(function(){
				
				var pw = $('#pw').val();
				var pageContext = "${pageContext.request.contextPath}";
				
				if(radioVal!='on'){
					
				location.href=pageContext+"/trainer/TpayOk.tr?radioVal="+radioVal+"&pw="+pw;
				 
				}else if(choice != null){
					
				location.href=pageContext+"/trainer/TpayOk.tr?choice="+choice+"&pw="+pw;
				}
		});
			
		});
	</script>
	</body>
</html>