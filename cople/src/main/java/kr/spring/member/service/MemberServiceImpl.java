package kr.spring.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public void insertMember(MemberVO member) {
		member.setMem_num(memberMapper.selectMem_num());
		memberMapper.insertMember(member);
		memberMapper.insertMember_detail(member);
		
	}

	@Override
	public MemberVO selectCheckMember(String id) {
		return memberMapper.selectCheckMember(id);
	}

	@Override
	public MemberVO selectMember(int mem_num) {
		return memberMapper.selectMember(mem_num);
	}

	@Override
	public void updateMember(MemberVO member) {
		member.setMem_num(memberMapper.selectMem_num());
		memberMapper.updateMember_detail(member);
		
	}

	@Override
	public void updatePassword(MemberVO member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(int mem_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateAu_id(String au_id, int mem_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectAu_id(String au_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAu_id(int mem_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProfile(MemberVO member) {
		memberMapper.updateProfile(member);
		
	}


	@Override
	public int selectRowCount(Map<String, Object> map) {
	    return memberMapper.selectRowCount(map);
	}


	@Override
	public List<MemberVO> selectListAdminMain(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return memberMapper.selectListAdminMain(map);
	}

	


	

}
