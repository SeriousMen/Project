package com.dg.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor //@Data은 @RequiredArgsConstructor 를 생성해주기 때문에 편하게 all로 선언 
public class ReplyPageDTO {
	private int replyCnt; //댓글 총 갯수
	private List<ReplyVO> list; //해당 댓글 들의 정보 
	
}
