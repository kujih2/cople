package kr.spring.wiki.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.wiki.vo.WikiVO;

@Mapper
public interface WikiMapper {
	//위키문서 생성하기
		//새로운 위키문서 번호 받아오기
		public int getNewDocNum();
	public int insertWiki(WikiVO wiki);
	
	//위키글 업데이트
	public void updateWiki(WikiVO wiki);
	//위키 문서 정보 불러오기
	@Select("SELECT * FROM wiki_doc LEFT OUTER JOIN wiki_update USING(doc_num) WHERE doc_num=#{doc_num} AND update_status=1")
	public WikiVO selectWiki(int doc_num);
	
	//최신 편집 갱신(이전 최신글의 status를 0으로)
	@Update("UPDATE wiki_update SET update_status=0 WHERE update_num=#{update_num}")
	public void changeWiki(int update_num);
	
	//리스트 불러오기
	public int selectRowCount(Map<String,Object> map);
	public List<WikiVO> selectList(Map<String,Object> map);
	
	
	
	
}
