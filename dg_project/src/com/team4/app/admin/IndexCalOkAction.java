package com.team4.app.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.trainer.dao.TrainerDAO;

public class IndexCalOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTf-8");
		ActionForward forward = new ActionForward();
		
		MemberDAO m_dao=new MemberDAO();
		TrainerDAO t_dao = new TrainerDAO();
		JSONObject obj = new JSONObject();
		
	
		
		Object totalMember =m_dao.totalMember();
		Object tradeToday = m_dao.getTradeToday();
		Object totalTrainer=t_dao.trainerCnt();
		
		
		obj.put("totalMember", totalMember);
		obj.put("tradeToday", tradeToday);
		obj.put("totalTrainer", totalTrainer);
		
	
		
		PrintWriter out = resp.getWriter();
		
		out.println(obj);
		
	
		
	return null;
	}
}
