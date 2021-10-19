package kr.ac.kopo.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.project.model.Reply;
import kr.ac.kopo.project.service.ReplyService;

@RestController
@RequestMapping("/select")
public class ReplyController {

	@Autowired
	ReplyService service;
	
	@PostMapping("/list")
	@ResponseBody
	public List<Reply> list(@RequestBody int boardNumber){
		return service.list(boardNumber);
	}
	
	@PutMapping("/add")
	public Reply add(@RequestBody Reply item) {
		Reply reply = new Reply();
		reply.setId("id");
		
		service.add(item);
		
		return item;
	}
	
	@DeleteMapping("/delete/{replyNumber}")
	public Integer delete(@PathVariable int replyNumber, @SessionAttribute String id) {
		Reply param = new Reply();
		
		param.setReplyNumber(replyNumber);
		param.setId(id);
		
		service.delete(param);
		
		return replyNumber;
	}
	
	
	
}
