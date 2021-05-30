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
<link href="${pageContext.request.contextPath}/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
<title>게시물</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/assets/css/main.css" />
<style>
.wrapper {
   padding: 0;
}

@font-face {
   font-family: 'paybooc-Bold';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/paybooc-Bold.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

input[type="text"], input[type="password"], input[type="email"], input[type="tel"],
   input[type="search"], input[type="url"], select, textarea {
   background-color: white;
}

table tbody tr:nth-child(2n + 1) {
      background-color: white;
   }
   
   
div .imgs_wrap {
   width: 100%;
   margin-bottom: 20%;
   display: flex;
   justify-content: center;
}

#firstLi {
   border-radius: 6px;
   margin-left: 33%;
   margin-top: 1%;
   padding-left: 0;
}

#secondLi {
   margin-top: 1%;
   padding-left: 0.1rem;
}

#thirdLi {
   margin-left: 27%;
   margin-top: 1%;
}

ul.actions li{
    padding: 0 0 0 0rem;
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

@media screen and (max-width: 480px) {
   #firstLi {
      border-radius: 6px;
      margin-left: 0%;
      margin-top: 1%;
      padding-left: 0;
      padding-top: 0.1rem;
   }
   #secondLi {
      margin-top: 1%;
      padding-left: 0.1rem;
      padding-top: 0rem;
   }
   #thirdLi {
      margin-top: 1%;
      padding-left: 0.1rem;
      padding-top: 0rem;
      margin-left: 0%;
   }
   div #dLi {
      padding: 0 !important;
   }
   div .imgs_wrap {
      display: none;
   }
   div #ulTag {
      display: none;
   }
   ul.actions:not(.fixed) li {
   padding: 0rem 0 0 0;
   }
   
   #listBtn, #modifyBtn {
   	margin-bottom: 3%;
   }
}
</style>
</head>
<body class="is-preload" style="font-family: 'paybooc-Bold';">
   <c:set var="p_vo" value="${p_vo}" />
   <c:set var="page" value="${page}" />
   <c:set var="files" value="${files}" />
   <jsp:include page="../../header.jsp" />
   <!-- Main -->
   <div id="main">
      <div class="wrapper special">
         <div class="inner">
            <header class="heading">
            <h1 style="margin-top: 10%; font-size: 40px;">${p_vo.getPhotoBoardTitle()}</h1>
            <p>서로를 배려하는 댓글 문화</p>
            </header>
         </div>


      </div>
      <div class="wrapper">
         <div class="inner">
            <form method="post" action="#" enctype="multipart/form-data">
               <div class="row gtr-uniform">
                  <div class="col-6 col-12-xsmall" style="margin: 0 auto;">
                     <ul class="actions" style="margin-left: 0;">
                        <li id="listBtn"><a
                           href="${pageContext.request.contextPath}/member/MemberBoard.me?page=${page}"
                           class="button primary small" style="border-radius: 6px;">목록</a></li>
                        <c:if test="${session_m_id eq p_vo.getMemberId()}">
                           <li id="modifyBtn" style="margin-left: auto; margin-right: 2%;"><a
                              href="${pageContext.request.contextPath}/member/MemberBoardModify.me?photoBoardNum=${p_vo.getPhotoBoardNum()}&page=${page}"
                              class="button primary small" style="border-radius: 6px;">수정</a></li>
                           <li><a href="javascript:deleteForm.submit()"
                              class="button small" style="border-radius: 6px;">삭제</a></li>
                        </c:if>
            
                     </ul>
                     <input type="text" name="demo-name" id="demo-name"
                        value="${p_vo.getMemberId()}" readonly=""> <span
                        style="font-size: small;">${p_vo.getUpload()}</span> &nbsp;<span
                        style="font-size: small;">조회수: </span><span
                        style="font-size: small;">${p_vo.getReadCount()}</span>

                     <!--작성자가 실제로  작성하는 textarea  -->
                     <textarea name="demo-textarea" id="rta" rows="6"
                        style="margin-top: 30px; border: none; padding: 0px; overflow-y: hidden; resize: none; height: 62px;"
                        readonly="">${p_vo.getPhotoBoardContent()}</textarea>
                     <!--내용에 따라 자동으로 textarea넓히기위한 textarea  -->
                     <textarea id="fta"
                        style="height: 1px; overflow-y: hidden; position: absolute; top: -35px;"
                        disabled=""></textarea>


                     <div style="margin-top: 5%;">
                        <hr style="margin: 0; border: 1px solid #61c5e0; width: 28%;">
                        <h5 style="margin-bottom: 0px;">이미지파일</h5>
                        <c:if test="${files != null}">
                           <c:forEach var="i" items="${files}">
                              <img style="width: 100%; height: 100%; margin-bottom: 3%;"
                                 src="${pageContext.request.contextPath}/files/${i.getFileName()}">
                           </c:forEach>
                        </c:if>
                        <br>
                     </div>

                     <div>
                        <div class="imgs_wrap"></div>
                     </div>

                     <ul class="actions fit" style="display: inherit; margin: 0 auto; width: 100%;">
                        <textarea name ="replyContent" style='width: 100%; height: 85px; resize: none;'></textarea>

                        <li style="padding-bottom: 3px; padding-top: 0.5rem;"><a
                           href="javascript:beforeReply()" class="button primary fit">댓글
                              등록</a></li>

                        <li><a href="javascript:void(0);" class="button fit"
                           onClick="viewReply();">댓글 목록</a></li>
                     </ul>

                     <!--댓글목록  -->
                     <div id="viewR" class="col-6 col-12-xsmall"
                        style="margin: 0 auto; display: none">

                        <table style="margin: 2rem 0 2rem 0;" id="replyTable">         
                        </table>


                     </div>
                  </div>
               </div>
            </form>

            <form name="deleteForm" method="post"
               action="${pageContext.request.contextPath}/member/MemberBoardDelete.me?memberId=${p_vo.getMemberId()}"
               enctype="multipart/form-data">
               <input type="hidden" name="page" value="${page}"> <input
                  type="hidden" name="photoBoardNum"
                  value="${p_vo.getPhotoBoardNum()}">
            </form>
         </div>
      </div>
   </div>

   <!-- Footer -->
   <jsp:include page="../../footer.jsp"></jsp:include>

   <!-- Scripts -->
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>




