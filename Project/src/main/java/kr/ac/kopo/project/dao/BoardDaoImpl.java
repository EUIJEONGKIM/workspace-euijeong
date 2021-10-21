package kr.ac.kopo.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.project.model.Board;
import kr.ac.kopo.project.util.Pager;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Board> list() {
		return sql.selectList("board.list");
	}

	@Override
	public void add(Board item) {
		sql.insert("board.add", item);
	}

	@Override
	public Board item(int boardNumber) {
		return sql.selectOne("board.item", boardNumber);
	}

	@Override
	public void update(Board item) {
		sql.update("board.update", item);
	}

	@Override
	public void delete(int boardNumber) {
		sql.delete("board.delete", boardNumber);
	}

	@Override
	public List<Board> list(Pager pager) {
		return sql.selectList("board.list", pager);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("board.total", pager);
	}

	@Override
	public List<Board> listAll(Pager pager) {
		return sql.selectList("board.listAll", pager);
	}

	@Override
	public List<Board> postList() {
		return sql.selectList("board.postList");
	}

	

}
