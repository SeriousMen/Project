package com.team4.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.photoboard.dao.PhotoBoardDAO;
import com.team4.app.photoboard.vo.MReplyVO;
import com.team4.app.photoboard.vo.PhotoBoardVO;

public class MemberBoardReplyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		MReplyVO r_vo = new MReplyVO();
		PhotoBoardDAO p_dao = new PhotoBoardDAO();
		ActionForward forward = new ActionForward();
		PhotoBoardVO p_vo = new PhotoBoardVO();
		//게시글 번호, 아이디, 컨텐츠
		int photoBoardNum = Integer.parseInt(req.getParameter("photoBoardNum"));
		String memberId = (String)session.getAttribute("session_m_id");
		String replyContent = req.getParameter("replyContent");
		
		r_vo.setPhotoNum(photoBoardNum);
		r_vo.setMemberId(memberId);
		r_vo.setmReplyContent(replyContent);
		
		if(p_dao.plusReplyNum(photoBoardNum)) {
			
		}else {
			
		}
		
		if(p_dao.insertReply(r_vo)) {
			out.println("댓글이 등록되었습니다.");
		}else {
			out.println("댓글 등록이 실패하였습니다. 다시 시도해주세요.");
		}
		
		out.close();
		
//		forward.setRedirect(true);
//		forward.setPath(req.getContextPath() + "/board/BoardView.bo?boardNum=" + boardNum + "&page=" + req.getParameter("page"));
		
//		return forward;
		return null;
	}
}
