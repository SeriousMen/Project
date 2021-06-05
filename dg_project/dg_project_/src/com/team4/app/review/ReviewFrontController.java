package com.team4.app.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.trainer.dao.TrainerDAO;


@SuppressWarnings("serial")
public class ReviewFrontController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestUri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestUri.substring(contextPath.length());
		ActionForward forward = null;
		
		switch(command) {
			// submit 시 첨부 파일 이름과 게시글을 DB에 등록하고 경로에 첨부 파일 저장
			case "/review/ReviewWriteOkAction.rv":
				try {
					forward = new ReviewWriteOkAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println("/review/ReviewWriteOkAction.rv 오류");
					System.out.println(e.getMessage());
				}
				break;
			// 임시 폴더에 첨부 파일 저장하는 컨트롤러
			case "/review/ReviewThumbnailOkAction.rv":
				try {
					forward = new ReviewThumbnailOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				break;
			//트레이너 상세보기에 review list
			case "/review/ReviewList.rv":
				try {
					forward = new ReviewListOkAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				break;
			//리뷰 상세보기 페이지
			case "/review/ReviewView.rv":
				try {
					forward = new ReviewViewOkAction().execute(req, resp);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				break;
			//리뷰 삭제하기
			case "/review/ReviewDelete.rv":
				try {
					forward = new ReviewDeleteOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				break;
			//리뷰 수정페이지로 이동
			case "/review/ReviewModify.rv":
				try {
					forward = new ReviewModifyAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				break;
			//리뷰 수정하기
			case "/review/ReviewModifyOk.rv":
				try {
					forward = new ReviewModifyOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				break;
			case "/review/ReviewPointCharge.rv":
				try {
					forward = new MemberChargePointOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				break;
			case "/review/Propensity.rv":
				try {
					forward = new PropensityOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				break;
			case "/review/PaymentPopup.rv":
				TrainerDAO t_dao = new TrainerDAO();
				MemberDAO m_dao = new MemberDAO();
				req.setAttribute("trainer", t_dao.getDetail(req.getParameter("trainerId")));
				req.setAttribute("m_id", m_dao.getMemberDetail(req.getParameter("m_id")));
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/public/handoverPoint.jsp");
				break;
			case "/review/Payment.rv":
				TrainerDAO t2_dao = new TrainerDAO();
				MemberDAO m2_dao = new MemberDAO();
				req.setAttribute("trainer", t2_dao.getDetail(req.getParameter("trainer")));
				req.setAttribute("m_id", m2_dao.getMemberDetail(req.getParameter("m_id")));
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/public/payment.jsp");
				break;
			case "/review/Handover.rv":
				try {
					forward = new HandOverPointOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				break;
			case "/review/TotalTrainerList.rv":
				try {
					forward = new TotalTrainerListOkAction().execute(req, resp);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.getMessage());
				}
				break;
			default:
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("error/404.jsp");		
				break;
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
	
}
