package kr.ac.kopo.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.project.model.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Reply> list(int boardNumber) {
		return sql.selectList("reply.list", boardNumber);
	}

	@Override
	public void add(Reply item) {
		sql.insert("reply.add", item);
	}

	@Override
	public void delete(Reply param) {
		sql.delete("reply.delete", param);
	}

	@Override
	public void delete(int replyNumber) {
		sql.delete("reply.adminDelete", replyNumber);
	}

	@Override
	public List<Reply> replyList() {
		return sql.selectList("reply.replyList");
	}

	@Override
	public Reply item(int replyNumber) {
		return sql.selectOne("reply.item", replyNumber);
	}

	@Override
	public void update(Reply item) {
		sql.update("reply.update", item);
	}

}
