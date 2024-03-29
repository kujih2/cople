package kr.spring.wiki.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.wiki.dao.WikiMapper;
import kr.spring.wiki.vo.WikiVO;

@Service
@Transactional
public class WikiServiceImpl implements WikiService{
	@Autowired
	private WikiMapper wikiMapper;
	
	

	@Override
	public void updateWiki(int update_num,WikiVO wiki) {
		if(update_num!=0) {
			wikiMapper.changeWiki(update_num);			 
		}
		wikiMapper.updateWiki(wiki);
	}

	@Override
	public WikiVO selectWiki(int doc_num) {
		return wikiMapper.selectWiki(doc_num);
	}
	@Override
	public WikiVO selectWiki2(String doc_name) {
		return wikiMapper.selectWiki2(doc_name);
	}


	@Override
	public int selectRowCount(Map<String, Object> map) {
		return wikiMapper.selectRowCount(map);
	}

	@Override
	public List<WikiVO> selectList(Map<String, Object> map) {
		return wikiMapper.selectList(map);
	}

	@Override
	public int insertWiki(WikiVO wiki) {
		int newNum = wikiMapper.getNewDocNum();
		wikiMapper.insertWiki(wiki);
		return newNum;
	} 

	@Override
	public List<WikiVO> selectLatest() {
		return wikiMapper.selectLatest();
	}

	@Override
	public List<WikiVO> selectHistory(Map<String,Object> map) {
		return wikiMapper.selectHistory(map);
	}

	@Override
	public int selectRowCountOfHistory(int doc_num) {
		return wikiMapper.selectRowCountOfHistory(doc_num);
	}

	@Override
	public WikiVO selectOldWiki(int update_num) {
		return wikiMapper.selectOldWiki(update_num);
	}

	@Override
	public void undoWiki(int doc_num, int update_num, String update_writer) {
		wikiMapper.changeWiki(wikiMapper.selectWiki(doc_num).getUpdate_num());
		WikiVO wiki = wikiMapper.selectOldWiki(update_num);
		wiki.setUpdate_summary("문서 되돌리기");
		wiki.setUpdate_writer(update_writer);
		updateWiki(update_num,wiki);
	}

	@Override
	public WikiVO findDoc(String doc_name) {
		return wikiMapper.findDoc(doc_name);
	}

	@Override
	public void deleteWiki(int doc_num, int update_num, WikiVO wiki) {
		wikiMapper.changeWiki(update_num);
		wikiMapper.deleteWiki(wiki);
		
	}

	@Override
	public List<WikiVO> searchInternal(String doc_name) {
		return wikiMapper.searchInternal(doc_name);
	}




	


}
