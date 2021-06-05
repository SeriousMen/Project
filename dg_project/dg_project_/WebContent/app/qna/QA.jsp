<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!--
   Visualize by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>
	<head>
	<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>자주 묻는 질문</title>
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
			
			
			@media screen and (max-width: 1680px){
				#ul1, #ul2 {
					width: 60% !important;
				}
			}
			
			@media screen and (max-width: 1280px){
				#ul1, #ul2 {
					width: 100% !important;
				}
			}
			
			@media screen and (max-width: 736px){
				.box {
					width: 90% !important;
				}
				
				#buttonDiv {
					width: 100% !important;
				}
				
				
			}
			
			@media screen and (max-width: 480px){
				.box {
					width: 90% !important;
				}
			}
			
			.logo {
				width: 40%;
				padding-left: 20% !important;
			}
			
			.logo img {
				width: 48px;
				height: 48px;
				vertical-align: sub;
				margin-right: 3%;
			}
			
			@media screen and (max-width: 980px){
				.logo img {
					width: 40px !important;
					height: 40px !important;
				}
			}
			
			@media screen and (max-width: 736px){
				.logo {
					padding-left: 4% !important;
				}
			}
			
			#mobile{display:none;}
			
			@media (max-width:480px){
				#desktop{display:none;}
				#mobile{display:block;}
				
				ul#mobile:not(.fixed) li .button {
				    width: 11%;
				}
				
				.column4 {
					display: none;
				}
				
				table th {
					padding: 0.75rem 0.3rem;
				}
				
				table td {
					padding: 0.75rem 0.3rem;
				}
				
				#report {
					width: 100% !important;
				}
			}		
		table tbody tr:nth-child(2n + 1) {
      background-color: white;
   }	
		</style>
	</head>
	<body class="is-preload" style="font-family: 'BMHANNAAir';">
	<%-- 	<c:set var="t_vo" value="${t_vo}"/>
		<c:set var="m_vo" value="${m_vo}"/> --%>
		<!-- Header -->
		<header id="header">
			<a class="logo" href="${pageContext.request.contextPath}/index.jsp"><img src=${pageContext.request.contextPath}/images/tplogo.png>득근득근</a>
			<nav>
				<a id="changeButton" href="javascript:change()" style="font-size: 20px;">REPORT</a>
			</nav>
		</header>

		<!-- Main -->
		<div id="main" class="qna">
			<div id="qna">
				<div class="wrapper special" style="padding: 0rem 0 0rem 0 ;">
					<div class="inner">
						<header class="heading" style="margin: 0 auto 0rem auto; font-family: 'BMEULJIRO';">
							<p style="font-size:55px;"><span style="margin: 0 0 0rem 0;">FQA</span></p>
							<p style="font-size:35px; display:inline; margin-right:10%; "><span id="span1" style="cursor: pointer;">회원</span></p>
							<p style="font-size:25px; display:inline;"><span id="span2" style="cursor: pointer; font-size: 75%;">트레이너</span></p>
						</header>
					</div>
				</div>
				<div class="box" data-position="center" style="width: 60%; margin: 0 auto;">
					<ul class="alt" id="ul1" style="width:55%; margin: 0 auto;">
						<h4>회원 자주 묻는 질문</h4>
						<li style="cursor: pointer;" id="list1" >득근득근 탈퇴하려면 어떻게 해야하나요?<div id="div1" class="box" style="display:none;"><p>한 번의 회원가입으로 여러 개의 상담글을 작성할 수 있기 때문에 여러 번 회원가입을 하실 필요가 없습니다.</p></div></li>
						<li style="cursor: pointer;" id="list2" >득근득근 회원가입하지 않고 비회원으로 상담을 받을 수 있나요?<div id="div2" class="box" style="display:none;"><p>저희 득근득근 서비스는 비회원으로 트레이너 검색결과와 운동성향은 알아 볼수 있지만 상담은 불가능하오니 회원가입 또는 로그인을 하여 이용해주시길 바랍니다.</p></div></li>
						<li style="cursor: pointer;" id="list3" >득근득근 아이디는 몇개까지 만들수있나요?<div id="div3" class="box" style="display:none;"><p>한 번의 회원가입으로 여러 개의 pt를 상담하고 받을 수 있기 때문에 여러 번 회원가입을 하실 필요가 없습니다.</p></div></li>
						<li style="cursor: pointer;" id="list4" >득근득근 아이디와비밀번호 변경은 어떻게하나요?<div id="div4" class="box" style="display:none;"><p>회원 마이페이지의 들어가 정보수정에서 아이디와 비밀번호를 수정해주시고 수정버튼을 눌러주세요</p></div></li>
						<li style="cursor: pointer;" id="list5" >득근득근 회원가입에 나이 제한이 있나요??<div id="div5" class="box" style="display:none;"><p>만 14세 이상인 경우, 회원가입이 가능합니다.
						운동하기을 하기엔 만 14세 미만 미성년자가 스스로 판단하기 힘든 문제일 수 있습니다. 14세 미만인 경우, 112 경찰청 또는 1577-1391 아동보호전문기관에 연락해 도움을 받아보세요</p></div></li>
					</ul>
					<ul class="alt" id="ul2" style="display:none; width:55%; margin: 0 auto;">
						<h4>트레이너 자주 묻는 질문</h4>
						<li style="cursor: pointer;" id="Plist1" >트레이너 회원 가입 자격이 있나요?<div id="Pdiv1" class="box" style="display:none;"><p>대한민국 트레이너 자격증을 보유한 트레이너님이라면 누구나 무료로 가입을 할 수 있습니다. 단, 등록 전이거나 휴업상태인 트레이너님이시라면 운영팀으로 문의주세요.</p></div></li>
						<li style="cursor: pointer;" id="Plist2" >트레이너회원 가입 절차는 어떻게 되나요?<div id="Pdiv2" class="box" style="display:none;"><p>회원가입하기→ 트레이너로 가입하기 → 정보입력 → 가입신청 → 자격 확인 → 최종 가입 승인'의 절차를 거칩니다. 가입이 승인되면 필수 프로필 정보를 입력해주시면 바로 사용이 가능합니다</p></div></li>
						<li style="cursor: pointer;" id="Plist3" >트레이너회원의 최종 가입 승인은 어떻게 하나요?<div id="Pdiv3" class="box" style="display:none;"><p>득근득근은 트레이너 자격 취득 여부가 확인된 트레이너만이 상담을 제공할 수 있기 때문에 대한트레이너협회 등의 기관을 통한 확인 후 가입이 승인됩니다.</p></div></li>
						<li style="cursor: pointer;" id="Plist4" >아이디/비밀번호 분실했어요.<div id="Pdiv4" class="box" style="display:none;"><p>로그인 페이지 → '아이디/비밀번호 찾기' 를 이용하시면 됩니다.아이디는 회원 가입시 기입한 이메일 주소로 전송되며, 비밀번호는 아이디와 이메일 주소를 알려주시면, 비밀 번호를 초기화 할 수 있는 이메일을 전송해 드립니다</p></div></li>
						<li style="cursor: pointer;" id="Plist5" >트레이너 프로필 사진 업로드가 안됩니다.<div id="Pdiv5" class="box" style="display:none;"><p>프로필 사진은 정해진 규격과 파일 크기에 맞추어야 하기 때문에 정해진 규격의 맞추어 등록해주시길 바랍니다.</p></div></li>
					</ul>
				</div>
				
				<div id="buttonDiv" style="margin: 0 auto; width: 60%;">
				<c:choose>
				<c:when test="${session_t_id !=null}">
						<ul class="actions">
						<li style="margin-left: auto; margin-top: 2%;"><a href="${pageContext.request.contextPath}/qnaboard/BoardList.qn?sessionId=${t_vo.getTrainerId()}" class="button primary">문의하기</a></li>
					</ul>
				</c:when>
				<c:when test="${session_m_id !=null}">
						<ul class="actions">
						<li style="margin-left: auto; margin-top: 2%;"><a href="${pageContext.request.contextPath}/qnaboard/BoardList.qn?sessionId=${m_vo.getMemberId()}" class="button primary">문의하기</a></li>
					</ul>
				</c:when>
				</c:choose>
				</div>
			</div>
			<div class="wrapper special" style="padding: 0rem 0 0rem 0 ;">
			<c:set var="list" value="${reportList}"/>
			<c:set var="totalCnt" value="${totalCnt}"/>
      		<c:set var="startPage" value="${startPage}"/>
      		<c:set var="endPage" value="${endPage}"/>
     		<c:set var="nowPage" value="${nowPage}"/>
      		<c:set var="realEndPage" value="${realEndPage}"/>
			
				<div class="inner" >
					<div id="report" style="display: none; width: 60%; margin: 0 auto;">
						<p style="font-size:55px; text-align: center; font-family: 'BMEULJIRO';"><span style="margin: 0 0 0rem 0;">신고 게시판</span></p>
						<div id="buttonDiv" style="margin: 0 auto;">
							<ul class="actions">
								<li style="margin-left: auto; margin-top: 2%;"><a href="${pageContext.request.contextPath}/report/ReportdWrite.rp?page=${nowPage}" class="button primary" >신고하러가기</a></li>
							</ul>
						</div>
						<table style="width: 100%; margin: 0 auto">
							<thead>
								<tr align="center" valign="middle">
									<th>
									<div align="center">번호</div>
									</th>
									<th>
									<div align="center">제목</div>
									</th>
									<th>
									<div align="center">아이디</div>
									</th>
									<th>
									<div align="center">날짜</div>
									</th>
									
									<th>
									<div align="center">조회수</div></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${list != null and fn:length(list) > 0}">
	               						<c:forEach var="rp_list" items="${list}">
											<tr align="center">
												<td id="test">${rp_list.getReportNum()}
												</td>
												
												<td>
												<div align="left">
												<a href="${pageContext.request.contextPath}/report/ReportViewOkAction.rp?reportNum=${rp_list.getReportNum()}&page=${nowPage}"  style="text-decoration:none">
	               									${rp_list.getReportTitle()}
	               								</a>
												</div>
												</td>
												
												
												<td>
												<div align="center">
												${rp_list.getReportId()}
												</div>
												</td>
											
												
												
												<td>
												<div align="center">
												${fn:substring(rp_list.getUpload(),0,16)}
												</div>
												</td>
												
												
												<td>
												<div align="center">
												${rp_list.getReadCount()}
												</div>
												</td>
												
											</tr>
										</c:forEach> 
									</c:when>
									 <c:otherwise>
										<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
									</c:otherwise> 
								</c:choose>
								
							</tbody>
						</table>
						<div>
							<ul id="desktop" class="actions" style="justify-content:center;">
								<c:if test="${nowPage>1}">
									<li><a href="${pageContext.request.contextPath}/report/ReportListOkAction.rp?page=${nowPage-1}" class="button primary small pages" id="prev" style="box-shadow:none;">&lt;</a></li>
								</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:choose>
										<c:when test="${i eq nowPage}">
										<li><a href="#" class="button primary small pages" style="box-shadow:none; background-color: black; color: white !important;">${i}&nbsp;</a></li>	
										</c:when>
										<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/report/ReportListOkAction.rp?page=${i}" class="button primary small pages" style="box-shadow:none;">${i}&nbsp;</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${realEndPage != nowPage}">
									<li><a href="${pageContext.request.contextPath}/report/ReportListOkAction.rp?page=${nowPage + 1}" class="button primary small pages" id="next" style="box-shadow:none;">&gt;</a></li>
								</c:if>
							</ul>
							<ul id="mobile" class="actions" style="justify-content:center;">
								<li>
									<c:if test="${nowPage > 1}">
									<a href="${pageContext.request.contextPath}/report/ReportListOkAction.rp?page=${nowPage - 1}" class="button primary small pages" id="prev" style="box-shadow:none;">&lt;</a>
									</c:if>
									<a href="#" class="button primary small pages" style="box-shadow:none; background-color: black; color: white !important;">${nowPage}&nbsp;</a>
									<c:if test="${realEndPage != nowPage}">
									<a href="${pageContext.request.contextPath}/report/ReportListOkAction.rp?page=${nowPage + 1}" class="button primary small pages" id="next" style="box-shadow:none;">&gt;</a>
									</c:if>
									</li>
							</ul>
						</div>
					</div>
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
		<script>
			function change(){
				if($("#qna").css("display") == 'none'){
					$("#qna").show();
					$("#report").hide();
					$("#changeButton").text("REPORT");
				}else{
					$.ajax({
						url : "${pageContext.request.contextPath}/report/ReportListOkAction.rp",
						type : "post",
						dataType : "text",
						success : function(){
							
							$("#report").show();
							$("#qna").hide();
							$("#changeButton").text("Q&A");
						}
					})
				
				}
			}
		
			$(function(){
				$("#list1").click(function(){
					$("#div2").hide();
					$("#div3").hide();
					$("#div4").hide();
					$("#div5").hide();
					$("#list2").css('color','black');
					$("#list3").css('color','black');
					$("#list4").css('color','black');
					$("#list5").css('color','black');
					$("#list1").css('color','#29b6f6');
					$("#div1").css('color','black');
					$("#div1").show();
				});
				$("#list2").click(function(){
					$("#div1").hide();
					$("#div3").hide();
					$("#div4").hide();
					$("#div5").hide();
					$("#list1").css('color','black');
					$("#list3").css('color','black');
					$("#list4").css('color','black');
					$("#list5").css('color','black');
					$("#list2").css('color','#29b6f6');
					$("#div2").css('color','black');
					$("#div2").show();
				});
				$("#list3").click(function(){
					$("#div1").hide();
					$("#div2").hide();
					$("#div4").hide();
					$("#div5").hide();
					$("#list1").css('color','black');
					$("#list2").css('color','black');
					$("#list4").css('color','black');
					$("#list5").css('color','black');
					$("#list3").css('color','#29b6f6');
					$("#div3").css('color','black');
					$("#div3").show();
				});
				$("#list4").click(function(){
					$("#div1").hide();
					$("#div2").hide();
					$("#div3").hide();
					$("#div5").hide();
					$("#list1").css('color','black');
					$("#list2").css('color','black');
					$("#list3").css('color','black');
					$("#list5").css('color','black');
					$("#list4").css('color','#29b6f6');
					$("#div4").css('color','black');
					$("#div4").show();
				});
				$("#list5").click(function(){
					$("#div1").hide();
					$("#div2").hide();
					$("#div3").hide();
					$("#div4").hide();
					$("#list1").css('color','black');
					$("#list2").css('color','black');
					$("#list3").css('color','black');
					$("#list4").css('color','black');
					$("#list5").css('color','#29b6f6');
					$("#div5").css('color','black');
					$("#div5").show();
				});
				$("#span1").click(function(){
					$("#ul2").hide();
					$("#span2").css('font-size','75%');
					$("#span1").css('font-size','100%');
					$("#ul1").show();
				});
				$("#span2").click(function(){
					$("#ul1").hide();
					$("#span1").css('font-size','50%');
					$("#span2").css('font-size','125%');
					$("#ul2").show();
				});
				$("#Plist1").click(function(){
					$("#Pdiv2").hide();
					$("#Pdiv3").hide();
					$("#Pdiv4").hide();
					$("#Pdiv5").hide();
					$("#Plist2").css('color','black');
					$("#Plist3").css('color','black');
					$("#Plist4").css('color','black');
					$("#Plist5").css('color','black');
					$("#Plist1").css('color','#29b6f6');
					$("#Pdiv1").css('color','black');
					$("#Pdiv1").show();
				});
				$("#Plist2").click(function(){
					$("#Pdiv1").hide();
					$("#Pdiv3").hide();
					$("#Pdiv4").hide();
					$("#Pdiv5").hide();
					$("#Plist1").css('color','black');
					$("#Plist3").css('color','black');
					$("#Plist4").css('color','black');
					$("#Plist5").css('color','black');
					$("#Plist2").css('color','#29b6f6');
					$("#Pdiv2").css('color','black');
					$("#Pdiv2").show();
				});
				$("#Plist3").click(function(){
					$("#Pdiv1").hide();
					$("#Pdiv2").hide();
					$("#Pdiv4").hide();
					$("#Pdiv5").hide();
					$("#Plist1").css('color','black');
					$("#Plist2").css('color','black');
					$("#Plist4").css('color','black');
					$("#Plist5").css('color','black');
					$("#Plist3").css('color','#29b6f6');
					$("#Pdiv3").css('color','black');
					$("#Pdiv3").show();
				});
				$("#Plist4").click(function(){
					$("#Pdiv1").hide();
					$("#Pdiv2").hide();
					$("#Pdiv3").hide();
					$("#Pdiv5").hide();
					$("#Plist1").css('color','black');
					$("#Plist3").css('color','black');
					$("#Plist2").css('color','black');
					$("#Plist5").css('color','black');
					$("#Plist4").css('color','#29b6f6');
					$("#Pdiv4").css('color','black');
					$("#Pdiv4").show();
				});
				$("#Plist5").click(function(){
					$("#Pdiv1").hide();
					$("#Pdiv2").hide();
					$("#Pdiv3").hide();
					$("#Pdiv4").hide();
					$("#Plist1").css('color','black');
					$("#Plist3").css('color','black');
					$("#Plist2").css('color','black');
					$("#Plist4").css('color','black');
					$("#Plist5").css('color','#29b6f6');
					$("#Pdiv5").css('color','black');
					$("#Pdiv5").show();
				});
			});
			
	
		</script>
	</body>
</html>