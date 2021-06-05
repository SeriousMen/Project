package com.team4.app.qnaboard;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.fileName.vo.FileNameVO;
import com.team4.app.qna.dao.QnaDAO;
import com.team4.app.qna.vo.QnaVO;
import com.team4.app.qna.vo.QreplyVO;

public class QnaBoardViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		QnaDAO q_dao = new QnaDAO();
		QnaDAO r_dao = new QnaDAO();
		QnaVO q_vo = null;
		FileNameDAO f_dao = new FileNameDAO();
		
		ActionForward forward =null;
		int qnaNum = Integer.parseInt(req.getParameter("boardNum"));
		int page = Integer.parseInt(req.getParameter("page"));
		
		q_vo= q_dao.getDetail(qnaNum);
		
		List<FileNameVO> fileList = f_dao.getReviewFile(3, qnaNum);
		List<QreplyVO> replyList = r_dao.getReplyList(qnaNum);
		
		if(q_vo != null) {
			q_dao.updateReadCount(qnaNum);
			req.setAttribute("replies",replyList);
			req.setAttribute("q_vo", q_vo);
			req.setAttribute("page", page);
			if(fileList != null) {
				req.setAttribute("files", fileList);
			}
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/qna/QAView.jsp");
		}
		return forward;
	}
	
	
}
