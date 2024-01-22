package kr.spring.matching.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatchingController {

	@RequestMapping("/matching/mmain")
	public String mmain() {
		return "matching/mmain";
	}
}
