package kr.spring.matching.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.matching.vo.AdviceVO;
import kr.spring.matching.vo.EmpVO;
import kr.spring.matching.vo.LetterVO;
import kr.spring.member.vo.MemberVO;

public interface MatchingService {
	//매칭페이지 기본기능
	public void insertEmp(EmpVO empVO);
	public List<EmpVO> listEmp(Map<String,Object> map);
	public EmpVO selectEmp(int mem_num);
	public int selectEmpCount();
	public List<MemberVO> selectMemberList();
	public MemberVO selectMember(int mem_num);

	//쪽지기능
	public void insertLetter(LetterVO letterVO);
	public List<LetterVO> selectReceivedLetter(Map<String,Object> map);
	public List<LetterVO> selectSentLetter(Map<String,Object> map);
	public int receivedLetterCount(int mem_num);
	public int sentLetterCount(int mem_num);
	public LetterVO readLetter(int letter_num);
	//첨삭기능
	public void insertAdvice(AdviceVO adviceVO);
	public List<AdviceVO> selectReceivedAdvice(Map<String,Object> map);
	public List<AdviceVO> selectSentAdvice(Map<String,Object> map);
	public AdviceVO selectAdvice(int advice_num);
	public int receivedAdviceCount(int mem_num);
	public int sentAdviceCount(int mem_num);

}
