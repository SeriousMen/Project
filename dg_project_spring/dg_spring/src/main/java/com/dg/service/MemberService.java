package com.dg.service;

import com.dg.domain.MemberVO;

public interface MemberService {

public boolean join(MemberVO member);
	
	public int checkId(String userId);
	
	public int checkMemberId (String memberId);
	
	public int login(MemberVO member);
	
	public String findId(String phoneNum);
	
	public int findPw(MemberVO member);
	
	public boolean changePw(String newPw,MemberVO member);
	
	public boolean changeId(String newId,MemberVO member);
	
	public boolean withdrawal(MemberVO member);
	
	public int checkPhone(String phoneNum);
	
	//암호화
	public String encrypt(String pw);
	//복호화
	public String decrypt(String enPw);
	
	//핸드폰 인증
	public String sms(String phoneNum);
	
}
