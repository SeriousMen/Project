package com.dg.domain;

import lombok.Data;

@Data
public class ReplyVO {

	/*CREATE TABLE DS_REPLY(
	RNO NUMBER(10),
	BNO NUMBER(10) NOT NULL,
	BOARD NUMBER(10) NOT NULL,
	REPLY VARCHAR2(1000) NOT NULL,
	REPLYER VARCHAR2(100) NOT NULL,
	REPLYDATE DATE DEFAULT SYSDATE,
	UPDATEDATE DATE DEFAULT SYSDATE
);*/
	
	private long rno;
	private long bno;
	private long boardNum;
	private String reply;
	private String replyer;
	private String replyDate;
	private String updateDate;
	
}
