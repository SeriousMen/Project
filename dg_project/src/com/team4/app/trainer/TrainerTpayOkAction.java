package com.team4.app.trainer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.javafx.scene.paint.GradientUtils.Parser;
import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerTpayOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao = new TrainerDAO();
		TrainerVO t_vo = null;
		int intradioVal=0;
		int intchoice=0;
		int choicePay=0;
		
		
		
		String pw=req.getParameter("pw");
	
		
		String choice =req.getParameter("choice");
		
		String radioVal=req.getParameter("radioVal");
		
		
		if(choice !=null) {
			intchoice= Integer.parseInt(choice);
			choicePay=intchoice;
		}
	
		if(radioVal !=null) {
			 intradioVal=Integer.parseInt(radioVal);
			 choicePay=intradioVal;
		}
		
		ActionForward forward = null;
		HttpSession session = req.getSession();
		String t_id = (String)session.getAttribute("session_t_id");
		t_vo=t_dao.getDetail(t_id);
		
		boolean Pwcheck=t_dao.checkPw(t_id, pw);
		
		if(Pwcheck==true) {
			forward = new ActionForward();
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() +"/trainer/Tpay.tr?Pwcheck="+Pwcheck);
		}else {
			
		
		boolean check=t_dao.Tpay(pw,t_id,choicePay);
		String Scheck=String.valueOf(check);
		
		
		
		
		req.setAttribute("check",check);
		req.setAttribute("t_vo",t_vo);
		
		
		forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() +"/trainer/TpayComplete.tr?Scheck="+Scheck+"&choicePay="+choicePay);
		}

		return forward;
	}


}
