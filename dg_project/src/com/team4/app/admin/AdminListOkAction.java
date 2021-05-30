package com.team4.app.admin;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.dao.QnaDAO;
import com.team4.app.report.dao.ReportDAO;
import com.team4.app.review.vo.PageDTO;

public class AdminListOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		QnaDAO q_dao = new QnaDAO();
		ReportDAO r_dao = new ReportDAO();
		ActionForward forward = new ActionForward();
		
		String q_temp = req.getParameter("q_page");
		String r_temp = req.getParameter("r_page");
		
		int q_page = q_temp == null ? 1 : Integer.parseInt(q_temp);
		int r_page = r_temp == null ? 1 : Integer.parseInt(r_temp);
		
		PageDTO q_paging = new PageDTO(q_page, 10, 10, q_dao.getBoardCnt());
		PageDTO r_paging = new PageDTO(r_page, 10, 10, r_dao.getReportCnt());
		
		req.setAttribute("q_totalCnt", q_paging.getTotalCnt());
		req.setAttribute("q_startPage", q_paging.getStartPage());
		req.setAttribute("q_endPage", q_paging.getEndPage());
		req.setAttribute("q_nowPage", q_page);
		req.setAttribute("q_realEndPage", q_paging.getRealEndPage());
		req.setAttribute("q_list", q_dao.getBoardList(q_paging.getStartRow(), q_paging.getEndRow()));
		
		req.setAttribute("r_totalCnt", r_paging.getTotalCnt());
		req.setAttribute("r_startPage", r_paging.getStartPage());
		req.setAttribute("r_endPage", r_paging.getEndPage());
		req.setAttribute("r_nowPage", r_page);
		req.setAttribute("r_realEndPage", r_paging.getRealEndPage());
		req.setAttribute("r_list", r_dao.getReportList(r_paging.getStartRow(), r_paging.getEndRow()));
		req.setAttribute("r_temp", r_temp);
		
		forward.setRedirect(false);
		forward.setPath("/app/public/adminBoard.jsp");
		
		return forward;
	}
}
