package kr.spring.wiki.controller;

import javax.servlet.http.HttpServletRequest;

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

import kr.spring.util.StringUtil;
import kr.spring.wiki.service.WikiService;
import kr.spring.wiki.vo.WikiVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WikiController {
	@Autowired
	private WikiService wikiService;
	/*=================
	 * 위키 문서 생성
	 ==================*/
	//자바빈VO 초기화
	@ModelAttribute
	public WikiVO initCommand() {
		return new WikiVO();
	}
	//생성 폼 호출
	@GetMapping("/wiki/write")
	public String form() {
		return "wikiWrite";
	}
	/*=================
	 * 위키 글 상세
	 ==================*/
	@RequestMapping("/wiki/detail")
	public ModelAndView process(@RequestParam int doc_num) {
		log.debug("<<위키 글 상세 doc_num>> : "+doc_num);
	    log.debug("Before selectWiki method");

		WikiVO wiki = wikiService.selectWiki(doc_num);   
		log.debug("After selectWiki method");

		log.debug("wiki:"+wiki);
		//wiki.setDoc_name(StringUtil.useNoHtml(wiki.getDoc_name()));
		
		return new ModelAndView("wikiDetail","wiki",wiki);
	}
	
	/*=================
	 * 위키 글 편집
	 ==================*/
	@GetMapping("wiki/update")
	public String formUpdate(@RequestParam int doc_num,@RequestParam int update_num, Model model) {
		WikiVO wikiVO = wikiService.selectWiki(doc_num);
		model.addAttribute("wikiVO",wikiVO);
		
		return "wikiUpdate";
	}
	@PostMapping("/wiki/update")
	public String submitUpdate(int update_num,WikiVO wikiVO,BindingResult result,HttpServletRequest request, Model model) {
		log.debug("<<위키 편집>> : "+wikiVO);
		wikiService.updateWiki(update_num,wikiVO);
		
		model.addAttribute("message","편집 완료");
		model.addAttribute("url",request.getContextPath()+"/wiki/detail?doc_num="+wikiVO.getDoc_num());
		
		return "common/resultAlert";
	}

	
	
}
