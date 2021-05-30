package com.team4.app.member;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.photoboard.dao.PhotoBoardDAO;
import com.team4.app.photoboard.vo.PhotoBoardVO;

public class MemberWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		ActionForward forward = new ActionForward();
		PhotoBoardVO p_vo = new PhotoBoardVO();
		PhotoBoardDAO p_dao = new PhotoBoardDAO();
		FileNameDAO f_dao= new FileNameDAO();
		
		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);

		// 5MB
		int fileSize = 5 * 1024 * 1024;

		MultipartRequest multi = null;

		multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
	
		
		String memberId = multi.getParameter("memberId");

		p_vo.setPhotoBoardTitle(multi.getParameter("photoBoardTitle"));
		p_vo.setMemberId(memberId);
		p_vo.setPhotoBoardContent(multi.getParameter("photoBoardContent"));

		
		if (p_dao.photoBoardWrite(p_vo)) {
			
			if (f_dao.insertFiles(2, p_dao.selectBoardNum(), memberId, multi)) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(req.getContextPath() +"/member/MemberBoard.me");
				
			}

		}else{
			
			
		}
		return forward;
	}
}
