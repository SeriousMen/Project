
/**
 * 트레이너 회원가입
 */

check = false;

idFormCheck= false;
numberCheck = false;
function certifiedCheck() {
	
	var checkPhone = $("input[name='trainerPhoneNumberOk']").val();
	console.log("temp : " + temp);
	console.log("trainerPhoneNumberOk : " + checkPhone);
	
		
	
	if (temp == checkPhone) {
		alert("인증되었습니다.");
		numberCheck = true;
		return false;
	} else {
		alert("인증번호가 틀렸습니다.");
		return false;
	}
}

function checkId(id) {
	console.log("checkId 들어옴");
	
	if (id == "") {
		$("#idCheck_text").text("아이디를 작성해주세요.");
	} else {

		$.ajax({

			url : contextPath + "/trainer/TrainerCheckIdOk.tr?id=" + id,
			type : "get",
			dataType : "text",
			success : function(result) {
				if (result.trim() == "ok") {
					idFormCheck = true;
					$("#idCheck_text").text("사용할 수 있는 아이디입니다.");
					return false;
				} else {
					$("#idCheck_text").text("중복된 아이디입니다.");
					idFormCheck= false;
					return false;
				}
			},
			error : function() { // 통신 오류 시
				console.log("오류");
			}
		});
	}
}

function formSubmit() {
	
	var form = document.joinForm;
	// 아이디는 4자 이상, 16자 이하로 입력
	if (form.trainerId.value.length < 4 || form.trainerId.value.length > 16) {
		alert("아이디는 4자 이상, 16자 이하로 입력해주세요.");
		form.trainerId.focus();
		return false;
	}

	if (form.trainerPw.value == "") {
		alert("패스워드를 입력해주세요.");
		form.trainerPw.focus();
		return false;
	} else { //위의 if문을 만족하지 않으면 실행한다.(패스워드를 입력하면 실핸한다는 말)
		// 8자리 이상, 소문자/숫자/특수문자 모두 포함되어 있는 지 검사
		var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		// 한글이 있는 지 검사
		var hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

		if (!reg.test(form.trainerPw.value)) { //만일 소문자/문자/특수문자를 모두 포함하지않는다면 
			// 정규식 조건에 맞지 않으면
			alert("비밀번호는 8자리 이상이어야 하며, 소문자/숫자/특수문자 모두 포함해야 합니다.");
			form.trainerPw.focus();
			return false;
		}

		// 비밀번호에 공백을 포함할 수 없다.
		else if (form.trainerPw.value.search(/\s/) != -1) {
			// 비밀번호에서 공백을 찾았다면
			alert("비밀번호에 공백 없이 입력해주세요.");
			form.trainerPw.focus();
			return false;
		}

	}
	
	if(form.trainerName.value == ""){
		alert("성함을 입력해주세요.");
		form.trainerName.focus();
		return false;
	}
	if(form.trainerPhoneNum.value == ""){
		alert("연락처를 입력해주세요.");
		form.trainerPhoneNum.focus();
		return false;
	}
	if(form.trainerPhoneNumberOk.value == ""){
		alert("연락처 인증번호를 입력해주세요.");
		form.trainerPhoneNumberOk.focus();
		return false;
	}
	if(form.trainerGender.value == ""){
		alert("성별을 선택해주세요.");
		form.trainerGender.focus();
		return false;
	}
	if(form.trainerEmail.value == ""){
		alert("이메일을 입력해주세요.");
		form.trainerEmail.focus();
		return false;
	}else { //위의 if문을 만족하지 않으면 실행한다.(패스워드를 입력하면 실핸한다는 말)
		// 8자리 이상, 소문자/숫자/특수문자 모두 포함되어 있는 지 검사
		var reg = /^[A-Z0-9+_.-]+@[A-Z0-9.-]+$/i ;
	

		if (!reg.test(form.trainerEmail.value)) { 
			// 정규식 조건에 맞지 않으면
			alert("올바른 형식의 이메일 주소를 입력해주세요");
			form.trainerEmail.focus();
			return false;
		}

		
	}
	if(form.trainerAccount.value == ""){
		alert("경력을 선택해주세요.");
		form.trainerAccount.focus();
		return false;
	}
	if(form.trainerAddressZipCode.value == ""){
		alert("우편번호를 검색해주세요.");
		form.trainerAddressZipCode.focus();
		return false;
	}
	if(form.trainerAddress.value == ""){
		alert("주소를 입력해주세요.");
		form.trainerAddress.focus();
		return false;
	}
	if(form.trainerUrl.value == ""){
		alert("오픈카톡URL을 입력해주세요.");
		form.trainerUrl.focus();
		return false;
	}

	if(!idFormCheck){
		alert("중복된 아이디입니다.다른 아이디를 입력해주세요.");
		return false;
	}
	
	if(!numberCheck){
		alert("인증번호 확인을 진행해주세요.");
		return false;
		
	}else{
		form.submit();
	}
}



$("input[name='trainerId']").keyup(function(event) {
	var id = $("input[name='trainerId']").val();
	checkId(id);

	console.log("keyup 들어옴");
});

var temp;

function sms() {
	check = false;
	var phone = $("#trainerPhoneNum").val();

	if (phone.length != 11 || phone == "") {
		alert("핸드폰 번호를 다시 확인해주세요.");
		return false;
	} else {
		$("#trainerPhoneNumberOk").removeAttr("readonly");
		$(".disabledbutton").removeAttr("disabled");
		$.ajax({
			url : contextPath + "/trainer/TrainerSms.tr?phone=" + phone,
			type : "get",
			dataType : "text",
			success : function(result) {
				check = true;
				temp = result.trim();
				console.log("result: " + result.trim());
				console.log("성공");
			},
			error : function(a, b, c) {
				console.log("sms오류");
			}
		});
	}
}


