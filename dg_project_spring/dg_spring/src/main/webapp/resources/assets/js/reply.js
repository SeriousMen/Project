/**
 * 댓글 관련 Ajax구현 
 */

console.log("Reply Ajax");

var replyService =(function(){//함수선언 한다음 바로 쓸 것
	
	//자바스크립트는 인수가 여러개일 때 한개만 전달받는다고 문제가 생기지 않는다.
	//누락된 인자 값은 undefined가 들어간다.
	// 또 초과되는 경우에는 초과된 인자를 무시한다.
	//댓글 입력
	function add(reply, callback, error){
		//자바스크립트는 함수를 값으로 생각해서 이렇게 중첩함수를 선언할 수 있다.
		//해당 함수의 리턴 값으로 리턴값을 가져옴. 당연히 사용할 때도 해당함수를 지정해서사용
		console.log("add reply...");
		
		$.ajax({//여러개 값 전달하기 위해{}//설정은 자바스크립트 객체 형식으로 전달하고 값은 제이슨 타입으로 전달함
			type:"post",
			url:"/reply/add",
			data:JSON.stringify(reply), //제이슨타입으로 변환해주는 함수,JSON.parse()는 객체로 변환해주는것
			contentType:"application/json; charset= utf-8",
			success: function(result){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr,status,err){
				if(error){
					error(err);
				}
			}
		});
	}//add끝
	
	//댓글 목록 
	function getList(param,callback,error){
		var bNum = param.bNum;
		var bno = param.bno;
		var page = param.page || 1; //page 값이 undefined들어오면 1
		
		$.getJSON("/reply/pages/"+bNum+"/"+bno+"/"+page+".json",
				//함수명에서 보듯 get방식으로 Json데이터를 보낸다는 설정이 되있다. URL만 적었음
				function(data){//만일 성공해서 컨트롤러부터 리턴값을 받았다면 
			if(callback){callback(data.replyCnt, data.list);}//콜백함수를 실행해라
		}).fail(function(xhr,status,err){
			if(error){error(err);}
		});	
	}
	
	//댓글 삭제
	function remove(rno,callback,error){
		console.log("remove js..")
		
		$.ajax({
			type:"delete", //rest방식에서 delete매핑타입
			url:"/reply/"+rno,
			
			success: function(result){
				if(callback){
					callback(result);
				}
			},
			error: function(xhr, status,err){
				if(error){
					error(err);
				}
			}
		});
	}
	
	//댓글 수정
	function modify(reply, callback, error){
		console.log("modify..ajax");
		console.log("RNO: "+reply.rno);
		
		$.ajax({
			type:"put",
			url:"/reply/modify",
			data: JSON.stringify(reply),
			contentType:"application/json; charset=utf-8",
			success: function(result){
					if(callback){
						callback(result);
					}
			},
			error: function(xhr,status,err){
				if(error){
					error(err);
				}
				
			}
			
		});
	}
	
	//댓글 하나 가져오기
	function get(rno,callback, error){
		console.log("get..ajax");
		
		$.get("/reply/"+rno+".json",function(result){//getJSON에서 json생략
			if(callback){callback(result);}
		}).fail(function(xhr,status,err){
			if(error){
				error(err);
			}
		})
	}
	
	return {add:add, getList:getList, remove:remove, modify:modify, get:get}
})();