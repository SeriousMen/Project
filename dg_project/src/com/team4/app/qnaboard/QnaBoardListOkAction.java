package com.team4.app.qnaboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.member.vo.MemberVO;
import com.team4.app.qna.dao.QnaDAO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class QnaBoardListOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		QnaDAO q_dao = new QnaDAO();
		ActionForward forward = new ActionForward();
		String temp = req.getParameter("page");
		
	/*	HttpSession session = req.getSession();
		String sessionId = "";
		
		if((String)session.getAttribute("session_m_id")!=null) {
			sessionId=(String)session.getAttribute("session_m_id");
		}else if((String)session.getAttribute("session_t_id")!=null) {
			sessionId=(String)session.getAttribute("session_t_id");
		}
		
		System.out.println(sessionId);
		
		if(m_dao.checkId(sessionId)) {
			m_vo.setMemberId(sessionId);
		}else if(t_dao.checkId(sessionId)) {
			t_vo.setTrainerId(sessionId);
		}*/
		
		int page = temp == null ? 1 : Integer.parseInt(temp);
		
		int boardSize = 10;
		int pageSize = 10;
		
		int endRow = page * boardSize;
		
		int startRow = endRow - (boardSize - 1);
		
		int startPage = ((page - 1) / pageSize) * pageSize  + 1;
		int endPage = startPage + (pageSize - 1);
		
		int totalCnt = q_dao.getBoardCnt();
		
		int realEndPage = (totalCnt - 1) / pageSize + 1;
		
		endPage = endPage > realEndPage ? realEndPage : endPage;
		
		
		
		req.setAttribute("totalCnt",totalCnt);
		req.setAttribute("startPage",startPage);
		req.setAttribute("endPage",endPage);
		req.setAttribute("nowPage",page);
		req.setAttribute("realEndPage",realEndPage);
		req.setAttribute("boardList",q_dao.getBoardList(startRow, endRow));
		
		
		
		forward.setRedirect(false);
		forward.setPath("/app/qna/QABoard.jsp");
		
		return forward;

	}

}
