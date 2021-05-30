package com.team4.app.trainer.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.team4.app.qna.vo.ProFileVO;
import com.team4.app.qna.vo.QnaVO;
import com.team4.app.qna.vo.SnsFileVO;
import com.team4.app.trade.vo.TradeVO;
import com.team4.app.review.vo.PageDTO;
import com.team4.app.trainer.vo.TrainerVO;
import com.team4.mybatis.config.SqlMapConfig;

public class TrainerDAO {
   private static final int KEY = 3;

   SqlSessionFactory session_f = SqlMapConfig.getSqlMapInstance();
   SqlSession session;

   public TrainerDAO() {
      session = session_f.openSession(true);
   }

   // 트레이너 회원가입
   public boolean join(TrainerVO trainer) {
      trainer.setTrainerPw(encrypt(trainer.getTrainerPw()));
      return session.insert("Trainer.join", trainer) == 1;
   }

   // 암호화
   public String encrypt(String pw) {
      String en_pw = "";
      for (int i = 0; i < pw.length(); i++) {
         en_pw += (char) (pw.charAt(i) * KEY);
      }
      return en_pw;
   }

   // 복호화
   public String decrypt(String en_pw) {
      String de_pw = "";
      for (int i = 0; i < en_pw.length(); i++) {
         de_pw += (char) (en_pw.charAt(i) / KEY);
      }
      return de_pw;
   }

   /**
    * 
    * @param id
    * @return
    * 
    *       true: 중복된 아이디 <br>
    *         false: 사용가능한 아이디
    */
   // 아이디검사
   public boolean checkId(String id) {

      return (Integer) session.selectOne("Trainer.checkId", id) == 1;
   }
   public boolean checkId2(String id) {
       return (Integer) session.selectOne("Trainer.checkId2", id) == 1;
    }
   
   public boolean checkPw(String id,String pw) {
	   	HashMap<String, String> trainer = new HashMap<>();
	      trainer.put("id", id);
	      trainer.put("pw",encrypt(pw));
	   
	   return (Integer) session.selectOne("Trainer.checkPw",trainer) == 0;
   }
   public void insertTrade(String id,String content) {
	   HashMap<String, String> trainer = new HashMap<>();
	   trainer.put("id",id);
	   trainer.put("content",content);
	   
	   session.selectOne("Trainer.insertTrade",trainer);
   }

   public boolean login(String id, String pw) {
      HashMap<String, String> trainer = new HashMap<>();
      trainer.put("id", id);
      trainer.put("pw",encrypt(pw));

      return (Integer) session.selectOne("Trainer.login", trainer) == 1;
   }
   //아이디찾기
      public List<String> findId(String PhoneNum){
         return session.selectList("Trainer.findId",PhoneNum);
         
      }
   //비밀번호찾기
      public List<String> findPw(String id,String PhoneNum){
         HashMap<String,String> trainer=new HashMap<>();
         trainer.put("id", id);
         trainer.put("PhoneNum", PhoneNum);
         return session.selectList("Trainer.findPw",trainer);
               
      }
   //
      public void changePw(String id,String pw) {
      HashMap<String, String> member=new HashMap<>();
      member.put("id", id);
      member.put("pw", encrypt(pw));
      session.update("Trainer.changePw",member);
      
   }      
      

   // 현재 시퀀스 가져오기
   public int getTrainerNum() {
      return (Integer)session.selectOne("Trainer.getTrainerNum");
   }


   public String sms(String mypagePhone) {
      System.out.println("trainer's DAO");
      String num = (new Random().nextInt(9000)+1000)+"";//1000~9999
      System.out.println(num);
      
//      String api_key = "NCSJ2DN9KV5RBFBT";
//       String api_secret = "UPWRB6JLN62M6FX1E9ZO7R1BVX4DKZNO";
//       Message coolsms = new Message(api_key, api_secret);
//
//       // 4 params(to, from, type, text) are mandatory. must be filled
//       HashMap<String, String> params = new HashMap<String, String>();
//       params.put("to", "01046420130");
//       params.put("from", mypagePhone);
//       params.put("type", "SMS");
//       params.put("text", num);
//       params.put("app_version", "test app 1.2"); // application name and version
//
//       try {
//         JSONObject obj = (JSONObject) coolsms.send(params);
//         System.out.println(obj.toString());
//       } catch (CoolsmsException e) {
//         System.out.println(e.getMessage());
//         System.out.println(e.getCode());
//       }
      
       return num;
   }
   
