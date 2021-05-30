package com.team4.app.review.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.team4.app.member.vo.MemberVO;
import com.team4.app.review.vo.PageDTO;
import com.team4.app.review.vo.ReviewVO;
import com.team4.app.trade.vo.TradeVO;
import com.team4.app.trainer.vo.TrainerVO;
import com.team4.mybatis.config.SqlMapConfig;

public class ReviewDAO {
	SqlSessionFactory session_f = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public ReviewDAO() {
		session = session_f.openSession(true);
	}
	
	/**
	 * 
	 * @param r_vo
	 * @return boolean
	 * 
	 * true면 등록 성공<br>false면 등록 실패
	 * 
	 */
	public boolean reviewWrite(ReviewVO r_vo) {
		return session.insert("Review.reviewWrite", r_vo) == 1;
	}
	
	//reviewNum 얻기
	public int getReviewNum() {
		return session.selectOne("Review.getReviewNum");
	}
	
	//총 review 개수
	public int getReviewCnt(String trainerId) {
		return session.selectOne("Review.getReviewCnt", trainerId);
	}
	
	//review 리스트
	public List<ReviewVO> getReviewList(int startRow, int endRow, String trainerId){
	/*public List<ReviewVO> getReviewList(int startRow, int endRow){*/
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("trainerId", trainerId);
		
		return session.selectList("Review.getReviewList", map);
	}
	
	//review 게시글 가져오기
	public ReviewVO getReviewDetail(int reviewNum) {
		return session.selectOne("Review.getReviewDetail", reviewNum);
	}
	
	//review 삭제하기
	public void deleteReview(int reviewNum) {
		session.delete("Review.deleteReview", reviewNum);
	}
	
	//review 수정하기
	public void updateReview(ReviewVO r_vo) {
		session.update("Review.updateReview", r_vo);
	}
	
	//회원 포인트 충전하기
	public void chargeMemberPoint(MemberVO m_vo) {
		session.update("Member.chargeMemberPoint", m_vo);
	}
	
	//회원 충전 내역
	public void payment(String memberId, int price) {
		String content = (price/100) + "포인트 충전";
		
		HashMap<String, String> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("content", content);
		session.insert("Member.payment", map);
	}
	
	
//	트레이너 포인트 충전하기
//	public void chargeTrainerPoint(TrainerVO t_vo) {
//		session.update("Trainer.chargeTrainerPoint", t_vo);
//	}
	
	//거래내역 테이블 관련 메소드
	public void minusMemberPoint(int price, String memberId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("price", price);
		map.put("memberId", memberId);
		session.update("Review.minusMemberPoint", map);
	}
	
	public void minusTrainerPoint(int price, String trainerId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("price", price);
		map.put("memberId", trainerId);
		session.update("Review.minusTrainerPoint", map);
	}
	
	public void plusPoint(int price, String trainerId) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("price", price);
		map.put("trainerId", trainerId);
		session.update("Review.plusPoint", map);
	}
	
	public void pointContent(String userId, String trainerId, int price) {
		String content = price + "포인트 결제";
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		map.put("content", content);
		session.insert("Review.pointContent", map);
	}
	
	
	//리뷰작성여부
	public boolean checkReview(TradeVO t_VO) {
		
		
		return session.update("Review.checkReview",t_VO)==1;
	}
	
	
	
	
	//운동성향 테스트
	public List<TrainerVO> propensity(PageDTO paging, String tgCheck, int zipCode, String[] attentionCheck, String[] dateCheck) {
		String temp = (zipCode+"").substring(0, 2);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("dateCheck", dateCheck);
		map.put("attentionCheck", attentionCheck);
		map.put("zipCode", temp);
		map.put("tgCheck", tgCheck);
		map.put("page", paging);
		
		return session.selectList("Review.propensity", map);
	}
	
	public int getTrainerTotalCnt(String tgCheck, int zipCode, String[] attentionCheck, String[] dateCheck) {
		String temp = (zipCode+"").substring(0, 2);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("dateCheck", dateCheck);
		map.put("attentionCheck", attentionCheck);
		map.put("zipCode", temp);
		map.put("tgCheck", tgCheck);
		return session.selectOne("Review.trainerTotalCnt", map);
	}
	
	
	
	
}
