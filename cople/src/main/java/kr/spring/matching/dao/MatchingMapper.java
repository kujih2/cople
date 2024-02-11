package kr.spring.matching.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.matching.vo.AdviceVO;
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
	public List<LetterVO> selectReceivedLetter(Map<String,Object> map);
	public List<LetterVO> selectSentLetter(Map<String,Object> map);
	@Select("SELECT * FROM letter WHERE letter_num=#{letter_num}")
	public LetterVO selectLetter(int letter_num);
	@Select("SELECT COUNT(*) FROM letter WHERE receiver=#{mem_nmm}")
	public int receivedLetterCount(int mem_num);
	@Update("UPDATE letter SET date_read= CASE WHEN date_read IS NULL THEN SYSDATE ELSE date_read END WHERE letter_num=#{letter_num}")
	public void readLetter(int letter_num);
	@Select("SELECT COUNT(*) FROM letter WHERE sender=#{mem_nmm}")
	public int sentLetterCount(int mem_num);
	//보낸쪽지
	
	
	//첨삭기능
	public void insertAdvice(AdviceVO adviceVO);
	public List<AdviceVO> selectReceivedAdvice(Map<String,Object> map);
	public List<AdviceVO> selectSentAdvice(Map<String,Object> map);
	@Select("SELECT * FROM advice WHERE advice_num=#{advice_num}")
	public AdviceVO selectAdvice(int advice_num);
	@Select("SELECT COUNT(*) FROM advice WHERE receiver=#{mem_nmm}")	
	public int receivedAdviceCount(int mem_num);
	@Select("SELECT COUNT(*) FROM advice WHERE sender=#{mem_nmm}")	
	public int sentAdviceCount(int mem_num);
	@Update("UPDATE advice SET date_read= CASE WHEN date_read IS NULL THEN SYSDATE ELSE date_read END WHERE advice_num=#{advice_num}")
	public void readAdvice(int advice_num);
	
	//회원기능
	@Select("SELECT mem_num FROM member WHERE id=#{id}")
	public int findMemnumById(String id);
}