   //트레이너 총 인원수
   public int trainerCnt() {
      return session.selectOne("Trainer.trainerCnt");
   }
   
   public TrainerVO getDetail(String TrainerId) {
      return session.selectOne("Trainer.getDetail", TrainerId);
   }
   public TradeVO getTradeDetail(int tradeNum) {
      HashMap<Object,Object> trade=new HashMap<>();
      trade.put("tradeNum",tradeNum);
      return session.selectOne("Trainer.getTradeDetail", tradeNum);
   }
   
   
   public boolean updateAccount(TrainerVO t_vo) {
      return session.update("Trainer.updateAccount",t_vo) == 1;
   }
   public boolean updateContent(TrainerVO t_vo) {
      return session.update("Trainer.updateContent",t_vo) == 1;
   }
   public boolean updateURL(TrainerVO t_vo) {
      return session.update("Trainer.updateURL",t_vo) == 1;
   }
   
   public boolean updatePrice(TrainerVO t_vo) {
      return session.update("Trainer.updatePrice",t_vo) == 1;
   }
   
   
   public boolean MypageDrawal(TrainerVO t_vo) {
      return session.delete("Trainer.myPageDrawal",t_vo)==1;
   }
   public int getSnsNum() {
      return session.selectOne("Trainer.getSnsNum");
   }
   public int getProNum() {
      return session.selectOne("Trainer.getProNum");
   }
   
   public List<SnsFileVO> getimageList(String trainerId) {
      return session.selectList("Trainer.imagelistAll",trainerId );
   }
   public String getProfileImage(String imageName) {
      return session.selectOne("Trainer.getProfile",imageName);
   }
   public String getProfile(String trainerId) {
      return session.selectOne("Trainer.getProfileTrainer",trainerId);
   }
   
   public boolean UpdateProfile(TrainerVO t_vo) {
      return session.update("Trainer.UpdateProfile",t_vo)==1;
   }
   
   public boolean UpdateTrainerPw (String id,String pw,String modifyPw) {
      TrainerDAO t_dao = new TrainerDAO();
      HashMap<String,String> trainerModify=new HashMap<>();
      trainerModify.put("id",id);
      trainerModify.put("modifyPw",t_dao.encrypt(modifyPw));
      trainerModify.put("pw",t_dao.encrypt(pw));
      
      return session.update("Trainer.UpdateTrainerPw",trainerModify)==1;
   }
   
   public boolean UpdateTrainerId (String id,String pw,String modifyId) {
      TrainerDAO t_dao = new TrainerDAO();
      HashMap<String,String> trainerModify=new HashMap<>();
      trainerModify.put("id",id);
      trainerModify.put("modifyId",modifyId);
      trainerModify.put("pw",t_dao.encrypt(pw));
      
      return session.update("Trainer.UpdateTrainerId",trainerModify)==1;
   }
   
   
   public void createTrigger(String id,String pw,String modifyId) {
      String h="'";
      String sql = "CREATE OR REPLACE TRIGGER TRAINERID_TGR\r\n" + 
         "AFTER UPDATE ON DG_TRAINER\r\n" + 
         "FOR EACH ROW\r\n" + 
         "BEGIN\r\n" + 
         "   UPDATE DG_REVIEW SET TRAINERID = "+h+modifyId+h+" WHERE TRAINERID = "+h+id+h+";\r\n" + 
         "   UPDATE FILENAME SET USERID = "+h+modifyId+h+" WHERE USERID = "+h+id+h+";\r\n" + 
         "   UPDATE DG_QNA SET MEMBERID = "+h+modifyId+h+" WHERE MEMBERID = "+h+id+h+";\r\n" + 
         "   UPDATE DG_QREPLY SET MEMBERID = "+h+modifyId+h+" WHERE MEMBERID = "+h+id+h+";\r\n" + 
         "   UPDATE DG_TRADE SET TRAINERID = "+h+modifyId+h+" WHERE TRAINERID = "+h+id+h+";\r\n"+
         "   UPDATE DG_REVIEW SET TRAINERID = "+h+modifyId+h+" WHERE TRAINERID = "+h+id+h+";\r\n" + 
         "   UPDATE SNSFILENAME SET TRAINERID = "+h+modifyId+h+" WHERE TRAINERID = "+h+id+h+";\r\n" + 
         "   UPDATE PROFILENAME SET TRAINERID = "+h+modifyId+h+" WHERE TRAINERID = "+h+id+h+";\r\n" + 
         "   UPDATE DG_REPORT SET REPORTID = "+h+modifyId+h+" WHERE REPORTID = "+h+id+h+";\r\n" + 
         "END;";
      System.out.println(sql);
      HashMap<String, String> map = new HashMap<>();
      map.put("sql", sql);
      System.out.println(session.update("Trainer.createTrigger", map));
   }
   
