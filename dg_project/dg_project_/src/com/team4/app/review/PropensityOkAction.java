package com.team4.app.review;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.review.dao.ReviewDAO;
import com.team4.app.review.vo.PageDTO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class PropensityOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		ReviewDAO r_dao = new ReviewDAO();
		
		ActionForward forward = new ActionForward();
		
		String[] attentionCheck;
		String[] dateCheck;
		String tgCheck;
		int zipCode;
		HttpSession session = req.getSession();
		try {
			attentionCheck = new String[9];
			attentionCheck = req.getParameterValues("attentionCheck");
			
			dateCheck = new String[8];
			dateCheck = req.getParameterValues("dateCheck");
			
			tgCheck = req.getParameter("tgCheck");
			zipCode = Integer.parseInt(req.getParameter("zipCode"));

			session.setAttribute("attentionCheck", attentionCheck);
			session.setAttribute("dateCheck", dateCheck);
			session.setAttribute("tgCheck", tgCheck);
			session.setAttribute("zipCode", zipCode);
		} catch (NumberFormatException e) {
			attentionCheck = new String[9];
			attentionCheck = (String[]) session.getAttribute("attentionCheck");
			
			dateCheck = new String[8];
			dateCheck = (String[]) session.getAttribute("dateCheck");
			
			tgCheck = (String) session.getAttribute("tgCheck");
			zipCode = (Integer) session.getAttribute("zipCode");
		}
		
		String temp = req.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		
		TrainerDAO t_dao = new TrainerDAO();
		PageDTO paging = new PageDTO(page, 5, r_dao.getTrainerTotalCnt(tgCheck, zipCode, attentionCheck, dateCheck));
		List<TrainerVO> list = r_dao.propensity(paging, tgCheck, zipCode, attentionCheck, dateCheck);
		
		req.setAttribute("totalCnt", paging.getTotalCnt());
		req.setAttribute("startPage", paging.getStartPage());
		req.setAttribute("endPage", paging.getEndPage());
		req.setAttribute("nowPage", page);
		req.setAttribute("realEndPage", paging.getRealEndPage());
		req.setAttribute("resultList", list);
		req.setAttribute("trainerCnt", t_dao.trainerCnt());
		
		forward.setRedirect(false);
		forward.setPath("/app/trainer/trainerList.jsp");
		
		return forward;
	}
}
