package com.team4.app.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.ActionForward;

public class AdminFrontController extends HttpServlet{
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
			case "/admin/AdminList.ad":
				try {
					forward = new AdminListOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				break;
			case "/admin/AdminKick.ad":
				try {
					forward = new AdminKickOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				break;
			case "/admin/IndexCal.ad":
				try {
					forward = new IndexCalOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				break;
			default:
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("error/404.jsp");
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
