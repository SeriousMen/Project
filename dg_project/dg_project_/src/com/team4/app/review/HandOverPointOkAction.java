package com.team4.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.review.dao.ReviewDAO;

public class HandOverPointOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ReviewDAO r_dao = new ReviewDAO();
		String m_id = req.getParameter("m_id");
		String trainer = req.getParameter("trainer");
		int price = Integer.parseInt(req.getParameter("price"));

		r_dao.minusMemberPoint(price, m_id);
		r_dao.plusPoint(price, trainer);
		r_dao.pointContent(m_id, trainer, price);
		
		
		return null;
	}
}
