package com.team4.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.admin.dao.AdminDAO;

public class AdminKickOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		AdminDAO a_dao = new AdminDAO();
		
		String userId = req.getParameter("kick");
		
		a_dao.kickMember(userId);
		a_dao.kickTrainer(userId);
		
		return null;
	}
}
