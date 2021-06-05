package com.team4.app.report;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.fileName.vo.FileNameVO;
import com.team4.app.report.dao.ReportDAO;

public class ReportDeleteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ReportDAO r_dao=new ReportDAO();
		FileNameDAO f_dao=new FileNameDAO();
		ActionForward forward=new ActionForward();
		
		MultipartRequest multi=null;
		
		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);
		
		int fileSize = 5 * 1024 * 1024;
		
		multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
	
		
		int reportNum = Integer.parseInt(multi.getParameter("ReportNum"));
		int page = Integer.parseInt(multi.getParameter("page"));
	

		
		for(FileNameVO files : f_dao.getReportFile(5, reportNum)) {
			File f = new File(realPath, files.getFileName());
			if(f.exists()) {
				f.delete();
			}
		}
		f_dao.deleteReportFile(5, reportNum);
		
		r_dao.deleteReport(reportNum);
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath()+"/report/ReportListOkAction.rp?page="+page);
		
		return forward;
	}

}
