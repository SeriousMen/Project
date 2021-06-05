package com.team4.app.trainer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageDrawalOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao=new TrainerDAO();
		TrainerVO t_vo=new TrainerVO();
		FileNameDAO f_dao = new FileNameDAO();
		HttpSession session = req.getSession();
		
		ActionForward forward=new ActionForward();
		
		String id=req.getParameter("memberId");
		String pw= req.getParameter("memberPw");
		
		t_vo.setTrainerId(id);
		t_vo.setTrainerPw(t_dao.encrypt(pw));
		
		
		if(t_dao.MypageDrawal(t_vo)) {
			if(f_dao.deleteUserFile(id)) {
				session.invalidate();
			}
		}
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() +"/index.jsp");
		
		return forward;
	}
		
}
