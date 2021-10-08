package kr.ac.kopo.project.service;

import java.util.List;

import kr.ac.kopo.project.model.Board;
import kr.ac.kopo.project.util.Pager;

public interface BoardService {

	List<Board> list();

	void add(Board item);

	Board item(int boardNumber);

	void update(Board item);

	void delete(int boardNumber);

	List<Board> list(Pager pager);

	List<Board> listAll(Pager pager);
	
}
