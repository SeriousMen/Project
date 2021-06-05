package com.dg.mapper;

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
public class MemberMapperTests {
	
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
//	@Test
//	public void testJoinMember() {
//		MemberVO member = new MemberVO();
//		String userId="test02";
//		if(mapper.checkId(userId)==1) {
//			log.info("중복된아이디다.");
//			return;
//		}
//		member.setMemberId(userId);
//		member.setMemberPw("1234"); //아이디 암호화 처리도 할 것  (서비스에서?)
//		member.setMemberPhone("01011111112");
//			log.info(mapper.join(member));
//		
//	}
	
//	@Test//flag들 다 실험 
//	public void testCheckMemberId() {
//		MemberVO member = new MemberVO();
//		String memberId = "test02";
//		String phoneNum = "01011111112";
//		String memberPw="1234";
//		member.setMemberId(memberId);;
//		member.setMemberPw(memberPw);
//		if(mapper.login(member)==1) {
//			log.info("회원아이디여부: "+mapper.checkMemberId(memberId));
//			log.info("회원아이디는?:"+mapper.findId(phoneNum));
//			
//		}else {
//			log.info("회원아이디여부: "+mapper.checkMemberId(memberId));
//			log.info("회원아이디는?:"+mapper.findId(phoneNum));
//		}
//		
//	}
	
//	@Test
//	public void testFindPw() {
//		MemberVO member = new MemberVO();
//		member.setMemberId("test02");
//		member.setMemberPhone("01011111112");
//		member.setMemberPw("0000");
//		String newPw="1234";
//		if(mapper.findPw(member)==1) {
//			if(mapper.changePw(newPw,member)) {
//				log.info("비밀번호"+newPw+"으로 변경");
//				
//			}else {
//				log.info("비밀번호가 틀렸어요");
//			}
//		}else {
//			log.info("아이디나 핸드폰번호가 틀렸어요");
//		}
//	}
	
	@Test
	public void testChangeId() {
		MemberVO member = new MemberVO();
		member.setMemberId("testChange2");
		member.setMemberPw("0000");
		String newId = "testChange2";
		
//		if(mapper.changeId(newId, member)) {
//			log.info("변경완료");
			if(mapper.withdrawal(member)) {
				log.info("탈퇴완료");
			}
//		}else {
//			log.info("정보가 잘못됨");
//			
//		}
				
		
	}
	
}
