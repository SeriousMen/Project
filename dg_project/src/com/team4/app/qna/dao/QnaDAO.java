package com.team4.app.qna.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.team4.app.qna.vo.QnaVO;
import com.team4.app.qna.vo.QreplyVO;
import com.team4.mybatis.config.SqlMapConfig;

public class QnaDAO {
	SqlSessionFactory session_f = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	
	public QnaDAO() {
		session = session_f.openSession(true);
	}
	
	public boolean insertQnaBoard(QnaVO qnaboard) {
		
		boolean check= session.insert("Qna.insertQnaBoard",qnaboard) == 1;
		
		return check;
		
	}
	/*public void getAll() {
		System.out.println(session.selectList("Qna.test"));
	}*/
	
	public int getBoardNum() {
		return session.selectOne("Qna.getBoardNum");
	}
	
	public int getBoardCnt() {
		return session.selectOne("Qna.getBoardCnt");
	}
	
	public List<QnaVO> getBoardList(int startRow, int endRow) {
		HashMap<String, Integer> pageMap = new HashMap<>();
		
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		
		
		return session.selectList("Qna.listAll", pageMap);
	}
	
	public QnaVO getDetail(int qnaNum) {
		return session.selectOne("Qna.getDetail",qnaNum);
	}
	
	public List<QreplyVO> getReplyList(int qnaNum){
		return session.selectList("Qna.getReplyList",qnaNum);
	}
	
	public void updateReadCount(int qnaNum){
		session.update("Qna.updateReadCount", qnaNum);
	}
	
	public boolean insertReply(QreplyVO r_vo) {
		return session.insert("Qna.insertReply", r_vo) == 1;
	}
	
	public boolean deleteReply(int replyNum) {
		return session.delete("Qna.deleteReply", replyNum) == 1;
	}
	public boolean updateReply(QreplyVO r_vo) {
			return session.update("Qna.updateReply", r_vo) == 1;
		}
	public void updateBoard(QnaVO q_vo) {
		session.update("Qna.updateBoard", q_vo);
	}
	
	
	public void deleteBoard(int boardNum) {
		session.delete("Qna.deleteBoard", boardNum);
	}
	
	
}
