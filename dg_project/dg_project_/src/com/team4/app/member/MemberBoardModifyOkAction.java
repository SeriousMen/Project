package com.team4.app.member;

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
import com.team4.app.photoboard.dao.PhotoBoardDAO;
import com.team4.app.photoboard.vo.PhotoBoardVO;

public class MemberBoardModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
	
		PhotoBoardDAO p_dao = new PhotoBoardDAO();
		FileNameDAO f_dao = new FileNameDAO();
		
		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);

		// 5MB
		int fileSize = 5 * 1024 * 1024;

		MultipartRequest multi = null;

		
		//왜여기 트라이캐치하는거지
			try {
				PhotoBoardVO p_vo = new PhotoBoardVO();
				
				multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
				
				int page = Integer.parseInt(multi.getParameter("page"));
				
				int photoBoardNum = Integer.parseInt(multi.getParameter("photoBoardNum"));
				
				for(FileNameVO files : f_dao.getReviewFile(2, photoBoardNum)) {
					File f = new File(realPath,files.getFileName());
					if(f.exists()) {
						f.delete();
					}
				}
				//DB삭제
				
				p_vo.setPhotoBoardNum(photoBoardNum);
				p_vo.setPhotoBoardTitle(multi.getParameter("photoBoardTitle"));
				p_vo.setMemberId(multi.getParameter("memberId"));
				p_vo.setPhotoBoardContent(multi.getParameter("photoBoardContent"));
				f_dao.deleteReviewFile(2, photoBoardNum);
				f_dao.insertFiles(2, photoBoardNum, multi.getParameter("memberId"), multi);
				p_dao.updateBoard(p_vo);
				
				forward.setRedirect(true);
				
				forward.setPath(req.getContextPath()+"/member/MemberBoardDetail.me?photoBoardNum="+p_vo.getPhotoBoardNum()+"&page="+page);
				
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
