package com.dg.service;

import java.util.Random;

import org.springframework.stereotype.Service;

import com.dg.domain.MemberVO;
import com.dg.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImple implements MemberService{
	private MemberMapper mapper;
	//에이작스로 유효성검사할 거라서 따로 선언만해둘것 
	@Override
	public boolean join(MemberVO member) {
		
		member.setMemberPw(encrypt(member.getMemberPw()));
		return mapper.join(member);
	}

	@Override
	public int checkId(String userId) {
		
		return mapper.checkId(userId);
	}

	@Override
	public int checkMemberId(String memberId) {
		
		return mapper.checkMemberId(memberId);
	}

	@Override
	public int login(MemberVO member) {
		member.setMemberPw(encrypt(member.getMemberPw()));
		return mapper.login(member);
	}

	@Override
	public String findId(String phoneNum) {
	
		return mapper.findId(phoneNum);
	}

	@Override //지정보알고있는지
	public int findPw(MemberVO member) {
		
		return mapper.findPw(member);
	}

	@Override
	public boolean changePw(String newPw, MemberVO member) {
		member.setMemberPw(encrypt(member.getMemberPw()));
		newPw = encrypt(newPw);
		return mapper.changePw(newPw, member);
	}

	@Override
	public boolean changeId(String newId,MemberVO member) {
		member.setMemberPw(encrypt(member.getMemberPw()));
		return mapper.changeId(newId, member);
	}

	@Override
	public boolean withdrawal(MemberVO member) {
		member.setMemberPw(encrypt(member.getMemberPw()));
		return mapper.withdrawal(member);
	}

	@Override
	public int checkPhone(String phoneNum) {
		
		return mapper.checkPhone(phoneNum);
	}

	@Override
	public String encrypt(String pw) {
		String en_pw="";
		int key = 3;
		for(int i=0;i<pw.length(); i++) {
			en_pw += (char)(pw.charAt(i)*key);
		}
		return en_pw;
	}

	@Override
	public String decrypt(String en_pw) {
		String de_pw="";
		int key = 3;
		for(int i=0;i<en_pw.length(); i++) {
			de_pw += (char)(en_pw.charAt(i)/key);
		}
		return de_pw;
	}

	@Override
	public String sms(String phoneNum) {
		String num = (new Random().nextInt(9000)+1000)+""; //1000~9999 랜덤숫자 뽑은 다음 문자열로
		//jsp에서 사용한 coolsms은 안쓰고 기능만 구현하도록하겠음 
		
		return num;
	}

}
