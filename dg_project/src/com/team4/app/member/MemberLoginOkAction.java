package com.team4.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.admin.dao.AdminDAO;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.trainer.dao.TrainerDAO;

public class MemberLoginOkAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		ActionForward forward = new ActionForward();
		
		
		//회원 로그인, 트레이너 로그인 분기 처리
		MemberDAO m_dao = new MemberDAO();
		TrainerDAO t_dao = new TrainerDAO();
		AdminDAO a_dao = new AdminDAO();
		
		String id = req.getParameter("Id");
		String pw = req.getParameter("Pw");
		
		
	
		
		if(m_dao.login(id, pw)) {
		
			session.setAttribute("session_m_id", id);
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/index.jsp");
		}else if(t_dao.login(id, pw)){
		
			session.setAttribute("session_t_id", id);
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/index.jsp");
		}else if(a_dao.adminLogin(id, pw)){
		
			session.setAttribute("session_a_id", id);
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/index.jsp");
		}else if(!m_dao.login(id, pw)){
		
			forward.setRedirect(false);
			forward.setPath("/member/MemberLogin.me?login=false;");
		}else if(!a_dao.adminLogin(id, pw)){
		
			forward.setRedirect(false);
			forward.setPath("/member/MemberLogin.me?login=false;");
		}else if(!t_dao.login(id, pw)) {
			
			forward.setRedirect(false);
			forward.setPath("/member/MemberLogin.me?login=false;");
		}
		
		String propensity = req.getParameter("propensity");
		if(!propensity.isEmpty()) {
			if(forward.isRedirect()) {
				forward.setPath(req.getContextPath()+"/review/Propensity.rv");
			}
		}
		
		String trainer = req.getParameter("trainer");
		if(!trainer.isEmpty()) {
			if(forward.isRedirect()) {
				forward.setPath(req.getContextPath()+"/review/ReviewList.rv?trainerId="+trainer);
			}
		}
		
		return forward;
	}
}
