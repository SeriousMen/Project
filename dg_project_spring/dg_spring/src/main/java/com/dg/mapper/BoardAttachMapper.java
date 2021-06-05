package com.dg.mapper;

import java.util.List;

import com.dg.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO VO);
	
	public void delete(String uuid);
	
	public void deleteAll(Long bno);
	
	public List<BoardAttachVO> findByBno(Long bno);
}
