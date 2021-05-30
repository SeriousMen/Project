package com.team4.action;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.team4.app.visit.dao.VisitDAO;

public class VisitSessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
		//기존의 세션이 있다면 실행하지 말고 기존의 세션이 없다면  아래 메소드를 실행해라 서버에 30분?동안(기본 세션기간) 요청이 없고 또 실행하면 다시 아래 메소드가 실행되는 것 
		if(sessionEve.getSession().isNew()) {
			execute(sessionEve);
		}
		
	}
	
	private void execute(HttpSessionEvent sessionEve) {
		VisitDAO v_dao = new VisitDAO();
		
		//당일날짜로 방문자수 증가
		v_dao.insertTDate();
		//총 방문자 수(X)
//		int totalVisit = v_dao.getTDate();
		
		//오늘 방문 자 수 
		int todayVisit = v_dao.getTDate();
		
		HttpSession session = sessionEve.getSession();
		
		//해당 세션에 방문자 수를 담는다.
//		session.setAttribute("totalVisit", totalVisit);
		session.setAttribute("todayVisit", todayVisit);
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {;}
}
