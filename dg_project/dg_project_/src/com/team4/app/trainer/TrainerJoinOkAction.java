package com.team4.app.trainer;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.fileName.dao.FileNameDAO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerJoinOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//		req.setCharacterEncoding("UTF-8");
		ActionForward forward = null;

		TrainerDAO t_dao = new TrainerDAO();
		TrainerVO t_vo = new TrainerVO();
		FileNameDAO f_dao = new FileNameDAO();
		

		
		String saveFoleder = "/files";
		ServletContext context = req.getSession().getServletContext();
		String realPath = context.getRealPath(saveFoleder);
		
		int fileSize = 5 * 1025 * 1024; // 파일용량 제한
		
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		t_vo.setTrainerId(multi.getParameter("trainerId"));
		t_vo.setTrainerPw(multi.getParameter("trainerPw"));
		t_vo.setTrainerName(multi.getParameter("trainerName"));
		t_vo.setTrainerPhoneNum(multi.getParameter("trainerPhoneNum"));
		t_vo.setTrainerGender(multi.getParameter("trainerGender"));
		t_vo.setTrainerEmail(multi.getParameter("trainerEmail"));
		t_vo.setTrainerAccount(multi.getParameter("trainerAccount"));
		t_vo.setTrainerAddressZipCode(multi.getParameter("trainerAddressZipCode"));
		t_vo.setTrainerAddress(multi.getParameter("trainerAddress"));
		t_vo.setTrainerAddressDetail(multi.getParameter("trainerAddressDetail"));
		t_vo.setTrainerUrl(multi.getParameter("trainerUrl"));

		
	
		// DAO 사용

		// insert 성공시
		if (t_dao.join(t_vo)) {

			if (f_dao.insertFiles(1, t_dao.getTrainerNum(),t_vo.getTrainerId(), multi)) {

				
				forward = new ActionForward(); // 위에서 변수(타입)만 선언한 것에 공간(주소)를 담아준다.

				forward.setRedirect(false); 
				forward.setPath("/member/MemberLogin.me");
			}

		} else {// insert 실패시
			
			PrintWriter out = resp.getWriter();
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>alert('현재 서버문제로 가입이 실패하였습니다. 잠시 후에 다시 시도해주세요.')</script>");
			out.close();

		}
		return forward;
	}
}
