package kr.ac.kopo.project.dao;

import java.util.List;

import kr.ac.kopo.project.model.Reply;

public interface ReplyDao {

	List<Reply> list();

	void add(Reply item);

	void delete(int replyNumber);

}
