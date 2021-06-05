<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<link href="/resources/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
<title>게시글 상세보기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="/resources/assets/css/main.css" /> 
	<!--프로젝트명/resources/ (resources는 servlet-context.xml에서 설정함  -->
<style>
.re {
	height: 66px;
}

.wrapper {
	padding: 0;
}

@font-face {
	font-family: 'BMHANNAAir';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'BMEULJIRO';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/BMEULJIRO.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

input[type="text"], input[type="password"], input[type="email"], input[type="tel"],
	input[type="search"], input[type="url"], select, textarea {
	background-color: white;
}

div .imgs_wrap {
	width: 100%;
	margin-bottom: 20%;
	display: flex;
	justify-content: center;
}

/* 버튼 가운데 정렬로 바꾸기 */
@media screen and (max-width: 980px) {
	div #downButton {
		display: none;
	}
	div #lLi {
		margin-left: auto;
	}
	div #dLi {
		padding: 0 0 0 1rem !important;
		margin-right: auto;
	}
}

@media screen and (max-width: 1680px) {
	#insertInput {
		width: 85% !important;
	}
	#file1 {
		width: 85% !important;
	}
}

@media screen and (max-width: 1359px) {
	#ready {
		margin-left: 72%;
	}
}

@media screen and (max-width: 1280px) {
	#insertInput {
		width: 81% !important;
	}
	#file1 {
		width: 81% !important;
	}
}

@media screen and (max-width: 980px) {
	#insertInput {
		width: 73% !important;
	}
	#file1 {
		width: 73% !important;
	}
}

@media screen and (max-width: 736px) {
	#qaViewDiv {
		width: 100% !important;
	}
	#insertInput {
		width: 84% !important;
	}
	#file1 {
		width: 84% !important;
	}
}

@media screen and (max-width: 480px) {
	div #dLi {
		padding: 0 !important;
	}
	div .imgs_wrap {
		display: none;
	}
	div #ulTag {
		display: none;
	}
	#insertInput {
		width: 100% !important;
		float: none !important;
	}
	#insertUl {
		margin-top: 5% !important;
	}
	#file1 {
		width: 100% !important;
		float: none !important;
	}
	#downUl {
		margin-top: 5% !important;
	}
}

.modal {
	position: absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	top: 0;
	left: 0;
	display: none;
}

table tbody tr:nth-child(2n + 1) {
	background-color: white;
}

#tdId {
	width: 20%;
}

#insertLi {
	padding: 0;
}

#downLi {
	padding: 0;
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

@media screen and (max-width: 980px) {
	.logo img {
		width: 40px !important;
		height: 40px !important;
	}
}

@media screen and (max-width: 736px) {
	.logo {
		padding-left: 4% !important;
	}
}
</style>
</head>
<body class="is-preload" style="font-family: 'BMHANNAAir';">

	<jsp:include page="../../header.jsp"></jsp:include>

