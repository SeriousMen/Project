package com.team4.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;

public class MemberSmsAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		MemberDAO m_dao=new MemberDAO();
		
		String memberPhone=req.getParameter("phone");
		
		String num=m_dao.sms(memberPhone);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out=resp.getWriter();
		out.println(num);
		out.close();
		
		
		return null;
	}
	
}
