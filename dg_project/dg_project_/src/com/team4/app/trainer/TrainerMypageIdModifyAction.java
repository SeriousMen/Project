package com.team4.app.trainer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.vo.ProFileVO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageIdModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao=new TrainerDAO();
		TrainerVO t_vo =new TrainerVO();
		ProFileVO p_vo=new ProFileVO();
		
		ActionForward forward=new ActionForward();
		
		String id=req.getParameter("TrainerId");
		String ModifyId= req.getParameter("ModifyId");
		String pw=req.getParameter("pw");
		
		System.out.println(ModifyId);
		System.out.println(id);
		System.out.println(pw);
		
		t_dao.createTrigger(id,pw,ModifyId);
		
		t_dao.UpdateTrainerId(id,pw,ModifyId);
		
	
		p_vo.setFileName(t_dao.getProfile(ModifyId));
		
		
	
		t_vo.setTrainerId(ModifyId);
		
		req.setAttribute("t_vo",t_vo);
		req.setAttribute("p_vo",p_vo);
		HttpSession session = req.getSession();
		session.removeAttribute("trNumList");
		session.removeAttribute("attentionCheck");
		session.removeAttribute("dateCheck");
		session.removeAttribute("tgCheck");
		session.removeAttribute("zipCode");
		session.removeAttribute("session_m_id");
		session.removeAttribute("session_t_id");
		session.removeAttribute("session_a_id");
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath()+"/index.jsp");
		
		return forward;
	}

}
