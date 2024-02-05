package kr.spring.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.spring.member.service.MemberService2;
import kr.spring.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController2 {
	@Autowired
	private MemberService2 memberService;
	
	/*====================================
	 * 자바빈(VO) 초기화
	 *==================================== */
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	/*====================================
	 * 회원가입
	 *==================================== */
	//회원가입 폼 호출
	@GetMapping("/member/registerSelect")
	public String form() {
		return "memberRegisterSelect";
	}
	
}
