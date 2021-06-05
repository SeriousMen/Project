package com.team4.app.trainer;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypagePriceModifyOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		
		ActionForward forward = new ActionForward();
		
		TrainerDAO t_dao= new TrainerDAO();
		TrainerVO t_vo= new TrainerVO();
		
		String price=req.getParameter("price");
		String trainerId=req.getParameter("TrainerId");
		
		
		
		t_vo.setTrainerPrice(price);
		t_vo.setTrainerId(trainerId);
		
		t_dao.updatePrice(t_vo);
			
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/trainer/TrainerMypageView.tr?t_id="+trainerId);
		
		return forward;
	}

}
