package com.team4.app.trainer;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.trade.vo.TradeVO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerTpayMentViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao=new TrainerDAO();
		TrainerVO t_vo=new TrainerVO();
		TradeVO tr_vo=null;
		
		String id= req.getParameter("TrainerId");
		
		t_vo.setTrainerId(id);
		
		
		ActionForward forward =null;
		
		int tradeNum = Integer.parseInt(req.getParameter("TradeNum"));
		int page = Integer.parseInt(req.getParameter("page"));
		
		tr_vo= t_dao.getTradeDetail(tradeNum);
		
		
		if(tr_vo != null) {
			req.setAttribute("tr_vo", tr_vo);
			req.setAttribute("t_vo", t_vo);
			req.setAttribute("page", page);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/trainer/TpaymentView.jsp");
		}
		return forward;
	}
	
	
}
