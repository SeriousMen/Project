package com.team4.app.trainer;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.trainer.dao.TrainerDAO;

public class TrainerCheckIdOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		System.out.println("TrainerCheckIdOkAction들어옴");
		String id = req.getParameter("id");
		TrainerDAO t_dao = new TrainerDAO();
		MemberDAO m_dao = new MemberDAO();
		
		PrintWriter out = resp.getWriter();
		
		resp.setContentType("text/html;charset=utf-8");
		
		if(t_dao.checkId(id)) {
			//not-ok
			out.println("not-ok");
		}else {
			
			out.println("ok");
		}
		out.close();
		//페이지 이동 없음 
		return null;
	}

}
