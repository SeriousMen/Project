package com.team4.app.qna.dao;

import java.util.Enumeration;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.oreilly.servlet.MultipartRequest;
import com.team4.app.qna.vo.FilesVO;
import com.team4.app.qna.vo.SnsFileVO;
import com.team4.mybatis.config.SqlMapConfig;

public class FilesDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public FilesDAO() {
		session = sessionf.openSession(true);
	}
	
	public boolean insertFiles(int boardNum, MultipartRequest multi) {
		boolean check = true;
		FilesVO vo = new FilesVO();
		//사용자가 업로드한 원본 파일명
		Enumeration<String> files = multi.getFileNames();
		
		while(files.hasMoreElements()) {
			String data = files.nextElement();
			//사용자가 업로드한 파일명을 통해서 중복이 없도록 변경된 시스템 파일명을 가져온다.
			String systemName = multi.getFilesystemName(data);
			String userId =multi.getParameter("demo-id");
			
			if(systemName == null) {continue;}
			vo.setUserId(userId);
			vo.setFileName(systemName);
			vo.setBoardNum(boardNum);
			
			if(session.insert("Files.insertFile", vo) != 1) {
				check = false;
				break;
			}
		}
		return check;
	}
	public boolean insertSnsFiles(int boardNum,String trainerId, MultipartRequest multi) {
		boolean check = true;
		SnsFileVO s_vo= new SnsFileVO();
		//사용자가 업로드한 원본 파일명
		Enumeration<String> files = multi.getFileNames();
		
		while(files.hasMoreElements()) {
			String data = files.nextElement();
			//사용자가 업로드한 파일명을 통해서 중복이 없도록 변경된 시스템 파일명을 가져온다.
			String systemName = multi.getFilesystemName(data);
			if(systemName == null) {continue;}
			
			s_vo.setBoardNum(boardNum);
			s_vo.setFileName(systemName);
			s_vo.setTrainerId(trainerId);
		
			
			if(session.insert("Files.insertSnsFile", s_vo) != 1) {
				check = false;
				break;
			}
		}
		return check;
	}
	public boolean insertProFiles(int boardNum,String trainerId, MultipartRequest multi) {
		boolean check = true;
		SnsFileVO s_vo= new SnsFileVO();
		//사용자가 업로드한 원본 파일명
		Enumeration<String> files = multi.getFileNames();
		
		while(files.hasMoreElements()) {
			String data = files.nextElement();
			//사용자가 업로드한 파일명을 통해서 중복이 없도록 변경된 시스템 파일명을 가져온다.
			String systemName = multi.getFilesystemName(data);
			if(systemName == null) {continue;}
			
			s_vo.setBoardNum(boardNum);
			s_vo.setFileName(systemName);
			s_vo.setTrainerId(trainerId);
		
			
			if(session.insert("Files.insertProFile", s_vo) != 1) {
				check = false;
				break;
			}
		}
		return check;
	}
	
	public List<FilesVO> getFileList(int boardNum) {
		return session.selectList("Files.getFileList", boardNum);
	}
	
	public void deleteFile(int boardNum) {
		session.delete("Files.deleteFile", boardNum);
	}
	
	public void deleteSnsFile(String filename) {
		session.delete("Files.deleteSnsFile", filename);
	}
	
//	//트레이너 아이디로 프로필 사진 파일 이름 가져오기
//	public String idForProfile(String trainerId) {
//		return session.selectOne("Files.idForProfile", trainerId);
//	}
}













