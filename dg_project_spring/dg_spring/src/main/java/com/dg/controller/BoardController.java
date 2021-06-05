package com.dg.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dg.domain.BoardAttachVO;
import com.dg.domain.BoardVO;
import com.dg.domain.Criteria;
import com.dg.domain.PageDTO;
import com.dg.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller // 컨트롤러느느 @component가 아니라 이걸로 빈을 등록한다.
@Log4j //콘솔창 출력정리를 위해
@AllArgsConstructor // 모든 필드를 받는 명시적 생성자 생성 
//@Autowired대신 생성자 주입을 하겠다는 것은 필드의 생성을 미리하지않고 해당 객체를 생성할 때 생성자로 필드를 생성해서 사용하겠다는 것  
//모든 필드를 받는 생성자를 형성하였기 때문에 @Controller에 등록되있는 해당 컨트롤러는 서버로 부터 요청을 받아서 @RequestMapping("")안으로 들어오면 
//해당 컨트롤러의 Controller(service)가 호출된다. (당연히 빈으로 등록되있으니 new한 것과 같은 기능, 빈은 해당 객체를 보존하고 있다고 생각하면 편함) 
@RequestMapping("/board/*") // QNA게시판을 찾았을 때(요청을 보냈을 때) 들어오게하기위해
public class BoardController {
	private BoardService service; // service를 imple한 다양한 자식객체가 있을 경우 업캐스팅으로 해당페이지에서 다양하게 사용하기위해 부모타입으로 
	
	@GetMapping("/insertBoard")
	public String insertBoard(Criteria cri) {log.info("insertBoard한다.");return "/app/qna/QAWrite2";}
	//게시글 등록하기
	
	@PostMapping("/insertBoard")
	public String insertBoard(BoardVO board, HttpServletRequest req, RedirectAttributes rttr) {
	
	if(board.getAttachList() != null) {
			
			board.getAttachList().forEach(log::info);
		}
		
		log.info("BoardController...insertBoard"+board);
		log.info(board.getBoardNum());
		
		
		service.insertBoard(board);
		log.info(board.getBno());
		//원래 객체는 {앞에서 소문자 객체}해서 가져올 수 있지만 자바스크립트에서 몇번 게시글이 등록됬는지 alert해볼겸 변수하나를 넘겨보자.
		//redirect에서는 addAttribute로 담아봤자 넘어가면서 req객체가 초기화 되기 때문에
//		rttr.addFlashAttribute("result",board.getBno());
		//flash를 이용한다.(한개의 값밖에 못담음, 전달하고 소멸함)
		
			return"redirect:/board/boardList?boardNum="+board.getBoardNum();
	}
	
	//@getMapping해도되는데 그냥 이렇게 해봄 //QA게시글 상세보기
	@RequestMapping(value="/read" )
	public String read(@RequestParam("boardNum") Long boardNum, @RequestParam("bno")Long bno, @ModelAttribute("cri") Criteria cri,Model model) {
		//경로로 변수 받는건 @PathVariable(@ModelAttribute도 가능 view에 뿌려줄 것을 담을 때 쓰면 될 것 같음)		//객체는 모델 객체로 안받고 뷰에서 그냥 criteria로하면된다 근데이렇게 하는 이유는?
		//위의 URL(value의 경로에 받는 변수가 없으면 ) 보낼때 get방식으로보냈어도 @RequestParam으로 받아야한다!! 
		//parameter에 담아서 보내는 거 받을 때는 @RequestParam
		BoardVO board = new BoardVO();
		board.setBoardNum(boardNum);
		board.setBno(bno);
		log.info("BoardController..read:"+board);
		model.addAttribute("board",service.readBoard(board)); //이렇게해야지 리턴 값을 담아서 view에 전달하지
		return "/app/qna/QAView";
	}
	
	@GetMapping("/qa")
	public String qa() {return "app/qna/QA";}
	
	@GetMapping("/boardList")
	public String boardList (@RequestParam("boardNum") Long boardNum,Criteria cri, Model model) {
	
	model.addAttribute("list",service.getListWithPaging(cri, boardNum));
	model.addAttribute("pageMaker",new PageDTO(cri,service.getTotal(cri, boardNum)));
	//getTotal에 cri가 필요한 이유는 검색시 총갯수를 구하는 경우도 고려하는 동적 쿼리를 만들어야하해서이다.
	//역순으로 끌고 온다고 생각하면 된다. getTotal로 끌고와서 총갯수 넣고  PageDTO에 cri(몇페이지 고르고 ,어떤 검색어 검색햇는지 등등 정보를 유지시키기위해)
	
	if(boardNum ==1) {
		return "/app/qna/QABoard";		
		
	}
	return "error_page";
	}
	
	
	@GetMapping("/modifyBoard")//이동
	public String modiifyBoard(@RequestParam("boardNum") Long boardNum,@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		BoardVO board = new BoardVO();
		board.setBoardNum(boardNum);
		board.setBno(bno);
		model.addAttribute("board",service.readBoard(board));
			model.addAttribute("bno",bno);
			
			return "/app/qna/QAModify";
	}
	
	@PostMapping("/modifyBoard")
	public String modifyBoard(BoardVO board, RedirectAttributes rttr) {
		log.info("BoardController...modify");
		log.info("modifyBno :" + board.getBno());
		service.modifyBoard(board);
		rttr.addFlashAttribute("result",board.getBno());
		
		return"redirect:/board/boardList?boardNum=1";
	}
	
	@GetMapping("/deleteBoard")
	public String deleteBoard(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		List<BoardAttachVO> attachList = service.getAttachList(board.getBno());
		if(service.deleteBoard(board)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result","success");
		}
		
		//삭제하고 해당 페이지에 머물어야 되니까 넘겨줘야함
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());
		return"redirect:/board/boardList?boardNum=1"; //컨트롤러에서 다시 키워드랑 pageMaker설정해야되니까 들리게
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("getAttachList :" + bno);
		
		return new ResponseEntity<List<BoardAttachVO>>(service.getAttachList(bno), HttpStatus.OK);
		
	}
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList ==null || attachList.size() ==0) {
			return;
		}
		
		log.info("delete attach files..........");
		log.info(attachList);
		
		attachList.forEach(attach ->{
			// 1. File객체에 담아서 delete() 사용
			// 2. Files.delete(Path): 해당 경로에 있는 파일을 삭제한다.
			
			  try {
		            Path file = Paths.get("C:\\dsUpload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
		            Files.delete(file);
		            
		            if(Files.probeContentType(file).startsWith("image")) {
		               Path thumbnail = Paths.get("C:\\dsUpload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
		               Files.delete(thumbnail);
		            }
		         } catch (IOException e) {
		            e.printStackTrace();
		         }

		});
	}

}
