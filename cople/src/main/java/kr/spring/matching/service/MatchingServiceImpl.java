package kr.spring.matching.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.matching.dao.MatchingMapper;
import kr.spring.matching.vo.AdviceVO;
import kr.spring.matching.vo.EmpVO;
import kr.spring.matching.vo.LetterVO;
import kr.spring.member.vo.MemberVO;

@Service
@Transactional
public class MatchingServiceImpl implements MatchingService{
	
	@Autowired
	MatchingMapper matchingMapper;
	
	@Override
	public void insertEmp(EmpVO empVO) {
		matchingMapper.insertEmp(empVO);
	}

	@Override
	public List<EmpVO> listEmp(Map<String, Object> map) {
		return matchingMapper.listEmp(map);
	}

	@Override
	public EmpVO selectEmp(int mem_num) {
		return matchingMapper.selectEmp(mem_num);
	}

	@Override
	public int selectEmpCount() {
		return matchingMapper.selectEmpCount();
	}

	@Override
	public List<MemberVO> selectMemberList() {
		return matchingMapper.selectMemberList();
	}

	@Override
	public MemberVO selectMember(int mem_num) {
		return matchingMapper.selectMember(mem_num);
	}

	@Override
	public void insertLetter(LetterVO letterVO) {
		matchingMapper.insertLetter(letterVO);
		
	}

	@Override
	public void insertAdvice(AdviceVO adviceVO) {
		matchingMapper.insertAdvice(adviceVO);
		
	}

}
