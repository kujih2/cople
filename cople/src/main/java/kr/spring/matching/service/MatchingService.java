package kr.spring.matching.service;

import java.util.List;
import java.util.Map;

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
}
