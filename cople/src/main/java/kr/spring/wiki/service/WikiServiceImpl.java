package kr.spring.wiki.service;

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
		wikiMapper.changeWiki(update_num);
		wikiMapper.updateWiki(wiki);
	}

	@Override
	public WikiVO selectWiki(int doc_num) {
		return wikiMapper.selectWiki(doc_num);
	}


}
