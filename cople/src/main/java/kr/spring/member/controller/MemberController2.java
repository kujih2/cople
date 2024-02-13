package kr.spring.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	//회원가입 폼 호출2
	@GetMapping("/member/registerUser2")
	public String form2(@RequestParam int auth_index,Model model) {
		model.addAttribute("auth_index",auth_index);
		return "memberRegisterUser";
	}
	//회원가입 완료
	@RequestMapping("/member/result")
	public String form3() {
		return "memberRegisterResult";
	}

	@RequestMapping("/admin/adminAuthCertify")
	public ModelAndView processAdminAuthCertify() {
		List<MemberVO> list = memberService.selectUncertifiedMember();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminAuthCertify");
		mav.addObject("list",list);
		
		return mav;
	}

	

	
}
