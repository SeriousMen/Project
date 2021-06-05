package com.team4.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.member.vo.MemberVO;

public class MemberJoinOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		ActionForward forward=null;
		
		MemberVO m_vo=new MemberVO();
		MemberDAO m_dao=new MemberDAO();
		
		m_vo.setMemberId(req.getParameter("memberId"));
		m_vo.setMemberPw(req.getParameter("memberPw"));
		m_vo.setMemberPhone(req.getParameter("memberPhone"));
		
		//실패시
		if(!m_dao.join(m_vo)) {
		
			PrintWriter out=resp.getWriter();
			resp.setContentType("type/html;charset=utf-8");
			out.println("<script>alert('서버가 불안정합니다.잠시 후 다시 시도해주세요.');</script>");
			out.close();
			
		}else {
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/MemberLogin.me");
		}
		
		return forward;
	}

}
