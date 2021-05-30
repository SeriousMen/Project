package com.team4.app.trainer;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageTpayViewOkAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		TrainerVO t_vo = new TrainerVO();
		
		ActionForward forward = null;
		HttpSession session = req.getSession();
		String t_id = (String)session.getAttribute("session_t_id");
		t_vo.setTrainerId(t_id);
		
		boolean Pwcheck=Boolean.valueOf(req.getParameter("Pwcheck"));
	
		
		if(Pwcheck==true) {
			req.setAttribute("Pwcheck",Pwcheck);
		}
		
			 
		req.setAttribute("t_vo",t_vo);
			
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/trainer/Tpay.jsp");

		return forward;
	}

}
