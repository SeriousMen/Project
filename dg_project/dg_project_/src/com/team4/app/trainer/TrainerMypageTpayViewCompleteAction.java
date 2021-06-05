package com.team4.app.trainer;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.trade.vo.TradeVO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageTpayViewCompleteAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		TrainerVO t_vo = new TrainerVO();
		TrainerDAO t_dao=new TrainerDAO();
		
		
		
		ActionForward forward = null;
		HttpSession session = req.getSession();
		String t_id = (String)session.getAttribute("session_t_id");
		int TrainerPoint=t_dao.getpoint(t_id);
		
		String choicePay=req.getParameter("choicePay");
	
		String content=choicePay+"포인트 환전";
		
		t_vo.setTrainerId(t_id);
		t_vo.setTrainerPoint(TrainerPoint);

		
		String Scheck= req.getParameter("Scheck");
		boolean check=Boolean.valueOf(Scheck);
		if(check == true) {
			t_dao.insertTrade(t_id,content);
		}
			 
			req.setAttribute("check",check);
			req.setAttribute("t_vo",t_vo);
			
			
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/trainer/Tpaycomplete.jsp?point="+choicePay);
			

			return forward;
	}

}
