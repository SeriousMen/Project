/**
 * 
 */
var check = false;


numberCheck = false;

function pwformSubmit() {
	var form = document.findPwForm;
	   
	   if(!check){
	      alert("다시 확인해주세요.");
	      return false;
	   }
	   form.submit();
}

var temp;

function sns(){
	check = false;
	var phone = $("#PhoneNum2").val();
	
	if(phone.length != 11 || phone == ""){
		alert("핸드폰 번호를 다시 확인해주세요.");
		return false;
	}else{
		$("#checkNum2").removeAttr("readonly");
		$(".disableAtag2").removeAttr("disabled");
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

function certifiedCheck2(){
	
	var checkPhone = $("input[name='checkNum2']").val();
	
	console.log("temp : "+temp);
	console.log("checkNum2 : "+checkPhone);
	
	if(temp == checkPhone){
		alert("인증되었습니다.");
		numberCheck = true;
		return false;
	}else{
		alert("인증번호가 틀렸습니다.");
		return false;
	}
}