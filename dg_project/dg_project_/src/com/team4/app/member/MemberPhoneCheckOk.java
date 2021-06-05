package com.team4.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;

public class MemberPhoneCheckOk implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		
		MemberDAO m_dao = new MemberDAO();
		HttpSession session = req.getSession(false);
		PrintWriter out=resp.getWriter();
		
		resp.setContentType("text/html;charset=utf-8");
		
		String session_m_id = (String)session.getAttribute("session_m_id");
		String memberPhoneNumber = req.getParameter("memberPhoneNumber");
		
	
	
		if(memberPhoneNumber.equals(m_dao.selectMemberPhone(session_m_id))){
			out.println("ok");
		
		}else {
			out.println("not-ok");
		
		}
		out.close();
		
		return null;
	}
}
