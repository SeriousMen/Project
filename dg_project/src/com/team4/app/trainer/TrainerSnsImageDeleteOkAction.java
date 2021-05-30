package com.team4.app.trainer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.dao.FilesDAO;
import com.team4.app.trainer.dao.TrainerDAO;

public class TrainerSnsImageDeleteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		FilesDAO f_dao = new FilesDAO();
		
		TrainerDAO t_dao= new TrainerDAO();
		
		 ActionForward forward = null;
		
		String src=req.getParameter("deletesrc");
		
		String id=req.getParameter("TrainerId");
		
		String srcResult=src.substring(18);
		
	
		
		f_dao.deleteSnsFile(srcResult);
		
		
		
		forward= new ActionForward();
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/trainer/sns.tr?TrainerId="+id);

		return forward;
	}

}
