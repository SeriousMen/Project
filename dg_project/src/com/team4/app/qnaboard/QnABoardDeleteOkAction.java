package com.team4.app.qnaboard;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.dao.FilesDAO;
import com.team4.app.qna.dao.QnaDAO;

public class QnABoardDeleteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		QnaDAO q_dao= new QnaDAO();
		FilesDAO f_dao = new FilesDAO();
		ActionForward forward = new ActionForward();
		
		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);
		
		int boardNum = Integer.parseInt(req.getParameter("boardNum"));
		int page = Integer.parseInt(req.getParameter("page"));
		
		for(com.team4.app.qna.vo.FilesVO file : f_dao.getFileList(boardNum)) {
			File f = new File(realPath, file.getFileName());
			if(f.exists()) {
				f.delete();
			}
		}
		f_dao.deleteFile(boardNum);
		
		q_dao.deleteBoard(boardNum);
		
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/qnaboard/BoardList.qn?page=" + page);
		
		return forward;
	}

}
