package com.team4.app.report;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.report.dao.ReportDAO;
import com.team4.app.report.vo.ReportVO;
import com.team4.app.review.dao.ReviewDAO;
import com.team4.app.review.vo.ReviewVO;

public class ReportWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward=null;
		ReportVO r_vo=new ReportVO();
		ReportDAO r_dao=new ReportDAO();
		FileNameDAO f_dao=new FileNameDAO();
		
		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);
		
		//5MB
		int fileSize = 5 * 1024 * 1024;
		
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String reportId=multi.getParameter("reportId");
		
		r_vo.setReportTitle(multi.getParameter("reportTitle"));
		r_vo.setReportId(multi.getParameter("reportId"));
		r_vo.setReportContent(multi.getParameter("reportContent"));

		if(r_dao.reportWrite(r_vo)) {
			//5번 카테고리의 r_dao.getReportNum()번의 첨부파일
			if(f_dao.reportinsertFiles(5,r_dao.getReportNum(),reportId,multi)) {
				forward=new ActionForward();
				forward.setRedirect(true);
				forward.setPath(req.getContextPath()+"/report/ReportListOkAction.rp");
			}
		}
		
		return forward;
	}

}
