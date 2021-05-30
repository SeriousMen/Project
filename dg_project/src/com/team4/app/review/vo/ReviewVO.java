package com.team4.app.review.vo;
/*UPLOAD DATE DEFAULT SYSDATE,
REVIEWNUM NUMBER,
TRAINERID VARCHAR2(200),
MEMBERID VARCHAR2(200),
REVIEWCONTENT VARCHAR2(3000),*/
public class ReviewVO {
	private String upload;
	private int reviewNum;
	private String trainerId;
	private String memberId;
	private String reviewContent;
	
	public ReviewVO() {;}

	public final String getUpload() {
		return upload;
	}

	public final void setUpload(String upload) {
		this.upload = upload;
	}

	public final int getReviewNum() {
		return reviewNum;
	}

	public final void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public final String getTrainerId() {
		return trainerId;
	}

	public final void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}

	public final String getMemberId() {
		return memberId;
	}

	public final void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public final String getReviewContent() {
		return reviewContent;
	}

	public final void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
}
