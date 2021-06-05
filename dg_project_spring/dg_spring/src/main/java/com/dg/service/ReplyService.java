package com.dg.service;

import org.apache.ibatis.annotations.Param;

import com.dg.domain.Criteria;
import com.dg.domain.ReplyPageDTO;
import com.dg.domain.ReplyVO;

public interface ReplyService {
	public int insertReply(ReplyVO reply);
	
	public int modifyReply(ReplyVO reply);
	
	public int deleteReply(Long rno);
	
	//해당 댓글 조회
	public ReplyVO getReply(Long rno);
	
	public int totalReplyCnt(Long bno);
	
	public ReplyPageDTO getListWithPaging( @Param("bno")Long bno, @Param("cri") Criteria cri);
}
