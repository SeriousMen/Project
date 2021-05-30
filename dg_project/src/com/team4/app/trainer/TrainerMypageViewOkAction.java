package com.team4.app.trainer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageViewOkAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao = new TrainerDAO();
		TrainerVO t_vo = null;
		
		ActionForward forward = null;
		HttpSession session = req.getSession();
		String t_id = (String)session.getAttribute("session_t_id");
		
		
		t_vo=t_dao.getDetail(t_id);
		
		
		
		if(t_vo.getTrainerProfileImage()==null||t_vo.getTrainerProfileImage()=="") {
		
			t_vo.setTrainerProfileImage("blackLogo.jpg");
		}
		
		if(t_vo!=null) {
			req.setAttribute("t_vo",t_vo);
			req.setAttribute("trainerId",t_id);
		}
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/trainer/TMypage.jsp");

			return forward;
	}

}
