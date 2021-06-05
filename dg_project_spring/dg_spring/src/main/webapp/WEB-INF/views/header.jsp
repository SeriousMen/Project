<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	

	
	@font-face {
	    font-family: 'BMHANNAAir';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}	
	.menuDiv {
	position: relative;
	display: inline-block;
}

#drop-content {
    text-align: center;
    margin-left: 2rem;
	position: absolute;
	z-index: 1;
	line-height: 70%;
	    width: 6%;
	top: 80%;
}

#drop-content a {
	display: block;
	font-size: 15px;
	background-color: black;
	color: white;
	text-decoration: none;
	padding: 10px 36px;
	margin: 0px 0px 0px 0px;
	border: 1px solid white;
}
	
	
	
#menuDiv a {
	color: white;
	font-size: 18px;
	padding: 5px;
	margin-right: 8px;
	text-decoration: none;
}

#menuDiv a:hover {
	text-decoration: underline;
	color: #06f3ddf7;
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
		
			#drop-content {
	    margin-left: 3rem;
	    width: 24%;
}
#drop-content a {

	margin: 0px 0px 0px 0px;
	
}
	}

</style>
<!-- Header -->
<header id="header" style="font-family: 'BMHANNAAir';">
	<a class="logo" href="/"><img src=${pageContext.request.contextPath}/resources/images/tplogo.png>득근득근</a>
	
	<c:choose>

				<c:when test="${session_m_id eq null}">
					<div id="menuDiv">
						<a href="/login?login=true"
							style="color: white"> 로그인 </a> <a href="#" onclick="dp_menu()"
							style="color: white">회원가입 </a>
						<div style="display: none;" id="drop-content">
							<a
								href="/member/memberJoin"><span>회원</span></a>
							
						</div>
					</div>
				</c:when>

				<c:when test="${session_m_id ne null}">
					<div id="menuDiv">
						<a
							href="/member/memberLogout"
							style="color: white"> 로그아웃 </a> 

					</div>
				</c:when>
			

				

			</c:choose>
</header>

<script>
function dp_menu() {
	let click = document.getElementById("drop-content");
	if (click.style.display === "none") {
		click.style.display = "block";

	} else {
		click.style.display = "none";

	}
}


</script>
