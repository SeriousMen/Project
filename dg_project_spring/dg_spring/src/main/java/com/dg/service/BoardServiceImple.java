package com.dg.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dg.domain.BoardAttachVO;
import com.dg.domain.BoardVO;
import com.dg.domain.Criteria;
import com.dg.mapper.BoardAttachMapper;
import com.dg.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j //콘솔창의 출력을 정리하기 위해서
@AllArgsConstructor //모든 필드를 이용하는 생성자 작성, 이게 있기 때문에 BoardMapper를 new ();이런 식으로 하지않아도 주입받을 수 있다(DI)
public class BoardServiceImple implements BoardService {
//컨트롤러에서 요청하면 로직처리를 해 데이터처리한 값을 리턴해준다.
	
	private BoardMapper mapper;
	private BoardAttachMapper a_mapper;
	
	
	@Transactional
	@Override
	public void insertBoard(BoardVO board) {
		log.info("insertBoard: " +board);
		mapper.insertSelectKey_bno(board);
		//게시글을 등록하고 해당 게시글의 게시글 번호를 
		//글 등록할 때 담은 attachList를 가져온다음 하나하나에 담아서 연결해주고 DB로 첨부파일을 등록해준다.
		List<BoardAttachVO> attachList = board.getAttachList();
		
		// 조건식에서 ||연산자(or연산자)는 앞에 것이 참이면 뒤에 거를 검사 안한다. 뒤에 것도 검사하는 것은 AND니까 당연 
		if(attachList == null || attachList.size() ==0) {
			return ;
		}
		attachList.forEach(attach ->{
			attach.setBno(board.getBno());
			a_mapper.insert(attach);
		});
		
	}

	@Transactional
	@Override
	public boolean modifyBoard(BoardVO board) {
		log.info("modifyBoard: " +board);
		
		//수정에서는 기존에 등록했던 첨부파일을 싹 다 삭제하고 다시 등록하게 설계
		//1.먼저 기존의 첨부파일 다지우고
		a_mapper.deleteAll(board.getBno());
		
		//2.게시글 수정을 하고
		boolean modifyResult = mapper.modifyBoard(board)==1;
		
		//3.만일 해당 게시글이 수정되고 첨부파일이 null이 아니라면 그리고 또 첨부파일이 있다면 해당 첨부파일의 bno와 boardNum을 채워준다음 insert해주자.
		if(modifyResult && board.getAttachList() != null) {
			if(board.getAttachList().size() !=0) {
				board.getAttachList().forEach(attach ->{
					attach.setBno(board.getBno());
					attach.setBoardNum(board.getBoardNum());
					a_mapper.insert(attach);
				});
			}
		}
	
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean deleteBoard(BoardVO board) {
		log.info("deleteBoard: " +board);
		a_mapper.deleteAll(board.getBno());
		return mapper.deleteBoard(board)==1;
	}

	@Override
	public BoardVO readBoard(BoardVO board) {
		log.info("readBoard: " +board);
		return mapper.readBoard(board);
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri, Long boardNum) {
		log.info("BoardServiceImple:"+cri +boardNum);
		return mapper.getListWithPaging(cri, boardNum);
	}

	@Override//모든 게시물 가져오는 것 딱히 쓸일 없을 듯 ?
	public List<BoardVO> getList(Long boardNum) {

		return mapper.getList(boardNum);
	}

	@Override
	public int getTotal(Criteria cri, Long boardNum) {
		
		return mapper.getTotal(cri, boardNum);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
	
		
		log.info("getAttachList:" + bno);
		return a_mapper.findByBno(bno);
	}

}
