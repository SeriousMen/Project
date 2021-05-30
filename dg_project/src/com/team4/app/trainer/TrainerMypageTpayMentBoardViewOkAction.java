package com.team4.app.trainer;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.trade.vo.TradeVO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageTpayMentBoardViewOkAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		TrainerDAO t_dao = new TrainerDAO();
		TrainerVO t_vo = new TrainerVO();
		TradeVO tr_vo=new TradeVO();
		
		String temp = req.getParameter("page");
		
		int page = temp == null ? 1 : Integer.parseInt(temp);
		
		int boardSize = 10;
		int pageSize = 10;
		
		int endRow = page * boardSize;
		
		int startRow = endRow - (boardSize - 1);
		
		int startPage = ((page - 1) / pageSize) * pageSize  + 1;
		int endPage = startPage + (pageSize - 1);
		
		String id=req.getParameter("TrainerId");
		t_vo.setTrainerId(id);
		int totalCnt = t_dao.getTrainerBoardCnt(id);
	
		
		int realEndPage = (totalCnt - 1) / pageSize + 1;
		
		endPage = endPage > realEndPage ? realEndPage : endPage;
		
		
		
	
		req.setAttribute("totalCnt",totalCnt);
		req.setAttribute("startPage",startPage);
		req.setAttribute("endPage",endPage);
		req.setAttribute("nowPage",page);
		req.setAttribute("realEndPage",realEndPage);
		req.setAttribute("boardList",t_dao.getTradeBoardList(startRow, endRow,id));
	
		ActionForward forward = null;
		
		
		
			req.setAttribute("t_vo",t_vo);
			req.setAttribute("tr_vo", tr_vo);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/trainer/TpaymentBoard.jsp");

			return forward;
	}

}
