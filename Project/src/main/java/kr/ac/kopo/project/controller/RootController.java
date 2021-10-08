package kr.ac.kopo.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.project.model.Board;
import kr.ac.kopo.project.model.Member;
import kr.ac.kopo.project.service.BoardService;
import kr.ac.kopo.project.service.MemberService;
import kr.ac.kopo.project.util.Pager;

@Controller
public class RootController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	BoardService boardService;
	
	//메인 페이지
	@RequestMapping({"/","/display"})
	public String main(Pager pager ,Model model) {
		List<Board> list = boardService.listAll(pager);
		
		model.addAttribute("list", list);
		
		return "display";
	}
	
	//아이디 중복확인
	@ResponseBody
	@RequestMapping("/checkId")
	public String checkId(String id) {
		if(service.checkId(id) )
			return "OK";
		else 
			return "FAIL";
					
	}
	
	//회원가입 페이지
	@RequestMapping(value="/signup",method=RequestMethod.GET)
	public String signup() {
		return "signup";
	}
	//회원 등록
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String signup(Member item) {
		service.add(item);
		
		return "redirect:.";
	}
	//로그인 페이지
	@RequestMapping(value="/login", method=RequestMethod.GET)//login
	public String login() {
		return "login";
	}
	//로그인 아이디, 비밀번호 확인
	@RequestMapping(value="/login", method=RequestMethod.POST)//login
	public String login(Member item, HttpSession session) {
		Member member = service.item(item.getId());
		
		if(member != null) {
			String id = member.getId();
			String passwd = member.getPasswd();
			
			if(id.equals(item.getId()) && passwd.equals(item.getPasswd()) ) {
				session.setAttribute("member", member);
				session.setAttribute("id", id);
				
				return "redirect:display";	
			}
			return "redirect:.";
		}
		
		return "redirect:.";
			
	}
	//로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:display";
	}
	//메인에서 마이페이지 
	@RequestMapping("/board")
	public String board() {
		return "board";
	}
	//메인에서 상세페이지
	@RequestMapping("/select")
	public String select(int boardNumber, Model model) {
		Board item = boardService.item(boardNumber);
		
		model.addAttribute("item", item);
		
		return "select";
	}
	
	
}
