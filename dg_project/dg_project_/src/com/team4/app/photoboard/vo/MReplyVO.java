package com.team4.app.photoboard.vo;

public class MReplyVO {

	/*
	 * CREATE TABLE DG_MREPLY( 
	 * MREPLYNUM NUMBER, 
	 * UPLOAD DATE DEFAULT SYSDATE,
	 * PHOTONUM NUMBER,
	 *  MEMBERID VARCHAR2(200),
	 *   MREPLYCONTENT VARCHAR2(3000),
	 * CONSTRAINT DG_MREPLY_PK PRIMARY KEY(MREPLYNUM),
	 *  CONSTRAINT
	 * DG_MREPLY_MEMBER_FK FOREIGN KEY(MEMBERID) REFERENCES DG_MEMBER(MEMBERID),
	 * CONSTRAINT DG_MREPLY_PHOTO_FK FOREIGN KEY(PHOTONUM) REFERENCES
	 * DG_PHOTOBOARD(PHOTOBOARDNUM) ON DELETE CASCADE );
	 */
	
	public MReplyVO() {
		// TODO Auto-generated constructor stub
	}
	
	private int mReplyNum;
	private String upload;
	private int photoNum;
	private String memberId;
	private String mReplyContent;
	
	
	public int getmReplyNum() {
		return mReplyNum;
	}
	public void setmReplyNum(int mReplyNum) {
		this.mReplyNum = mReplyNum;
	}
	public String getUpload() {
		return upload;
	}
	public void setUpload(String upload) {
		this.upload = upload;
	}
	public int getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getmReplyContent() {
		return mReplyContent;
	}
	public void setmReplyContent(String mReplyContent) {
		this.mReplyContent = mReplyContent;
	}
	
	
	
}
