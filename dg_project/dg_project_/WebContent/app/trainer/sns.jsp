<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
	<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>트레이너SNS</title>
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
				padding: 5rem 0 0 0 !important;
			}
		
			.modal { 
				position:absolute; 
				width:100%; 
				height:100%; 
				background: rgba(0,0,0,0.8); 
				top:0; 
				left:0;
				z-index: 10000; 
				display:none;
			}
			
			#area1 img{
				overflow: hidden;
				display: flex;
				align-items: center;
				justify-content: center;
				width: 300px;
				height: 300px;
				margin: 0 auto;
			}
			
			#modalImg {
				overflow: hidden;
				display: flex;
				align-items: center;
				justify-content: center;
				width: 25%;
				height: 25%;
				margin: 0 auto;
			}
			
			.headul {
				margin-bottom: 1rem;			
			}
			
			@media screen and (max-width: 1680px){
				#area3 { margin-top: 4.5% !important; }
				#modalImg {
					width: 41% !important;
				}
			}
			
			@media screen and (max-width: 1280px){
				#area2 {
					width: 18% !important;
					margin-left: 2%;
					margin-top: 3%;
				}
				
				#area3 {
					margin-top: 8% !important;
				}
				
				#modalImg {
					width: 40% !important;
				}
			}
			
			@media screen and (max-width: 980px){
				#area1 {
					margin-left: 10% !important;					
				}
				
				#area2 {
					margin-left: 8%;
					margin-top: 3%;
					width: 22% !important;
				}
				
				#area3 {
					margin-right: 10% !important;
					margin-top: 10% !important;
				}
				
				#modalImg {
					width: 60% !important;
				}
			}
			
			@media screen and (max-width: 736px){
				#headHr {width: 90% !important;}
				#area1 {
					margin-left: 0% !important;
				}
			@media screen and (max-width: 1681px){
				
				}
				
				#area2 {
					width: 24% !important;
					margin-top: 6%;
					margin-left: 17%;
				}
				
				#area3 {
					width: 27%;
					margin-right: 0 !important;
					margin-top: 13% !importnat;
				}
				
				#modalImg {
					width: 80% !important;
				}				
				
				.col-4 {
					height: 230px !important;
				}
			}
			
			@media screen and (max-width: 1680px){
				.viewDiv {
					left: 477px !important;
				}
				
				.trash {
					left: 161px !important;
				}
			}
			
			@media screen and (max-width: 1280px){
				.trash {
					left: 27% !important;
				}
			}
			
			@media screen and (max-width: 980px){
				.trash {
					width: 40px !important;
					height: 40px !important;
					top: 0px !important;
					left: 85% !important;
				}	
			}
			
			@media screen and (max-width: 736px){
				.trash {
					left: 82% !important;
				}	
			}
			
			@media screen and (max-width: 480px){
				#area1 {
					float: none !important;
					width: 100% !important;
					margin-left: 0 !important;
				}
				
				#area2 {
					width: 100% !important;
					margin-top: 5%;
					text-align: center;
					margin-left: 0%;
					float: none !important;
				}
				
				#area3 {
					width: 100% !important;
					float: none !important;
					margin: 0 !important;  
				}
				 
				#area3 li {
					float: left;
				}
				 
				#li1, #li2 {
					margin-right: 10%;
				}
				 
				.modal {
					width:0% !important; 
					height:0% !important; 
				}

				.col-4 {
					width: 100% !important;
					height: 100% !important;
					/* pointer-events: none; */
				}
				
				.modalTest {
					pointer-events: none;
				}
				
				#li4 {
					margin-left: 10%;
				}				 
				
				#li1 {
					margin-left: 25%;
				}
		
				#snsUpload {
					display: block;
				}
				
				#snsOk {
					width: 45% !important;
					float: left;
					margin-left: 3%;
					margin-right: 1%;
				}
				
				#snsCancle {
					width: 45% !important;
					float: left;
					margin-left: 3%;
					margin-bottom: 5% !important;
				}
				
				#ready, #profileimagecancel3 {
					visibility: visible !important;
					margin: 0 !important;
				}
				
				.trash {
					width: 45px !important;
					height: 45px !important;
					left: 90% !important;
				}
				
				#changeProfile {
					display: none;
				}
			}
			
			.col-4 {
    			width: 380px;
			    height: 400px;
			    overflow: hidden;
			    margin: 0 auto;
			    display: grid;
			    vertical-align: middle;
			}

			.col-4 img {
			    width: 100%;
			    height: 100%;
			    object-fit: contain;
			}
			
			.image {
				background-color: black;
			}
			

			
		</style>
	</head>
	
	<body class="is-preload" style="font-family: 'BMHANNAAir';">
		<jsp:include page="../../header.jsp"/>
	<c:set var="t_vo" value="${t_vo}"/>
	<c:set var="list" value="${imageList}"/>
	<c:set var="profileimages" value="${profileimages}"/>
	<c:set var="p_vo" value="${p_vo}"/>
		<!-- Main -->
		

		<div id="main">
			<div class="wrapper">
				<div class="inner">
					<div class="row" style="margin: 0;">
						<div id="headArea" style="width: 100%; padding: 0; margin-bottom: 3%;">
							<div class="modalTest" id="area1" style="width: 30%; float: left; margin-left: 15%; text-align: center;">
								<c:choose>
									<c:when test="${p_vo.getFileName() != null}">
										<img style="border-radius: 70%;" src="${pageContext.request.contextPath}/files/${p_vo.getFileName()}" onclick="findSrc(this)">
									</c:when>
									<c:otherwise>
										<img style="border-radius: 70%;" src="${pageContext.request.contextPath}/images/blackLogo.jpg" onclick="findSrc(this)">
									</c:otherwise>								
								</c:choose>
							</div>
							<div id="area2" style="width: 20%; float: left;">
								<h3>${t_vo.getTrainerId()}</h3>
								<h4>${t_vo.getTrainerName()} 트레이너</h4>
								
								<ul class="actions headul">
								<c:choose>
								<c:when test="${session_t_id ne null and session_t_id eq t_vo.getTrainerId()}">
									<li><a href="javascript:deleteCheck()" id="imagedelete" class="button primary">사진 삭제</a></li>
									<li style="display:none;" id="deleteli">
										<form id="deleteready" name="deleteready" action="${pageContext.request.contextPath}/trainer/TrainerSnsImageDelete.tr?TrainerId=${t_vo.getTrainerId()}" enctype="multipart/form-data">
											<input id="deletesrc" name="deletesrc" type="hidden" placeholder="삭제할사진을 클릭해주세요">
											<input name="TrainerId" value="${t_vo.getTrainerId()}" style="display:none;">
											<%-- <button class="button primary">완료</button> 
											<a id="profileimagecancel2" href="${pageContext.request.contextPath}/trainer/sns.tr?TrainerId=${t_vo.getTrainerId()}" class="button primary" style="display:none;">취소</a>--%>
										</form>
									</li>
								</c:when>
								</c:choose>
								</ul>
								
								<ul id="snsUpload" class="actions headul" style="list-style:none; padding: 0;">
									<c:choose>
										<c:when test="${session_t_id ne null and session_t_id eq t_vo.getTrainerId()}">
											<li><span class="button" id="upload">사진 업로드</span></li>
											<li id="snsOk"><a href="javascript:imageBoard()" class="button" id="ready" style="visibility: hidden; margin-top: 1%;"> 완료</a></li>
											<li id="snsCancle"><a id="profileimagecancel3" href="${pageContext.request.contextPath}/trainer/sns.tr?TrainerId=${t_vo.getTrainerId()}" class="button" style="visibility: hidden; margin-top: 1%;">취소</a></li>
										</c:when>
									</c:choose>
								</ul>
								
								<ul id="changeProfile" class="actions headul" style="list-style:none; padding: 0;">
								<c:choose>
								<c:when test="${session_t_id ne null and session_t_id eq t_vo.getTrainerId()}">
									<li><a id="profileimage"  class="button primary">프로필 변경</a></li>
									<li><a id="profileimageReady" href="javascript:profilesub()" class="button primary" style="display:none; margin-top: 1%;">완료</a></li>
									<li><a id="profileimagecancel1" href="${pageContext.request.contextPath}/trainer/sns.tr?TrainerId=${t_vo.getTrainerId()}" class="button primary" style="display:none; margin-top: 1%;">취소</a></li>
								</c:when>
								</c:choose>
								</ul>
									
							</div>
							<div id="area3" style="width: 20%; float: left; margin-right: 15%; margin-top: 5.5%;">
								<ul style="list-style: none;">
									<li id="li1"><h4>경력 <span>${t_vo.getTrainerAccount()}</span></h4></li>
									<li id="li3"><h4>트레이닝 횟수 <span>${t_vo.getTrainerLike()}</span></h4></li>
								</ul>								
							</div>
						</div>
						<hr id="headHr" style="width: 70%; margin:  0 auto;">
						<div class="modal" style="margin: 0 auto;">
							<div class="modal_content" style="text-align: center; margin-top: 10%;">
								<img id="modalImg" src="">
							</div>
						</div>
					</div>
					
					<div class="box alt" id="photo" style="margin-top: 1%;">
						<div class="row gtr-50 gtr-uniform">
						
						 <c:choose>
             			  <c:when test="${list != null and fn:length(list) > 0}">
	               			<c:forEach var="b_bean" items="${list}" varStatus="i">
								<div class="col-4">
									<div class="image fit">
										<img src="${pageContext.request.contextPath}/files/${b_bean.getFileName()}" alt="" onclick="findSrc(this, ${i.index})"/>
										<div class="viewDiv" onclick="boardModal('${b_bean.getFileName()}')" style="position: absolute; width: 40px; height: 40px; top:0px; left: 413px;">
											<img src="${pageContext.request.contextPath}/images/view.png" alt="" style="width: 100%; height: 100%;"/>
										</div>
										<div class="trash" id="${i.index}" style="position: absolute; width: 200px; height: 200px; top:86px; left: 122px; visibility: hidden;">
											<img src="${pageContext.request.contextPath}/images/trash.png" alt="" style="width: 100%; height: 100%;"/>
										</div>
									</div>
								</div>
					     </c:forEach>
	           				</c:when>
	           <c:otherwise>
	           		<div  align="center" style=" margin: 0 auto;">등록된 게시물이 없습니다.</div>
	          	 </c:otherwise>
               				</c:choose>
               				
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
			<input id="profileImage" type="file" accept="" style="display: none;" id="profileUpload">
		<!-- 사진 업로드 -->
		<form name="imagesBoard" method="post" action="${pageContext.request.contextPath}/trainer/TrainerSnsImage.tr?TrainerId=${t_vo.getTrainerId()}" enctype="multipart/form-data">
			<input name="boardImage" id="boardImage" type="file" accept="" style="display: none;" id="fileUpload">
		</form>
		<!--프로필변경  -->
		
		<form  name="profileForm" id="profileForm" method="post" action="${pageContext.request.contextPath}/trainer/TrainerSnsProfileImage.tr?TrainerId=${t_vo.getTrainerId()}"  enctype="multipart/form-data">
		<input name="profileInput" id="profileInput" type="file"  style="display:none;" >
		<input name="TrainerId" id="TrainerId" type="text"  style="display:none;" value="${t_vo.getTrainerId()}" > 
		</form>
		
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
				<script>
				function imageBoard(){
					var boardImage=document.getElementById("boardImage").value;
					if(boardImage !=""){
						imagesBoard.submit();
						}else{
							alert("사진을 선택해주세요");
						}
				}
				function profilesub(){
					
					var profileInput=document.getElementById("profileInput").value;
					
					
					if(profileInput !=""){
					profileForm.submit();
					}else{
						alert("사진을 선택해주세요");
					}
				}
				</script>
		<script>
			
			function changeLike(){
				if($("#likeImg").attr("src") == "images/likebtn2.png"){
					alert("좋아요를 누르셨습니다.");
					document.getElementById("likeImg").src = "images/likebtn1.png";
				}else{
					alert("좋아요를 취소셨습니다.");
					document.getElementById("likeImg").src = "images/likebtn2.png";
				}
			}
			
			function boardModal(img){
				var temp = img;
				document.getElementById('modalImg').src = "${pageContext.request.contextPath}/files/"+img;
			}
		
			function findSrc(obj, i){
				document.getElementById('modalImg').src = $(obj).attr('src') ;
				var src1 = $(obj).attr('src');
				
				/*console.log(src1); */				
				document.getElementById('deletesrc').value=src1;
				console.log(document.getElementById('deletesrc').value);
				for(let k=0; k < "${fn:length(list)}"; k++){
					$("#"+k).css("visibility", "hidden");		
				}				
				$("#"+i).css("visibility", "visible");
				
				
			}
		
			$(function(){
				
				$("#profileimage").click(function(){
					$("#imagedelete").hide();				
					$("#upload").hide();
					$("#profileInput").click();
					$("#profileimageReady").show();
					$("#profileimagecancel1").show();
				});
				
				/* $("#imagedelete").click(function(){
				$("#imagedelete").hide();
				$("#profileimage").hide();
				$("#upload").hide();
				$("#deleteli").show();
				$("#profileimagecancel2").show();
				}); */
				
				$("#upload").click(function(){
					$("#imagedelete").css("visibility", "hidden");
					$("#profileimage").hide();
					$("#boardImage").click();
					$("#ready").css("visibility", "visible");
					$("#profileimagecancel3").css("visibility", "visible");
				});
				
				$(".modalTest").click(function(){
					$(".box").hide();
					$("#footer").hide();
					$(".modal").fadeIn();
				});
				
				$(".modal_content").click(function(){
					$(".box").show();
					$("#footer").show();
					$("#headArea").show();
					$(".modal").fadeOut();
				});
				
				$(".viewDiv").click(function(){
					$(".box").hide();
					$("#footer").hide();
					$(".modal").fadeIn();
				});

			
				$("#snsBtn1").click(function(){
					$("#snsBtn1").css('font-size','150%');
					$("#snsBtn2").css('font-size','100%');
					$("#photo").show();
					$("#movie").hide();
				});
				
				$("#snsBtn2").click(function(){
					$("#photo").hide();
					$("#snsBtn2").css('font-size','150%');
					$("#snsBtn1").css('font-size','100%');
					$("#movie").show();
				});
				
				$("#profileModify").click(function(){
					$("#profileUpload").trigger("click");
					});
				$("#upload").click(function(){
					$("#fileUpload").trigger("click");
					});
			});

			//모달창 오픈 시 스크롤 막기
			$(".modal").on('scroll touchmove mousewheel', function(e){
				e.preventDefault();
				e.stopPropagation(); 
				return false;
			});
			
			function deleteCheck(){
				var checkFile = $("input[name='deletesrc']").val();
				var Reaffirmation = false;
				if(checkFile == ""){
					alert("삭제 할 사진을 선택해주세요.");
					return false;
				}else{
					Reaffirmation = confirm("정말로 삭제 하시겠습니까?");
					if(Reaffirmation){
						deleteready.submit();
					}else{
						console.log("test");
						return false;
					}
				}
			}
		</script>
	</body>
</html>