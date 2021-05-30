package com.team4.app.fileName.vo;
/*CREATE TABLE FILENAME(
		   CATEGORYNUM NUMBER,
		   BOARDNUM NUMBER,
		   FILENAME VARCHAR2(3000),
		   CONSTRAINT FILE_PK PRIMARY KEY(FILENAME),
		   CONSTRAINT FILE_REPORT_FK FOREIGN KEY(REPORTNUM) REFERENCES DG_ADMIN(REPORTNUM) ON DELETE CASCADE,
		   CONSTRAINT FILE_REVIEW_FK FOREIGN KEY(BOARDNUM) REFERENCES DG_REVIEW(REVIEWNUM) ON DELETE CASCADE,
		   CONSTRAINT FILE_PHOTOBOARD_FK FOREIGN KEY(BOARDNUM) REFERENCES DG_PHOTOBOARD(PHOTOBOARDNUM) ON DELETE CASCADE,
		   CONSTRAINT FILE_TPAGE_FK FOREIGN KEY(BOARDNUM) REFERENCES DG_TPAGE(TPAGENUM) ON DELETE CASCADE,
		   CONSTRAINT FILE_QNA_FK FOREIGN KEY(BOARDNUM) REFERENCES DG_QNA(QNANUM) ON DELETE CASCADE
		);*/
public class FileNameVO {
	private String userId;
	private int categoryNum;
	private int boardNum;
	private String fileName;
	
	public FileNameVO() {;}

	public final int getCategoryNum() {
		return categoryNum;
	}

	public final void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}

	public final int getBoardNum() {
		return boardNum;
	}

	public final void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public final String getFileName() {
		return fileName;
	}

	public final void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
