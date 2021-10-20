package kr.ac.kopo.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.project.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public void add(Member item) {
		sql.insert("member.add", item);
	}

	@Override
	public int checkId(String id) {
		return sql.selectOne("member.checkId", id);
	}

	@Override
	public Member item(String id) {
		return sql.selectOne("member.item", id);
	}

	@Override
	public List<Member> list() {
		return sql.selectList("member.list");
	}

}
