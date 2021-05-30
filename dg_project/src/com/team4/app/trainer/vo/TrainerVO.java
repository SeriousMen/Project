package com.team4.app.trainer.vo;

public class TrainerVO {
	/*CREATE TABLE DG_TRAINER(
			   TRAINERID VARCHAR2(200),
			   TRAINERPW VARCHAR2(300),
			   TRAINERNAME VARCHAR2(200),
			   TRAINERPHONENUM VARCHAR2(100),
			   TRAINERGENDER VARCHAR(10),
			   TRAINEREMAIL VARCHAR2(300),
			   TRAINERACCOUNT VARCHAR2(300),
			   TRAINERADDRESSZIPCODE VARCHAR2(500),
			   TRAINERADDRESS VARCHAR2(500),
			   TRAINERADDRESSDETAIL VARCHAR2(500),
			   TRAINERTRADE VARCHAR2(2000),
			   TRAINERPOINT NUMBER DEFAULT 0,
			   TRAINERNUM NUMBER UNIQUE NOT NULL,     
			   TRAINERCONTENT VARCHAR2(3000),
			   TRAINERURL VARCHAR2(500),
			   TRAINERLIKE NUMBER,
			   CONSTRAINT DG_TRAINER_PK PRIMARY KEY(TRAINERID)
			);*/
	private String trainerId;
	private String trainerPw;
	private String trainerName;
	private String trainerPhoneNum;
	private String trainerGender;
	private String trainerEmail;
	private String trainerAccount;
	private String trainerAddressZipCode;
	private String trainerAddress;
	private String trainerAddressDetail;
	private String trainerPrice;
	private int trainerPoint;
	private int trainerNum;
	private String trainerContent;
	private String trainerUrl;
	private int trainerLike;
	private String trainerProfileImage;
	
	public TrainerVO() {;}
	
	public String getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}
	public String getTrainerPw() {
		return trainerPw;
	}
	public void setTrainerPw(String trainerPw) {
		this.trainerPw = trainerPw;
	}
	public String getTrainerName() {
		return trainerName;
	}
	public void setTrainerName(String trainerName) {
		this.trainerName = trainerName;
	}
	public String getTrainerPhoneNum() {
		return trainerPhoneNum;
	}
	public void setTrainerPhoneNum(String trainerPhoneNum) {
		this.trainerPhoneNum = trainerPhoneNum;
	}
	public String getTrainerGender() {
		return trainerGender;
	}
	public void setTrainerGender(String trainerGender) {
		this.trainerGender = trainerGender;
	}
	public String getTrainerEmail() {
		return trainerEmail;
	}
	public void setTrainerEmail(String trainerEmail) {
		this.trainerEmail = trainerEmail;
	}
	public String getTrainerAccount() {
		return trainerAccount;
	}
	public void setTrainerAccount(String trainerAccount) {
		this.trainerAccount = trainerAccount;
	}
	public String getTrainerAddressZipCode() {
		return trainerAddressZipCode;
	}
	public void setTrainerAddressZipCode(String trainerAddressZipCode) {
		this.trainerAddressZipCode = trainerAddressZipCode;
	}
	public String getTrainerAddress() {
		return trainerAddress;
	}
	public void setTrainerAddress(String trainerAddress) {
		this.trainerAddress = trainerAddress;
	}
	public String getTrainerAddressDetail() {
		return trainerAddressDetail;
	}
	public void setTrainerAddressDetail(String trainerAddressDetail) {
		this.trainerAddressDetail = trainerAddressDetail;
	}
	public String getTrainerPrice() {
		return trainerPrice;
	}
	public void setTrainerPrice(String trainerPrice) {
		this.trainerPrice = trainerPrice;
	}
	public int getTrainerPoint() {
		return trainerPoint;
	}
	public void setTrainerPoint(int trainerPoint) {
		this.trainerPoint = trainerPoint;
	}
	public int getTrainerNum() {
		return trainerNum;
	}
	public void setTrainerNum(int trainerNum) {
		this.trainerNum = trainerNum;
	}
	public String getTrainerContent() {
		return trainerContent;
	}
	public void setTrainerContent(String trainerContent) {
		this.trainerContent = trainerContent;
	}
	public String getTrainerUrl() {
		return trainerUrl;
	}
	public void setTrainerUrl(String trainerUrl) {
		this.trainerUrl = trainerUrl;
	}
	public int getTrainerLike() {
		return trainerLike;
	}
	public void setTrainerLike(int trainerLike) {
		this.trainerLike = trainerLike;
	}

	public final String getTrainerProfileImage() {
		return trainerProfileImage;
	}

	public final void setTrainerProfileImage(String trainerProfileImage) {
		this.trainerProfileImage = trainerProfileImage;
	}
}
