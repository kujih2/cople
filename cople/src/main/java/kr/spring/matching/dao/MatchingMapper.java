package kr.spring.matching.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.matching.vo.EmpVO;
import kr.spring.matching.vo.LetterVO;
import kr.spring.member.vo.MemberVO;

@Mapper
public interface MatchingMapper {
	
	public void insertEmp(EmpVO empVO);
	public List<EmpVO> listEmp(Map<String,Object> map);
	@Select("SELECT count(*) FROM emp JOIN member USING(mem_num) WHERE auth=2")
	public int selectEmpCount();
	@Select("SELECT a.*, member.id FROM (SELECT * FROM emp) a JOIN member ON a.mem_num = member.mem_num WHERE member.mem_num = #{mem_num}")
	public EmpVO selectEmp(int mem_num);
	@Select("SELECT * FROM member WHERE auth=2")
	public List<MemberVO> selectMemberList();
	@Select("SELECT * FROM member JOIN member_detail USING(mem_num) WHERE mem_num=#{mem_num}")
	public MemberVO selectMember(int mem_num);
	
	//쪽지기능
	public void insertLetter(LetterVO letterVO);
}
