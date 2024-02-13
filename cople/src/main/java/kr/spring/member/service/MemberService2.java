package kr.spring.member.service;

import java.util.List;

import kr.spring.member.vo.MemberVO;

public interface MemberService2 {
	//회원관리 사용자
	public MemberVO insertMember(MemberVO member);
	public List<MemberVO> selectUncertifiedMember();
}
