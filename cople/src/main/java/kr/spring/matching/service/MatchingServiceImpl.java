package kr.spring.matching.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

	@Override
	public List<LetterVO> selectReceivedLetter(Map<String,Object> map) {
		return matchingMapper.selectReceivedLetter(map);
	}

	@Override
	public List<LetterVO> selectSentLetter(Map<String,Object> map) {
		return matchingMapper.selectSentLetter(map);
	}


	@Override
	public int receivedLetterCount(int mem_num) {
		return matchingMapper.receivedLetterCount(mem_num);
	}

	@Override
	public int sentLetterCount(int mem_num) {
		return matchingMapper.sentLetterCount(mem_num);
	}

	@Override
	public List<AdviceVO> selectReceivedAdvice(Map<String,Object> map) {
		return matchingMapper.selectReceivedAdvice(map);
	}

	@Override
	public List<AdviceVO> selectSentAdvice(Map<String,Object> map) {
		return matchingMapper.selectSentAdvice(map);
	}

	@Override
	public AdviceVO selectAdvice(int advice_num) {
		return matchingMapper.selectAdvice(advice_num);
	}

	@Override
	public int receivedAdviceCount(int mem_num) {
		return matchingMapper.receivedAdviceCount(mem_num);
	}

	@Override
	public int sentAdviceCount(int mem_num) {
		return matchingMapper.sentAdviceCount(mem_num);
	}

	@Override
	public LetterVO readLetter(int letter_num, HttpSession session) {
		
		MemberVO receiverVO = (MemberVO)session.getAttribute("user");
		int receiver_memnum = receiverVO.getMem_num();
		LetterVO letter = matchingMapper.selectLetter(letter_num);
		if(receiver_memnum==letter.getReceiver()) {
			matchingMapper.readLetter(letter_num);
		}
		
		return matchingMapper.selectLetter(letter_num);
	}

	@Override
	public int findMemnumById(String id) {
		return matchingMapper.findMemnumById(id);
	}

	@Override
	public AdviceVO readAdvice(int advice_num, HttpSession session) {
		
		MemberVO receiverVO = (MemberVO)session.getAttribute("user");
		int receiver_memnum = receiverVO.getMem_num();
		AdviceVO adviceVO = matchingMapper.selectAdvice(advice_num);
		if(receiver_memnum == adviceVO.getReceiver()) {
			matchingMapper.readAdvice(advice_num);
		}
		return matchingMapper.selectAdvice(advice_num);
	}
	
	//받은 쪽지 삭제
	@Override
	public void deleteReceivedLetter(int letter_num) {
		int del = matchingMapper.selectSentDel(letter_num);
		matchingMapper.deleteReceivedLetter(letter_num);
		if(del==1) {
			matchingMapper.deleteLetter(letter_num);
		}
	}
	//보낸 쪽지 삭제
	@Override
	public void deleteSentLetter(int letter_num) {
		int del = matchingMapper.selectReceiveDel(letter_num);
		matchingMapper.deleteSentLetter(letter_num);
		if(del==1) {
			matchingMapper.deleteLetter(letter_num);
		}
	}


	//보낸 첨삭 삭제
	@Override
	public void deleteSentAdvice(int advice_num) {
		int del = matchingMapper.selectReceiveDel(advice_num);
		matchingMapper.deleteSentAdvice(advice_num);
		if(del==1) {
			matchingMapper.deleteAdvice(advice_num);
		}
	}
	
	//받은 첨삭 삭제
	@Override
	public void deleteReceivedAdvice(int advice_num) {
		int del = matchingMapper.selectAdviceSentDel(advice_num);
		matchingMapper.deleteReceivedAdvice(advice_num);
		if(del ==1) {
			matchingMapper.deleteAdvice(advice_num);
		}
	}
	
	
	
	

}
