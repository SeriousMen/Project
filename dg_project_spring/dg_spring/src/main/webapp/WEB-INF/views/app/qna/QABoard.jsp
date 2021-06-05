<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
	<link href="/resources/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
		<title>Q&A게시판</title>
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
								<form name="writeForm" action="/board/insertBoard">
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
										<c:forEach var="board" items="${list}">
												<tr>
													<td>${board.bno}</td>
													<td>
														<div><!--컨트롤러에서 모델에 담아서 그냥 쓸 수 있고 pageMaker안에 cri객체가 있고 그안에 getListLink로 해당페이지정보를 초기화해서 쿼리로 리턴해준다.  -->
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
				
				<!--페이징처리  -->
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
         
         <!-- 사용자가 가고싶은 페이지를 눌렀을 때도 해당 정보들은 유지 시키기위해  -->
         <form id="actionForm" action="/board/boardList">	
         	<input type="hidden" name="boardNum" value="1">
         	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
         	<input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
         	<input type="hidden" name="type" value="${pageMaker.cri.type}"/>
         	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"/>
         </form>
        <!--검색창  -->
        <form action="/board/boardList" id="searchForm">
        <input type="hidden" name="boardNum" value="1">
							<div class="searchDiv">
								<div style="text-align:center">
								<select name ="type">
								<!--EL삼항연산자를 통해 검색결과가 나와도 해당 타입과 키워드를 유지시켜주도록 설정  -->
									<option value="" ${pageMaker.cri.type eq null? 'selected' : ''}>검색 기준</option> <!--있다가 value도 아에 지워도 똑같은지 확인   -->
									<option value="T" ${pageMaker.cri.type eq 'T'? 'selected' : ''} >제목</option>
									<option value="C" ${pageMaker.cri.type eq 'C'? 'selected' : ''} >내용</option>
									<option value="W" ${pageMaker.cri.type eq 'W'? 'selected' : ''} >작성자</option>
									<option value="TC" ${pageMaker.cri.type eq 'TC'? 'selected' : ''} >제목 또는 내용</option>
									<option value="TW" ${pageMaker.cri.type eq 'TW'? 'selected' : ''} >제목 또는 작성자</option>
									<option value="TCW" ${pageMaker.cri.type eq 'TCW'? 'selected' : ''} >전체</option>
								</select>
								<input id ="keyword" type="text" name="keyword" value="${pageMaker.cri.keyword}">
								<a href="javascript:void(0)" class="search button primary icon solid fa-search">검색</a>
							
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
	e.preventDefault();  //해당 a태그를 눌러도 태그에 정의된 이벤트가 발생하지 않는다.(href)
	var searchForm = $("#searchForm");
	
	if(!searchForm.find("option:selected").val()){
		alert("검색 종류를 선택하세요");
		return false
	}
	if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력해주세요");
		return false
		}
		searchForm.submit();
	})
	
	$(".changePage").on("click",function(e){
		e.preventDefault(); //a태그 이벤트 막아서 href막고
		var actionForm = $("#actionForm");
		var pageNum =$(this).attr("href"); //href에 있던 값을 가져와서 이렇게 할 수 있음
		actionForm.find("input[name='pageNum']").val(pageNum);
		//href에서 선택한 pageNum을 값으로 넣어서 
		actionForm.submit(); //보내준다.
	})
	
	var result = "${result}";
	$(document).ready(function(){
		if(result=="" || isNaN(result)){
			//값이 없거나 숫자가 아니면 탈출
			return;
		}
		//아니라면 alert
		alert("게시글" +result+"번이 등록되었습니다.")
	})

</script>
	</body>
</html>