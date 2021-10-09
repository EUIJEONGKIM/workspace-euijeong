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
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.project.model.Reply;
import kr.ac.kopo.project.service.ReplyService;

@RestController
@RequestMapping("/select")
public class ReplyController {

	@Autowired
	ReplyService service;
	
	@PostMapping("/list")
	public List<Reply> list(){
		return service.list();
	}
	
	@PutMapping("/add")
	public Reply add(@RequestBody Reply item) {
		Reply reply = new Reply();
		reply.setId("id");
		
		service.add(item);
		
		return item;
	}
	
	@DeleteMapping("/{replyNumber}")
	public Integer delete(@PathVariable int replyNumber) {
		service.delete(replyNumber);
		
		return replyNumber;
	}
	
	
	
}
