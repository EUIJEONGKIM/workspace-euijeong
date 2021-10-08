package kr.ac.kopo.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.project.dao.BoardDao;
import kr.ac.kopo.project.model.Board;
import kr.ac.kopo.project.util.Pager;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	@Override
	public List<Board> list() {
		return dao.list();
	}

	@Override
	public void add(Board item) {
		dao.add(item);
	}

	@Override
	public Board item(int boardNumber) {
		return dao.item(boardNumber);
	}

	@Override
	public void update(Board item) {
		dao.update(item);
	}

	@Override
	public void delete(int boardNumber) {
		dao.delete(boardNumber);
	}

	@Override
	public List<Board> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal( (float)total );
		
		return dao.list(pager);
	}

	@Override
	public List<Board> listAll(Pager pager) {
		return dao.listAll(pager);
	}

}
