package com.team4.app.visit.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.team4.mybatis.config.SqlMapConfig;

public class VisitDAO {

	SqlSessionFactory session_f = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public VisitDAO() {
		session = session_f.openSession(true);
	}
	
	public boolean insertTDate() {
		
		return session.insert("Member.insertTDate") ==1;
	}
	
	public int getTDate() {
		return session.selectOne("Member.getTDate");
	}
}
