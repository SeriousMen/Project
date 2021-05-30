package com.team4.app.qna.vo;
/*QREPLYNUM NUMBER(10),
UPLOAD DATE DEFAULT SYSDATE,
QNANUM NUMBER(10),
MEMBERID VARCHAR2(100),
QREPLYCONTENT VARCHAR2(3000),*/
public class QreplyVO {
	private int qreplyNum;
	private String upload;
	private int qnaNum;
	private String memberId;
	private String qreplyContent;
	
	public QreplyVO() {;}

	public final int getQreplyNum() {
		return qreplyNum;
	}

	public final void setQreplyNum(int qreplyNum) {
		this.qreplyNum = qreplyNum;
	}

	public final String getUpload() {
		return upload;
	}

	public final void setUpload(String upload) {
		this.upload = upload;
	}

	public final int getQnaNum() {
		return qnaNum;
	}

	public final void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public final String getMemberId() {
		return memberId;
	}

	public final void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public final String getQreplyContent() {
		return qreplyContent;
	}

	public final void setQreplyContent(String qreplyContent) {
		this.qreplyContent = qreplyContent;
	}
}
