package kr.spring.matching.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.matching.service.MatchingService;
import kr.spring.matching.vo.EmpVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.FileUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MatchingController {
	
	@Autowired
	MatchingService matchingService;

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

	@PostMapping("/matching/empInsert")
	public String registerEmp(EmpVO empVO, Model model, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException {

		log.debug("<< 합격자 신청 폼 >> : " + empVO);

		//회원번호 셋팅
		MemberVO memberVO = (MemberVO)session.getAttribute("user");
		empVO.setMem_num(memberVO.getMem_num());
		empVO.setFilename(FileUtil.createFile(request, empVO.getUpload()));
		
		//DB에 empVO 등록
		matchingService.insertEmp(empVO);

		//View에 표시할 메시지
		model.addAttribute("message", "글쓰기가 완료되었습니다.");
		model.addAttribute("url", request.getContextPath()+ "/matching/mmain");

		return "common/resultAlert";

	}
}
