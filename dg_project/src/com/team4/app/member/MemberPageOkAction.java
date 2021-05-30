package com.team4.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.trade.vo.TradeVO;

public class MemberPageOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		TradeVO t_vo = new TradeVO();
		MemberDAO m_dao = new MemberDAO();
		ActionForward forward = new ActionForward();
		String temp = req.getParameter("page");
	
		String memberId = (String)session.getAttribute("session_m_id");
		int page = temp == null? 1: Integer.parseInt(temp);
		
		int boardSize = 10;
		int pageSize = 10;
		
		int endRow = page*boardSize; //한 페이지의 가장 마지막 행 번호 (제일 최신글?)
		
		int startRow = endRow -(boardSize-1);
		
		int startPage = ((page-1)/pageSize)*pageSize+1; //그냥 page하면 되는거 아니야 ? 
		int endPage = startPage +(pageSize-1);	//요청한 페이지에 따라 한리스트에 보이는 마지막 페이지
		
		int totalCnt = m_dao.getMemberTradeCnt(memberId);
		int realEndPage = (totalCnt-1)/pageSize +1;	// 절대적인 전체의 마지막 페이지 4/10 +1
		
		endPage = endPage >realEndPage ? realEndPage :endPage; //만약 한줄의 페이지 리스트(1~10)만큼의 게시글도 없을때 endPage를 realPage랑 같게해라
		
		
		//회원이 작성한 게시물의 사진을 미리보기로 보여주기위해 해당 게시물의 번호와 그안의 파일을 담아준다. 해당 글을 작성한 photoBoardNum을 가져와야한다.
		
		
		// 이제 위의 벨류를 키 값에 담아서 보내자.
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("nowPage", page);
		req.setAttribute("realEndPage", realEndPage);
		req.setAttribute("boardList", m_dao.getTradeList(startRow, endRow, memberId));
		
		//아래 것은 그사진을 등록할 때 리스트들 하나만 가져오는 거잖아? 이러면 안되고 모든 등록된 포토보드넘을 가져와서 담은다음에 그것의 [0]만 담는 식으로 다시 담아줘야돼
		//그러려면 위의 boardList의 photoBoardNum들을 다가져와서 아래 getReviewFile에 담아줘야한다.
		
		
	
		
		
		
		//setAttribute로 값을 전달하니까 forward로
		forward.setRedirect(false);
		forward.setPath("/app/member/memberPage.jsp");
		
		return forward;
	}
	
}
