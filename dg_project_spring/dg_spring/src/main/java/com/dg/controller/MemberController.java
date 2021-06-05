package com.dg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dg.domain.MemberVO;
import com.dg.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller 
@Log4j 
@AllArgsConstructor 
@RequestMapping("/member/*") 
public class MemberController {
	
	private MemberService service;
	
	@GetMapping("/memberJoin")//회원가입페이지이동
	public String memberJoin() {return "/app/member/memberJoin";}
	
	@PostMapping("/memberJoin")
	public String memberJoinOk(MemberVO member) {
		service.join(member);
		//회원가입 //리다이렉트는 서버에서 바로 다른 페이지로 화면을 띄우는 게 아니라 다른 컨트롤러로 연결 시켜서 다시 요청하라고 지시한다.
		return "redirect:/login?login=true";
	}
	
	@ResponseBody // restController를 쓰기위해 ,rest방식에서 post방식으로 받으면 counsumes 지정필수인가?
	@GetMapping("/memberCheckId")
	public ResponseEntity<String> memberCheckId(String id){
		//1이 아니면 중복이 없다는거니까 ok리턴 1이있다면 중복이니까 not-ok리턴
		return service.checkId(id)!=1? new ResponseEntity<String>("ok",HttpStatus.OK):
			new ResponseEntity<String>("not-ok",HttpStatus.OK);
	}
	
	@ResponseBody
	@GetMapping("/memberSms")
	public ResponseEntity<String> memberSms(String phone){
	
		return service.checkPhone(phone) !=1? new ResponseEntity<String>(service.sms(phone),HttpStatus.OK):
			new ResponseEntity<String>("not-ok", HttpStatus.OK);
	}
	@PostMapping("/memberLogin")
	public String memberLogin(MemberVO member,HttpServletRequest req, Model model){

		//참이면 session만들고 참이아니라면 다시 로그인컨트롤러로 변수를 가져간다음 해당 변수가 있을 때 alert하게하자
		if(service.login(member)==1) {
			HttpSession session = req.getSession();
			session.setAttribute("session_m_id", member.getMemberId());
			return "index";
		}else
			model.addAttribute("login","false");
			return "/app/public/login";
		
	}
	
	@GetMapping("/memberLogout")
	public String memberLogout(HttpServletRequest req) {
	HttpSession session = req.getSession();
	session.removeAttribute("session_m_id");
	return "index";
	}
	

}
