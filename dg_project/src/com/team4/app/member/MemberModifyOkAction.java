package com.team4.app.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.vo.FileNameVO;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.member.vo.MemberVO;

public class MemberModifyOkAction implements Action{
@Override
public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	req.setCharacterEncoding("UTF-8");
	HttpSession session = req.getSession(false);
	MemberDAO m_dao = new MemberDAO();
	MemberVO m_vo = new MemberVO();
	ActionForward forward = null;
	
	String memberId = (String)session.getAttribute("session_m_id");
	
	
	m_vo = m_dao.getMemberDetail(memberId);
	
	
	if(m_vo != null) {
		req.setAttribute("m_vo", m_vo);			
		
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/member/memberModify.jsp");
	}
	
	return forward;
}
}
