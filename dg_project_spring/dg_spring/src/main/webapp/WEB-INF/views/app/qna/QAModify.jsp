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
<title>게시글 수정하기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="/resources/assets/css/main.css" />
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
}
</style>
</head>

<body class="is-preload" style="font-family: 'paybooc-Bold';">
	
	<!-- Header -->
	<jsp:include page="../../header.jsp" />

	<!-- Main -->
	<div id="main">
		<div class="wrapper special">
			<div class="inner">
				<header class="heading">
				<h1 style="margin-top: 10%;">Q&A 수정하기</h1>
				</header>
			</div>
		</div>
		<div class="wrapper">
			<div class="inner">
				<form role= "form" name="modifyForm" method="post" id="modifyForm"
					action="/board/modifyBoard">
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall" style="margin: 0 auto;">
							<input type="hidden" name="pageNum" value="${cri.pageNum}">
							<input type="hidden" name="amount" value="${cri.amount}">
							<input type="hidden" name="keyword" value="${cri.keyword}">
							<input type="hidden" name="type" value="${cri.type}">
							<input type="hidden" id = "boardNum" name="boardNum" value="1"> 
							<input type="hidden" name= "bno" value="${board.bno}"> 
						
									<input type="text" name="title" id="demo-name"
										value="${board.title}" />
								<input type="text" name ="writer" value="${board.writer}" readonly>
									<textarea name="content" id="demo-textarea" rows="6"
										style="margin-top: 30px; resize: none;">${board.content}</textarea>
										
										
								<div class="field uploadDiv">
									<h4>첨부파일</h4>
									<input type="file" name="uploadFile" multiple>
								</div>
									
								
								<div class="field">
									<div class="uploadResult">
									<ul></ul>
									</div>
								</div>

									

									<ul class="actions fit">
										<li><a href="submit"
											class="button primary small">수정</a></li>
										<li><a class="button primary small"
											href="/board/boardList${cri.getListLink()}&boardNum=${board.boardNum}">목록</a></li>
									</ul>
						
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="../../footer.jsp" />

	<!-- Scripts -->
	<script
		src="/resources/assets/js/jquery.min.js"></script>
	<script
		src="/resources/assets/js/jquery.scrollex.min.js"></script>
	<script
		src="/resources/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="/resources/assets/js/browser.min.js"></script>
	<script
		src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>
