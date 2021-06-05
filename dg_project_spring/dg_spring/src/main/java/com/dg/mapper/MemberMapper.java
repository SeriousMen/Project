package com.dg.mapper;

import org.apache.ibatis.annotations.Param;

import com.dg.domain.MemberVO;

public interface MemberMapper {

	public boolean join(MemberVO member);
	
	public int checkId(String userId);
	
	public int checkMemberId (String memberId);
	
	//로그인 검사시 어떤 로그인할 지 선택하게 하고 해당 컬럼에서만 조회하도로하기
	public int login(MemberVO member);
	
	public String findId(String phoneNum);//원래는 핸드폰 번호 겹칠일 없으니까 회원가입할때 이번호로 가입되있으면 못하게 막을 것 
	
	public int findPw(MemberVO member);
	
	public boolean changePw(@Param("newPw") String newPw, @Param("member") MemberVO member);
	
	public boolean changeId(@Param("newId") String newId, @Param("member") MemberVO member);
	
	public boolean withdrawal(MemberVO member);
	
	public int checkPhone(String phoneNum);
	
}
