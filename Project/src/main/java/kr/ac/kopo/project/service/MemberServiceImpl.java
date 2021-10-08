package kr.ac.kopo.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.project.dao.MemberDao;
import kr.ac.kopo.project.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Override
	public void add(Member item) {
		dao.add(item);
	}

	@Override
	public boolean checkId(String id) {
		if(dao.checkId(id) > 0)
			return false;
		else 
			return true;
	}

	@Override
	public Member item(String id) {
		return dao.item(id);
	}

}
