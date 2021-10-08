package kr.ac.kopo.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.project.model.Board;
import kr.ac.kopo.project.service.BoardService;
import kr.ac.kopo.project.util.Pager;

@Controller
@RequestMapping("/board")
public class BoardController {

	final String path = "board/";
	
	@Autowired
	BoardService service;
	
	@RequestMapping("/list")
	public String list(Model model, Pager pager, HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		pager.setId(id);
		
		List<Board> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String add() {
		return path + "add";
	}
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(Board item, HttpSession session) {
		String id = (String)session.getAttribute("id");
		
		item.setId(id);
		
		System.out.println(item.getThumbnail());
		service.add(item);
				
		return "redirect:list";		
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update(int boardNumber, Model model) {
		Board item = service.item(boardNumber);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(Board item) {
		service.update(item);
		System.out.println(item.toString());
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public String delete(int boardNumber) {
		service.delete(boardNumber);
		
		return "redirect:list";		
	}
	
	
}
