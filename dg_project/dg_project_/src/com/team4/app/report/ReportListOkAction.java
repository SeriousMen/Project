package com.team4.app.report;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.member.vo.MemberVO;
import com.team4.app.report.dao.ReportDAO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class ReportListOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ReportDAO r_dao=new ReportDAO();
		ActionForward forward=new ActionForward();
		/*MemberDAO m_dao=new MemberDAO();
		TrainerDAO t_dao=new TrainerDAO();
		TrainerVO t_vo=new TrainerVO();
		MemberVO m_vo=new MemberVO();
		
		
		HttpSession session = req.getSession();
		String sessionId="";*/
	/*	String sessionId = (String)session.getAttribute("session_m_id");*/
		
	/*if((String)session.getAttribute("session_m_id")!=null) {
		sessionId=(String)session.getAttribute("session_m_id");
	}else if((String)session.getAttribute("session_t_id")!=null) {
		sessionId=(String)session.getAttribute("session_t_id");
	}*/
		
		
		/*if(m_dao.checkId(sessionId)) {
			m_vo.setMemberId(sessionId);
		}else if(t_dao.checkId(sessionId)) {
			t_vo.setTrainerId(sessionId);
		}*/
		
		
		
		String temp = req.getParameter("page");
		
		int page= temp ==null ? 1: Integer.parseInt(temp);
		
		int reportSize=10;
		int pageSize=10;
		//페이지 마지막 행 번호
		int endRow=page*reportSize;
		//페이지 첫번째 행 번호
		int startRow=endRow-(reportSize-1);
		
		int startPage=((page-1)/pageSize)*pageSize+1;
		int endPage=startPage+(pageSize-1);
		
		int totalCnt=r_dao.getReportCnt();
		
		int realEndPage=(totalCnt-1)/pageSize+1;
		
		endPage=endPage > realEndPage ? realEndPage:endPage;
		
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("nowPage", page);
		req.setAttribute("realEndPage", realEndPage);
		req.setAttribute("reportList", r_dao.getReportList(startRow, endRow));
		
		/*req.setAttribute("m_vo",m_vo);
		req.setAttribute("t_vo",t_vo);*/
		
		
		forward.setRedirect(false);
		forward.setPath("/app/qna/QA.jsp");
		return forward;
	}
	
	
}
