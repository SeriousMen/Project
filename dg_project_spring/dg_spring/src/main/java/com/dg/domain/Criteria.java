package com.dg.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;

//해당 페이지에서의 정보를 담기 위해 (선택한 페이지의 정보)
@Data //여기서 requiredContructor를 생성하기 때문에 기본생성자를 생성하지만(필드에 notnull이나 final표식을 안해놨으니까)
@AllArgsConstructor//여기서 모든 필드의 생성자를 생성해주기 떄문에 상쇄 , 그래서 기본 생성자를 만들어줘야함
public class Criteria {

	private int pageNum;
	private int amount;
	
	//검색시 나온 페이지의 정보를 담기위해 
	private String type; //어떤 검색목록을 골랐는지
	private String keyword; //그 검색 목록안에서 입력한 키워드를 가져올 것 
	
	public Criteria() {
		this(1,10); //this는 Criteria자신을 가르킨다.(this 생성자) 
		//아무것도 지정하지 않았다면 당연히 1페이지에 10개의 게시물(혹은 댓글?)들이 있겠지
	}


	public Criteria(int pageNum, int amount) { //위에 this생성자의 선언
		this.pageNum=pageNum;
		this.amount=amount;
		
	}
	
	//BoardMapper.xml에서 선택한 타입에 따라 동적쿼리를 구현하기 위한 메소드 선언 
	public String[] getTypeArr() {
		
		return type == null ? new String [] {} : type.split(""); //split은 문자열을 잘라 '배열'의 형태로 리턴해준다. 
		//type ==null은 단순 조건식 , 이 삼항 연산자의 목적은 return 뒤에 아무것도 없는게 올 것인지 쪼갠게 올 것인지를 정하는 것 
	}
	
	//각 수정과 삭제 등을 할때 페이지 번호, 개수,검색조건, 검색 키워드를 매번 넘겨줘야할 때 사용한다. 
	// "?pageNum=3&amount=20&type=TC&keyword=%EC%83%88%EB%A1%9C "와 같이 GET방식에 적합한 URL 인코딩된 결과로 만들어 진다.
	public String getListLink() {
		//쿼리스트링을 자동으로 만들어주는 라이브러리
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum) //getPageNum()을 쓰던 그냥 필드를 가져오던 상관없을 듯 
				.queryParam("amount", this.amount)
				.queryParam("keyword", this.getKeyword() )
				.queryParam("type", this.getType());
		
		return builder.toUriString();
				
		//이걸 쓰고 컨트롤러에 cri.getListLink(); 를 넣어주면 저 위의 4개 값들을 rttr.addAttribute에 넣을 필요가 없음 
		
	}
	
	
}
