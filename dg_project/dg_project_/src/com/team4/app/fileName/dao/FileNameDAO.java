package com.team4.app.fileName.dao;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.oreilly.servlet.MultipartRequest;
import com.team4.app.fileName.vo.FileNameVO;
import com.team4.mybatis.config.SqlMapConfig;

public class FileNameDAO {
	SqlSessionFactory session_f = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public FileNameDAO() {
		session = session_f.openSession(true);
	}
	
	//리뷰 첨부파일 등록하기
	public boolean insertFiles(int categoryNum, int boardNum, String userId, MultipartRequest multi) {
		boolean check = true;
		FileNameVO f_vo = new FileNameVO();
		Enumeration<String> files = multi.getFileNames();
		
		while(files.hasMoreElements()) {
			String data = files.nextElement();
			String systemName = multi.getFilesystemName(data);
			if(systemName == null) {
				continue;
			}
			
			f_vo.setCategoryNum(categoryNum);
			f_vo.setBoardNum(boardNum);
			f_vo.setUserId(userId);
			f_vo.setFileName(systemName);
			
			if(session.insert("Files.reviewInsert", f_vo) != 1) {
				check = false;
				break;
			}
		}
		return check;
	}
	
	//리뷰 첨부파일 가져오기
	public List<FileNameVO> getReviewFile(int categoryNum, int reviewNum){
		HashMap<String, Integer> map = new HashMap<>();
		map.put("categoryNum", categoryNum);
		map.put("reviewNum", reviewNum);
		
		return session.selectList("Files.getReviewFile", map);
	}
	
	//리뷰 첨부파일 삭제하기
	public void deleteReviewFile(int categoryNum, int reviewNum) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("categoryNum", categoryNum);
		map.put("reviewNum", reviewNum);
		
		session.delete("Files.deleteReviewFile", map);
	}
	
	//신고 첨부파일 등록하기
		public boolean reportinsertFiles(int categoryNum, int boardNum, String userId, MultipartRequest multi) {
			boolean check = true;
			FileNameVO f_vo = new FileNameVO();
			Enumeration<String> files = multi.getFileNames();
			
			while(files.hasMoreElements()) {
				String data = files.nextElement();
				String systemName = multi.getFilesystemName(data);
				if(systemName == null) {
					continue;
				}
				
				f_vo.setCategoryNum(categoryNum);
				f_vo.setBoardNum(boardNum);
				f_vo.setUserId(userId);
				f_vo.setFileName(systemName);
				
				if(session.insert("Files.reportInsert", f_vo) != 1) {
					check = false;
					break;
				}
			}
			return check;
		}
	
		//리뷰 첨부파일 가져오기
		public List<FileNameVO> getReportFile(int categoryNum, int reportNum){
			HashMap<String, Integer> map = new HashMap<>();
			map.put("categoryNum", categoryNum);
			map.put("reportNum", reportNum);
			
			return session.selectList("Files.getReportFile", map);
		}
		
		//리뷰 첨부파일 삭제하기
		public void deleteReportFile(int categoryNum, int reportNum) {
			HashMap<String, Integer> map = new HashMap<>();
			map.put("categoryNum", categoryNum);
			map.put("reportNum", reportNum);
			
			session.delete("Files.deleteReportFile", map);
		}
	
	
	
	
	
	//탈퇴시 유저관련 파일 삭제 
	public boolean deleteUserFile(String userId) {
		boolean check = false;
		
		if(((Integer)session.delete("Files.deleteUserFile",userId)) != 0){
			
			check = true;
		}
		return check;
	}
	
	//사진게시판 모든 사진이름 가져오기
	public String getFileName(int categoryNum, int boardNum) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("categoryNum", categoryNum);
		map.put("reviewNum", boardNum);
		
		return session.selectOne("Files.getFileName", map);
	}
	

}
