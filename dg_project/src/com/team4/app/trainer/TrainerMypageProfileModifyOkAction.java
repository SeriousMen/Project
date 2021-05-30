package com.team4.app.trainer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.dao.FilesDAO;
import com.team4.app.qna.vo.ProFileVO;
import com.team4.app.trainer.dao.TrainerDAO;
import com.team4.app.trainer.vo.TrainerVO;

public class TrainerMypageProfileModifyOkAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		TrainerDAO t_dao=new TrainerDAO();
		FilesDAO f_dao= new FilesDAO();
		TrainerVO t_vo =new TrainerVO();

		String id=req.getParameter("TrainerId");
		
		ActionForward forward = null;
		 
		 int fileSize = 5 * 1024 * 1024;
		 
		 MultipartRequest multi = null;
		 
		/* String saveFolder = "C:\\0900_gb_ijh\\jsp\\workspace\\dg_project\\WebContent\\files";
		 
	      multi = new MultipartRequest(req, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());*/
		 
		  String saveFoleder = "/files";
	      ServletContext context = req.getSession().getServletContext();
	      String realPath = context.getRealPath(saveFoleder);
	      multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
	      
	      
		 
	      String profilename=multi.getFilesystemName("profileInput");
	      
	      t_vo.setTrainerProfileImage(profilename);
	      t_vo.setTrainerId(id);
	      t_dao.UpdateProfile(t_vo);
	      
	    
	      
	      f_dao.insertProFiles(t_dao.getProNum(),id,multi);
		 
		 
			forward= new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/trainer/Mypagepro.tr?TrainerId="+id+"&profilename="+profilename);

			return forward;
}
}
