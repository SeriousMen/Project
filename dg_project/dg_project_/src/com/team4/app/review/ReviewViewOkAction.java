package com.team4.app.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.fileName.vo.FileNameVO;
import com.team4.app.review.dao.ReviewDAO;
import com.team4.app.review.vo.ReviewVO;

public class ReviewViewOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
req.setCharacterEncoding("UTF-8");
		
		ReviewDAO r_dao = new ReviewDAO();
		ReviewVO r_vo = null;
		FileNameDAO f_dao = new FileNameDAO();
		ActionForward forward = null;
		
		int reviewNum = Integer.parseInt(req.getParameter("reviewNum"));
		int page = Integer.parseInt(req.getParameter("page"));
		
		r_vo = r_dao.getReviewDetail(reviewNum);
		List<FileNameVO> fileList = f_dao.getReviewFile(6, reviewNum);
		
		
		if(r_vo != null) {
			req.setAttribute("r_vo", r_vo);
			req.setAttribute("page", page);
			if(fileList != null) {
				req.setAttribute("files", fileList);
			}
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/reviewView.jsp");
		}
		return forward;

	}
}
