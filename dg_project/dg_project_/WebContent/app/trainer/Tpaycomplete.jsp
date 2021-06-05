<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	

		<jsp:include page="../../header.jsp" />
		
			<c:set var="t_vo" value="${t_vo}"/>
			<c:set var="check" value="${check}"/>
			<c:set var="point" value="${param.point}"/>

		<!-- Main -->
			<div id="main">
				<div class="wrapper special" style="padding: 0rem 0 0rem 0 ;">
					<div class="inner">
						<header class="heading">
							<p style="margin: 0 0 0rem 0; font-size:40px; color:#29b6f6; ">노력의 땀방울 환전하기</p>
						</header>
					</div>
				</div>
				
				<div id="Tpaydiv" class="col-6 col-12-medium" id="success1" style="text-align: center; margin: 0 auto; display:none;">
								<div class="box">
									<div id="paymentBox" style="margin: 5% auto; text-align: left; width: 25%; text-align: center;">
										<img src="${pageContext.request.contextPath}/images/paymentSuccess.png" width="100%;">
										<p style="font-size: 150%;">환전 완료</p>
										<p>${t_vo.getTrainerId()} 회원님</p>
										<p>환전 금액 : <fmt:formatNumber type="number" pattern="0" value="${(point * 100) - (point * 100) * 0.05}"/>원<p>
										<p>현재 포인트 : ${t_vo.getTrainerPoint()}<p>
										<a class="button small" href="${pageContext.request.contextPath}/trainer/TrainerMypageView.tr?t_id=${t_vo.getTrainerId()}">돌아가기</a>
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
			var check;
			var pageContext = "${pageContext.request.contextPath}";
			
			check='<c:out value="${check}"/>';
			
				if(check=='false'){
					alert("환전할 포인트가 부족합니다");
					location.href=pageContext+"/trainer/Tpay.tr"
				}else{
					$("#Tpaydiv").show();
				}
			
				
				
			</script>
	</body>
</html>