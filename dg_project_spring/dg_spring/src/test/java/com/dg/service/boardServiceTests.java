package com.dg.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dg.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class boardServiceTests {
	//서비스 구축한거 테스트 한거니 업캐스팅을 위해(다형성을 위해) 부모 클래스(인터페이스) DI 
	//자식은 자식메소드+부모메소드 사용가능 부모는 부모메소드만 사용가능 자식꺼 사용하려면 다시 다운캐스팅해야함.
	@Setter(onMethod_=@Autowired) //서비스 객체좀 new 해줘 (주입해줘)
	private BoardService service; //인터페이스를 참조하면 해당 타입을 구현한 자식 객체들을 불러온다.
	//인터페이스는 미구현이라 객체를 생성할 수 없다. 그래서 타입만 선언해 놓고 해당 타입중 객체를 생성할 수 있는 것을 @Autowired를 통해 요청하고
	//등록되있는 bean중에 찾는다. 자식은 부모타입이므로 구현한 자식 객체가 생성이 되고 그래서 오버라이드한 메소드들을 사용할 수 있는 것이다.
	//만약 부모에서 선언한 것을 오버라이드한 것이 아닌 본인이 그냥 만든거면 부모타입으로 사용이 불가하다. 
	//만약 2개이상의 클래스가 해당 인터페이스를 구현하고 객체로 등록되면 어느것을 불러오라는 건지 모르기 때문에 예외가 발생한다.
	//이럴 땐 Qualifier등등을 사용해서 구분한다.
	//이러한 방식이 느슨한 결합이며 직접 코드를 수정할 필요 없이 해당 타입을 구현한 객체중 다른 로직을 사용한 구현체를 필요에 따라 갈아끼우기만 하면된다.
	// 객체를 참조할 때 인터페이스를 사용하라는 말이 이말이다. --> 인터페이스를 자료형으로 써라 ! 
	
//	@Test
//	public void testGetListWithPaging() {
//		Long boardNum = 1L;
//		service.getListWithPaging(new Criteria(), boardNum).forEach(board->log.info(board));
//	}
	
//	@Test
//	public void testGetList() {
//		Long boardNum =2L;
//		service.getList(boardNum).forEach(board->log.info(board));
//		//getList(boardNum)의 리턴 값(board)를 출력 
//	}
	
//	@Test
//	public void testGetTotal() {
//		Long boardNum =2L;
//		
//		log.info("testGetTotal :"+service.getTotal(new Criteria(), boardNum));
//	}

//	@Test 
//	public void testReadBoard() {
//		
//		BoardVO board = new BoardVO();
//		
//		board.setBno(4L);
//		board.setBoardNum(1L);
//		log.info("readTest :" +service.readBoard(board));	
//	}
	
//	@Test
//	public void testInsertBoard() {
//		BoardVO board = new BoardVO();
//		board.setBoardNum(2L);
//		board.setContent("바부");
//		board.setTitle("난최고");
//		board.setWriter("김두한");
//		service.insertBoard(board);
//	}
	
//	@Test
//	public void testModify() {
//		BoardVO board = new BoardVO();
//		board.setBoardNum(2L);
//		board.setBno(18L);
//		board.setContent("수정");
//		board.setTitle("수정");
//		
//		service.modifyBoard(board);
//	}
	
	@Test
	public void testDelete() {
		BoardVO board = new BoardVO();
		board.setBno(18L);
		board.setBoardNum(2L);
		
		service.deleteBoard(board);
	}
}
