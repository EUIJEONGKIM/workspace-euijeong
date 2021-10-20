package kr.ac.kopo.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.project.model.Member;
import kr.ac.kopo.project.service.MemberService;

@Controller
@RequestMapping("admin/")
public class AdminController {
	
	@Autowired
	MemberService memberService;
	
	final String memberPath = "admin/member";
	final String postPath = "admin/post";
	
	@RequestMapping("/list")
	public String memberList(Model model) {
		List<Member> memberList = memberService.list();
		
		model.addAttribute("memberList", memberList);
		
		return memberPath + "list";
	}
	
}
