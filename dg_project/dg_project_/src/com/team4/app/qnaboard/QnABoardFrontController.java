package com.team4.app.qnaboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnABoardFrontController extends HttpServlet {

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
		com.team4.action.ActionForward forward = null;
		

		switch (command) {
		case "/qnaboard/FileDownload.qn":
			try {
				forward = new QnAFileDownloadAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/qnaboard/BoardModify.qn":
			try {
				forward = new QnABoardMddifyAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/qnaboard/BoardModifyOk.qn":
			try {
				forward = new QnABoardMddifyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/qnaboard/BoardList.qn":
			try {
				forward = new QnaBoardListOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/qnaboard/QAWrite.qn":
			try {
				forward = new QnaWriteViewAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/qnaboard/BoardDelete.qn":
			try {
				forward = new QnABoardDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/qnaboard/QnaWriteOk.qn":
			try {
				
				forward = new QnABoardWriteOkAction().execute(req, resp);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "/qnaboard/BoardReplyOk.qn":
			try {
				forward = new QnABoardReplyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/qnaboard/BoardReplyList.qn":
			try {
				forward = new QnABoardReplyListAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/qnaboard/BoardView.qn":
			try {
				forward = new QnaBoardViewAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/qnaboard/BoardReplyDeleteOk.qn":
			try {
				forward = new QnAReplyDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/qnaboard/BoardReplyModifyOk.qn":
			try {
				forward = new QnAReplyModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		default:
			forward = new com.team4.action.ActionForward();
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
