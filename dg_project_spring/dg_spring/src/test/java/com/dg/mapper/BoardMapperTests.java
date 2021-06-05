package com.dg.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dg.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//비지니스 로직을 짜서 컨트롤러로 연결하기 전에 단위별로 테스트해서 사전에 오류를 잡는다.
//메퍼 class가 interface가 제대로 구동이 되는지 확인 한다.
@RunWith(SpringJUnit4ClassRunner.class) //작성한 코드가 스프링을 실행하도록 설정해준다.
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")//서버 요청시 초기화가 되는 것이 아닌? 테스트를 위해 명시한 객체들을 스프링 내의 객체들로 등록  
@Log4j
public class BoardMapperTests {
	@Setter(onMethod_=@Autowired) //생성자 주입
	private BoardMapper mapper;
	
	
	
	//페이지의 리스트 불러오기 
//	@Test
//	public void testGetListWithPaging() {
//		Criteria cri = new Criteria(2,10); //필드에서 초기화하는 것이 아닌 메소드 내에서는 직접 초기화를 해준다. 
//		long boardNum = 1; //QNA게시판 번호
//
//		mapper.getListWithPaging(cri, boardNum).forEach(board->log.info(board.getBno()));
//		
//	}
	
//	@Test
//	public void testGetTotal() {
//		Criteria cri = new Criteria();
//		Long boardNum = 1L;
//		
//		log.info("testGetTotal :"+mapper.getTotal(cri, boardNum));
//	}
	
	//해당 게시판 전체 글 
//	@Test
//	public void testGetList() {
//		Long boardNum = 2L;
//		
//		log.info(mapper.getList(boardNum));
//	}
	
//	@Test
//	public void testDelete() {
//		BoardVO board = new BoardVO();
//		board.setBoardNum(1L);
//		board.setBno(1L);
//		
//		log.info("delete :" +mapper.deleteBoard(board));
//	}
	
//	@Test
//	public void testModify() {
//		BoardVO board = new BoardVO();
//		board.setTitle("수정1");
//		board.setContent("수정내용");
//		board.setBoardNum(2L);
//		board.setBno(1L);
//		
//		log.info("modifyTest "+mapper.modifyBoard(board));
//		
//	}
	
//	@Test
//	public void testRead() {
//		BoardVO board = new BoardVO();
//	
//		board.setBno(1L);
//		board.setBoardNum(1L);
//		
//	log.info(mapper.readBoard(board));
//	
//	
//	}
	
	
	
//	@Test
//	public void testInsertSelectKey_bno() {
//		BoardVO board = new BoardVO();
//		board.setTitle("boardMapper testInsert");
//		board.setBoardNum(2L);
//		board.setContent("하이2");
//		board.setWriter("테스터1");
//		
//		mapper.insertSelectKey_bno(board);
//		log.info("testInsertKey"+board);//결과 창에서 방금 넣은 시퀀스의 값을 가져온다.
//	}
	
	
	
	
	
//	@Test 
//	public void testInsert() {
//		
//		BoardVO board = new BoardVO();
//		board.setTitle("boardMapper testInsert");
//		board.setBoard(1);
//		board.setContent("하이");
//		board.setWriter("테스터1");
//		
//		mapper.insertBoard(board);
//		log.info("testInsert"+board);//결과 창에서 방금 넣은 시퀀스의 값을 못가져옴 0으로 나온다.
//	}
	
	
	
}
