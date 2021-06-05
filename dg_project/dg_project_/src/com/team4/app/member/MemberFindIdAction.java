package com.team4.app.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.trainer.dao.TrainerDAO;

public class MemberFindIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ActionForward forward=new ActionForward();
		MemberDAO m_dao=new MemberDAO();
		TrainerDAO t_dao=new TrainerDAO();
		
		String PhoneNum=req.getParameter("PhoneNum");
		List<String> memberlist=m_dao.findId(PhoneNum);
		List<String> trainerlist=t_dao.findId(PhoneNum);
		
		if(!memberlist.isEmpty()) {
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			for (int i = 0; i < memberlist.size(); i++) {
				out.print(memberlist.get(i));			
			}
			
			req.setAttribute("memberlist", memberlist);
			forward.setRedirect(false);
			forward.setPath("/member/MemberFindIdOk.me");
		}else if(!trainerlist.isEmpty()){
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			for (int i = 0; i < trainerlist.size(); i++) {
				out.print(trainerlist.get(i));			
			}
			
			req.setAttribute("trainerlist", trainerlist);
			forward.setRedirect(false);
			forward.setPath("/member/MemberFindIdOk.me");
		
		}else if(memberlist.isEmpty()){
			forward.setRedirect(false);
			forward.setPath("/member/MemberFindIdCheck.me?check=false");
		}else if(trainerlist.isEmpty()){
			forward.setRedirect(false);
			forward.setPath("/member/MemberFindIdCheck.me?check=false");
		}
		return forward;
	}

}
