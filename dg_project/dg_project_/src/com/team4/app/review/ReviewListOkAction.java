package com.team4.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.review.dao.ReviewDAO;
import com.team4.app.trainer.dao.TrainerDAO;

public class ReviewListOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao = new TrainerDAO();
		ReviewDAO r_dao = new ReviewDAO();
		ActionForward forward = new ActionForward();
		
		String trainerId = req.getParameter("trainerId");
		/*System.out.println(trainerId);*/
		String temp = req.getParameter("page");
		/*String test = req.getParameter("reviewNum");*/
		
		int page = temp == null ? 1 : Integer.parseInt(temp);
		/*int reviewNum = test == null ? 1 : Integer.parseInt(test);*/
		
		int boardSize = 10;
		int pageSize = 10;
		int endRow = page * boardSize;
		int startRow = endRow - (boardSize - 1);
		int startPage = ((page - 1) / pageSize) * pageSize + 1;
		int endPage = startPage + (pageSize - 1);
		int totalCnt = r_dao.getReviewCnt(trainerId);
		int realEndPage = (totalCnt - 1) / pageSize + 1;
		endPage = endPage > realEndPage ? realEndPage : endPage;
		
		/*if(reviewNum != 1 && reviewNum % 10 == 1) {
			endRow = reviewNum - 1;
		}*/
		
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("nowPage", page);
		req.setAttribute("realEndPage", realEndPage);
		req.setAttribute("reviewList", r_dao.getReviewList(startRow, endRow, trainerId));
		req.setAttribute("t_vo", t_dao.getDetail(trainerId));
		
		forward.setRedirect(false);
		forward.setPath("/app/trainer/trainerView.jsp");
		
		return forward;
	}
}
