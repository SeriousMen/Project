package com.dg.service;

import org.springframework.stereotype.Service;

import com.dg.domain.Criteria;
import com.dg.domain.ReplyPageDTO;
import com.dg.domain.ReplyVO;
import com.dg.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReplyServiceImple implements ReplyService {

	

	private ReplyMapper mapper;
	@Override
	public int insertReply(ReplyVO reply) {
		
		return mapper.insertReply(reply);
	}

	@Override
	public int modifyReply(ReplyVO reply) {
		
		return mapper.modifyReply(reply);
	}

	@Override
	public int deleteReply(Long rno) {
		
		return mapper.deleteReply(rno);
	}

	@Override
	public ReplyVO getReply(Long rno) {
		
		return mapper.getReply(rno);
	}

	@Override
	public int totalReplyCnt(Long bno) {
		
		return mapper.totalReplyCnt(bno);
	}

	@Override
	public ReplyPageDTO getListWithPaging(Long bno, Criteria cri) {
	//이렇게 mapper에서 필요한 값을 뽑아서 리턴해서 넘겨준다.
		return new ReplyPageDTO(mapper.totalReplyCnt(bno),mapper.getListWithPaging(bno, cri));
	}

}