$(document).ready(function(){
   	var uploadResult = $(".uploadResult ul");
	var cloneObj = $(".uploadDiv").clone();//해당 요소를 복사해서 첨부한다음 다시 처음으로 초기화하기위해 
	var contextPath = "${pageContext.request.contextPath}";
	var regex = new RegExp("(.*/)\.(exe|sh|zip|alz)");
	var maxSize = 1024 * 1024 *5; //5MB
   
	function checkExtension(fileName, fileSize){
		if(regex.test(fileName)){
			alert("업로드 할 수 없는 확장자 입니다.");
			return false;
		}
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		return true;
	}
	
 // $("input[type='file']").on("change", function(e){
    $(".uploadDiv").on("change","input[type='file']", function(e){
        var formData = new FormData();
        var inputFile = $("input[name='uploadFile']");
        var files = inputFile[0].files;
        
        for(let i=0; i<files.length; i++){
           if(!checkExtension(files[i].name, files[i].size)){
              return false;
           }
           formData.append("uploadFile", files[i]);//formData에 값추가 
        }
        
        $.ajax({
           url: '/uploadAjaxAction',
           processData: false,
           contentType: false,
           data: formData,
           type: "post",
           dataType: "json",
           success: function(result){
              console.log(result);
              if(result.failureList.length != 0){
                 var str = "";
                 for(let i=0; i<result.failureList.length; i++){
                    str += result.failureList[i].fileName + "\n";
                 }
                 alert("지원하지 않는 파일의 형식은 제외되었습니다.\n" + str);
              }
              
              //썸네일 실행
              showUploadResult(result.succeedList);
              //기존에 있던 input태그 대신 DOM으로 넣었기 때문에 change이벤트도 위임을 통해 사용해야 한다.
              $(".uploadDiv").html(cloneObj.html()); //html()은 전체 값을 가져오는 것 
              //위에서 .uploadDiv요소를 복제한것을 넣어주었으니까 새로운 요소가 추가된거지? 그니까 우리가 str+=한거랑 비슷한거니까 위에서 이벤트 핸들러에 등록이 안된것
            		  //그니까 위임해야함
           }
        });
     });
    
    function showUploadResult(uploadResults){
		var str = "";
		$(uploadResults).each(function(i,obj){
			if(!obj.fileType){
				//일반 파일
				var filePath = encodeURIComponent(obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>"
				str +="<div><img src='/resources/images/nonImage.png' width= 100 height=100>";
				str += "<br>"+obj.fileName;
				str += "&nbsp;&nbsp;&nbsp;<span data-file='"+filePath+"' data-type='file'>X</span></div></li>";
			 }else{
                  //이미지 파일
                  var thumbPath = encodeURIComponent(obj.uploadPath + "\\s_" + obj.uuid + "_" + obj.fileName);
				  str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>"
                  str += "<div><img src='/display?fileName=" + thumbPath + "' width=100 height=100>";
                  str += "<br>" + obj.fileName;
                  str += "&nbsp;&nbsp;&nbsp;<span data-file='"+thumbPath+"' data-type='image'>x</span></div></li>";
               }
            });
            uploadResult.append(str);
         }
    
	$("a[href='submit']").on("click",function(e){
		e.preventDefault(); //등록을 누르면 submit이벤트를 막아줌 
		console.log("submit clicked");
		var form = $("form[role='form']");
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj){
		//obj는 js다. data()는 제이쿼리이기 때문에 $()로 감싸준다.--> 원래 $(요소명).data()로 가져오니까 DB에 저장하려면 넣어야댐
			str += "<input type ='hidden' name='attachList["+i+"].uploadPath' value='"+$(obj).data("path")+"'>";
			str += "<input type ='hidden' name='attachList["+i+"].uuid' value='"+$(obj).data("uuid")+"'>";
			str += "<input type ='hidden' name='attachList["+i+"].fileName' value='"+$(obj).data("filename")+"'>";
			str += "<input type ='hidden' name='attachList["+i+"].fileType' value='"+$(obj).data("type")+"'>";
			str += "<input type ='hidden' name='attachList["+i+"].boardNum' value='1'>";
		});
		form.append(str).submit();
	})
	
	
   $(".uploadResult").on("click","span",function(e){
	   if(confirm("파일을 삭제하시겠습니까?")){
		   $(this).closest("li").remove(); 
	   }
	   //수정 부분에서는 경로의 파일까지는 삭제하지 않는다.(실시간 DB조회 라이브러리로 해결)
   });
    
   $(".uploadResult").on("click", "li", function(e){
       console.log("view or download")
       var li = $(this);
       var path = encodeURIComponent(li.data("path") + "/" + li.data("uuid") + "_" + li.data("filename"));
       
       if(li.data("type")){
          //썸네일
          showImage(path.replace(new RegExp(/\\/g), "/"));
       }else{
          //다운로드
          self.location = "/download?fileName=" + path; 
       }
    });
   
    var check = false;
    function showImage(path){
       if(check){return;}
       $(".bigPictureWrapper").css("display", "flex").show();
       $(".bigPicture").html("<img src='/display?fileName=" + path + "'>")
       .animate({width:'100%', height:'100%'}, 1000);
       check = true;
       
    }
    
 $(".bigPictureWrapper").on("click", function(e){
    if(!check){return;}
    $(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
    setTimeout(function(){
       $(".bigPictureWrapper").hide();
       check = false;
    }, 1000);
 });
 
   (function(){
       var bno = "${board.bno}";
       console.log(bno);
       $.getJSON("/board/getAttachList", {bno:bno}, function(list){
          var str = "";
          
          $(list).each(function(i, obj){
             if(obj.fileType){
            	 
            	  var thumbPath = encodeURIComponent(obj.uploadPath + "\\s_" + obj.uuid + "_" + obj.fileName);
             str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>"
             str += "<div><img src='/display?fileName=" + thumbPath + "' width=100 height=100>";
             str += "<br>" + obj.fileName;
             str += "&nbsp;&nbsp;&nbsp;<span data-file='"+filePath+"' data-type='file'>X</span></div></li>";
             }else{
            	 var filePath = encodeURIComponent(obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName);
                str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'>"
             str += "<div><img src='/resources/images/nonImage.png' width=100 height=100>";
             str += "<br>" + obj.fileName;
             str += "&nbsp;&nbsp;&nbsp;<span data-file='"+thumbPath+"' data-type='image'>x</span></div></li>";
             }
          });
          $(".uploadResult ul").html(str);
       });
    })();//선언된걸 바로 사용(일회용)
})
</script>
</html>