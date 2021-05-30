package com.team4.app.qnaboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.dao.QnaDAO;

public class QnABoardMddifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		QnaDAO q_dao =new QnaDAO();
		ActionForward forward = new ActionForward();
		
		int boardNum = Integer.parseInt(req.getParameter("boardNum"));
		int page = Integer.parseInt(req.getParameter("page"));
		
		req.setAttribute("q_vo", q_dao.getDetail(boardNum));
		req.setAttribute("page", page);
		forward.setRedirect(false);
		forward.setPath("/app/qna/QAModify.jsp");
		
		return forward;
	}

}
