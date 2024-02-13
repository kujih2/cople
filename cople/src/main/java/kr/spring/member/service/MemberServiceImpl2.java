package kr.spring.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.member.dao.MemberMapper2;
import kr.spring.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl2 implements MemberService2{
	@Autowired
	private MemberMapper2 memberMapper;
	
	@Override
	public MemberVO insertMember(MemberVO member) {
		member.setMem_num(memberMapper.selectMem_num());
		memberMapper.insertMember(member);
		memberMapper.insertMember_detail(member);
		
		return member;
	}

	@Override
	public List<MemberVO> selectUncertifiedMember() {
		return memberMapper.selectUncertifiedMember();
	}

}
