package com.team4.app.qna.vo;
/*QNANUM NUMBER,
UPLOAD DATE DEFAULT SYSDATE,
QNATITLE VARCHAR2(500),
MEMBERID VARCHAR2(200),
QNACONTENT VARCHAR2(3000),
READCOUNT NUMBER,*/
public class QnaVO {
	private int qnaNum;
	private String upload;
	private String qnaTitle;
	private String memberId;
	private String qnaContent;
	private int readCount;
	
	public QnaVO() {;}

	public final int getQnaNum() {
		return qnaNum;
	}

	public final void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	public final String getUpload() {
		return upload;
	}

	public final void setUpload(String upload) {
		this.upload = upload;
	}

	public final String getQnaTitle() {
		return qnaTitle;
	}

	public final void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public final String getMemberId() {
		return memberId;
	}

	public final void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public final String getQnaContent() {
		return qnaContent;
	}

	public final void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public final int getReadCount() {
		return readCount;
	}

	public final void setReadCount(int readCount) {
		this.readCount = readCount;
	}
}
