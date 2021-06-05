package com.team4.app.review;


//import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.review.dao.ReviewDAO;
import com.team4.app.review.vo.ReviewVO;
import com.team4.app.trade.vo.TradeVO;

public class ReviewWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ReviewVO r_vo = new ReviewVO();
		ReviewDAO r_dao = new ReviewDAO();
		FileNameDAO f_dao = new FileNameDAO();
		TradeVO t_vo = new TradeVO();
		ActionForward forward = null;
		//트레이드테이블불러와서
		
		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);
		
		//5MB
		int fileSize = 5 * 1024 * 1024;
		
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		//Enumeration<String> names = multi.getFileNames();
		//while(names.hasMoreElements()) {
			//String data = names.nextElement();
			//String systemName = multi.getFilesystemName(data);
			//System.out.println(systemName);
		//}
		
		String memberId = multi.getParameter("memberId");
		
		r_vo.setMemberId(memberId);
		r_vo.setTrainerId(multi.getParameter("trainerId"));
		r_vo.setReviewContent(multi.getParameter("reviewContent"));
		//해당하는 tradeNum을 get으로 가져와서 업데이트하는 쿼리문에 대입해서 checkReview를 0에서 1로 바꿔준다.
		//여기에 트레이드 테이블 해당 tradeNum을 가진 곳의 checkReview를 1로 바꾸어준다. r_vo.set리뷰여부
		
		int tradeNum  = Integer.parseInt(multi.getParameter("tradeNum"));
		t_vo.setTradeNum(tradeNum);
		t_vo.setCheckReview(1);
		
		if(r_dao.checkReview(t_vo)) {
			System.out.println("checkReview 1로 업데이트 완료 ");
		}
			
		
		
		if(r_dao.reviewWrite(r_vo)) {
			//6번 카테고리의 r_dao.getReviewNum()번 글의 첨부파일
			if(f_dao.insertFiles(6, r_dao.getReviewNum(), memberId, multi)) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(req.getContextPath() + "/review/ReviewList.rv?trainerId="+multi.getParameter("trainerId"));
			}
		}
				
		return forward;
	}
}
