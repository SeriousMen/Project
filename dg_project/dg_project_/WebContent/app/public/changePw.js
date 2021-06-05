/**
 * 
 */

var check = false;



function changeformSubmit(){
	var form = document.changePwForm;
	   
	   if(!check){
	      alert("다시 확인해주세요.");
	      return false;
	   }
	   form.submit();
}

$("input[name='newPw']").keyup(function(event){
	check = false;
	
	
	var pw = $("input[name='newPw']").val();
	if(pw == ""){
		$("#checkPw_msg").text("비밀번호를 입력해주세요.");
		return false;
	}
	var reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	
	if(!reg.test(pw)){
		$("#checkPw_msg").text("비밀번호는 8자리/소문자/숫자/특수문자 모두 포함해야 합니다.");
		$("#checkPw_msg").css("color", "red");
		return false;
	}else{
		$("#checkPw_msg").text("사용할 수 있는 비밀번호입니다.");
		$("#checkPw_msg").css("color", "black");
		check = true;
	}
});

$("input[name='PwOk']").keyup(function(event){
	check = false;
	var pw = $("input[name='newPw']").val();
	var checkPw = $("input[name='PwOk']").val();
	
	if(pw != checkPw){
		$("#equalPw_msg").text("비밀번호가 일치하지 않습니다.");
		$("#equalPw_msg").css("color", "red");
		return false;
	}else{
		$("#equalPw_msg").text("비밀번호가 일치합니다.");
		$("#equalPw_msg").css("color", "black");
		check = true;
	}
});