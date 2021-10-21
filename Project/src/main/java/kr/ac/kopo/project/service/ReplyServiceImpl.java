package kr.ac.kopo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.project.dao.ReplyDao;
import kr.ac.kopo.project.model.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDao dao;
	
	@Override
	public List<Reply> list(int boardNumber) {
		return dao.list(boardNumber);
	}

	@Override
	public void add(Reply item) {
		dao.add(item);
	}

	@Override
	public void delete(Reply param) {
		dao.delete(param);
	}
	
	//包府磊 昏力
	@Override
	public void delete(int replyNumber) {
		dao.delete(replyNumber);
	}
	//包府磊 格废
	@Override
	public List<Reply> replyList() {
		return dao.replyList();
	}
	//包府磊 荐沥
	@Override
	public Reply item(int replyNumber) {
		return dao.item(replyNumber);
	}

	@Override
	public void update(Reply item) {
		dao.update(item);
	}

}
