package kr.ac.kopo.project.service;

import java.util.List;

import kr.ac.kopo.project.model.Member;

public interface MemberService {

	void add(Member item);

	boolean checkId(String id);

	Member item(String id);

	List<Member> list();

}
