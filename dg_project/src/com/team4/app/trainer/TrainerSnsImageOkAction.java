package com.team4.app.trainer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.dao.FilesDAO;
import com.team4.app.trainer.dao.TrainerDAO;

public class TrainerSnsImageOkAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		TrainerDAO t_dao=new TrainerDAO();
		String id=req.getParameter("TrainerId");
		FilesDAO f_dao= new FilesDAO();
		 ActionForward forward = null;
		 
		 int fileSize = 5 * 1024 * 1024;
		 
		 MultipartRequest multi = null;
		/* String saveFolder = "C:\\0900_gb_ijh\\jsp\\workspace\\dg_project\\WebContent\\files";
		 
	      multi = new MultipartRequest(req, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());*/
		 
	      String saveFoleder = "/files";
	      ServletContext context = req.getSession().getServletContext();
	      String realPath = context.getRealPath(saveFoleder);
	      multi = new MultipartRequest(req, realPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
	      
	      
	      
	      
	      t_dao.getSnsNum();
	      f_dao.insertSnsFiles(t_dao.getSnsNum(),id,multi);
		 
		 
			forward= new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/trainer/sns.tr?TrainerId="+id);

			return forward;
}
}
