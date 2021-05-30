package com.team4.app.qnaboard;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.member.dao.MemberDAO;
import com.team4.app.member.vo.MemberVO;
import com.team4.app.qna.dao.QnaDAO;
import com.team4.app.qna.vo.QnaVO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class QnABoardWriteOkAction implements com.team4.action.Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		 QnaVO q_vo = new QnaVO();
		 QnaDAO q_dao = new QnaDAO();
		 
		
		 
		 FileNameDAO f_dao= new FileNameDAO();
		 ActionForward forward = null;
		 
		 	MemberDAO m_dao=new MemberDAO();
			TrainerDAO t_dao=new TrainerDAO();
			
			int fileSize = 5 * 1024 * 1024; //5M
			
			
			
			MultipartRequest multi = null;
		 
			String saveFoleder = "/files";
		      ServletContext context = req.getSession().getServletContext();
		      String realPath = context.getRealPath(saveFoleder);
		      multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		      
		      String memberId = multi.getParameter("memberId");
		      String trainerId = multi.getParameter("trainerId");
		   
		
			if(memberId != null) {
			if(m_dao.checkId(memberId)){
				q_vo.setMemberId(memberId);
			}}
			
			if(trainerId !=null) {
			if(t_dao.checkId(trainerId)){
				q_vo.setMemberId(trainerId);
			}}
			
			
			/*req.setAttribute("userId",q_vo.getMemberId());
			req.setAttribute("m_vo",m_vo);
			req.setAttribute("t_vo",t_vo);*/
			
		
		q_vo.setQnaTitle(multi.getParameter("demo-title"));	
		q_vo.setQnaContent(multi.getParameter("demo-textarea"));
		
		
	
		
		/*if(check) {
			if(f_dao.insertFiles(q_dao.getBoardNum(), multi))
			System.out.println("다오들어옴3");
				forward= new ActionForward();
				forward.setRedirect(true);
				forward.setPath(req.getContextPath()+"/qnaboard/BoardList.qn?sessionId="+sessionId);
		}*/
		
		if( q_dao.insertQnaBoard(q_vo)) {
			
			if(memberId != null) {
			if(m_dao.checkId(memberId)) {
				if(f_dao.insertFiles(3, q_dao.getBoardNum(), memberId, multi)){
					
							forward= new ActionForward();
							forward.setRedirect(true);
							forward.setPath(req.getContextPath()+"/qnaboard/BoardList.qn");
				}
			}}
			if(trainerId !=null) {
			if(t_dao.checkId(trainerId)) {
				if(f_dao.insertFiles(3, q_dao.getBoardNum(), trainerId, multi)){
						
							forward= new ActionForward();
							forward.setRedirect(true);
							forward.setPath(req.getContextPath()+"/qnaboard/BoardList.qn");
				}
			}
			
		}}
		return forward;
	}
}
