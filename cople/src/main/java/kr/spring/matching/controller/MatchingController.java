package kr.spring.matching.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.vo.MemberVO;

@Controller
public class MatchingController {

	@RequestMapping("/matching/mmain")
	public String mmain() {
		return "SHJ";
	}
	
	@RequestMapping("/matching/emp_register")
	public String main(HttpSession session, Model model, HttpServletRequest request) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(user==null) {
			//View에 표시할 메시지
			model.addAttribute("message", "수강생 회원만 이용가능합니다.");
			model.addAttribute("url", request.getContextPath()+ "/member/login");
			
			return "matching/resultAlert";
		}else {
			model.addAttribute(user);
		}
			
		return "matching/emp_register";
	}
}
