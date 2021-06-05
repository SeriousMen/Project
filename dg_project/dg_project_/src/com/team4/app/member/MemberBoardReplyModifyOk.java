package com.team4.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.photoboard.dao.PhotoBoardDAO;
import com.team4.app.photoboard.vo.MReplyVO;

public class MemberBoardReplyModifyOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MReplyVO r_vo = new MReplyVO();
		PhotoBoardDAO p_dao = new PhotoBoardDAO();
//		ActionForward forward = new ActionForward();
		PrintWriter out = resp.getWriter();
		
		int replyNum=Integer.parseInt(req.getParameter("replyNum"));
		String replyContent=req.getParameter("content");
		
		r_vo.setmReplyNum(replyNum);
		r_vo.setmReplyContent(replyContent);
		
		if(p_dao.updateReply(r_vo)) {
			out.println("수정 성공");
		}else {
			out.println("수정 실패");
		}
		out.println();
//		forward.setRedirect(true);
//		forward.setPath(req.getContextPath()+"/board/BoardView.bo?page="+page+"&boardNum="+boardNum);
		
		
//		return forward;
		return null;
	}
}
