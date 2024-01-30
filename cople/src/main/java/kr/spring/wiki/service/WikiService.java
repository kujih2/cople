package kr.spring.wiki.service;

import java.util.List;
import java.util.Map;

import kr.spring.wiki.vo.WikiVO;

public interface WikiService {
	public int insertWiki(WikiVO wiki);
	public void updateWiki(int update_num,WikiVO wiki);
	public WikiVO selectWiki(int doc_num);
	public WikiVO selectWiki2(String doc_name);

	public int selectRowCount(Map<String,Object> map);
	public List<WikiVO> selectList(Map<String,Object> map);
	public List<WikiVO> selectLatest();
	public int selectRowCountOfHistory(int doc_num);
	public List<WikiVO> selectHistory(Map<String,Object> map);
	public WikiVO selectOldWiki(int update_num);
	
	public void undoWiki(int doc_num, int update_num, String update_writer);
	public WikiVO findDoc(String doc_name);
	public void deleteWiki(int doc_num, int update_num,WikiVO wiki);

	public List<WikiVO> searchInternal(String doc_name);



}
