package kr.spring.market.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.market.dao.MarketMapper;
import kr.spring.market.service.MarketService;
import kr.spring.market.vo.MarketVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.FileUtil;
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
	public String submit(MarketVO marketVO,HttpServletRequest request,HttpSession session,
            Model model ) throws IllegalStateException, IOException  {
		
		MemberVO vo = (MemberVO)session.getAttribute("user");
		
		marketVO.setProduct_seller(vo.getMem_num());
		//파일 업로드
		int count = Integer.parseInt(request.getParameter("count"));
		if(count>0) {
			for(int i=0;i<count;i++) {
				switch (i){
					case 0: marketVO.setFilename0(request.getParameter("fileName0"));
					break;
					
					case 1: marketVO.setFilename1(request.getParameter("fileName1"));
					break;
					
					case 2: marketVO.setFilename1(request.getParameter("fileName2"));
					break;
					
					case 3: marketVO.setFilename2(request.getParameter("fileName3"));
					break;
				}
				
			}
		}
		
		
		
		//글쓰기
		marketService.insertMarket(marketVO);
		
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
