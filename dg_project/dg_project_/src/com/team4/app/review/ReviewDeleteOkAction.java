package com.team4.app.review;

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
import com.team4.app.review.dao.ReviewDAO;

public class ReviewDeleteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ReviewDAO r_dao = new ReviewDAO();
		FileNameDAO f_dao = new FileNameDAO();
		ActionForward forward = new ActionForward();
		
		MultipartRequest multi = null;
		String trainerId = req.getParameter("trainerId");
		
		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);
		
		int fileSize = 5 * 1024 * 1024;
		
		multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		int reviewNum = Integer.parseInt(multi.getParameter("reviewNum"));
		int page = Integer.parseInt(multi.getParameter("page"));
		
		System.out.println(req.getParameter("page"));// 얘 null 나옴
		System.out.println(req.getParameter("reviewNum"));// 얘 null 나옴
		
		for(FileNameVO files : f_dao.getReviewFile(6, reviewNum)) {
			File f = new File(realPath, files.getFileName());
			if(f.exists()) {
				f.delete();
			}
		}
		f_dao.deleteReviewFile(6, reviewNum);
		
		r_dao.deleteReview(reviewNum);		
		
		forward.setRedirect(true);
		//forward.setPath(req.getContextPath()+"/review/ReviewList.rv?page="+page+"&reviewNum="+reviewNum);
		forward.setPath(req.getContextPath()+"/review/ReviewList.rv?page="+page+"&trainerId="+trainerId);
		
		return forward;
	}
}
