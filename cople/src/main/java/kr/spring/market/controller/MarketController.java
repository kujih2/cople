package kr.spring.market.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.market.service.MarketService;
import kr.spring.market.vo.MarketVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MarketController {
	@Autowired
	private MarketService marketService;
	
	/*=================================
	 * 장터 글 등록
	 *=================================*/
	//자바빈(VO) 초기화
	@ModelAttribute
	public MarketVO initCommand() {
		return new MarketVO();
	}
	
	@GetMapping("/market/write")
	public String form() {
		return "marketWrite";
	}
	@PostMapping("/market/write")
	public String submit(@Valid MarketVO marketVO, BindingResult result, HttpServletRequest request,HttpSession session,
            Model model ) throws IllegalStateException, IOException  {
		
		//유효성 체크시 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
		
		return "common/resultAlert";
	}

	/*=================================
	 * 장터 글 리스트 조회
	 *=================================*/
	@RequestMapping("/market/list")
	public String process() {
		return "marketList";
	}
}
