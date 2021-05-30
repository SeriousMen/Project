package com.team4.app.trainer;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.dao.FilesDAO;
import com.team4.app.qna.vo.ProFileVO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageProfileModifyViewOkAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao = new TrainerDAO();
		ProFileVO p_vo =new ProFileVO();
		
		
		ActionForward forward = null;
		String id=req.getParameter("TrainerId");
		String imagename=req.getParameter("profilename");
		
		TrainerVO t_vo = t_dao.getDetail(id);
		req.setAttribute("t_vo",t_vo);
		
	
		
		p_vo.setFileName(imagename);
		req.setAttribute("p_vo",p_vo);
		req.setAttribute("imageList", t_dao.getimageList(id));
	
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/trainer/TMypageModify.jsp");

		return forward;
	}

}
