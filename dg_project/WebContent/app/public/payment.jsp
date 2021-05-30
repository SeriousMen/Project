<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
		<title>결제페이지</title>
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
			
			input[type="text"], input[type="password"], 
			input[type="email"], input[type="tel"], 
			input[type="search"], input[type="url"], select, textarea {
    			background-color: white;				
    		}
    		
    		@media screen and (max-width: 1280px){
    			#coinBox {
    				width: 35% !important;
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
				
				#paymentBox {
					width: 35% !important;
				}
				
			}
    		@media screen and (max-width: 480px){
    			#coinBox {
    				width: 75% !important;
    			}    		
    			
    			#paymentBox {
					width: 55% !important;
				}
    		}
    		
    		.wrapper {
    			padding: 0;
    		}
    		
    		/* body {
    			background-image: url('images/test.png');
    			background-repeat: no-repeat;
    			background-size: 69%;
    			background-position: center;
    			background-position-y: 70%;
    			
    		} */
    		.gtr-200 {
    			display: contents;
    		}
    		
    		#formStyle {
    			padding: 0;
    		}
    		
    		#success1 {
    			width: 80% !important;
    		}
		</style>
	</head>
	<body class="is-preload" style="font-family: 'BMHANNAAir';">
		<c:set var="m_id" value="${m_id}"/>
		<c:set var="trainer" value="${trainer}"/>
		<!-- Main -->
			<div id="main">
				<div class="wrapper">
					<div class="inner">
						<div class="row gtr-200">
							<form id="formStyle">
								<%-- 충전하는 포인트 금액이 들어있는 input태그 --%>
								<input type="hidden" name="point" value="">
								<div class="col-6 col-12-medium" id="coin" style="text-align: center; margin: 0 auto;">
									<div class="box">
										<div id="coinBox" style="margin: 5% auto; text-align: left; width: 60%;">
											<input type="radio" id="coin100" name="coin-radio" value="10000">
											<label for="coin100"><img src="${pageContext.request.contextPath}/images/coin3.png" style="vertical-align: middle;"/><span> x 100개 - 10,000원</span></label>
											<input type="radio" id="coin300" name="coin-radio" value="30000">
											<label for="coin300"><img src="${pageContext.request.contextPath}/images/coin3.png" style="vertical-align: middle;"/><span> x 300개 - 30,000원</span></label>
											<input type="radio" id="coin500" name="coin-radio" value="50000">
											<label for="coin500"><img src="${pageContext.request.contextPath}/images/coin3.png" style="vertical-align: middle;"/><span> x 500개 - 50,000원</span></label>
											<input type="radio" id="coin1000" name="coin-radio" value="100000">
											<label for="coin1000"><img src="${pageContext.request.contextPath}/images/coin3.png" style="vertical-align: middle;"/><span> x 1000개 - 100,000원</span></label>
											<input type="radio" id="coinChoice" name="coin-radio">
											<label for="coinChoice" ><img src="${pageContext.request.contextPath}/images/coin3.png" style="vertical-align: middle;"/><span> 직접 입력</span></label>
											<input type="text" name="choiceInput" id="choiceInput" value="" placeholder="입력하신 포인트 x 100" style="margin-left: 16%; width: 70%; display: none;"/>
										</div>
										<div style="margin-top: 5%;">
											<ul class="actions">
												<li style="text-align: center; margin: 0 auto;"><a href="javascript:nextStep1()" class="button primary">충전 방법 선택</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="col-6 col-12-medium" id="payment" style="text-align: center; margin: 0 auto; display: none;">
									<div class="box">
										<div id="paymentBox" style="margin: 5% auto; text-align: left; width: 40%;">
											<input type="radio" id="phone" name="payment-radio" value="phone">
											<label style="width: 100%;" for="phone"><img src="${pageContext.request.contextPath}/images/phone.png" style="width: 48px; height: 48px; vertical-align: middle;"/><span>핸드폰 결제</span></label>
											<input type="radio" id="credit" name="payment-radio" value="credit">
											<label style="width: 100%;" for="credit"><img src="${pageContext.request.contextPath}/images/creditcard.png" style="width: 48px; height: 48px; vertical-align: middle;"/><span>일반 신용카드</span></label>
											<input type="radio" id="voucher" name="payment-radio" value="voucher">
											<label style="width: 100%;" for="voucher"><img src="${pageContext.request.contextPath}/images/voucher.png" style="width: 48px; height: 48px; vertical-align: middle;"/><span>상품권</span></label>
										</div>
										<div style="margin-top: 5%;">
											<ul class="actions">
												<li style="text-align: center; margin-left: auto;"><a href="javascript:backstep()" class="button primary">뒤로 가기</a></li>
												<li style="text-align: center; margin-right: auto;"><a href="javascript:nextStep2()" class="button primary">충전 하기</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="col-6 col-12-medium" id="success1" style="text-align: center; margin: 0 auto; display: none;">
									<div class="box">
										<div id="paymentBox" style="margin: 5% auto; text-align: left; width: 40%; text-align: center;">
											<img src="${pageContext.request.contextPath}/images/paymentSuccess.png" width="100%;">
											<p style="font-size: 150%;">충전 완료</p>
											<p>${m_id.getMemberId()} 회원님</p>
											<p id="resultPoint"><p>
										</div>
										<div style="margin-top: 5%;">
											<ul class="actions">
												<li style="text-align: center; margin: 0 auto;"><a href="${pageContext.request.contextPath}/review/PaymentPopup.rv?m_id=${session_m_id}&trainerId=${trainer.getTrainerId()}" class="button primary">결제하러 가기</a></li>
											</ul>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
			<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	</body>
	<script>
		var pointTemp = 0;
		var memberId = "${param.memberId}";
		var resultPoint = $("#resultPoint");
	
		//직접 입력 창
		$("input[name='coin-radio']:radio").change(function () {
        	var choiceRadio = $("#coinChoice");
			if(choiceRadio.is(':checked') == true){
				$("input:text[name=choiceInput]").show();
			}else if(choiceRadio.is(':checked') == false){
				$("input:text[name=choiceInput]").hide();
			}
		});
		
		//금액 선택 > 결제 방법
		function nextStep1(){
			var arRadio = document.getElementsByName('coin-radio');
			var check = false;
			var choiceInput = $("#choiceInput").val();
			
			for(let i = 0; i < arRadio.length; i++){
				if(arRadio[i].checked){
					pointTemp = arRadio[i].value;
					check = true;
				}
				if(arRadio[4].checked){
					if(choiceInput == "" || choiceInput == undefined){
						console.log(choiceInput);
						console.log("충전하실 포인트를 입력해주세요.");
						check = false;
					}
					if(choiceInput > 1000 && choiceInput % 100 != 0){
						alert("포인트는 최소 1000점부터 100점 단위로 충전이 가능합니다!");
						return false;
					}
					pointTemp = (choiceInput * 100);
					console.log(pointTemp)
				}
			}
			
			if(check){
				$("#payment").show();
				$("#coin").hide();
			}else{
				alert("충전하실 금액을 선택해주세요😀");
			}
		} 
		
		//결제 방법 > 금액 선택
		function backstep(){
			$("#payment").hide();
			$("#coin").show();
		}
		
		//결제 방법 > 결제하기
		function nextStep2(){
			var arRadio = document.getElementsByName('payment-radio');
			var check = false;
			
			$("input[name='point']").val(pointTemp);
			
			for(let i = 0; i < arRadio.length; i++){
				if(arRadio[i].checked){
					check = true;
				}
			}
			
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : pointTemp, //판매 가격
			    buyer_email : 'darktraces@nate.com',
			    buyer_name : '방준호',
			    buyer_tel : '010-4642-0130',
			    buyer_addr : '경기도 안산시 상록구',
			    buyer_postcode : '123-456'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '\n고유ID : ' + rsp.imp_uid;
			        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			        msg += '\n결제 금액 : ' + rsp.paid_amount;
			        msg += '\n카드 승인번호 : ' + rsp.apply_num;
					$.ajax({
						url : "${pageContext.request.contextPath}/review/ReviewPointCharge.rv?point="+pointTemp+"&memberId=${m_id.getMemberId()}",
						type : "get",
						dataType : "text",
						success : function(){
							resultPoint.text(pointTemp/100+"점 충전 성공!");
							if(check){
								$("#payment").hide();
								$("#success1").show();
							}else{
								alert('결제 수단을 선택해주세요😀');
							}
						},
						error : function(){
							console.log("충전 실패");
						}
					});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
		 	/* $.ajax({
				url : "${pageContext.request.contextPath}/review/ReviewPointCharge.rv?point="+pointTemp+"&memberId=${m_id.getMemberId()}",
				type : "get",
				dataType : "text",
				success : function(){
					resultPoint.text(pointTemp/100+"점 충전 성공!");
						$("#payment").hide();
						$("#success1").show();
				},
				error : function(){
					console.log("충전 실패");
				}
			}); */
		}
		
		var IMP = window.IMP; // 생략해도 괜찮습니다.
		IMP.init("imp63501160");
		
	</script>
</html>