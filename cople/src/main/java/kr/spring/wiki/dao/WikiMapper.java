package kr.spring.wiki.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.wiki.vo.WikiVO;

@Mapper
public interface WikiMapper {
	public void updateWiki(WikiVO wiki);
	@Select("SELECT * FROM wiki_doc LEFT OUTER JOIN wiki_update USING(doc_num) WHERE doc_num=#{doc_num} AND update_status=1")
	public WikiVO selectWiki(int doc_num);
	
	//최신 편집 갱신(이전 최신글의 status를 0으로)
	@Update("UPDATE wiki_update SET update_status=0 WHERE update_num=#{update_num}")
	public void changeWiki(int update_num);
	
}
