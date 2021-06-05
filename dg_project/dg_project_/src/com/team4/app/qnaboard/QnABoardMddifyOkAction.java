package com.team4.app.qnaboard;

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
import com.team4.app.qna.dao.QnaDAO;
import com.team4.app.qna.vo.QnaVO;

public class QnABoardMddifyOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();

		QnaDAO q_dao = new QnaDAO();
		FileNameDAO f_dao = new FileNameDAO();

		MultipartRequest multi = null;

		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);

		int fileSize = 5 * 1024 * 1024;

		try {
			QnaVO q_vo = new QnaVO();

			multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());

			int page = Integer.parseInt(multi.getParameter("page"));
			int boardNum = Integer.parseInt(multi.getParameter("boardNum"));

			for (FileNameVO file : f_dao.getReviewFile(3, boardNum)) {
				File f = new File(realPath, file.getFileName());
				if (f.exists()) {
					f.delete();
				}
			}

			q_vo.setQnaNum(boardNum);
			q_vo.setQnaTitle(multi.getParameter("demo-name"));
			q_vo.setQnaContent(multi.getParameter("demo-textarea"));

			f_dao.deleteReviewFile(3, boardNum);
		
			f_dao.insertFiles(3, boardNum, multi.getParameter("memberId"), multi);

			q_dao.updateBoard(q_vo);

			forward.setRedirect(true);
			forward.setPath(
					req.getContextPath() + "/qnaboard/BoardView.qn?boardNum=" + q_vo.getQnaNum() + "&page=" + page);

		} catch (Exception e) {
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('게시글 수정 실패. 다시 시도해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}
		return forward;

	}
}
