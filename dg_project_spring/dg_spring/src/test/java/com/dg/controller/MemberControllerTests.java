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

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class MemberControllerTests {

	@Setter(onMethod_= @Autowired)
	private WebApplicationContext wac; 
	private MockMvc mockMvc;	
	
	@Before //구동 전에 세팅을 한다는 거
	public void setUp() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	
//	@Test
//	public void testLogin() throws Exception{	
//		log.info(mockMvc.perform(MockMvcRequestBuilders.post("/member/memberLogin")
//				.param("memberId", "test01").param("memberPw", "1234"))		
//				.andReturn().getModelAndView().getViewName());
//
//	}
	
	@Test
	public void testcheckPhone() throws Exception{	
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/member/memberSms")
				.param("phone", "01011111111"))	
				.andReturn().getModelAndView().getViewName());
		
	}
}
