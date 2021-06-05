package com.dg.service;

import java.util.List;

import com.dg.domain.BoardAttachVO;
import com.dg.domain.BoardVO;
import com.dg.domain.Criteria;

public interface BoardService {//강제성을 부여하는 역할 (메뉴얼) 기타 이유도 있지만 그렇게 생각하면 편함

	//게시글 등록
		//게시판 종류(BOARD) 1.QnA게시판 2.신고게시판3.회원사진게시판 4.리뷰
		public void insertBoard(BoardVO board); //insertSelectKey_bno쓴거
			
		//게시글 수정
		public boolean modifyBoard(BoardVO board);
		//게시글 삭제
		public boolean deleteBoard(BoardVO board);
		
		//게시글 조회
		public BoardVO readBoard(BoardVO board);
		
		
		public List<BoardVO> getListWithPaging(Criteria cri, Long boardNum);
		
		public List<BoardVO> getList(Long boardNum);
		
		//검색된 게시글의 총 개수 
		public int getTotal(Criteria cri, Long boardNum);
		
		//해당 게시판 게시글 전체 첨부파일 가져오기
		public List<BoardAttachVO> getAttachList(Long bno);
}
