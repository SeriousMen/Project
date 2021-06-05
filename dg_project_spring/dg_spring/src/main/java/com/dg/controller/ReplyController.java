package com.dg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dg.domain.Criteria;
import com.dg.domain.ReplyPageDTO;
import com.dg.domain.ReplyVO;
import com.dg.service.ReplyService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j

@RequestMapping("/reply/")
public class ReplyController {

	@Setter(onMethod_=@Autowired)
	private ReplyService service;
	
	@PostMapping(value="/add", consumes="application/json", produces="text/plain; charset= utf-8")
	public ResponseEntity<String> insertReply( @RequestBody ReplyVO reply){
		
//		int insertCnt =0;
//		log.info("ReplyVO :" + reply);
//		insertCnt = service.insertReply(reply);
//		log.info("Reply Insert Count :" +insertCnt);
		
		return service.insertReply(reply) ==1? new ResponseEntity<>("댓글등록 성공",HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); //500 servce error 실패시
	}
	
//헤더에 묶어서 보내는게 아니면 consumes를 명시할 필요가 없다. 
	@GetMapping(value="/pages/{bNum}/{bno}/{page}",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("bNum") Long bNum,@PathVariable("bno") Long bno, @PathVariable("page") int page){
		
		Criteria cri = new Criteria(page,10);
		return new ResponseEntity<ReplyPageDTO>(service.getListWithPaging(bno, cri),HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{rno}", produces="text/plain; charset= utf-8")
	public ResponseEntity<String> deleteReply(@PathVariable("rno") Long rno){
		
		return service.deleteReply(rno) ==1? new ResponseEntity<String>("삭제완료", HttpStatus.OK):
			new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH},value="/modify", consumes="application/json",produces="text/plain; charset= utf-8")
	public ResponseEntity<String> modifyReply(@RequestBody ReplyVO reply){
		
	
		log.info("modifycontroller.."+reply);
		
		return service.modifyReply(reply) == 1? new ResponseEntity<String>("수정완료",HttpStatus.OK):
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