<%-- 	<c:set var="q_vo" value="${q_vo}" />
	<c:set var="replies" value="${replies}" />
	<c:set var="files" value="${files}" />  jsp에서 쓰던 것--%>


	<!-- Main -->
	<div id="main">
		<div class="wrapper special">
			<div class="inner">
				<header class="heading">
				<p>회원님들의 댓글은 서비스 개선에 큰 도움이 됩니다!</p>
				</header>
			</div>
		</div>


		<div class="wrapper">
			<div class="inner">
				<div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall" id="qaViewDiv"
						style="margin: 0 auto;">
						<input type="text" name="title" id="title"
							value="${board.title}" readonly />
							
						<input type="text" name="writer" id="writer"
							value="${board.writer}" readonly />
							
						<textarea name="content" id="content" rows="6"
							style="margin-top: 5%; resize: none;" readonly>${board.content}</textarea>
						<div style="margin-top: 5%;">
							
							
								
									<ul class="actions">
										<li><a style="border-radius: 6px;"
											class="button primary small"
											href="/board/boardList${cri.getListLink()}&boardNum=${board.boardNum}">목록</a></li>

										<c:if
											test="${session_m_id eq board.writer || session_t_id eq board.writer}">


											<li style="margin-left: auto;"><a
												style="border-radius: 6px;" class="button primary small"	
												href="/board/modifyBoard${cri.getListLink()}&&bno=${board.bno}&&boardNum=${board.boardNum}">수정</a></li>
												<!--솔직히 수정,삭제 시에 boardNum넘길 필요가 없는데 쿼리에서 그렇게 작성한거 그냥 놔둔 이유는 어처피 List로 이동할 때 boardNum이 필요하고  좀더 강제성?을 주려고 속도도 빠르게  -->
											<li><a style="border-radius: 6px;"	
												class="button primary small"
												href="/board/deleteBoard${cri.getListLink()}&&bno=${board.bno}&&boardNum=${board.boardNum}">삭제</a></li>
										</c:if>

									</ul>
								
								<div class="field uploadDiv"><!--첨부파일 관련전체를 감싸는  -->
								<div class="field uploadDiv">
									<h4>첨부파일</h4>
								
								</div>
								<div class="field">
									<div class="uploadResult"><!--파일하고 사진  -->
									<ul>
										
									</ul>
									</div>
								</div>
								<div class="bigPictureWrapper"><!--사진클릭씨 크게 늘어나게할 공간  -->
									<div class="bigPicture"></div>
								</div>
							</div>
						</div>
						
							<ul class="icons">
								<li>
									<span class="icon solid fa-envelope"></span>
									<strong>댓글</strong>
								</li>
							</ul>
							<c:if test="${session_m_id ne null}">
								 <a style="width:100%" href="javascript:void(0)" class="button primary small register">댓글 등록</a>
								 </c:if>
                          <div class="fields register-form" style="display:none">
                             <div class="field">
                                <h4>작성자</h4>
                               
                                <input type="text" name="replyer" readonly value="${session_m_id}"/>                      	
                                
                                
                              
                             </div>
                             <div class="field">
                                <h4>댓글</h4>
                                <textarea rows="6" name="reply" placeholder="Reply" style="resize:none;"></textarea>
                             </div>
                             <div class="field regBtn">
                                <a href="javascript:void(0)" class="button primary small finish">등록</a>
                                <a href="javascript:void(0)" class="button primary small cancel">취소</a>
                             </div>
                          </div>
						<!-- 댓글 -->
						<ul class="replies"> </ul>

			<div class ="paging" style="text-align:center;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../footer.jsp" />
	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
