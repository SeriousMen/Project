package com.team4.app.qnaboard;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team4.action.Action;
import com.team4.action.ActionForward;

public class QnAFileDownloadAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
			String saveFoleder = "/files";
	      ServletContext context = req.getSession().getServletContext();
	      String savePath = context.getRealPath(saveFoleder);
		
/*		String savePath = "C:\\0900_gb_ijh\\jsp\\workspace\\dg_project\\WebContent\\files";
*/		
		
		String fileName = req.getParameter("fileName");
		
		PrintWriter writer = resp.getWriter();
		
		
		InputStream in = null;
		OutputStream out = null;
		File file = null;
		boolean check = true;
		
		try {
			file = new File(savePath, fileName);
			
			in = new FileInputStream(file);
			
		} catch (FileNotFoundException e) {
			check = false;
			e.printStackTrace();
		}
		String client = req.getHeader("User-Agent");
		
		resp.reset();
		resp.setContentType("application/octet-stream");	//파일 다운로드 타입 설정
		resp.setHeader("Content-Description", "JSP Generated Data");	//컨텐츠 설명 수정
		
		if(check) {
			try {
				//출력할 파일의 인코딩 설정
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
				
				//IE
//			if(client.contains("MSIE")) {
				if(client.indexOf("MSIE") != -1) {
					resp.setHeader("Content-Disposition", "attachment;filename="+fileName);
				}else {
					resp.setHeader("Content-Disposition", "attachment;filename=\""+fileName + "\"");
					resp.setHeader("Content-Type", "application/octet-stream;charset=utf-8");
				}
				resp.setHeader("Content-Length", "" + file.length());
				
				//충돌이 발생할 수 있는 공유 공간을 비워준다.
				writer.flush();
				
				out = resp.getOutputStream();
				
				//읽어온 바이트를 담아줄 배열
				byte[] b = new byte[(int)file.length()];
				
				//바이트 데이터(내용)을 저장할 변수
				int len = 0;
				while((len = in.read(b)) > 0) {
					//전체 내용에서(b) 첫번째 바이트부터(offset:0) 읽어온 내용(len)을 순차적으로 출력한다.
					out.write(b, 0, len);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(in != null) {
						in.close();
					}
					if(out != null) {
						out.close();
					}
				} catch (Exception e) {
					throw new RuntimeException(e.getMessage());
				}
			}
		}
		return null;
	}
	
}
