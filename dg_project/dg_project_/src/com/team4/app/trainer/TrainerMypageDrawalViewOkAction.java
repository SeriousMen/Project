package com.team4.app.trainer;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageDrawalViewOkAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao = new TrainerDAO();
		TrainerVO t_vo = new TrainerVO();
		
		ActionForward forward = null;
		String id=req.getParameter("TrainerId");
		t_vo.setTrainerId(id);
		
			req.setAttribute("t_vo",t_vo);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/trainer/Twithdrawal.jsp");

			return forward;
	}

}
