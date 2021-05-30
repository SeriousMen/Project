package com.team4.app.trainer;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageURLModifyOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		ActionForward forward = new ActionForward();
		
		TrainerDAO t_dao= new TrainerDAO();
		TrainerVO t_vo= new TrainerVO();
		
		String URL=req.getParameter("URL");
		String trainerId=req.getParameter("TrainerId");
		
		
		
		t_vo.setTrainerUrl(URL);
		t_vo.setTrainerId(trainerId);
		
		t_dao.updateURL(t_vo);
			
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/trainer/TrainerMypageView.tr?t_id="+trainerId);
		
		return forward;
	}

}
