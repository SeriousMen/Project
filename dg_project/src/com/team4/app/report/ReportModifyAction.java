package com.team4.app.report;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.report.dao.ReportDAO;

public class ReportModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ReportDAO r_dao=new ReportDAO();
		ActionForward forward=new ActionForward();
		
		int reportNum=Integer.parseInt(req.getParameter("reportNum"));
		int page=Integer.parseInt(req.getParameter("page"));
		String reportId=req.getParameter("reportId");
		
		req.setAttribute("r_vo", r_dao.getReportDetail(reportNum));
		req.setAttribute("page", page);
		req.setAttribute("reportId", reportId);
		
		forward.setRedirect(false);
		forward.setPath("/app/qna/reportModify.jsp");
		
		return forward;
	}

}
