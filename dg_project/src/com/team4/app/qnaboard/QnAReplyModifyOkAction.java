package com.team4.app.qnaboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.dao.QnaDAO;
import com.team4.app.qna.vo.QreplyVO;

public class QnAReplyModifyOkAction  implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		QreplyVO r_vo= new QreplyVO();
		QnaDAO r_dao= new QnaDAO();
		
		PrintWriter out = resp.getWriter();
		
		int replyNum = Integer.parseInt(req.getParameter("replyNum"));
		String replyContent = req.getParameter("content");
		
		
		r_vo.setQreplyNum(replyNum);
		r_vo.setQreplyContent(replyContent);
		
		if(r_dao.updateReply(r_vo)) {
			out.println("수정 성공");
		}else {
			out.println("수정 실패");
		}
		out.close();
		
		
		return null;
	}

}