<script src="/resources/assets/js/reply.js"></script>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
	<script
		src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>

	<script>
		$(document).ready(function() {	
			showList();
		});
	

		//썸네일 li태그를 클릭하면 들어옴 
	    $(".uploadResult").on("click", "li", function(e){//아래 즉시실행함수로 가져온 파일들을 클릭하면
	       console.log("view or download")
	       var li = $(this); //클릭한 파일(사진) 요소가져오기
	       var path = encodeURIComponent(li.data("path") + "/" + li.data("uuid") + "_" + li.data("filename")); //원본파일가져오고
	       
	       if(li.data("type")){//만약 타입이 이미지면 
	          //썸네일 // 클릭시에 원본파일 크기로 보여줘라.
	          showImage(path.replace(new RegExp(/\\/g), "/")); // '\'를 모두 '/'로  변경(\가 JS에서 명령어로 인식될 수 있기 때문)
	       }else{
	          //다운로드 //이미지 아닌건 다운로드 
	          self.location = "/download?fileName=" + path; 
	       }
	    });
	    var check = false;
	    function showImage(path){
	       if(check){return;}
	       $(".bigPictureWrapper").css("display", "flex").show();
	       $(".bigPicture").html("<img src='/display?fileName=" + path + "'>")
	       .animate({width:'100%', height:'100%'}, 1000);//애니메이션 효과 
	       check = true;
	       
	    }
	 $(".bigPictureWrapper").on("click", function(e){//클릭시 다시 작아지게
	    if(!check){return;}
	    $(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
	    setTimeout(function(){
	       $(".bigPictureWrapper").hide();
	       check = false;
	    }, 1000);
	 });
	 
	    (function(){ //즉시 실행함수: 선언과 동시에 바로 실행된다. get에서는 해당 파일의 목록을 불러와야 하기 때문에 즉시실행함수로 초기화를 해서 불러올 것 
	       var bno = "${board.bno}";
	       console.log(bno);
	       $.getJSON("/board/getAttachList", {bno:bno}, function(list){
	          var str = "";
	          
	          $(list).each(function(i, obj){
	             if(obj.fileType){//썸네일을 불러온다.
	                var thumbPath = encodeURIComponent(obj.uploadPath + "\\s_" + obj.uuid + "_" + obj.fileName);
	             str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>"
	             str += "<div><img src='/display?fileName=" + thumbPath + "' width=100 height=100>";
	             str += "<br>" + obj.fileName;
	             str += "</div></li>";
	             }else{//일반 파일(이미지가 아닌경우)
	                str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>"
	             str += "<div><img src='/resources/images/nonImage.png' width=100 height=100>";
	             str += "<br>" + obj.fileName;
	             str += "</div></li>";
	             }
	          });
	          $(".uploadResult ul").html(str);
	       });
	    })();
		
		var bNum ="${board.boardNum}";
		var bno = "${board.bno}";
		var pageNum = 1;
		var check = false;
		var pageContext = "${pageContext.request.contextPath}";
		 var t_session = '${session_t_id}';
	      var m_session = '${session_m_id}';
	      
		//댓글 등록버튼 누르면 열리도록 설정
		$(".register").on("click",function(e){
			e.preventDefault();
			$(".register-form").show();
			$(this).hide(); //등혹하기 버튼 사라지게 
		});
		
		//댓글등록취소 이벤트 설정
		$(".cancel").on("click", function(e){
			e.preventDefault();
			$(".register-form").hide();
			$(".register").show();
		});
		
		//댓글등록 이벤트처리 
		 $(".finish").on("click", function(e){
	            e.preventDefault();                
	            //textarea는 제이쿼리에서 이미 작성한 글을 가져올 때에는 text()도 Ok, val()도 Ok
	            //하지만 사용자가 작성한 글을 가져올 때는 val()로 가져올 수 있다.(랜더링 후 입력한 값을 가져올 때)
	            var reply = $("textarea[name='reply']").val();
	            var replyer = $("input[name='replyer']").val();
	           // var replyer = $("input[name='replyer']").text();
	            	if(replyer =="" ||reply==""){ alert("댓글 내용을 입력해주세요");return;} //댓글 작성자랑 내용이 없으면 작성 못하게 
	            replyService.add({bno:bno, reply:reply, replyer:replyer},
	                  function(result){
	                     alert(result);
	                     $("textarea[name='reply']").val("");
	                     $(".register-form").hide();
	         			$(".register").show();
	                     pageNum=1;
	                     
	            showList(pageNum);
	            });
	         });
		
		//페이지 이동 이벤트 처리
		 $(".paging").on("click","a.changePage", function(e){
	            e.preventDefault();//href작동 안하게 막아놓고 
	         //   pageNum = parseInt($(this).attr("href"));   //문자열이면 위에서 연결되기 때문에 반드시 정수로 형변환한다.//크고 작음을 비교하기 위해 int로 바꾸는거 같음
	            pageNum = $(this).attr("href");   //이렇게 해도 잘됨 문제 생기면 위에 것으로 해볼 것 
	            console.log(pageNum);
	            showList(pageNum);
	         });
		
		//댓글 삭제 이벤트 처리
		 $(".replies").on("click","a.remove", function(e){
	            e.preventDefault();
	          if(check){alert("댓글을 수정한 후에 진행해 주세요."); return;}
	          
	            var rnoValue = $(this).attr("href");
	          
	            replyService.remove(rnoValue,function(result){ //js에 선언된 양식에 맞게 값,콜백함수,에러함수 
	    			alert("DELETE :"+result);
	    		},function(err){
	    			alert("error"+err);
	    			});
	            
	            showList(pageNum);
	       
	         });
		
			//댓글수정 이벤트처리
			$(".replies").on("click","a.modify",function(e){
				e.preventDefault();
				if(check){alert("이미 수정중인 댓글이 있습니다."); return;}
				 var rnoValue = $(this).attr("href");
				 var replyTag = $(".reply" + rnoValue);
				 
				 replyTag.html("<textarea class='"+rnoValue+"'>"+replyTag.text()+"</textarea>") // replyTag.val()이 아니라 .text()인 이유는 이미 입력되있는 것을 옮기는 거니까 
				$(this).hide();
				 
				 var finishs = $(".modifyFinish")
				 for(let i=0; i<finishs.length;i++){
					 if($(finishs[i]).attr("href") == rnoValue){
						$(finishs[i]).show();//수정완료 버튼이 보일 때
						check = true;//check를 true로 
						
						break;
				}
			
				 }
			
				});
			
			//댓글 수정완료 이벤트 처리
			$(".replies").on("click", "a.modifyFinish",function(e){ //수정완료버튼을 누르면
				e.preventDefault();
				var rnoValue = $(this). attr("href");
				var newReply = $("."+rnoValue).val();
				if(newReply == ""){alert("댓글을 작성해주세요."); return;}
				replyService.modify({rno:rnoValue, reply:newReply},function(result){
					alert(result);
					check=false; //댓글수정완료 되면
					showList(pageNum);//이전페이지를 기억하는 댓글 리스트를 불러와라 
					});
				
			});
			

		 
			//댓글 페이징 처리	
			 function showReplyPage(replyCnt){
		            var str = "";
		            var replyPaging = $(".paging");
		            var endNum = Math.ceil(pageNum / 10.0) * 10;
		            var startNum = endNum - 9;
		            var realEnd = Math.ceil(replyCnt / 10.0) 
		            //(0페이지는 존재하지않아 )댓글 수 1~10개까지는 0.xx로 나눠지니까 1 그다음은 2 이런식으로 
		            
		            //if(endNum > replyCnt / 10.0){
		            if(endNum > realEnd){//10페이지 채 못채운다는 거니까 
		               endNum = realEnd; // 10페이지가 endNum일 수가 없다 
		            }
		            //자바스크립트에서는 이렇게 논리연산자랑 비교연산자로 연산자로 boolean타입 조건 설정 
		            var prev = startNum != 1; //1페이지,11페이지 이렇게 있으니까 1이 아니면 그전이 있다.
		            var next = endNum * 10 < replyCnt; //100개 이상이면 10페이지 넘어가는 거니 다음 페이지있다.
		            
		            if(matchMedia("screen and (max-width:918px)").matches){
		            	//918px보다 작을 때 한페이지씩 나오도록 설정 
		                if(pageNum != 1){//0페이지는 존재하지 않으니까
		                   str += "<a class='changePage' href='" + (pageNum - 1) + "'><code>&lt;</code></a>" 
		                }
		                   str += "<code>" + pageNum + "</code>";
		                if(pageNum != realEnd){//진짜 끝이 아니면 다음이 있지 
		                   str += "<a class='changePage' href='" + (pageNum + 1) + "'><code>&gt;</code></a>" 
		                }
		             }else{
		                //918px보다 클 때
		                if(prev){// 위의 pageNum은 1씩이고 이건 10단위로 보이게
		                   str += "<a class='changePage' href='" + (startNum - 1) + "'><code>&lt;</code></a>" 
		                }
		                for(let i=startNum; i<=endNum; i++){//10페이지 다 보이게 설정 
		                   if(pageNum == i){
		                      str += "<code>" + i + "</code>"; //현재 페이지면 이렇게 
		                      continue; //여기 들어오면 아래에 또 만들면 안되니까 이 반복문 나가서 실행해 
		                      //break;는 조건문 탈출하고 해당 반복문 자체를 탈출, 말그대로 멈추고 continue는 자기 조건문 아래꺼 안하고 멈춘다음 탈출하고 그 다음 반복문 이어서 실행 
		                   } 
		                
		                   str += "<a class='changePage' href='" + i + "'><code>" + i + "</code></a>"//다른 페이지로 가는 버튼을 만들어 준다.
		                }
		                if(next){
		                   str += "<a class='changePage' href='" + (endNum + 1) + "'><code>&gt;</code></a>" 
		                }
		             }

		            replyPaging.html(str);
		            
		         };
		         
		       //작성된 댓글 보기 
				  function showList(page){
		            var replyUL = $(".replies");
		            replyService.getList({bNum:bNum,bno:bno, page:page||1}, //bno는 전역변수로 선언되있고, page는 외부에서 전달받아서 해당 게시글 번호와 선택한 페이지 정보를 js에 보낸다.
		                  function(replyCnt, list){ // 이제 js에서 컨트롤러부터의 리턴 값을 인수로 넣어서 이쪽 콜백함수를 실행한다.
		                     if(list == null || list.length == 0){
		                    	if(pageNum >1){pageNum -=1; showList(pageNum);} 
		                    	//다음페이지에 댓글 1개있을 때 삭제시 그 해당 페이지를 없애주기 위해 
		                    	//자기 자신을 호출했기때문에 여기서 멈추고 다시 위로올라간다.그래서 충족되면 여기안들어옴
		                     		
		                        replyUL.html("등록된 댓글이 없습니다.");
		                        return;
		                     }

							
							var str ="";
							//data 속성 
							//태그에 원하는 value를 저장시키기 위해서 사용한다.
							//data-변수명="value"로 작성하며, jQuery에서 해당 태그 객체.data("변수명")으로 
							//value를 가져와 사용할 수 있다.
							//만약 value를 수정하고 싶다면 해당 태그객체.data("변수명", "새로운 값");으로 하면된다.
							  for(let i=0, len=list.length; i<len; i++){

								//이렇게 선언후 바로 쓸 수도 있다.
								//data-변수명 : 이렇게 쓴다. 가져올 때는 data("변수명") 
								    str += "<li data-rno='" + list[i].rno + "'>";
			                        str += "<strong>" + list[i].replyer + "</strong>";
			                        str += "<p class='reply" + list[i].rno + "'>" + list[i].reply + "</p>";
			                        str += "<div style='text-align:right;'>";	//댓글을 오른쪽으로 정렬 
			                		console.log("session: "+ "${session_m_id}");
			                		console.log(list[i].replyer);
			                       if(m_session == list[i].replyer){
			                        str += "<a class='modify' href='" + list[i].rno + "'>수정</a>";
			                        str += "<a class='modifyFinish' href='" + list[i].rno +"'style='display:none;'>수정완료</a>";
			                        str +="&nbsp;&nbsp;&nbsp;&nbsp;";
			                        str += "<a class='remove' href='" + list[i].rno + "'>삭제</a>";
			                       }
			                       if(t_session == list[i].replyer){
			                        str += "<a class='modify' href='" + list[i].rno + "'>수정</a>";
			                        str += "<a class='modifyFinish' href='" + list[i].rno +"'style='display:none;'>수정완료</a>";
			                        str +="&nbsp;&nbsp;&nbsp;&nbsp;";
			                        str += "<a class='remove' href='" + list[i].rno + "'>삭제</a>";
			                       }
			                        str += "</div><div class='line'></div></li>"; //댓글마다 간격을 띄워주려고

								
							}
							replyUL.html(str);
							showReplyPage(replyCnt); //리턴받은 총개수를 넣어준다.
							
					
		            });

					
				
					
					
				};
			
		

	</script>
</body>
</html>