<script>
   var fileNames = new Array();
   var cnt = 0;

   check = false;
   $(document).ready(function() {
      getList();
   });

   var pageContext = "${pageContext.request.contextPath}";
   var photoBoardNum = "${p_vo.getPhotoBoardNum()}";
   
   //모든 첨부파일 이름 input창에 출력
   $(document).ready(function() {
      $("input[type=file]").change(function() {
         console.log("들어옴!");
         var fileInput = document.getElementById("file-Button");
         var files = fileInput.files;
         var file;
         console.log(files);
         for (var i = 0; i < files.length; i++) {
            file = files[i];
            fileNames[i] = file.name;
         }
         showImages();
      });
   });

   //썸네일
   function showImages() {
      var img_html = "<div id='imgDiv" + cnt
            + "' class='test' style='text-align: center; width: 30%;'>"
            + "<img src=\"" + fileNames[cnt]/*이미지 경로*/
            + "\" style='width: 100%; height: 100%; margin-bottom: 3%;'/>"
            + "<input type='radio' id='rb"+cnt+"' name='radioName'>"
            + "<label for='rb"+cnt+"' id='imgName'><span>" + fileNames[cnt]
            + "</span></label></div>";
      $(".imgs_wrap").append(img_html);
   }

   //첨부 파일 미리보기()
   var sel_files = [];
   $(document).ready(function() {
      $("#file-Button").on("change", handleImgsFilesSelect);
   });

   //파일첨부된거 다운받기
   $(function() {
      $("#file1").click(function() {
         $(".modal").fadeIn();
      });
      $(".modal_content").click(function() {
         $(".modal").fadeOut();
      });
   });

   //텍스트 에어리어 스크롤 막기/자동 크기조절
   function xSize(e) {
      var xe = document.getElementById('fta'), t;

      e.onfocus = function() {
         t = setInterval(function() {
            xe.value = e.value;
            e.style.height = (xe.scrollHeight + 12) + 'px';
         }, 100);
      }

      e.onblur = function() {
         clearInterval(t);
      }
   }

   xSize(document.getElementById('rta'));

   //댓글목록 
   function viewReply() {
      if ($("#viewR").css("display") == "none") {

         $("#viewR").show();
         getList();
      } else
         $("#viewR").hide();

   }

   //비 회원 댓글 못작성하게
   function beforeReply(){
      var t_session = '${session_t_id}';
      var m_session = '${session_m_id}';
      
      if (t_session =="" && m_session == "" ) {
         alert("댓글을 작성하려면 로그인해주세요.");
         location.href = "${pageContext.request.contextPath}/app/public/login.jsp"; 
      }else if(t_session != "" && m_session ==""){
         alert("회원게시판의 댓글은 일반회원만 작성할 수 있습니다.");
         return false;
      }else {
         
         insertReply();
      }
   }
   //댓글 작성 0
   function insertReply(){
      var replyContent = $("textarea[name='replyContent']").val();
      var textLimit = /^.{1,200}$/ ; //모든 글자 1글자 200이하 
      if(!replyContent.match(textLimit)){
         alert("댓글은 최소 1자에서 200자까지 입력이 가능합니다.")
         return false;
      }
      $.ajax({
         url : pageContext + "/member/MemberBoardReplyOk.me",
         type : "post",
         data : {"replyContent" : replyContent, "photoBoardNum" : photoBoardNum},
         dataType : "text",
         success : function(result){
            alert(result);
            getList();
         }
         
      });
      
      $("textarea[name='replyContent']").val("");
   } 

   //댓글 목록 0
   function getList() {
      $.ajax({
         url : pageContext + "/member/BoardReplyList.me?photoBoardNum="+ photoBoardNum,
         type : "get",
         //         dataType : "text",
         dataType : "json",
         //         success : function(result){
         //            var replys = JSON.parse(result);
         //            console.log(replys);
         //         success : function(replys){
         //            console.log(replys);
         success : showList
      });
   }

   function showList(replys) {//댓글들을 가져와서 담음 
      //         console.log(replys); 미지수
      var insertReply_HTML = "<tbody><tr><th id='wt'>작성자</th><th id='wc'>내용</th></tr>";

      var text = insertReply_HTML;

      if (replys != null && replys.length != 0) {
         $.each(replys,function(index, reply) { //index:키 값(인덱스) reply:value값(객체) replys는 json형태로 넘어오니까 
                        text += "<tr class='cTr'><td id='tdId'>"
                              + reply.memberId + "</td>";
                        text += "<td id='tdContent'>";
                        text += "<textarea name='content"
                              + (index + 1)
                              + "' id='"
                              + (index + 1)+ "' class='re' style='width: 100%; height: 85px; resize: none;' readonly>"
                              + reply.replyContent + "</textarea>";

                        if ("${session_m_id}" == reply.memberId) {
                           text += "<a id='ready" + (index + 1)
                                 + "' href='javascript:updateReply("
                                 + (index + 1) + ")' style='text-decoration: none;'>[수정]</a>";
                           text += "<a id='ok"
                                 + (index + 1)
                                 + "' href='javascript:updateOkReply("
                                 + reply.replyNum
                                 + ", "
                                 + (index + 1)
                                 + ")' style='display:none; text-decoration: none;'>[수정 완료]</a>";
                           text += "<a href='javascript:deleteReply("
                                 + reply.replyNum + ")' style='text-decoration: none;'>[삭제]</a>"
                        }
                        text += "</td></tr>";
                     });
      } else {
         text += "<tr align='center'><td align='center' width='150px' colspan='2'>댓글이 없습니다.</td></tr>";
      }
      text += "</tbody>";
       $("#replyTable").html(text);
      autosize($("textarea.re")); 
     
   }
	
   //삭제 Ajax
   function deleteReply(replyNum) {
      $.ajax({
         url : pageContext + "/member/BoardReplyDeleteOk.me",
         type : "post",
         data : {
            "replyNum" : replyNum , "photoBoardNum" : photoBoardNum
         },
         dataType : "text",
         success : function(result) {
            alert(result);
            getList();
         }
      });
   }

   //댓글 수정
   function updateReply(num) {
      if (!check) {
         var textarea = $("textarea#" + num);
         var a_ready = $("a#ready" + num);
         var a_ok = $("a#ok" + num);
         
         console.log("updateReply'num: "+num);
         
         textarea.removeAttr("readonly");
         a_ready.hide();
         a_ok.show();
         check = true;
      } else {
         alert("수정 중인 댓글이 있습니다.");
      }
   }

   //댓글 수정완료 
   function updateOkReply(replyNum, seq) {
      var content = $("textarea#" + seq).val();
      console.log(content);
      $.ajax({
         url : pageContext + "/member/BoardReplyModifyOk.me",
         type : "post",
         data : {
            "replyNum" : replyNum,
            "content" : content
         },
         dataType : "text",
         success : function(result) {
            alert(result);
            check = false; // 새로고침이되는게 아니니까 
            getList();

         }

      });

   }
</script>
</html>