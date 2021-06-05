package com.team4.app.report;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.ActionForward;

@SuppressWarnings("serial")
public class ReportFrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestUri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestUri.substring(contextPath.length());
		ActionForward forward = null;
		
		
		switch(command) {
		//QA.jsp에 report list
		case "/report/ReportListOkAction.rp":
			try {
				forward = new ReportListOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			break;
		case "/report/ReportWriteOkAction.rp":
			try {
			
				forward = new ReportWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/report/ReportViewOkAction.rp":
			try {
				
				forward = new ReportViewOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			break;	
		case "/report/ReportThumbnailOkAction.rp":
			try {
				forward = new ReportThumbnailOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			
			}
			break;
		
		case "/report/ReportDeleteOkAction.rp":
			try {
				forward = new ReportDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			break;	
		case "/report/ReportModify.rp":
			try {
				forward = new ReportModifyAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			break;	
		case "/report/ReportModifyOk.rp":
			try {
				
				forward = new ReportModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			break;	
		case "/report/ReportdWrite.rp":
			forward = new ActionForward();
			forward.setRedirect(false);
			req.setAttribute("page", req.getParameter("page"));
			forward.setPath("/app/qna/reportWrite.jsp");
			break;
		
		default:
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/report/error/404.jsp");		
			break;
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
}
