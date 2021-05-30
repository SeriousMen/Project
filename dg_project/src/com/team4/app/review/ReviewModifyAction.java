package com.team4.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.review.dao.ReviewDAO;

public class ReviewModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ReviewDAO r_dao = new ReviewDAO();
		ActionForward forward = new ActionForward();
		
		int reviewNum = Integer.parseInt(req.getParameter("reviewNum"));
		int page = Integer.parseInt(req.getParameter("page"));
		String memberId = req.getParameter("memberId");
		
		req.setAttribute("r_vo", r_dao.getReviewDetail(reviewNum));
		req.setAttribute("page", page);
		req.setAttribute("memberId", memberId);
		
		forward.setRedirect(false);
		forward.setPath("/app/member/reviewModify.jsp");
		
		return forward;
	}
}
