package kr.ac.kopo.project.util;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	private int page = 1;
	private int perPage = 10;
	private float total;
	private int perGroup = 5;
	private String id;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	private int search = 0;
	private String keyword;
	
	public int getSearch() {
		return search;
	}
	public void setSearch(int search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPerGroup() {
		return perGroup;
	}
	public void setPerGroup(int perGroup) {
		this.perGroup = perGroup;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	
	public List<Integer> getList(){
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		int startPage = ((page - 1) / perGroup) * perGroup + 1;
		int last = getLast();
			
		for(int index = startPage; index < (startPage + perGroup) && index <= last ; index++) {//1부터 최종페이지 
			list.add(index);
		}
		
		if(list.isEmpty())
			list.add(1);
		
		return list;
	}
	
	public int getLast() {
		return (int)Math.ceil(total / perPage);
	}
	
	public int getPrev() {
		return (page <= perPage) ? 1 : (((page - 1) / perGroup) - 1) * perGroup + 1;
	}
	
	public int getNext() {
		int next = (((page - 1) / perGroup) + 1) * perGroup + 1;
		int last = getLast();
		
		return (next < last) ? next : last; 
	}
	
	public String getQuery() {
		if(search > 0)
			return "search=" + search + "&keyword=" + keyword;
		
		return "";
	}
}
