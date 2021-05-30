package com.team4.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;

public class MemberLogoutAction implements Action{

		@Override
		public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			HttpSession session = req.getSession();//세션반환하고
			ActionForward forward = new ActionForward();
			
			
			//존재하는 세션삭제(방문자 수 세션을 제외하고)
			/*
			 토탈 트레이너 리스트 세션
			trNumList
			운동성향 세션
			attentionCheck
			dateCheck
			tgCheck
			zipCode
			로그인한 세션
			session_m_id
			session_t_id
			session_a_id
			*/
			
		
			
			
		
			session.removeAttribute("trNumList");
			session.removeAttribute("attentionCheck");
			session.removeAttribute("dateCheck");
			session.removeAttribute("tgCheck");
			session.removeAttribute("zipCode");
			session.removeAttribute("session_m_id");
			session.removeAttribute("session_t_id");
			session.removeAttribute("session_a_id");
			
			//session.invalidate();
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/index.jsp");
			
			return forward;
		}
}
