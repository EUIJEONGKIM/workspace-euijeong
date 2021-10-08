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
	
	//���� ������
	@RequestMapping({"/","/display"})
	public String main(Pager pager ,Model model) {
		List<Board> list = boardService.listAll(pager);
		
		model.addAttribute("list", list);
		
		return "display";
	}
	
	//���̵� �ߺ�Ȯ��
	@ResponseBody
	@RequestMapping("/checkId")
	public String checkId(String id) {
		if(service.checkId(id) )
			return "OK";
		else 
			return "FAIL";
					
	}
	
	//ȸ������ ������
	@RequestMapping(value="/signup",method=RequestMethod.GET)
	public String signup() {
		return "signup";
	}
	//ȸ�� ���
	@RequestMapping(value="/signup",method=RequestMethod.POST)
	public String signup(Member item) {
		service.add(item);
		
		return "redirect:.";
	}
	//�α��� ������
	@RequestMapping(value="/login", method=RequestMethod.GET)//login
	public String login() {
		return "login";
	}
	//�α��� ���̵�, ��й�ȣ Ȯ��
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
	//�α׾ƿ�
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:display";
	}
	//���ο��� ���������� 
	@RequestMapping("/board")
	public String board() {
		return "board";
	}
	//���ο��� ��������
	@RequestMapping("/select")
	public String select(int boardNumber, Model model) {
		Board item = boardService.item(boardNumber);
		
		model.addAttribute("item", item);
		
		return "select";
	}
	
	
}
