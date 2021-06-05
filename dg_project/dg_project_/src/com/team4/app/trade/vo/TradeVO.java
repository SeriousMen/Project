package com.team4.app.trade.vo;

public class TradeVO {

	private int tradeNum;
	private String userId;
	private String trainerId;
	private String tradeContent;
	private String upload;
	private int checkReview;
	
	public TradeVO() {;}

	public int getTradeNum() {
		return tradeNum;
	}

	public void setTradeNum(int tradeNum) {
		this.tradeNum = tradeNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTrainerId() {
		return trainerId;
	}

	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}

	public String getTradeContent() {
		return tradeContent;
	}

	public void setTradeContent(String tradeContent) {
		this.tradeContent = tradeContent;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}

	public int getCheckReview() {
		return checkReview;
	}

	public void setCheckReview(int checkReview) {
		this.checkReview = checkReview;
	}

	

	
	
	
}
