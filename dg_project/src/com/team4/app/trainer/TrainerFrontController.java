package com.team4.app.trainer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.ActionForward;

public class TrainerFrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		
		String command = requestURI.substring(contextPath.length());

		ActionForward forward = null;
		
		if (command.equals("/trainer/TrainerJoinOk.tr")) {
			
			try {
				forward = new TrainerJoinOkAction().execute(req, resp);
			} catch (Exception e) {System.out.println(e);}
		} else if (command.equals("/trainer/TrainerCheckIdOk.tr")) {

		
			try {
				forward = new TrainerCheckIdOkAction().execute(req, resp);
			} catch (Exception e) {
				;
			}
		} else if (command.equals("/trainer/TpayOk.tr")) {
			
		
			try {
				forward = new TrainerTpayOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (command.equals("/trainer/TpayComplete.tr")) {
			
		
			try {
				forward = new TrainerMypageTpayViewCompleteAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (command.equals("/trainer/TrainerMypageContentModify.tr")) {
			
		
			try {
				forward = new TrainerMypageContentModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				;
			}
		} else if (command.equals("/trainer/TrainerMypagePriceModify.tr")) {
			
		
			try {
				forward = new TrainerMypagePriceModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (command.equals("/trainer/Mypagepro.tr")) {
			
			
			try {
				forward = new TrainerMypageProfileModifyViewOkAction().execute(req, resp);
			} catch (Exception e) {
				;
			}
		} else if (command.equals("/trainer/TrainerMypageProfileModify.tr")) {
			
			
			try {
				forward = new TrainerMypageProfileModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				;
			}
		} else if (command.equals("/trainer/TrainerMypageAccountModify.tr")) {
			
			
			try {
				forward = new TrainerMypageAccountModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				;
			}
		} else if (command.equals("/trainer/TrainerMypageDrawal.tr")) {
			
			
			try {
				forward = new TrainerMypageDrawalOkAction().execute(req, resp);
			} catch (Exception e) {
				;
			}
		} else if (command.equals("/trainer/Tpay.tr")) {
			
			
			try {
				forward = new TrainerMypageTpayViewOkAction().execute(req, resp);
			} catch (Exception e) {
				;
			}
		} else if (command.equals("/trainer/Tdrawal.tr")) {
			
			
			try {
				forward = new TrainerMypageDrawalViewOkAction().execute(req, resp);
			} catch (Exception e) {
				;
			}
		} else if (command.equals("/trainer/TpayMentBoard.tr")) {
			
			
			try {
				forward = new TrainerMypageTpayMentBoardViewOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (command.equals("/trainer/TpayMent.tr")) {
			
			
			try {
				forward = new TrainerTpayMentViewAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
		} else if (command.equals("/trainer/sns.tr")) {
			
			
			try {
				forward = new TrainerMypageSnsViewOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (command.equals("/trainer/TMypageModify.tr")) {
			
			
			try {
				forward = new TrainerMypageMypageModifyViewOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (command.equals("/trainer/TrainerMypageURLModify.tr")) {
			
			
			try {
				forward = new TrainerMypageURLModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				;
			}
		} else if (command.equals("/trainer/TrainerMypageView.tr")) {
			
			
			try {
				forward = new TrainerMypageViewOkAction().execute(req, resp);
			} catch (Exception e) {
				;
			}
		} else if (command.equals("/trainer/TmypageIdModify.tr")) {
			
			
			try {
				forward = new TrainerMypageIdModifyAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());;
			}
		} else if (command.equals("/trainer/TmypagePwModify.tr")) {
			
		
			try {
				forward = new TrainerMypagePwModifyAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());;
			}
		} else if (command.equals("/trainer/TmypageNameModify.tr")) {
			
		
			try {
				forward = new TrainerMypageNameModifyAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());;
			}

		} else if (command.equals("/trainer/TrainerSms.tr")) {
			try {
				
				forward = new TrainerSmsAction().execute(req, resp);
			} catch (Exception e) {
				;
			}
		} else if (command.equals("/trainer/TrainerSnsImage.tr")) {
			try {
			
				forward = new TrainerSnsImageOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
				
			}
		} else if (command.equals("/trainer/TrainerSnsProfileImage.tr")) {
			try {
		
				forward = new TrainerSnsProfileImageOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
				
			}
		} else if (command.equals("/trainer/TrainerSnsImageDelete.tr")) {
			try {
			
				forward = new TrainerSnsImageDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
				
			}
		} else if (command.equals("/trainer/pro.tr")) {
			try {
			
				forward = new  TrainerMypageSnsProfileViewOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
				
			}
		} else if (command.equals("/trainer/search.tr")) {
			try {
			
				forward = new  TrainerSearchOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else if (command.equals("/trainer/result.tr")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/public/search_result.jsp?keyword=" + req.getParameter("keyword") + "&flag=" + req.getParameter("flag"));
	
		}else { // 요청 URL잘못되서 분기처리 실래할 시
			System.out.println("들어옴");
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/error/404.jsp");

		}

		// 분기처리 끝나고 일괄처리
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
