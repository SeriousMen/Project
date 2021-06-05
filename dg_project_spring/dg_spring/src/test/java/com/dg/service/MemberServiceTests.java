package com.dg.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dg.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {

	@Setter(onMethod_=@Autowired)
	private MemberService service;
	
	
//	@Test
//	public void jointest() {
//		MemberVO member = new MemberVO();
//		String userId = "test03";
////		String phoneNum="01098989898";
//		String phoneNum="01098989898";
//		member.setMemberId(userId);
//		member.setMemberPw("1234");
//		member.setMemberPhone(phoneNum);
//		if(service.checkId(userId)!=1) {
//			log.info("아이디 중복안됨");
//			if(service.checkPhone(phoneNum)!=1) {
//			log.info("휴대폰 번호 중복안됨");
//			log.info("회원가입"+service.join(member));
//			}else {
//				log.info("휴대폰 번호 중복됨");
//			}
//		}else {
//			log.info("아아디 중복됨");
//		}				
//	}
	
//	@Test
//	public void loginTest() {
//		MemberVO member = new MemberVO();
//		String memberId = "test02";
//		String pw = "1234"; 
//		
//		member.setMemberId(memberId);
//		member.setMemberPw(pw);
//		if(service.login(member) ==1) {
//			log.info("로그인 성공");
//		}else {
//			log.info("로그인 실패: ");
//		}
//	}
	
//	@Test
//	public void findIdTest() {
//		String phoneNum = "01098989898";
//		
//		log.info("아이디는?" +service.findId(phoneNum));
//	}
	
//	@Test
//	public void findPwTest() {
//		MemberVO member = new MemberVO();
//		String memberId = "test02";
//		String memberPhone = "01098989898";
//		String newPw = "member11!";
//		member.setMemberId(memberId);
//		member.setMemberPhone(memberPhone);
//		if(service.findPw(member)==1) {
//			log.info("정보맞음");
//			member.setMemberPw("1234");
//			log.info("비번바꿈? : "+service.changePw(newPw, member));
//		}else
//		log.info("정보틀림");
//	}
	
	@Test
	public void withdrawalTest() {
		MemberVO member = new MemberVO();
		member.setMemberId("test02");
		member.setMemberPw("member11!");
		if(service.withdrawal(member)) {
			log.info("탈퇴 선공");
		}
	}
}
