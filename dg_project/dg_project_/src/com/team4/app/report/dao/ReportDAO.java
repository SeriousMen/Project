package com.team4.app.report.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.team4.app.report.vo.ReportVO;
import com.team4.mybatis.config.SqlMapConfig;

public class ReportDAO {
	SqlSessionFactory session_f = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public ReportDAO() {
		session = session_f.openSession(true);
	}
	//report 리스트
	public List<ReportVO> getReportList(int startRow,int endRow){
		HashMap<String, Integer> pageMap=new HashMap<>();
		
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		
		return session.selectList("Report.getReportList",pageMap);
		
	}
	
	//report쓰기
	public boolean reportWrite(ReportVO r_vo) {
		return session.insert("Report.reportWrite",r_vo)==1;
	}
	
	//reportNum 얻기
	public int getReportNum() {
		return  session.selectOne("Report.getReportCnt");
	}
	
	//총 report 개수
	public int getReportCnt() {
		return session.selectOne("Report.getReportCnt");
	}
	//report 게시글 가져오기
	public ReportVO getReportDetail(int reportNum) {
		return session.selectOne("Report.getReportDetail",reportNum);
	}
	//report 게시글 삭제
	public void deleteReport(int reportNum) {
		session.delete("Report.deleteReport",reportNum);
	}
	//report 게시글 수정
	public void updateReport(ReportVO r_vo) {
		session.update("Report.updateReport",r_vo);
	}
	
	//조회수 증가
	public void updateReadCount(int reportNum) {
		session.update("Report.updateReadCount",reportNum);
	}
}
