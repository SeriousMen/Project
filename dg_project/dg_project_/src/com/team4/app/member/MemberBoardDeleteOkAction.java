package com.team4.app.member;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.fileName.vo.FileNameVO;
import com.team4.app.photoboard.dao.PhotoBoardDAO;

public class MemberBoardDeleteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PhotoBoardDAO p_dao = new PhotoBoardDAO();
		FileNameDAO f_dao = new FileNameDAO();
		ActionForward forward = new ActionForward();
		
		MultipartRequest multi = null;
		String memberId = req.getParameter("memberId");
		
		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);
		
		int fileSize = 5 * 1024 * 1024;
		
		multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		int photoBoardNum = Integer.parseInt(multi.getParameter("photoBoardNum"));
		int page = Integer.parseInt(multi.getParameter("page"));
		
		
		
		for(FileNameVO files : f_dao.getReviewFile(2, photoBoardNum)) {
			File f = new File(realPath, files.getFileName());
			if(f.exists()) {
				f.delete();
			}
		}
		f_dao.deleteReviewFile(2, photoBoardNum);
		
		p_dao.deletePhotoBoard(photoBoardNum);		
		
		forward.setRedirect(true);
		
		forward.setPath(req.getContextPath()+"/member/MemberBoard.me?page="+page+"&memberId="+memberId);
		
		return forward;
	}
}
