<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
	<link href="/resources/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>Q&Aź²ģķ</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<style>
			#mobile{display:none;}
			.searchDiv{
				width: 30%;
  				margin: 0 auto;
			}
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
	
	 
	
      
      
	<body class="is-preload" style="font-family: 'BMHANNAAir';">

		<!-- Header -->
		<jsp:include page="../../header.jsp"/>
		<!-- Nav -->
			

		<!-- Main -->
			<div id="main">
				<div class="wrapper special" style="padding: 0rem 0 0rem 0 ;">
					<div class="inner">
						<header class="heading">
							<p style="margin: 0 0 0rem 0; font-size:40px;">ėź·¼ėź·¼ Q&A ź²ģķ</p>
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
								<form name="writeForm" action="/board/insertBoard">
									<ul class="actions">
										<li style="margin-left: auto;"><a href="javascript:writeBtn()" class="button primary">ģģ±ķźø°</a></li>
									</ul>
								</form>
								</c:when>
							
								</c:choose>
									<table>
										<thead>
											<tr>
												<th>ė²ķø</th>
												<th style="text-align: center;">ģ ėŖ©</th>
												<th>ģģ“ė</th>
												<th class="column4">ė ģ§</th>
												<th class="column5" style="text-align: center;">ģ”°ķģ</th>
											</tr>
										</thead>
										<tbody>
									<c:choose>
										<c:when test="${list != null and fn:length(list) > 0}">
										<c:forEach var="board" items="${list}">
												<tr>
													<td>${board.bno}</td>
													<td>
														<div><!--ģ»Øķøė”¤ė¬ģģ ėŖØėøģ ė“ģģ ź·øė„ ģø ģ ģź³  pageMakerģģ criź°ģ²“ź° ģź³  ź·øģģ getListLinkė” ķ“ė¹ķģ“ģ§ģ ė³“ė„¼ ģ“źø°ķķ“ģ ģæ¼ė¦¬ė” ė¦¬ķ“ķ“ģ¤ė¤.  -->
															<a href="/board/read${pageMaker.cri.getListLink()}&boardNum=${board.boardNum}&bno=${board.bno}">
																${board.title} </a>
														</div>
													</td>
													<td>
														<div>${board.writer}</div>
													</td>
													<td>
														<div>${board.regDate}</div>
													</td>
													<td>
														<div>${board.updateDate}</div>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="5" align="center">ė±ė”ė ź²ģė¬¼ģ“ ģģµėė¤.</td>
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
				
				<!--ķģ“ģ§ģ²ė¦¬  -->
		<table border="0" cellpadding="0" cellspacing="0" width="900px">
         	<tr align="center" valign="middle">
         		<td>
         			<c:if test="${pageMaker.prev}">
         				<a class="button small changePage" href="${1}" >&lt;&lt;</a>
						<a class="button small changePage" href="${pageMaker.startPage-1}" >&lt;</a>
         			</c:if>
	         		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	         			<c:choose>
	         				<c:when test="${num eq pageMaker.cri.pageNum}">
	         					<a class="button primary small">
	         					${num}
	         					</a>
	         				</c:when>
	         				<c:otherwise>
	         					<a class="button small changePage" href="${num}">${num}&nbsp;</a>
	         				</c:otherwise>
	         			</c:choose>
	         		</c:forEach>
         			<c:if test="${pageMaker.next}">
         				<a class="button small changePage" href="${pageMaker.endPage+1}">&gt;</a>
         				<a class="button small changePage" href="${pageMaker.realEnd}">&gt;&gt;</a>
         			</c:if>
         		</td>
         	</tr>
         </table>
         
         <!-- ģ¬ģ©ģź° ź°ź³ ģ¶ģ ķģ“ģ§ė„¼ ėė ģ ėė ķ“ė¹ ģ ė³“ė¤ģ ģ ģ§ ģķ¤źø°ģķ“  -->
         <form id="actionForm" action="/board/boardList">	
         	<input type="hidden" name="boardNum" value="1">
         	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
         	<input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
         	<input type="hidden" name="type" value="${pageMaker.cri.type}"/>
         	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/>
         </form>
        <!--ź²ģģ°½  -->
        <form action="/board/boardList" id="searchForm">
        <input type="hidden" name="boardNum" value="1">
							<div class="searchDiv">
								<div style="text-align:center">
								<select name ="type">
								<!--ELģ¼ķ­ģ°ģ°ģė„¼ ķµķ“ ź²ģź²°ź³¼ź° ėģė ķ“ė¹ ķģź³¼ ķ¤ģėė„¼ ģ ģ§ģģ¼ģ£¼ėė” ģ¤ģ   -->
									<option value="" ${pageMaker.cri.type eq null? 'selected' : ''}>ź²ģ źø°ģ¤</option> <!--ģė¤ź° valueė ģģ ģ§ģė ėź°ģģ§ ķģø   -->
									<option value="T" ${pageMaker.cri.type eq 'T'? 'selected' : ''} >ģ ėŖ©</option>
									<option value="C" ${pageMaker.cri.type eq 'C'? 'selected' : ''} >ė“ģ©</option>
									<option value="W" ${pageMaker.cri.type eq 'W'? 'selected' : ''} >ģģ±ģ</option>
									<option value="TC" ${pageMaker.cri.type eq 'TC'? 'selected' : ''} >ģ ėŖ© ėė ė“ģ©</option>
									<option value="TW" ${pageMaker.cri.type eq 'TW'? 'selected' : ''} >ģ ėŖ© ėė ģģ±ģ</option>
									<option value="TCW" ${pageMaker.cri.type eq 'TCW'? 'selected' : ''} >ģ ģ²“</option>
								</select>
								<input id ="keyword" type="text" name="keyword" value="${pageMaker.cri.keyword}">
								<a href="javascript:void(0)" class="search button primary icon solid fa-search">ź²ģ</a>
							
							</div>
							</div>
					</form>
        </div>

				<!-- Footer -->
				<jsp:include page="../../footer.jsp"></jsp:include>

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>
function writeBtn(){
	writeForm.submit();
}
$("a.search").on("click",function(e){
	e.preventDefault();  //ķ“ė¹ aķź·øė„¼ ėė¬ė ķź·øģ ģ ģė ģ“ė²¤ķøź° ė°ģķģ§ ģėė¤.(href)
	var searchForm = $("#searchForm");
	
	if(!searchForm.find("option:selected").val()){
		alert("ź²ģ ģ¢ė„ė„¼ ģ ķķģøģ");
		return false
	}
	if(!searchForm.find("input[name='keyword']").val()){
		alert("ķ¤ģėė„¼ ģė „ķ“ģ£¼ģøģ");
		return false
		}
		searchForm.submit();
	})
	
	$(".changePage").on("click",function(e){
		e.preventDefault(); //aķź·ø ģ“ė²¤ķø ė§ģģ hrefė§ź³ 
		var actionForm = $("#actionForm");
		var pageNum =$(this).attr("href"); //hrefģ ģė ź°ģ ź°ģ øģģ ģ“ė ź² ķ  ģ ģģ
		actionForm.find("input[name='pageNum']").val(pageNum);
		//hrefģģ ģ ķķ pageNumģ ź°ģ¼ė” ė£ģ“ģ 
		actionForm.submit(); //ė³“ė“ģ¤ė¤.
	})
	
	var result = "${result}";
	$(document).ready(function(){
		if(result=="" || isNaN(result)){
			//ź°ģ“ ģź±°ė ģ«ģź° ģėė©“ ķģ¶
			return;
		}
		//ģėė¼ė©“ alert
		alert("ź²ģźø" +result+"ė²ģ“ ė±ė”ėģģµėė¤.")
	})

</script>
	</body>
</html>