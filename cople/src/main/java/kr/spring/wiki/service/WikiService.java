package kr.spring.wiki.service;

import java.util.List;
import java.util.Map;

import kr.spring.wiki.vo.WikiVO;

public interface WikiService {
	public int insertWiki(WikiVO wiki);
	public void updateWiki(int update_num,WikiVO wiki);
	public WikiVO selectWiki(int doc_num);
	public int selectRowCount(Map<String,Object> map);
	public List<WikiVO> selectList(Map<String,Object> map);



}
