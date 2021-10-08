package kr.ac.kopo.project.service;

import java.util.List;

import kr.ac.kopo.project.model.Reply;

public interface ReplyService {

	List<Reply> list();

	void add(Reply item);

	void delete(int replyNumber);

}
