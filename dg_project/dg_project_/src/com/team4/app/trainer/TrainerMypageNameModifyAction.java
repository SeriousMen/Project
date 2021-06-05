package com.team4.app.trainer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageNameModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao=new TrainerDAO();
		TrainerVO t_vo =new TrainerVO();
		ActionForward forward=new ActionForward();
		
		String id=req.getParameter("TrainerId");
		String ModifyName= req.getParameter("Modifyname");
		String pw=req.getParameter("pw");
		
		
		t_dao.UpdateTrainerName(id,pw,ModifyName);
	
		
		
		t_vo.setTrainerName(ModifyName);
		
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() +"/trainer/TMypageModify.tr?TrainerId="+id);
		
		return forward;
	}

}
