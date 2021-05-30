package com.team4.app.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.vo.MemberVO;
import com.team4.app.review.dao.ReviewDAO;

public class MemberChargePointOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MemberVO m_vo = new MemberVO();
		ReviewDAO r_dao = new ReviewDAO();
		
		String m_id = req.getParameter("memberId");
		int point = Integer.parseInt(req.getParameter("point"));
		
		m_vo.setMemberId(m_id);
		m_vo.setMemberPoint(point/100);
		r_dao.chargeMemberPoint(m_vo);
		r_dao.payment(m_id, point);
		
		return null;
	}
}
