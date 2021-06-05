package com.team4.app.qna.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.team4.mybatis.config.SqlMapConfig;

public class QreplyDAO {
	SqlSessionFactory session_f = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public QreplyDAO() {
		session = session_f.openSession(true);
	}
}
