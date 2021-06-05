package com.team4.app.admin.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.team4.mybatis.config.SqlMapConfig;

public class AdminDAO {
	SqlSessionFactory session_f = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public AdminDAO() {
		session = session_f.openSession(true);
	}
	
	//관리자 계정 로그인
	public boolean adminLogin(String adminId, String adminPw) {
		HashMap<String, String> map = new HashMap<>();
		map.put("adminId", adminId);
		map.put("adminPw", adminPw);
		return (Integer)session.selectOne("Admin.adminLogin", map) == 1;
	}
	
	//회원 차단
	public void kickMember(String memberId) {
		session.delete("Admin.kickMember", memberId);
	}
	
	//트레이너 차단
	public void kickTrainer(String trainerId) {
		session.delete("Admin.kickTrainer", trainerId);
	}
}
