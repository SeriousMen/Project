package com.team4.app.report;

import java.io.File;
import java.io.PrintWriter;

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
import com.team4.app.report.vo.ReportVO;

public class ReportModifyOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		ReportDAO r_dao=new ReportDAO();
		FileNameDAO f_dao=new FileNameDAO();
		
		MultipartRequest multi = null;
		
		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);
		
		int fileSize = 5 * 1024 * 1024;
		
	
		
		ReportVO r_vo=new ReportVO();
		multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		int page = Integer.parseInt(multi.getParameter("page"));
		int reportNum=Integer.parseInt(multi.getParameter("reportNum"));
		
		for(FileNameVO files:f_dao.getReportFile(5, reportNum)) {
			File f=new File(realPath,files.getFileName());
				if(f.exists()) {
				f.delete();			
			}
		}
		
			r_vo.setReportNum(reportNum);
			r_vo.setReportTitle(multi.getParameter("reportTitle"));
			r_vo.setReportId(multi.getParameter("reportId"));
			r_vo.setReportContent(multi.getParameter("reportContent"));
			
			f_dao.deleteReportFile(5, reportNum);
			
			f_dao.insertFiles(5, reportNum, multi.getParameter("reportId"), multi);

			r_dao.updateReport(r_vo);
			
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/report/ReportViewOkAction.rp?reportNum="+r_vo.getReportNum()+"&page="+page);
		
		
		return forward;
	}
	
}
