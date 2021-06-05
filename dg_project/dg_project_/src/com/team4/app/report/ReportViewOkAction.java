package com.team4.app.report;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.fileName.vo.FileNameVO;
import com.team4.app.report.dao.ReportDAO;
import com.team4.app.report.vo.ReportVO;

public class ReportViewOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		ReportDAO r_dao=new ReportDAO();
		ReportVO re_vo=null;
		FileNameDAO f_dao=new FileNameDAO();
		ActionForward forward=null;
		
		int reportNum=Integer.parseInt(req.getParameter("reportNum"));
		int page=Integer.parseInt(req.getParameter("page"));
		
		re_vo=r_dao.getReportDetail(reportNum);
		List<FileNameVO> fileList=f_dao.getReportFile(5, reportNum);
		
		
		if(re_vo !=null) {
			r_dao.updateReadCount(reportNum);
		
			req.setAttribute("re_vo", re_vo);
			req.setAttribute("page",page);
			if(fileList !=null) {
			
				req.setAttribute("files", fileList);
			}
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/qna/reportView.jsp");
			
		}
		return forward;
	}

}
