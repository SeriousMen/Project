package com.team4.app.qnaboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.member.vo.MemberVO;
import com.team4.app.qna.dao.FilesDAO;
import com.team4.app.qna.dao.QnaDAO;
import com.team4.app.qna.vo.FilesVO;
import com.team4.app.qna.vo.QnaVO;
import com.team4.app.qna.vo.QreplyVO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class QnaWriteViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		MemberDAO m_dao=new MemberDAO();
		TrainerDAO t_dao=new TrainerDAO();
		TrainerVO t_vo=new TrainerVO();
		MemberVO m_vo=new MemberVO();
		
		ActionForward forward =null;
		
		String sessionId=req.getParameter("sessionId");
	
		
		if(m_dao.checkId(sessionId)) {
			m_vo.setMemberId(sessionId);
		}else if(t_dao.checkId(sessionId)) {
			t_vo.setTrainerId(sessionId);
		}
		
		
		req.setAttribute("m_vo",m_vo);
		req.setAttribute("t_vo",t_vo);
		
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/qna/QAWrite2.jsp");
			
		return forward;
	}
	
	
}
