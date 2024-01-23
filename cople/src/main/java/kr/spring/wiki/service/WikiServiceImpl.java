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

	


}
