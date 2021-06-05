package com.team4.app.report.vo;
/*REPORTNUM NUMBER,
REPORTTITLE VARCHAR2(1000),
REPORTID VARCHAR2(500),
REPORTCONTENT VARCHAR2(3000),
UPLOAD DATE DEFAULT SYSDATE,
READCOUNT NUMBER,*/
public class ReportVO {
	private int reportNum;
	private String reportTitle;
	private String reportId;
	private String reportContent;
	private String upload;
	private int readCount;
	
	public ReportVO() {;}

	public int getReportNum() {
		return reportNum;
	}

	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getUpload() {
		return upload;
	}

	public void setUpload(String upload) {
		this.upload = upload;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	
}
