package kr.spring.wiki.service;

import kr.spring.wiki.vo.WikiVO;

public interface WikiService {
	public void updateWiki(int update_num,WikiVO wiki);
	public WikiVO selectWiki(int doc_num);


}
