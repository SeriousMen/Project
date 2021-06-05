package com.team4.app.trainer;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.trainer.dao.TrainerDAO;


public class TrainerSmsAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		TrainerDAO t_dao=new TrainerDAO();
		
		String trainerPhone=req.getParameter("phone");
		
		String num=t_dao.sms(trainerPhone);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out=resp.getWriter();
		out.println(num);
		out.close();
		
		
		return null;
	}

}
