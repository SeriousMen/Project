package com.team4.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.fileName.vo.FileNameVO;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.member.vo.MemberVO;

public class MemberWithdrawalOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
	
		ActionForward forward = null;
		MemberDAO m_dao = new MemberDAO();
		HttpSession session = req.getSession();
		FileNameDAO f_dao = new FileNameDAO();
		
		String id = req.getParameter("memberId");
		String pw = req.getParameter("memberPw");
		
		resp.setContentType("text/html;charset=utf-8"); 

		
		if(m_dao.withdrawal(id, pw)) {
			if(f_dao.deleteUserFile(id)) {
		
				
			}
			forward = new ActionForward();
			forward.setRedirect(false);
			
			forward.setPath("/index.jsp?ok=true");
//			session.invalidate();
			session.removeAttribute("trNumList");
			session.removeAttribute("attentionCheck");
			session.removeAttribute("dateCheck");
			session.removeAttribute("tgCheck");
			session.removeAttribute("zipCode");
			session.removeAttribute("session_m_id");
			session.removeAttribute("session_t_id");
			session.removeAttribute("session_a_id");
			
		}else {
		
		
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/memberWithdrawal.jsp?ok=false");
		
		}
		
		// out.close; out.flush한 이후에는 forward가 안된다. 
	
		return forward;
		
	}

}
