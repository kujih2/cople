package kr.spring.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.matching.service.MatchingService;
import kr.spring.member.vo.MemberVO;

@Controller
public class JobsController {
	
	@Autowired
	private MatchingService matchingService;
	
	@RequestMapping("/jobs/letterAdvice")
	public String jobsMain(HttpServletRequest request, HttpSession session, Model model) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		model.addAttribute("user", user);
		
		return "jobsMain";
	}
}
