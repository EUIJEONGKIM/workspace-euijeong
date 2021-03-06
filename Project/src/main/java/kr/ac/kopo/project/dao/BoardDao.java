package kr.ac.kopo.project.dao;

import java.util.List;

import kr.ac.kopo.project.model.Board;
import kr.ac.kopo.project.util.Pager;

public interface BoardDao {

	List<Board> list();

	void add(Board item);

	Board item(int boardNumber);

	void update(Board item);

	void delete(int boardNumber);

	List<Board> list(Pager pager);

	int total(Pager pager);

	List<Board> listAll(Pager pager);

	List<Board> postList();


	
	
	
	
}
