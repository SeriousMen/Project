package com.team4.app.trainer;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.vo.ProFileVO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageMypageModifyViewOkAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		
		TrainerDAO t_dao = new TrainerDAO();
		ProFileVO p_vo =new ProFileVO();
		TrainerVO t_vo=new TrainerVO();
		
		ActionForward forward = null;
		
		
		String imagename=req.getParameter("profilename");
		
		String id=req.getParameter("TrainerId");
		
		
		
		if(imagename==null||imagename=="") {
			
			imagename="bjh";
			t_vo.setTrainerProfileImage(imagename);
			p_vo.setFileName(imagename);
			
		}else if(imagename!=null){
	
			t_vo.setTrainerProfileImage(imagename);
			p_vo.setFileName(imagename);
		}
	
		String profilename=t_dao.getProfile(id);
		
		if(profilename!=null) {
		
			p_vo.setFileName(profilename);
			t_vo.setTrainerProfileImage(profilename);
		}else if(profilename==""||profilename==null) {

			profilename="bjh";
			p_vo.setFileName(profilename);
			t_vo.setTrainerProfileImage(profilename);
		}
		
		

		
	
	
		t_vo = t_dao.getDetail(id);
		
	
		req.setAttribute("t_vo",t_vo);
		req.setAttribute("p_vo",p_vo);
		
		
		
		
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/trainer/TMypageModify.jsp");

			return forward;
	}

}
