package kr.spring.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	//회원가입 폼 호출
	@GetMapping("/member/registerUser2")
	public String form2(@RequestParam int auth_index,Model model) {
		model.addAttribute("auth_index",auth_index);
		return "memberRegisterUser";
	}
	@PostMapping("/member/registerUser2")
	public String submit(@Valid MemberVO memberVO, BindingResult result, Model model, HttpServletRequest request, int auth_index) {
		log.debug("<<회원가입>> : " + memberVO);
		log.debug("<<회원등급>> : " + auth_index);
		//유효성체크결과 오류가 있으면 
		if(result.hasErrors()) {
			System.out.println("오류가있음");
			return form2(auth_index,model);
		}
		//회원가입
		memberService.insertMember(memberVO);
		
		model.addAttribute("accessTitle","회원가입");
		model.addAttribute("accessMsg","회원가입이 완료되었습니다.");
		model.addAttribute("accessUrl", request.getContextPath()+"/main/main");
		
		return "common/resultView";
	}
	
}
