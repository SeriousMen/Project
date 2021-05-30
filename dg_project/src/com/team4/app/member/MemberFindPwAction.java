package com.team4.app.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.trainer.dao.TrainerDAO;


public class MemberFindPwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward=new ActionForward();
		MemberDAO m_dao=new MemberDAO();
		TrainerDAO t_dao=new TrainerDAO();
		
		String id=req.getParameter("id");
		String PhoneNum=req.getParameter("PhoneNum2");

		List<String> memberlist=m_dao.findPw(id, PhoneNum);
		List<String> trainerlist=t_dao.findPw(id, PhoneNum);
		
		
		if(!memberlist.isEmpty()) {
			resp.setContentType("text/html; charset=UTF-8");	
			req.setAttribute("memberlist", memberlist);
			forward.setRedirect(false);
			forward.setPath("/member/MemberFindPwOk.me");
		}else if(!trainerlist.isEmpty()) {
			req.setAttribute("trainerlist", trainerlist);
			resp.setContentType("text/html; charset=UTF-8");
			forward.setRedirect(false);
			forward.setPath("/member/MemberFindPwOk.me");
		}else if(memberlist.isEmpty()){
			forward.setRedirect(false);
			forward.setPath("/member/MemberFindPwCheck.me?checkpw=false");
		}else if(trainerlist.isEmpty()) {
			forward.setRedirect(false);
			forward.setPath("/member/MemberFindPwCheck.me?checkpw=false");
		}
		return forward;
	}

}
