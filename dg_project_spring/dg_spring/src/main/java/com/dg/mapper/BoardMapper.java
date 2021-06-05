package com.dg.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dg.domain.BoardVO;
import com.dg.domain.Criteria;

public interface BoardMapper {
//게시판 종류(BOARD) 1.QnA게시판 2.신고게시판3.회원사진게시판 4.리뷰  
	//게시글 등록
	//게시판 종류(BOARD) 1.QnA게시판 2.신고게시판3.회원사진게시판 4.리뷰
	
	public int insertBoard(BoardVO board);
	public int insertSelectKey_bno(BoardVO board);
		
	//게시글 수정
	public int modifyBoard(BoardVO board);
	//게시글 삭제
	public int deleteBoard(BoardVO board);
	
	//게시글 조회
//	public BoardVO readBoard(Long boardNum, Long bno); //이렇게 따로 받는 거는 인식을 못한다..
	public BoardVO readBoard(BoardVO board);
	
	//페이지의 게시글 전체목록 //마이바티스는 한 가지 자료형 밖에 처리 못한다.
	// 그렇기 때문에 2개 이상의 자료형을 넘기려면  1.객체에 넣어서 2. map으로 뭉쳐서 3. @Param으로 담아서 처리한다.
	public List<BoardVO> getListWithPaging(@Param("cri") Criteria cri,@Param("boardNum") Long boardNum);
	
	//게시글 전체 목록
	public List<BoardVO> getList(Long boardNum);
	
	//검색된 게시글의 총 개수
	public int getTotal(@Param("cri") Criteria cri, @Param("boardNum") Long boardNum);
	
}
