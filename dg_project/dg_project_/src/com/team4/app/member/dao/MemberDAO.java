package com.team4.app.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.team4.app.member.vo.MemberVO;
import com.team4.app.trade.vo.TradeVO;
import com.team4.mybatis.config.SqlMapConfig;

public class MemberDAO {
	private static final int KEY = 3;
	
	SqlSessionFactory session_f=SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	
	
	
	public MemberDAO() {
		session = session_f.openSession(true);
	}
	
	//회원가입
	public boolean join(MemberVO member) {
		member.setMemberPw(encrypt(member.getMemberPw()));
		return session.insert("Member.join",member)==1;
		
	}
	//아이디검사
	public boolean checkId(String memberId) {
		return (Integer)session.selectOne("Member.checkId", memberId) == 1;
	}
	 public boolean checkId2(String memberId) {
	      return (Integer)session.selectOne("Member.checkId2", memberId) == 1;
	   }

	
	//암호화
	public String encrypt(String pw) {
			String en_pw = "";
			for (int i = 0; i < pw.length(); i++) {
				en_pw += (char)(pw.charAt(i) * KEY);
			}
			return en_pw;
		}
		
	//복호화
	public String decrypt(String en_pw) {
			String de_pw = "";
			for (int i = 0; i < en_pw.length(); i++) {
				de_pw += (char)(en_pw.charAt(i) / KEY);
			}
			return de_pw;
		}
		//핸드폰 인증
	public String sms(String mypagePhone) {
	
			String num = (new Random().nextInt(9000)+1000)+"";//1000~9999
			
//			String api_key = "NCSJ2DN9KV5RBFBT";
//		    String api_secret = "UPWRB6JLN62M6FX1E9ZO7R1BVX4DKZNO";
//		    Message coolsms = new Message(api_key, api_secret);
	//
//		    // 4 params(to, from, type, text) are mandatory. must be filled
//		    HashMap<String, String> params = new HashMap<String, String>();
//		    params.put("to", "01046420130");
//		    params.put("from", mypagePhone);
//		    params.put("type", "SMS");
//		    params.put("text", num);
//		    params.put("app_version", "test app 1.2"); // application name and version
	//
//		    try {
//		      JSONObject obj = (JSONObject) coolsms.send(params);
//		      System.out.println(obj.toString());
//		    } catch (CoolsmsException e) {
//		      System.out.println(e.getMessage());
//		      System.out.println(e.getCode());
//		    }
			
		    return num;
		}
		
		/**
		 * 
		 * @param mypageId
		 * @param mypagePw
		 * @return
		 * 
		 * true면 로그인 성공<br>false면 로그인 실패
		 * 
		 */	
	//로그인
	public boolean login(String id,String pw) {
		HashMap<String, String> member=new HashMap<>();
		member.put("id", id);
		member.put("pw", encrypt(pw));
		return (Integer)session.selectOne("Member.login",member)==1;
		
	}
	//아이디찾기
	public List<String> findId(String PhoneNum){
		return session.selectList("Member.findId",PhoneNum);
		
	}
	//비밀번호 찾기
	public List<String> findPw(String id,String PhoneNum){
		HashMap<String, String> member=new HashMap<>();
		member.put("id", id);
		member.put("PhoneNum", PhoneNum);
		return session.selectList("Member.findPw",member);
	}
	//비밀번호 변경
	public void changePw(String id,String pw) {
		HashMap<String, String> member=new HashMap<>();
		member.put("id", id);
		member.put("pw", encrypt(pw));
		 session.update("Member.changePw",member);
		
	}
	
	
	//회원탈퇴 
	public boolean withdrawal(String id,String pw) {
		HashMap<String,String> member = new HashMap<>();
		member.put("id", id);
		member.put("pw", encrypt(pw));
		return(Integer)session.delete("Member.withdrawal",member)==1;
	}
	
	//회원 id로 행 가져오기
	public MemberVO getMemberDetail(String memberId) {
		return session.selectOne("Member.getMemberDetail", memberId);
	}
	
	//총 회원수 구하기
	public int totalMember() {
		return session.selectOne("Member.totalMember");
	}
	
	//회원 기존핸드폰 번호 가져오기
	public String selectMemberPhone(String memberId) {
		return session.selectOne("Member.selectMemberPhone", memberId);
	}
	
	//휴대폰 번호 변경
	public boolean changeMemberPhone(MemberVO m_vo) {
		
		return session.update("Member.changeMemberPhone",m_vo)==1;
	}
	
	
	//멤버거래내역 가져오기
	public TradeVO selectTrade(int tradeNum) {
		
		return session.selectOne("Member.selectTrade",tradeNum);
	}
		
	//결제 내역 수 
	public int getTradeCnt() {
		
		return session.selectOne("Member.getTradeCnt");
	}
	
	//해당 멤버의 결제 내역수 
	public int getMemberTradeCnt(String userId) {
		
		return session.selectOne("Member.getMemberTradeCnt",userId);
	}
	
	//오늘 결제 수
	public int getTradeToday() {
		
		return session.selectOne("Member.getTradeToday");
	}
	
	//해당 페이지에서의 게시물 (해당맴버의)
	public List<TradeVO>getTradeList(int startRow, int endRow, String memberId) {
		HashMap<String, Object> pageMap = new HashMap<>();
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		pageMap.put("memberId", memberId);

		return session.selectList("Member.getTradeList", pageMap);
		
	}
		
}
