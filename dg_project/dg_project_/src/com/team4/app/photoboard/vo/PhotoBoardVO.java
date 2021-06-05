package com.team4.app.photoboard.vo;

public class PhotoBoardVO {
/*
	UPLOAD DATE DEFAULT SYSDATE,
	   PHOTOBOARDNUM NUMBER,
	   PHOTOBOARDTITLE VARCHAR2(1000),
	   MEMBERID VARCHAR2(200),
	   PHOTOBOARDCONTENT VARCHAR2(3000),
	   READCOUNT NUMBER,
	   CONSTRAINT DG_PHOTO_PK PRIMARY KEY(PHOTOBOARDNUM),
	   CONSTRAINT DG_PHOTO_FK FOREIGN KEY(MEMBERID) REFERENCES DG_MEMBER(MEMBERID) ON DELETE CASCADE*/
	public PhotoBoardVO() {;}
	
	private String upload;
	private int photoBoardNum;
	private String photoBoardTitle;
	private String memberId;
	private String photoBoardContent;
	private int readCount;
	private int replyNum;
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	public int getPhotoBoardNum() {
		return photoBoardNum;
	}
	public void setPhotoBoardNum(int photoBoardNum) {
		this.photoBoardNum = photoBoardNum;
	}
	public String getPhotoBoardTitle() {
		return photoBoardTitle;
	}
	public void setPhotoBoardTitle(String photoBoardTitle) {
		this.photoBoardTitle = photoBoardTitle;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getPhotoBoardContent() {
		return photoBoardContent;
	}
	public void setPhotoBoardContent(String photoBoardContent) {
		this.photoBoardContent = photoBoardContent;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	
	
	
	 
	
	
	
	
}
