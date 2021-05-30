<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
	<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>Q&A게시판</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<style>
			#mobile{display:none;}
			
			@media (max-width:480px){
				#desktop{display:none;}
				#mobile{display:block;}
				
				ul#mobile:not(.fixed) li .button {
				    width: 11%;
				}
				
				.column4, .column5 {
					display: none;
				}
				
				table th {
					padding: 0.75rem 0.3rem;
				}
				
				table td {
					padding: 0.75rem 0.3rem;
				}
				
				#tableWidth {
				}
			}
			
			@media screen and (max-width: 736px) {
				#tableWidth {
					width: 100% !important;
				}
			}
			
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
			
			table tbody tr:nth-child(2n + 1) {
				background-color: white;
			}
			
			table a {
				text-decoration: none;
			}
			
			.wrapper {
    			padding: 0;
    		}
		</style>
	</head>
	
	 
	  <c:set var="list" value="${boardList}"/>
	  <c:set var="totalCnt" value="${totalCnt}"/>
      <c:set var="startPage" value="${startPage}"/>
      <c:set var="endPage" value="${endPage}"/>
      <c:set var="nowPage" value="${nowPage}"/>
      <c:set var="realEndPage" value="${realEndPage}"/>
     
      
      
	<body class="is-preload" style="font-family: 'BMHANNAAir';">

		<!-- Header -->
		<jsp:include page="../../header.jsp"/>
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
				<div class="wrapper special" style="padding: 0rem 0 0rem 0 ;">
					<div class="inner">
						<header class="heading">
							<p style="margin: 0 0 0rem 0; font-size:40px;">득근득근 Q&A 게시판</p>
						</header>
					</div>
				</div>
				
			
				
				<div class="wrapper">
					<div class="inner">
						<div class="row gtr-200">
							<div id="tableWidth" style="margin: 0 auto; width: 80%;">
								
								<div class="table-wrapper">
								<c:choose>
								
								<c:when test="${session_m_id !=null || session_t_id!=null}">
								<form name="writeForm" action="${pageContext.request.contextPath}/app/qna/QAWrite2.jsp">
									<ul class="actions">
										<li style="margin-left: auto;"><a href="javascript:writeBtn()" class="button primary">작성하기</a></li>
									</ul>
								</form>
								</c:when>
							
								</c:choose>
									<table>
										<thead>
											<tr>
												<th>번호</th>
												<th style="text-align: center;">제목</th>
												<th>아이디</th>
												<th class="column4">날짜</th>
												<th class="column5" style="text-align: center;">조회수</th>
											</tr>
										</thead>
										<tbody>
									<c:choose>
										<c:when test="${list != null and fn:length(list) > 0}">
										<c:forEach var="b_bean" items="${list}">
												<tr>
													<td>
														${b_bean.getQnaNum()}</td>
													<td>
														<div>
															<a href="${pageContext.request.contextPath}/qnaboard/BoardView.qn?boardNum=${b_bean.getQnaNum()}&page=${nowPage}">
																${b_bean.getQnaTitle()} </a>
														</div>
													</td>
													<td>
														<div>${b_bean.getMemberId()}</div>
													</td>
													<td>
														<div>${b_bean.getUpload()}</div>
													</td>
													<td>
														<div>${b_bean.getReadCount()}</div>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			  <table border="0" cellpadding="0" cellspacing="0" width="900px">
         	<tr align="center" valign="middle">
         		<td>
         			<c:if test="${nowPage >1}">
         				<a class="button small" href="${pageContext.request.contextPath}/qnaboard/BoardList.qn?page=${nowPage - 1}">이전</a>
         			</c:if>
	         		<c:forEach var="i" begin="${startPage}" end="${endPage}">
	         			<c:choose>
	         				<c:when test="${i eq nowPage}">
	         					<a class="button primary small">
	         					${i}
	         					</a>
	         				</c:when>
	         				<c:otherwise>
	         					<a class="button small" href="${pageContext.request.contextPath}/qnaboard/BoardList.qn?page=${i}">${i}&nbsp;</a>
	         				</c:otherwise>
	         			</c:choose>
	         		</c:forEach>
         			<c:if test="${realEndPage != nowPage}">
         				<a class="button small" href="${pageContext.request.contextPath}/qnaboard/BoardList.qn?page=${nowPage + 1}">다음</a>
         			</c:if>
         		</td>
         	</tr>
         </table>
        

				<!-- Footer -->
				<jsp:include page="../../footer.jsp"></jsp:include>

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
function writeBtn(){
	writeForm.submit();
}
</script>
	</body>
</html>