package com.team4.app.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.team4.action.Action;
import com.team4.action.ActionForward;
import com.team4.app.photoboard.dao.PhotoBoardDAO;
import com.team4.app.photoboard.vo.MReplyVO;

public class MemberBoardReplyListOk implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int photoBoardNum = Integer.parseInt(req.getParameter("photoBoardNum"));
	
		PrintWriter out = resp.getWriter();
		PhotoBoardDAO p_dao = new PhotoBoardDAO();
		
		JSONArray arReply = new JSONArray();
		
		List<MReplyVO> replys = p_dao.getReplyList(photoBoardNum);
		
		for(MReplyVO r_vo :replys) {
			JSONObject reply = new JSONObject();
			reply.put("replyNum", r_vo.getmReplyNum());
			reply.put("memberId", r_vo.getMemberId());
			reply.put("replyContent", r_vo.getmReplyContent());
			arReply.add(reply);
		}
		out.println(arReply.toJSONString());
		out.close();
		return null;
	}
}
