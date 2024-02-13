package kr.spring.matching.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
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
	//받은 쪽지 삭제상태로 변경
	@Update("UPDATE letter SET receive_del = 1 WHERE letter_num=#{letter_num}")
	public void deleteReceivedLetter(int letter_num);
	//받은 쪽지 보낸사람 삭제상태여부 불러오기
	@Select("SELECT sent_del FROM letter WHERE letter_num=#{letter_num}")
	public int selectSentDel(int letter_num);
	//쪽지 테이블에서 삭제
	@Delete("DELETE FROM letter WHERE letter_num=#{letter_num}")
	public void deleteLetter(int letter_num);
	//보낸 쪽지 삭제로 변경
	@Update("UPDATE letter SET sent_del = 1 WHERE letter_num=#{letter_num}")
	public void deleteSentLetter(int letter_num);
	//보낸 쪽지 받은사람 삭제상태여부 불러오기
	@Select("SELECT receive_del FROM letter WHERE letter_num=#{letter_num}")
	public int selectReceiveDel(int letter_num);
	
	
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
	//받은 첨삭 삭제상태로 변경
	@Update("UPDATE advice SET receive_del = 1 WHERE advice_num=#{advice_num}")
	public void deleteReceivedAdvice(int advice_num);
	//받은 첨삭 보낸사람 삭제상태여부 불러오기
	@Select("SELECT sent_del FROM advice WHERE advice_num=#{advice_num}")
	public int selectAdviceSentDel(int advice_num);
	//첨삭 테이블에서 삭제
	@Delete("DELETE FROM advice WHERE advice_num=#{advice_num}")
	public void deleteAdvice(int advice_num);
	//보낸 첨삭 삭제로 변경
	@Update("UPDATE advice SET sent_del = 1 WHERE advice_num=#{advice_num}")
	public void deleteSentAdvice(int advice_num);
	//보낸 첨삭 받은사람 삭제상태여부 불러오기
	@Select("SELECT receive_del FROM advice WHERE advice_num=#{advice_num}")
	public int selectAdviceReceiveDel(int advice_num);
	
	//회원기능
	@Select("SELECT mem_num FROM member WHERE id=#{id}")
	public int findMemnumById(String id);
}
