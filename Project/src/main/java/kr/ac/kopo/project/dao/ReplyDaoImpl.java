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
	public List<Reply> list() {
		return sql.selectList("reply.list");
	}

	@Override
	public void add(Reply item) {
		sql.insert("reply.add", item);
	}

	@Override
	public void delete(Reply param) {
		sql.delete("reply.delete", param);
	}

}
