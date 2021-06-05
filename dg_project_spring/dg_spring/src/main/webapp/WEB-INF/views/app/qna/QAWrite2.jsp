<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
	Visualize by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/images/blackLogo.png" rel="shortcut icon" type="image/x-icon">
<title>게시글 작성하기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
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

@media screen and (max-width: 1680px) {
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
				<h1 style="margin-top: 10%;">Q&A 작성하기</h1>
				<p>회원님들의 Q&A는 서비스 개선에 큰 도움이 됩니다!</p>
				</header>
			</div>
		</div>
		<div class="wrapper">
			<div class="inner">
			
					<c:if test="${session_m_id != null}">
						<form role = "form" name="qnaBoardForm" method="post" id="qnaBoardForm"
								action="/board/insertBoard"
									 enctype="multipart/form-data"><!-- enctype="multipart/form-data"안에 이거 였는데 지금 글만 전송하는거라 안되고 다른 설정이 필요할듯 -->
							 <input type="hidden" id = "boardNum" name="boardNum" value="1"> 
							<div class="row gtr-uniform">
								<div class="col-6 col-12-xsmall" style="margin: 0 auto;">
						<input type="text" name="title" id="title" placeholder="제목을 입력해주세요." /> 
							<input type="text" name="writer" id="writer" value="${session_m_id}"
										readonly="readonly" />
									<textarea name="content" id="content" rows="6"
										style="margin-top: 30px; resize: none;"></textarea>

							<div class="field uploadDiv">
									<h4>첨부파일</h4>
									<input type="file" name="uploadFile" multiple>
									<!--multiple 속성은 input 요소에 사용자가 둘 이상의 값을 입력할 수 있음을 명시한다.
									multiple속성이 제대로 동작하는 <input>의 type은 email,file이 있다.
									email인 경우 이메일 사이에 콤마를 사용해 여러 이메일을 동시에 입력할 수 있고
									file인경우 컨트롤이나 쉬프트 키를 사용해서 여러파일을 동시에 선택할 수 있다.
									multiple속성은 boolean속성임으로 명시하지 않으면 false 명시하면 true다.  -->
								</div>
								<div class="field">
									<div class="uploadResult">
									<ul></ul>
									</div>
								</div>

									
									<p style="color: red;">*이미지가 나올때까지 기다려주세요!</p>
									<ul class="actions fit">
										<li><a href="submit" 
											class="button primary fit"> 등록</a></li>
									</ul>
								</div>
							</div>
						</form>
					</c:if>
			
			
			</div>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="../../footer.jsp" />

	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>
$(document).ready(function(){
	var uploadResult = $(".uploadResult ul");   //썸네일을 위한 공간or 일반파일을 대표하는 이미지 목록이 들어갈 ul태그
	var cloneObj = $(".uploadDiv").clone();	//파일 업로드를하고나면 file의 값을 비워지게 초기화하기 위해 해당 파일타입을 담고있는 DIV를 미리 복사해서 새로운 요소를 만든다.
	var contextPath = "${pageContext.request.contextPath}";// 자바스크립트는 servlet-context를 통해 오는게 아니기 때문에 이렇게 경로 가져와서 설정
	var regex = new RegExp("(.*/)\.(exe|sh|zip|alz)"); // 해당 확장자의 파일을 제한하기위한 정규식 test() true
	var maxSize = 1024 * 1024 *5; //5MB
	
	function checkExtension(fileName, fileSize){ //업로드하는 파일의 유효성 검사를 위한 함수 
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
	
	$(".uploadResult").on("click","span",function(e){//이벤트 위임을 해서 동적으로 추가한 X를 클릭했을 때 이벤트를 발생하게한다.
		var file = $(this).data("file");//파일정보 
		var type = $(this).data("type");
		var target = $(this).closest("li");//업로드된 썸네일들을 가져온다.
		$.ajax({
			url:"/deleteFile",
			data: {fileName:file , fileType:type },
			dataType: "text",
			type:"post",
			success: function(result){
				alert(result); //해당 경로에 업로드된 파일을 JAVA서버단에서 삭제했다면, li태그도 삭제해준다.
				target.remove();//썸네일 취소
			}
		});
	})
	
	//등록완료 버튼 클릭시 들어온다.
	$("a[href='submit']").on("click",function(e){
		e.preventDefault(); //등록을 누르면 submit이벤트를 막아줌 
		console.log("submit clicked");
		var form = $("form[role='form']");
		var str = "";
		
		//썸네일(업로드된 파일)의 개수만큼 반복 
		$(".uploadResult ul li").each(function(i, obj){
		//obj는 js다. data()는 제이쿼리이기 때문에 $()로 감싸준다.
		//submit을 하기 전에 첨부파일의 정보도 같이 담아준다.
			str += "<input type ='hidden' name='attachList["+i+"].uploadPath' value='"+$(obj).data("path")+"'>";
			str += "<input type ='hidden' name='attachList["+i+"].uuid' value='"+$(obj).data("uuid")+"'>";
			str += "<input type ='hidden' name='attachList["+i+"].fileName' value='"+$(obj).data("filename")+"'>";
			str += "<input type ='hidden' name='attachList["+i+"].fileType' value='"+$(obj).data("type")+"'>";
			str += "<input type ='hidden' name='attachList["+i+"].boardNum' value='1'>";
		});
		//form 데이터에 첨부파일 정보를 추가한 후 submit해준다.
		form.append(str).submit();
	})
	
	//업로드에 성공한 파일 list를 전달받고, HTML에 추가해준다.
	function showUploadResult(uploadResults){
		var str = "";
		//업로드된 파일 개수 만큼 반복한다.
		$(uploadResults).each(function(i,obj){
			//encodeURIComponent(): 서버로 특정 문자열을 전솔할 때 명령어로 인식하는 문자 혹은 인식이 불가능한 문자를 코드 번호로 변경시켜주는 함수
			if(!obj.fileType){//fileType은 VO에 boolean으로 설정했기 때문에 조건식 자리에 바로 사용한다.
				//일반 파일
				var filePath = encodeURIComponent(obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>"
				str +="<div><img src='/resources/images/nonImage.png' width= 100 height=100>";//미리 준비한 이미지로 대체 
				str += "<br>"+obj.fileName;
				str += "&nbsp;&nbsp;&nbsp;<span data-file='"+filePath+"' data-type='file'>X</span></div></li>";
			 }else{
                  //이미지 파일
                  var thumbPath = encodeURIComponent(obj.uploadPath + "\\s_" + obj.uuid + "_" + obj.fileName);
				  str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>"
                 //img태그의 src에 byte[]을 전달받은 후 브라우저에서 랜더링을 통해 해당 이미지로 복원된다.
				  str += "<div><img src='/display?fileName=" + thumbPath + "' width=100 height=100>";
                  str += "<br>" + obj.fileName;
                  str += "&nbsp;&nbsp;&nbsp;<span data-file='"+thumbPath+"' data-type='image'>x</span></div></li>";
               }
            });
		//썸네일의 ul태그에 li태그들을 추가해준다.
		//append를 사용하는 이유는 여러 번 첨부파일 추가를 진행헀을 때 이전 목록을 유지하기 위함이다.
            uploadResult.append(str);
         }
         
       //  $("input[type='file']").on("change", function(e){//해당 하는 요소에 변화가 생기면(값이 추가되는 것처럼 ) 작동하는 메소드
        $(".uploadDiv").on("change","input[type='file']", function(e){
            var formData = new FormData();//빈 FormData객체를 만든다.(form태그를 만든다고 생각) append를 통해 key와 value쌍을 추가하기 위해서이다.
            var inputFile = $("input[name='uploadFile']");//해당 태그의 요소를 가져와서
            var files = inputFile[0].files; //해당 태그의 업로드된 파일 정보를 가져온다.//해당 태그들 중 첫번 째 인풋 태그에서 파일들을 가져온다.
            
            for(let i=0; i<files.length; i++){ //multiple(다중파일)이기 때문에 각 인덱스에 있는 정보들을 뽑아온다.
               if(!checkExtension(files[i].name, files[i].size)){//유효성 검사를 해서 false면 false
                  return false;
               }
               formData.append("uploadFile", files[i]); // 아니라면 uploadFile에 해당 파일들을 담아라 
            }
            console.log("uploadAjax로 간다");
            //그리고 ajax요청
            $.ajax({
               url: '/uploadAjaxAction',
               processData: false,
               contentType: false, //default로 전달하면 충돌 혹은 오류가 발생하기 때문에 false로 해준다.
               data: formData, //위에서 담은 forData를 보낸다. 자동으로 contenType이 multipart로 설정된다.
               type: "post",
               dataType: "json",//제이슨 타입으로 데이터 받을 거다
               success: function(result){
                  console.log(result);
                  if(result.failureList.length != 0){//업로드실패한 파일이 있다면
                     var str = "";
                     for(let i=0; i<result.failureList.length; i++){
                        str += result.failureList[i].fileName + "\n";
                     }
                     alert("지원하지 않는 파일의 형식은 제외되었습니다.\n" + str);//해당 파일 실패 알림
                  }
                  
                  //썸네일 실행
                  showUploadResult(result.succeedList);//성공한거 썸네일 출력
                  $(".uploadDiv").html(cloneObj.html());//input file의 내용을 초기화하기위해 아까 복사한 요소의 값을 넣어줘서 초기화한다.
               }
            });
         });
      });
</script>
</html>