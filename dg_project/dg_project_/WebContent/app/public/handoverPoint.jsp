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
		<title>결제하기 페이지</title>
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
    			#handoverCheck, #handoverSuccess {
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
				
				#paymentBox {
					width: 35% !important;
				}
				
			}
    		@media screen and (max-width: 480px){
    			#handoverCheck, #handoverSuccess {
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
		</style>
	</head>
	<body class="is-preload" style="font-family: 'BMHANNAAir';">
		<c:set var="trainer" value="${trainer}"/>
		<c:set var="m_vo" value="${m_id}"/>
		<!-- Main -->
			<div id="main">
				<div class="wrapper">
					<div class="inner">
						<div class="row gtr-200">
							<div class="col-6 col-12-medium" id="coin" style="text-align: center; margin: 0 auto;">
								<div class="box">
									<form>
										<div id="handoverCheck" style="margin: 5% auto; text-align: left; width: 60%;">
											<div style="width: 60%; margin: 0 auto; margin-bottom: 5%;">
												<img src="${pageContext.request.contextPath}/images/handover.png" alt="" style="width: 100%;"/>
											</div>
											<p style="font-size: 180%; font-family: 'BMEULJIRO';">결제 정보를 확인해주세요.</p>
											<p>트레이너 : ${trainer.getTrainerName()} 트레이너</p>
											<p>가격 : ${trainer.getTrainerPrice()} 포인트</p>
											<p>현재 포인트 : ${m_vo.getMemberPoint()}</p>
											<div style="margin-top: 5%;">
												<ul class="actions">
													<li style="text-align: center; margin-left: auto;"><a href="${pageContext.request.contextPath}/review/Payment.rv?m_id=${session_m_id}&trainer=${trainer.getTrainerId()}" class="button primary">충전하기</a></li>
													<li style="text-align: center; margin-right: auto;"><a href="javascript:paymentCheck()" class="button primary">결제하기</a></li>
												</ul>
											</div>
										</div>
									</form>
									<div id="handoverSuccess" style="margin: 5% auto; text-align: left; width: 60%; display: none;">
										<div style="width: 60%; margin: 0 auto; margin-bottom: 5%;">
											<img src="${pageContext.request.contextPath}/images/paymentSuccess.png" width="100%;">
										</div>
										<p style="font-size: 180%; font-family: 'BMEULJIRO';">결제 완료!</p>
										<p>${trainer.getTrainerName()} 트레이너님께</p>
										<p>${trainer.getTrainerPrice()} 포인트를 지불하셨습니다.</p>
										<div style="margin-top: 5%;">
											<ul class="actions">
												<li style="text-align: center; margin: 0 auto;"><a href="javascript:window.close()" class="button primary">종료하기</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
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

	</body>
	<script>
		function paymentCheck(){
			var check = confirm("트레이너 정보를 확인하셨나요?");
			if(check){
				<c:if test="${m_vo.getMemberPoint() < trainer.getTrainerPrice()}">
					alert("포인트가 부족합니다😭");
					return false;
				</c:if>
				$.ajax({
					url : "${pageContext.request.contextPath}/review/Handover.rv?m_id=${m_vo.getMemberId()}&trainer=${trainer.getTrainerId()}&price=${trainer.getTrainerPrice()}",
					type : "get",
					dataType : "text",
					success : function(){
						console.log("결제 성공");
					}
				});
				
				$("#handoverCheck").hide();
				$("#handoverSuccess").show();
			}
		}
	</script>
</html>