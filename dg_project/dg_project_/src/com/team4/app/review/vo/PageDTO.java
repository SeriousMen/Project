package com.team4.app.review.vo;

public class PageDTO {
	private int page;
	private int amount;
	private int boardSize;
	private int pageSize;
	private int endRow;
	private int startRow;
	private int startPage;
	private int endPage;
	private int totalCnt;
	private int realEndPage;
	private int realEndRow;
	
	public PageDTO() {
		this(1, 10, 5);
	}
	public PageDTO(int page, int amount, int totalCnt) {
		this.page = page;
		this.amount = amount;
		this.pageSize = 5;
		this.endRow = page * amount;
		this.startRow = endRow - (amount - 1);
		this.startPage = ((page - 1) / pageSize) * pageSize + 1;
		this.endPage = startPage + (pageSize - 1);
		this.totalCnt = totalCnt;
		this.realEndPage = (totalCnt - 1) / pageSize + 1;
		this.endPage = this.endPage > this.realEndPage ? this.realEndPage : this.endPage;
		this.endRow = this.endRow > this.totalCnt ? this.totalCnt : this.endRow;
	}
	
	public PageDTO(int page, int amount, int page10, int totalCnt) {
		this.page = page;
		this.amount = amount;
		this.pageSize = page10;
		this.endRow = page * amount;
		this.startRow = endRow - (amount - 1);
		this.startPage = ((page - 1) / pageSize) * pageSize + 1;
		this.endPage = startPage + (pageSize - 1);
		this.totalCnt = totalCnt;
		this.realEndPage = (totalCnt - 1) / pageSize + 1;
		this.endPage = this.endPage > this.realEndPage ? this.realEndPage : this.endPage;
		this.endRow = this.endRow > this.totalCnt ? this.totalCnt : this.endRow;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getBoardSize() {
		return boardSize;
	}
	public void setBoardSize(int boardSize) {
		this.boardSize = boardSize;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getRealEndPage() {
		return realEndPage;
	}
	public void setRealEndPage(int realEndPage) {
		this.realEndPage = realEndPage;
	}
	
	
}
