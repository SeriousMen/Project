package com.team4.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.member.vo.MemberVO;
import com.team4.app.trainer.dao.TrainerDAO;

public class MemberChangePwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward=new ActionForward();
		MemberDAO m_dao=new MemberDAO();
		TrainerDAO t_dao=new TrainerDAO();
	
		
		
		MemberVO m_vo=new MemberVO();
			String id=req.getParameter("id");
			String pw=req.getParameter("newPw");
			
			
			
			try {
				if(m_dao.checkId2(id)) {
		               m_dao.changePw(id,pw);
		            }else if(t_dao.checkId2(id)) {
		               t_dao.changePw(id, pw);;
		            }
				forward.setRedirect(true);
				forward.setPath(req.getContextPath() + "/index.jsp");
				
			} catch (Exception e) {
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>");
				out.println("alert('수정에 실패하였습니다. 잠시 후 다시 시도해주세요.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}

		
	
		
		return forward;
	}

}
