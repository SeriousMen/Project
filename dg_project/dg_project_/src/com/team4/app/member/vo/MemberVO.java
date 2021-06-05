package com.team4.app.member.vo;

//CREATE TABLE DG_MEMBER(
//		   MEMBERID VARCHAR2(200),
//		   MEMBERPW VARCHAR2(300),
//		   MEMBERPHONE VARCHAR2(100),
//		   MEMBERPOINT NUMBER DEFAULT 0,
//		   MEMBERTRADE VARCHAR2(2000),
//		   CONSTRAINT DG_MEMBER_PK PRIMARY KEY(MEMBERID)
//		);



public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberPhone;
	private int memberPoint;
	private String memberTrade;
	
	public MemberVO() {;}
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public String getMemberTrade() {
		return memberTrade;
	}
	public void setMemberTrade(String memberTrade) {
		this.memberTrade = memberTrade;
	}
	
	
}
