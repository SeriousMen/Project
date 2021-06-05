package com.team4.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.photoboard.dao.PhotoBoardDAO;

public class MemberBoardModifyAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		System.out.println("MemberBoardModifyAction들옴");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PhotoBoardDAO p_dao = new PhotoBoardDAO();
		ActionForward forward = new ActionForward();
		
		int photoBoardNum = Integer.parseInt(req.getParameter("photoBoardNum"));
		int page = Integer.parseInt(req.getParameter("page"));
		

		req.setAttribute("p_vo", p_dao.getPhotoBoardDetail(photoBoardNum));
		req.setAttribute("page", page);
//		req.setAttribute("memberId", memberId);
		
		
		forward.setRedirect(false);
		forward.setPath("/app/member/memberBoardModify.jsp");
		System.out.println("memberBoardModify.jsp로 간닷");
		return forward;
	}
	

}
