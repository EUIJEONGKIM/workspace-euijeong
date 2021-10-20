package kr.ac.kopo.project.dao;

import java.util.List;

import kr.ac.kopo.project.model.Member;

public interface MemberDao {

	void add(Member item);

	int checkId(String id);

	Member item(String id);

	List<Member> list();

}
