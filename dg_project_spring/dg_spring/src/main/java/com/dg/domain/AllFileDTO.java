package com.dg.domain;

import java.util.List;

import lombok.Data;

@Data
public class AllFileDTO {

	List<BoardAttachVO> succeedList; //전송 성공한 파일들의 정보
	List<BoardAttachVO> failureList; //전송 실패한 파일들의 정보 
}
