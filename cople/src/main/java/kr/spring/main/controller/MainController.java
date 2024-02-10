package kr.spring.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.member.vo.MemberVO;
import kr.spring.util.PageUtil;
import kr.spring.wiki.vo.WikiVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class MainController {
	@RequestMapping("/")
	public String init(HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		//관리자로 로그인하면 관리자 메인으로 이동처리
		if(user!=null && user.getAuth()==9) {
			return "redirect:/main/admin";
		}
		return "redirect:/main/main2";
	}
	@RequestMapping("/main/main")
	public String main(Model model) {
		log.debug("<<메인실행>>");
		
		return "main";//타일스 설정명
	}
	@RequestMapping("/main/main2")
	public String main2(Model model) {
		log.debug("<<메인실행>>");
		
		return "main3";//타일스 설정명
	}
}
