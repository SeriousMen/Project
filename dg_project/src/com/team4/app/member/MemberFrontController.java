package com.team4.app.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.team4.action.ActionForward;

public class MemberFrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();

		String contextPath = req.getContextPath();

		String command = requestURI.substring(contextPath.length());

		ActionForward forward = null;

		if (command.equals("/member/MemberJoinOk.me")) {
			try {
			forward = new MemberJoinOkAction().execute(req, resp);
			} catch (Exception e) {System.out.println(e.getMessage());}
			
		} else if (command.equals("/member/MemberJoin.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/memberJoin.jsp");
			
		} else if (command.equals("/member/MemberCheckIdOk.me")) {
			try {
			forward = new MemberCheckIdOkAction().execute(req, resp);
			} catch (Exception e) {;}
			
		} else if (command.equals("/member/MemberSms.me")) {
			try {
			
			forward = new MemberSmsAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/MemberLogin.me")) {
			
			String login = req.getParameter("login");
			forward = new ActionForward();
			forward.setRedirect(false);
			
			forward.setPath("/app/public/login.jsp"+ (login != null ? "?login=false" : ""));
				
		}else if(command.equals("/member/MemberLoginOk.me")) {
			
			try {
				forward = new MemberLoginOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/member/MemberLogout.me")) {
			try {
				forward = new MemberLogoutAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/MemberFindId.me")){
			try {
				forward = new MemberFindIdAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/MemberFindPw.me")){
			try {
				forward = new MemberFindPwAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/MemberChangePw.me")){
			try {
				forward = new MemberChangePwAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/MemberWithdrawalOk.me")){
			try {
				forward = new MemberWithdrawalOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/member/MemberWriteOk.me")){
			try {
				forward = new MemberWriteOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/MemberBoard.me")){
			try {
				forward = new MemberBoardOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/MemberBoardDetail.me")){
			try {
				forward = new MemberBoardDetailOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/MemberBoardModify.me")){
			try {
				forward = new MemberBoardModifyAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/MemberBoardModifyOk.me")){
			try {
				forward = new MemberBoardModifyOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/MemberBoardDelete.me")){
			try {
				forward = new MemberBoardDeleteOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/BoardReplyList.me")){
			try {
				forward = new MemberBoardReplyListOk().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/BoardReplyModifyOk.me")){
			try {
				forward = new MemberBoardReplyModifyOk().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/MemberBoardReplyOk.me")){
			try {
				forward = new MemberBoardReplyOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/BoardReplyDeleteOk.me")){
			try {
				forward = new MemberBoardReplyDeleteOk().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/MemberModify.me")){
			try {
				forward = new MemberModifyOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/MemberPhoneCheckOk.me")){
			try {
				forward = new MemberPhoneCheckOk().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/member/MemberChangePhoneOk.me")){
			try {
				forward = new MemberChangePhoneOk().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/member/MemberPageOk.me")){
			try {
				forward = new MemberPageOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/member/MemberFindIdOk.me")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/public/findIdOk.jsp?check=true");	
	
		}else if(command.equals("/member/MemberFindPwOk.me")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/public/changePw.jsp?check=true");	
	
		}else if(command.equals("/member/MemberFindIdCheck.me")){
			String check = req.getParameter("check");
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/app/public/findIdPw.jsp"+(check != null ? "?check=false" : ""));
			
		}else if(command.equals("/member/MemberFindPwCheck.me")){
			String checkpw = req.getParameter("checkpw");
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/app/public/findIdPw.jsp"+(checkpw != null ? "?checkpw=false" : ""));
			
		}else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/error/404.jsp");
		}
		if (forward != null) {
			if (forward.isRedirect()) {
			
				resp.sendRedirect(forward.getPath());
				
			} else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}

}
