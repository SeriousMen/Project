package com.team4.app.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.qna.dao.FilesDAO;
import com.team4.app.review.vo.PageDTO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TotalTrainerListOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao = new TrainerDAO();
		MemberDAO m_dao = new MemberDAO();
		FilesDAO f_dao = new FilesDAO();
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		
		String temp = req.getParameter("page");
		
		int page = temp == null ? 1 : Integer.parseInt(temp);
		
		PageDTO paging = new PageDTO(page, 5, t_dao.trainerCnt());
		
		List<String> trNumList = null;
		if(temp == null) {
			trNumList = t_dao.randomTrainerNum();
			session.setAttribute("trNumList", trNumList);
		}else {
			trNumList = (List<String>) session.getAttribute("trNumList");
		}
		
		List<TrainerVO> trainerList = new ArrayList<>();
		for (int i = paging.getStartRow() - 1; i < paging.getEndRow(); i++) {
			trainerList.add(t_dao.numForAll(Integer.parseInt(trNumList.get(i))));
		}
		
		req.setAttribute("totalTrainer", paging.getTotalCnt());
		req.setAttribute("totalMember", m_dao.totalMember());
		req.setAttribute("startPage", paging.getStartPage());
		req.setAttribute("endPage", paging.getEndPage());
		req.setAttribute("nowPage", page);
		req.setAttribute("realEndPage", paging.getRealEndPage());
		req.setAttribute("top3", t_dao.top3());
		req.setAttribute("trainerList", trainerList);

		forward.setRedirect(false);
		forward.setPath("/app/trainer/totalTrainerList.jsp");
		
		return forward;
	}
}
