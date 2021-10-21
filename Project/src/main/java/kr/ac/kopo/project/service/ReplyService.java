package kr.ac.kopo.project.service;

import java.util.List;

import kr.ac.kopo.project.model.Reply;

public interface ReplyService {

	List<Reply> list(int boardNumber);

	void add(Reply item);

	void delete(Reply param);

	void delete(int replyNumber);

	List<Reply> replyList();

	Reply item(int replyNumber);

	void update(Reply item);

	
}
