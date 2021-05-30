package com.team4.app.qnaboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.dao.QnaDAO;

public class QnAReplyDeleteOkAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		QnaDAO r_dao= new QnaDAO();
		
		int replyNum = Integer.parseInt(req.getParameter("replyNum"));
		
		if(r_dao.deleteReply(replyNum)) {
			out.println("삭제 성공");
		}else {
			out.println("삭제 실패");
		}
		out.close();
		
		
		return null;
	}

}
