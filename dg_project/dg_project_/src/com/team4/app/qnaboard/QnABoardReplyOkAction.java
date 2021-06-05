package com.team4.app.qnaboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.dao.QnaDAO;
import com.team4.app.qna.vo.QreplyVO;

public class QnABoardReplyOkAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		QreplyVO r_vo= new QreplyVO();
		QnaDAO r_dao= new QnaDAO();
		ActionForward forward = new ActionForward();
		
		int qnaNum = Integer.parseInt(req.getParameter("boardNum"));
		
		String sessionId = "";
		
		if((String)session.getAttribute("session_m_id")!=null) {
			sessionId=(String)session.getAttribute("session_m_id");
		}else if((String)session.getAttribute("session_t_id")!=null) {
			sessionId=(String)session.getAttribute("session_t_id");
		}
		
				/*(String)session.getAttribute("session_id");*/
		String qreplyContent = req.getParameter("replyContent");
		
		
		
		r_vo.setQnaNum(qnaNum);
		r_vo.setMemberId(sessionId);
		r_vo.setQreplyContent(qreplyContent);
		
		if(r_dao.insertReply(r_vo)) {
			out.println("추가 성공");
		}else {
			out.println("추가 실패");
		}
		out.close();
		
		return null;
	}

}
