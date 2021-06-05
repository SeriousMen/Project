package com.dg.domain;

import lombok.Getter;
import lombok.ToString;

//전체를 페이지로 분할하기 위해 만듬
@Getter //어처피 생성자에서 값을 다 세팅해줄꺼라서 setter가 필요없음
@ToString
public class PageDTO {
//뭐가 필요하겠니?
	private int startPage;
	private int endPage;
//	private int curPage;
	private boolean next, prev;
	private int total;
	private int realEnd;
	private Criteria cri; //선택된 페이지에 대한 정보를 가져오기 위해 
	 
	

	//요안에서 값을 다 초기화 해줄거임
	public PageDTO(Criteria cri, int total) {//여기서 total은 게시판에 등록된 전체 게시글수 getTotal()
		this.cri= cri; //서버에서 요청시 전달받은 cri의 객체들 담아준다.ex)cri.pageNum, cri.amount등
		this.total =total;
		
		//ceil()은 올림 함수
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		//-->getPageNum(현재페이지를 의미)가 10이하면 다 올림해서 1로 만들고 *10해서 10으로 10 넘으면 *20해서 20이 마지막 페이지로 일단 10단위로 정해놓는다.
		this.startPage = endPage-9; // 한 view에 보여지는 페이지수는 1~10, 11~20 이런식이니까 그 해당 view의 startPage를 설정
		
		this.realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		//10단위로 쪼개지는 기본 틀말고 진짜 마지막 페이지를 설정 만약 56개의 게시물이 있다면 한페이지에는 10개의 게시물만 보여야하니까 나누면 5.6페이지거기서 무조건 올림이니까
		//10개의 게시물을 다채우지 않더라도 6개의 게시물을 보여줄수 있는 공간인 6페이지가 마지막 페이지가 된다.
		
		if(realEnd <endPage) { //만일 실제 마지막페이지가 10페이지를 못채울정도라면(100개의 게시물 이하)
			endPage = realEnd; //endPage는 10개의 페이지수를 보일 수 없으니 realEnd에 맞춘다.
		}
	
		this.prev = this.startPage>1; //이렇게 start페이지는 1,11,21 이런단위로 가니까 1보다 크다면 11, 즉 이전 페이지가 있는 거니까 true 아니라면 false;
		this.next = realEnd>endPage;
		
	}
	
}
