package com.team4.app.photoboard.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.team4.app.photoboard.vo.MReplyVO;
import com.team4.app.photoboard.vo.PhotoBoardVO;
import com.team4.app.review.vo.ReviewVO;
import com.team4.mybatis.config.SqlMapConfig;

public class PhotoBoardDAO {

	SqlSessionFactory session_f = SqlMapConfig.getSqlMapInstance();
	SqlSession session;

	public PhotoBoardDAO() {
		session = session_f.openSession(true);
	}

//회원게시판 글작성
	public boolean photoBoardWrite(PhotoBoardVO p_vo) {

		return session.insert("Member.photoBoardWrite", p_vo) == 1;
	}

//조회수 업데이트
	public void updateReadCount(int photoBoardNum) {

		 session.update("Member.updateReadCount", photoBoardNum);
	}

//포토보드넘 가져오기
	public int selectBoardNum() {
		return session.selectOne("Member.selectBoardNum");
	}

//페이지별 회원 게시글 목록 
	public List<PhotoBoardVO> getBoardList(int startRow, int endRow) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);

		return session.selectList("Member.listAll", pageMap);

	}

//포토보드넘들가져오기
	public List<Integer> getPhotoBoardNum(int startRow, int endRow) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);

		return session.selectList("Member.getPhotoBoardNum", pageMap);
	}

//게시물이 얼마나 있는지
	public int getBoardCnt() {
		return session.selectOne("Member.getBoardCnt");
	}

//해당 포토번호가진 게시물 가져오기
	public PhotoBoardVO getPhotoBoardDetail(int photoBoardNum) {

		return session.selectOne("Member.getPhotoBoardDetail", photoBoardNum);
	}

//사진게시판 수정
	public void updateBoard(PhotoBoardVO p_vo) {
		session.update("Member.updateBoard", p_vo);
	}

//사진게시판 삭제 
	public boolean deletePhotoBoard(int photoBoardNum) {

		return session.delete("Member.deletePhotoBoard", photoBoardNum) == 1;
	}

//댓글 전체 목록
	public List<MReplyVO> getReplyList(int photoBoardNum) {
		return session.selectList("Member.getReplyList", photoBoardNum);
	}

	// 댓글 추가
	public boolean insertReply(MReplyVO r_vo) {
		return session.insert("Member.insertReply", r_vo) == 1;
	}

	//댓글 업데이트
	public boolean updateReply(MReplyVO r_vo) {
		return session.update("Member.updateReply",r_vo) ==1;
	}
	
	//댓글 삭제 
	public boolean deleteReply(int mReplyNum) {
		return session.delete("Member.deleteReply",mReplyNum) ==1;
	}
	
	//해당 게시물 댓글 수 증가
	public boolean plusReplyNum(int photoBoardNum) {
		return session.update("Member.plusReplyNum",photoBoardNum) ==1;
	}
	
	//해당 게시물 댓글 수 차감
	public boolean minusReplyNum(int photoBoardNum) {
		return session.update("Member.minusReplyNum",photoBoardNum) ==1;
	}
	
}
