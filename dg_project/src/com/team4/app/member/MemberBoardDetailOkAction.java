package com.team4.app.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.fileName.vo.FileNameVO;
import com.team4.app.photoboard.dao.PhotoBoardDAO;
import com.team4.app.photoboard.vo.PhotoBoardVO;

public class MemberBoardDetailOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		PhotoBoardDAO p_dao = new PhotoBoardDAO();
		PhotoBoardVO p_vo = new PhotoBoardVO();
		FileNameDAO f_dao = new FileNameDAO();
		ActionForward forward = null;
		
		int photoBoardNum = Integer.parseInt(req.getParameter("photoBoardNum"));
		int page = Integer.parseInt(req.getParameter("page"));
		
		p_vo = p_dao.getPhotoBoardDetail(photoBoardNum);
		List<FileNameVO> fileList = f_dao.getReviewFile(2,photoBoardNum);
		
		if(p_vo != null) {
			p_dao.updateReadCount(photoBoardNum);
			req.setAttribute("p_vo", p_vo);
			req.setAttribute("page", page);		
			if(fileList != null) {
				req.setAttribute("files", fileList);
			}
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/memberBoardDetail.jsp");
		}
		
		return forward;
	}
}
