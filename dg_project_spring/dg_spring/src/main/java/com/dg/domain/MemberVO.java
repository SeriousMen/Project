package com.dg.domain;

import lombok.Data;

@Data
public class MemberVO {

	/*  CREATE TABLE DS_MEMBER(
		      MEMBERID VARCHAR2(200),
		      MEMBERPW VARCHAR2(300),
		      MEMBERPHONE VARCHAR2(100),
		      MEMBERPOINT NUMBER DEFAULT 0,
		      CONSTRAINT DS_MEMBER_PK PRIMARY KEY(MEMBERID)
		   );*/
	private String memberId;
	private String memberPw;
	private String memberPhone;
	private int memberPoint;
	
	
}
