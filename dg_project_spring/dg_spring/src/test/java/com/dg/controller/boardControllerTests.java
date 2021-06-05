package com.dg.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.dg.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
//컨트롤러라서 servlet-context.xml(서버와 관련된) 설정도 해주나보다..
@Log4j
public class boardControllerTests {

	@Setter(onMethod_= @Autowired)
	private WebApplicationContext wac; // 아마도 서버의 요청을 구현해야해서 해당 객체를 주입하려나보다.
	private MockMvc mockMvc;	// mock: 속이다 기믹질하다 뭐 단어 그대로 가상의 구현 공간을 만든다는 거겠지.
	
	@Before //구동 전에 세팅을 한다는 거
	public void setUp() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
//	@Test
//	public void testList() throws Exception{
//		log.info(mocMvc.perform(MockMvcRequestBuilders.get("/board/aa")
//				.param("boardNum", "1L")).andReturn().getModelAndView().getModelMap());
//				
//	}
	/**
	 * MockMvc.perform() 메소드로 리턴되는 인터페이스. 지원 메소드는 대표적으로 3가지 있다.
	 * andReturn()은 테스트한 결과 객체를 받을 때 사용한다.
	 * andDo()는 요청에 대한 처리를 한다 보통 .andDo(print())) 처럼 print()메소드를 많이 쓴다.
	 * andExpect()는 예상 값을 검증한다. assert메소드와 유사한 기능이다. ex) andExpect(status().isOk()) 
	 * 
	 */
//	
//	@Test
//	public void testRead() throws Exception{	
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/read?boardNum=1&bno=5"))
//				//URL로 전달할 땐 자바언어가 아니니까 L없이 1,5이런식으로 전달한다.
//				//그리고 받는 타입에서 Long으로 형변환하겠지..
//				.andReturn().getModelAndView().getViewName()); //getModelMap도 가능
//		//Model객체를 전다랗고 있다면 getViewName()대신 getModelMap()을 사용할 수 있고
//		//RedirectAttributes의 flash attribute를 사용하고 있다면 getModelAndView() 대신 getFlashMap()을 사용할 수있다.
//	}
	
	@Test
	public void testInsert() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/insertBoard")
				.param("boardNum", "1")
				.param("title", "테스트 새글2")
				.param("content", "테스트 내용")
				.param("writer", "김덕구"))
				.andReturn().getModelAndView().getModelMap());
	}
	
//	@Test
//	public void testList() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/boardList")
//				.param("boardNum", "1"))
//				.andReturn().getModelAndView().getViewName());
//	}
	
//	@Test
//	public void testModify() throws Exception{
//		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/board/modifyBoard")
//				.param("boardNum", "1")
//				.param("bno", "13")
//				.param("title", "수정 테스트 새글")
//				.param("content", "수정 테스트 내용")	
//				).andReturn().getModelAndView().getModelMap());
//	}
//	
//	@Test
//	public void testDelete() throws Exception {
//		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/deleteBoard")
//				.param("boardNum", "1")
//				.param("bno", "13"))
//				.andReturn().getModelAndView().getModelMap());
//	}
}
