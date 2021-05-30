package com.team4.app.review;

import java.io.File;
import java.io.PrintWriter;

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
import com.team4.app.review.vo.ReviewVO;

public class ReviewModifyOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		ReviewDAO r_dao = new ReviewDAO();
		FileNameDAO f_dao = new FileNameDAO();
		
		MultipartRequest multi = null;
		
		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);
		
		int fileSize = 5 * 1024 * 1024;
		try {
			ReviewVO r_vo = new ReviewVO();
			multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			int page = Integer.parseInt(multi.getParameter("page"));
			int reviewNum = Integer.parseInt(multi.getParameter("reviewNum"));
			
			for(FileNameVO files : f_dao.getReviewFile(6, reviewNum)) {
				File f = new File(realPath, files.getFileName());
				if(f.exists()) {
					f.delete();
				}
			}
			r_vo.setReviewNum(reviewNum);
			r_vo.setMemberId(multi.getParameter("memberId"));
			r_vo.setTrainerId(multi.getParameter("trainerId"));
			r_vo.setReviewContent(multi.getParameter("reviewContent"));
			
			f_dao.deleteReviewFile(6, reviewNum);
			
			f_dao.insertFiles(6, reviewNum, multi.getParameter("memberId"), multi);
			
			r_dao.updateReview(r_vo);
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/review/ReviewView.rv?reviewNum="+r_vo.getReviewNum()+"&page="+page);
		} catch (Exception e) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('수정에 실패하였습니다. 잠시 후 다시 시도해주세요.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
			return null;
		}
		return forward;
	}
}