   public boolean UpdateTrainerName (String id,String pw,String modifyName) {
      TrainerDAO t_dao = new TrainerDAO();
      HashMap<String,String> trainerModify=new HashMap<>();
      trainerModify.put("id",id);
      trainerModify.put("modifyName",modifyName);
      trainerModify.put("pw",t_dao.encrypt(pw));
      
      return session.update("Trainer.UpdateTrainerName",trainerModify)==1;
   }
   
   //TOP3
   public List<TrainerVO> top3(){
      return session.selectList("Trainer.top3");
   }
   
   //트레이너 번호 랜덤 추출
   public List<String> randomTrainerNum(){
      return session.selectList("Trainer.randomTrainerNum");
   }
   
   //번호로 전체 정보 가져오기
   public TrainerVO numForAll(int trainerNum) {
      return session.selectOne("Trainer.numForAll", trainerNum);
   }
   
   //검색
   public List<TrainerVO> searchTrainer(String keyword, PageDTO page){
      Map<Object, Object> searchMap = new HashMap<>();
      searchMap.put("keyword", keyword);
      searchMap.put("page", page);
      return session.selectList("Trainer.searchTrainer", searchMap);
   }
   
   public int resultCnt(String keyword) {
      HashMap<String, String> map = new HashMap<>();
      map.put("keyword", keyword);
      return session.selectOne("Trainer.resultCnt", map);
   }
   
   //첫 검색
   public void insertKeywordCnt(String keyword) {
      session.insert("Trainer.insertKeyword", keyword);
   }
   
   //누적 검색
   public void updateKeywordCnt(String keyword) {
      session.update("Trainer.updateKeywordCnt", keyword);
   }
   
   //키워드 중복검사
   /**
    * 
    * @param keyword
    * @return int
    * 0일때 중복없음
    */
   public int checkKeyword(String keyword) {
      return session.selectOne("Trainer.keywordCnt", keyword);
   }

   //키워드 검색 횟수
   public int getKeywordCnt(String keyword) {
      return session.selectOne("Trainer.getKeywordCnt", keyword);
   }
   
   public int getBoardCnt() {
      return session.selectOne("Trainer.getBoardCnt");
   }
   
   //해당 트레이너의 결제 내역수 
 	public int getTrainerBoardCnt(String id) {
 		
 		return session.selectOne("Trainer.getTrainerBoardCnt",id);
 	}
   public List<TradeVO> getTradeBoardList(int startRow, int endRow,String id) {
      HashMap<Object,Object> pageMap = new HashMap<>();
      
      pageMap.put("startRow", startRow);
      pageMap.put("endRow", endRow);
      pageMap.put("id", id);
      
      
      return session.selectList("Trainer.tradelistAll", pageMap);
   }
   
   public int getpoint(String id) {
		return session.selectOne("Trainer.getpoint",id);
	}
   
   public boolean Tpay(String pw, String id,int pay) {
		HashMap<Object,Object> payMap = new HashMap<>();
		
		payMap.put("pw",encrypt(pw));
		payMap.put("id",id);
		payMap.put("pay",pay);
		
		return session.update("Trainer.TpayOk", payMap)==1;
	}
   
   
   
}