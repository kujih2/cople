package kr.spring.member.service;

import kr.spring.member.vo.MemberVO;

public interface MemberService {
	//회원관리 - 사용자
		public void insertMember(MemberVO member);
		public MemberVO selectCheckMember(String id);
		public MemberVO selectMember(int mem_num);
		public void updateMember(MemberVO member);
		public void updatePassword(MemberVO member);
		public void deleteMember(int mem_num);
		//자동 로그인
		public void updateAu_id(String au_id, int mem_num);
		public void selectAu_id(String au_id);
		public void deleteAu_id(int mem_num);
		//프로필 이미지 업데이트
		public void updateProfile(MemberVO member);


}
