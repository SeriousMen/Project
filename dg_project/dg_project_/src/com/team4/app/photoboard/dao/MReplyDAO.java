package com.team4.app.photoboard.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.team4.mybatis.config.SqlMapConfig;

public class MReplyDAO {

	SqlSessionFactory session_f = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	

public MReplyDAO() {
	session = session_f.openSession(true);
}
}
