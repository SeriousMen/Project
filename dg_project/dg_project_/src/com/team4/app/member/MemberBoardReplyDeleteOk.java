package com.team4.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.photoboard.dao.PhotoBoardDAO;

public class MemberBoardReplyDeleteOk implements Action{
	
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		PhotoBoardDAO p_dao = new PhotoBoardDAO();
		
		
		
		int replyNum=Integer.parseInt(req.getParameter("replyNum"));
		int photoBoardNum = Integer.parseInt(req.getParameter("photoBoardNum"));
		if(p_dao.minusReplyNum(photoBoardNum)) {
			
		}
		if(p_dao.deleteReply(replyNum)) {
			
			out.println("삭제성공");
		}else {
			out.println("삭제 실패");
		}
			out.close();
		//forward.setRedirect(true);
		//forward.setPath(req.getContextPath()+"/board/BoardView.bo?page="+page+"&boardNum="+boardNum);
		
		//return forward;
		return null;
		
	}

}
