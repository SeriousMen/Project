package com.team4.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;

public class MemberCheckIdOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		String id=req.getParameter("id");
		MemberDAO m_dao=new MemberDAO();
		
		PrintWriter out=resp.getWriter();
		
		resp.setContentType("text/html;charset=utf-8");
		
		if(m_dao.checkId(id)) {
			out.println("not-ok");
		
		}else {
			out.println("ok");
		}
		out.close();
		
		return null;
	}
	
}
