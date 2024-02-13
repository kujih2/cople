package kr.spring.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.member.vo.MemberVO;
@Mapper
public interface MemberMapper2 {
	@Select("SELECT member_seq.nextval FROM dual")
	public int selectMem_num();
	@Insert("INSERT INTO member (mem_num,id,nick_name,auth) VALUES (#{mem_num},#{id},#{nick_name},5)")
	public void insertMember(MemberVO member);
	public void insertMember_detail(MemberVO member);
	@Select("select mem_num,id,auth,name,phone,email,certify_photo_name,filename FROM member\r\n LEFT OUTER JOIN member_detail USING(mem_num) LEFT OUTER JOIN emp USING(mem_num) WHERE (auth=5 AND certify_photo_name IS NOT NULL) OR (auth!=2 AND filename IS NOT NULL)")
	public List<MemberVO> selectUncertifiedMember();
}
