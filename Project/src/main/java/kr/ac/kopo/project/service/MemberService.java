package kr.ac.kopo.project.service;

import kr.ac.kopo.project.model.Member;

public interface MemberService {

	void add(Member item);

	boolean checkId(String id);

	Member item(String id);

}
