package kr.ac.kopo.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.project.model.Board;
import kr.ac.kopo.project.model.Member;
import kr.ac.kopo.project.model.Reply;
import kr.ac.kopo.project.service.BoardService;
import kr.ac.kopo.project.service.MemberService;
import kr.ac.kopo.project.service.ReplyService;

@Controller
@RequestMapping("admin/")
public class AdminController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	BoardService postService;
	@Autowired
	ReplyService replyService;
	
	final String memberPath = "admin/member/";
	final String postPath = "admin/post/";
	final String replyPath = "admin/reply/";
	
	@RequestMapping("/index")
	public String index() {
		return "admin/index";
	}
	
	@RequestMapping("/member/list") //url 林家
	public String memberList(Model model) {
		List<Member> memberList = memberService.list();
		
		model.addAttribute("memberList", memberList);
		
		return memberPath + "memberList"; //jsp 林家
	}
	
	@GetMapping("/member/add")
	public String memberAdd() {
		return memberPath + "memberAdd";
	}
	@PostMapping("/member/add")
	public String memberAdd(Member item) {
		memberService.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/member/update")
	public String memberUpdate(String id, Model model) {
		Member item = memberService.item(id);
		
		model.addAttribute("item", item);
		
		return memberPath + "memberUpdate";
	}
	@PostMapping("/member/update")
	public String memberUpdate(Member item) {
		memberService.update(item);
		
		return "redirect:list";
	}
	
	@RequestMapping("/member/delete")
	public String memberDelete(String id) {
		memberService.delete(id);
		
		return "redirect:list";
	}
	
	
	@RequestMapping("/post/list")
	public String postList(Model model) {
		List<Board> postList = postService.postList();
		
		model.addAttribute("postList", postList);
		
		return postPath + "postList";
	}
	
	@GetMapping("/post/add")
	public String  postAdd() {
		return postPath + "postAdd";
	}
	@PostMapping("/post/add")
	public String postAdd(Board item) {
		postService.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/post/update")
	public String postUpdate(int boardNumber, Model model) {
		Board item = postService.item(boardNumber);
		
		model.addAttribute("item", item);
		
		return postPath + "postUpdate";
	}
	@PostMapping("/post/update")
	public String postUpdate(Board item) {
		postService.update(item);
		
		return "redirect:list";
	}
	
	@RequestMapping("/post/delete")
	public String postDelete(int boardNumber) {
		postService.delete(boardNumber);
		
		return "redirect:list";
	}
	
	@RequestMapping("/reply/list")
	public String replyList(Model model) {
		List<Reply> replyList = replyService.replyList();
		
		model.addAttribute("replyList", replyList);
		
		return replyPath + "replyList";
	}
	
	@GetMapping("/reply/update")
	public String replyAdd(int replyNumber, Model model) {
		Reply item = replyService.item(replyNumber);
		
		model.addAttribute("item", item);
		
		return replyPath + "replyUpdate";
	}
	@PostMapping("/reply/update")
	public String replyAdd(Reply item) {
		replyService.update(item);
		
		return "redirect:list";
	}
	
	@RequestMapping("/reply/delete")
	public String replyDelete(int replyNumber) {
		replyService.delete(replyNumber);
		
		return "redirect:list";
	}
	
}
