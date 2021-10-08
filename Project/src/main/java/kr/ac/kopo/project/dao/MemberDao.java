package kr.ac.kopo.project.dao;

import kr.ac.kopo.project.model.Member;

public interface MemberDao {

	void add(Member item);

	int checkId(String id);

	Member item(String id);

}
