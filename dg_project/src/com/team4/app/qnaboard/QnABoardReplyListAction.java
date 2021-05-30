package com.team4.app.qnaboard;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.qna.dao.QnaDAO;
import com.team4.app.qna.vo.QreplyVO;

public class QnABoardReplyListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int qnaNum = Integer.parseInt(req.getParameter("boardNum"));
		
		PrintWriter out = resp.getWriter();
		
		QnaDAO r_dao = new QnaDAO();
		
		JSONArray arReply = new JSONArray();
		
		List<QreplyVO> replys = r_dao.getReplyList(qnaNum);
		
		for(QreplyVO r_vo : replys) {
			JSONObject reply = new JSONObject();
			reply.put("replyNum", r_vo.getQreplyNum());
			reply.put("memberId", r_vo.getMemberId());
			reply.put("replyContent", r_vo.getQreplyContent());
			arReply.add(reply);
		}
		out.println(arReply.toJSONString());
		out.close();
		
		
		return null;
	}

}
