package com.team4.app.trainer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.review.vo.PageDTO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerSearchOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		TrainerDAO t_dao = new TrainerDAO();
		String keyword = req.getParameter("keyword");
		String temp = req.getParameter("page");
		boolean searchCheck = new Boolean(req.getParameter("searchFlag"));
		int page = temp == null ? 1 : Integer.parseInt(temp);
		PageDTO paging = new PageDTO(page, 5, t_dao.resultCnt(keyword));
		
		List<TrainerVO> trainers = t_dao.searchTrainer(keyword, paging);
		if(trainers != null && trainers.size() != 0) {
			if(searchCheck) {
				if(t_dao.checkKeyword(keyword) != 0) {
					t_dao.updateKeywordCnt(keyword);
				}else {
					t_dao.insertKeywordCnt(keyword);
				}
			}
			req.setAttribute("trainers", trainers);
			req.setAttribute("page", paging);
			req.setAttribute("keyword", keyword);
			req.setAttribute("searchCnt", t_dao.getKeywordCnt(keyword));
			req.setAttribute("flag", true);
			req.setAttribute("resultSize", t_dao.resultCnt(keyword));
			forward.setRedirect(false);
			forward.setPath("/trainer/result.tr");
			
		}else {
			req.setAttribute("keyword", keyword);
			req.setAttribute("flag", false);
			forward.setRedirect(false);
			forward.setPath("/trainer/result.tr");
		}
		return forward;
	}

}
