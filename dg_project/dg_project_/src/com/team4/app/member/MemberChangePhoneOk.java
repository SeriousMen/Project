package com.team4.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.member.vo.MemberVO;

public class MemberChangePhoneOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession(false);
		ActionForward forward = null;
		MemberDAO m_dao = new MemberDAO();
		MemberVO m_vo = new MemberVO();
	
		m_vo.setMemberPhone(req.getParameter("memberNewPhoneNumber"));
		m_vo.setMemberId((String)(session.getAttribute("session_m_id")));

		
		
		if(m_dao.changeMemberPhone(m_vo)) {
			forward = new ActionForward();
		
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/member/MemberModify.me");
		}
		
		return forward;
	}
}
