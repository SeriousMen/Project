 /**
 * 회원가입
 */

var check = false;


numberCheck = false;

function formSubmit(){
	var form = document.joinForm;
	//아이디는 4자 이상, 16자 이하로 입력
	if(form.memberId.value.length < 4 || form.memberId.value.length > 16){
		alert("아이디는 4자 이상, 16자 이하로 입력해주세요.");
		form.memberId.focus();
		return false;
	}
	
	if(form.memberPw.value == ""){
		alert("패스워드를 입력해주세요.");
		form.memberPw.focus();
		return false;
	}else{
		//8자리 이상, 소문자/숫자/특수문자 모두 포함되어 있는 지 검사
		var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		//한글이 있는 지 검사
		var hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		if(!reg.test(form.memberPw.value)){
			//정규식 조건에 맞지 않으면
			alert("비밀번호는 8자리 이상이어야 하며, 소문자/숫자/특수문자 모두 포함해야 합니다.");
			form.memberPw.focus();
			return false;
		}
		
		//비밀번호에 공백을 포함할 수 없다.
		else if(form.memberPw.value.search(/\s/) != -1){
			//비밀번호에서 공백을 찾았다면
			alert("비밀번호에 공백 없이 입력해주세요.");
			form.memberPw.focus();
			return false;
		}
	}
	
	if(!numberCheck){
		alert("인증번호 확인을 진행해주세요.");
		return false;
		
	}else{
		form.submit();
	}
}

function checkId(id){

	check = false;
	if(id == ""){
		$("#idCheck_text").text("아이디를 작성해주세요.");
	}else{
		
		$.ajax({
			
			url:contextPath + "/member/MemberCheckIdOk.me?id="+id,	
			type:"get",
			dataType:"text", 
			success:function(result){	
				if(result.trim() == "ok"){
					check = true;
					$("#idCheck_text").text("사용할 수 있는 아이디입니다.");
				}else{
					$("#idCheck_text").text("중복된 아이디입니다.");
				}
			},
			error:function(){	//통신 오류 시
				console.log("오류");
			}
		});
	}
}


$("input[name='memberId']").keyup(function(event){
	var id = $("input[name='memberId']").val();
	checkId(id);
});

var temp;

function sms(){
	check = false;
	var phone = $("#memberPhone").val();
	
	if(phone.length != 11 || phone == ""){
		alert("핸드폰 번호를 다시 확인해주세요.");
		return false;
	}else{
		$("#memberPhoneOk").removeAttr("readonly");
		$(".disabledbutton").removeAttr("disabled");
		$.ajax({
			url:contextPath+"/member/MemberSms.me?phone="+phone,
			type:"get",
			dataType:"text",
			success:function(result){
				check = true;
				temp = result.trim();
				console.log("result"+result.trim());
				console.log("성공");
			},
			error:function(a,b,c){
				console.log("sms오류");
			}
		});
	}
}

function certifiedCheck(){
	
	var checkPhone = $("input[name='memberPhoneOk']").val();
	
	console.log("temp : "+temp);
	console.log("memberPhoneOk : "+checkPhone);
	
	if(temp == checkPhone){
		alert("인증되었습니다.");
		numberCheck = true;
		return false;
	}else{
		alert("인증번호가 틀렸습니다.");
		return false;
	}
}









