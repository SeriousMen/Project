package com.team4.app.trainer;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.vo.ProFileVO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageSnsViewOkAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao = new TrainerDAO();
		ProFileVO p_vo =new ProFileVO();
		
		
		ActionForward forward = null;
		
		
		String id=req.getParameter("TrainerId");
		
		
		
		
		String profilename=t_dao.getProfile(id);
		
		p_vo.setFileName(profilename);
		
		
		TrainerVO t_vo = t_dao.getDetail(id);
		
			
			req.setAttribute("p_vo",p_vo);
			
			req.setAttribute("t_vo",t_vo);
		
			req.setAttribute("imageList", t_dao.getimageList(id));
			
		
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/trainer/sns.jsp");

			return forward;
	}

}
