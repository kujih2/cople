package kr.spring.wiki.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.wiki.service.WikiService;
import kr.spring.wiki.vo.WikiVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WikiAjaxController {
	@Autowired
	private WikiService wikiService;

	@RequestMapping("/wiki/internalSearchAjax") 
	@ResponseBody
	public Map<String,Object> internalSearch(@RequestParam String doc_name){
		Map<String,Object> mapJson = new HashMap<String,Object>();
		
		List<WikiVO> wikiList = wikiService.searchInternal(doc_name);
		mapJson.put("result", "success");
		mapJson.put("wikiList", wikiList);
		
		return mapJson;
	}
}
