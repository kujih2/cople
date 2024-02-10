package kr.spring.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.matching.service.MatchingService;
import kr.spring.matching.vo.AdviceVO;
import kr.spring.matching.vo.LetterVO;
import kr.spring.member.service.MemberService;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PageUtil;
import kr.spring.util.StringUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class JobsController {
	
	@ModelAttribute
	public LetterVO init1() {
		return new LetterVO();
	}
	
	@ModelAttribute
	public AdviceVO init2() {
		return new AdviceVO();
	}
	
	@Autowired
	private MatchingService matchingService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/myPage/myAction")
	public String jobsMain(HttpServletRequest request, HttpSession session, Model model) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		model.addAttribute("user", user);

	    return "MyActionMain";	
	}
	
	/*
	 * @RequestMapping("myPage/myLetter") public String letterMain() {
	 * 
	 * return "MyLetterAction"; }
	 */
	
	@RequestMapping("/myPage/myLetter")
	public ModelAndView receivedLetter(@RequestParam(value="pageNum",defaultValue="1") int currentPage, HttpSession session,
									String keyfield, String keyword) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		int mem_num = user.getMem_num();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("receiver", mem_num);
		
		int count = matchingService.receivedLetterCount(mem_num);
		log.debug("<<letter Count >> : " + count);
		
		PageUtil page = new PageUtil(keyfield, keyword, currentPage, count, 20, 10, "MyLetterAction");
		
		List<LetterVO> list = null;
		if(count>0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = matchingService.selectReceivedLetter(map);
			log.debug("<<LetterVO list >> : " + list);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("page",page.getPage());
		mav.setViewName("MyLetterAction");
		
		return mav;
	}
	
	@RequestMapping("/myPage/letterDetail")
	public String letterDetail(HttpSession session, Model model, HttpServletRequest request, int letter_num) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user==null) {
			model.addAttribute("message", "회원만 이용 가능합니다.");
			model.addAttribute("url", request.getContextPath() + "/member/login");

			return "matching/resultAlert";
		}
		
		log.debug("<<LetterDetail user >> : " + user);
			LetterVO letterVO = matchingService.readLetter(letter_num);
			log.debug("<<LetterDetail letterVO >> : " + letterVO);
			String sender = memberService.selectMember(letterVO.getSender()).getId();
			String receiver = memberService.selectMember(letterVO.getReceiver()).getId();
			log.debug("<<LetterDetail sender >> : " + sender);
			
			model.addAttribute("letter", letterVO);
			model.addAttribute("sender", sender);
			model.addAttribute("receiver", receiver);
			log.debug("<<user.getId >> : " + user.getId());
			String userId = user.getId();
			model.addAttribute("userId", userId);
			model.addAttribute("letter_num", letter_num);
			
			return "LetterDetail";	
	}
	
	@GetMapping("/myPage/letterAnswer")
	public String letterAnswer(HttpSession session, Model model, HttpServletRequest request, int letter_num) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user==null) {
			model.addAttribute("message", "회원만 이용 가능합니다.");
			model.addAttribute("url", request.getContextPath() + "/member/login");

			return "matching/resultAlert";
		}
		
		model.addAttribute("login_user", user);
		
		
		
		return "LetterAnswer";
	}
	//쪽지답장하기
	@GetMapping("myPage/answer_letter")
	public String answer_letter(HttpServletRequest request, HttpSession session, 
			String user_id, Model model) {

		MemberVO user = (MemberVO)session.getAttribute("user");
		log.debug("<<MemberVO (login)>> : " + user);
		log.debug("<<user_id mem_num >> : " + user_id);

		if(user==null) {//로그인 되지 않은 경우
			model.addAttribute("message", "회원만 이용가능합니다.");
			model.addAttribute("url", request.getContextPath() + "/member/login");

			return "matching/resultAlert";
		}else {//로그인, Auth가 1인 경우
			model.addAttribute("login_user", user);
			model.addAttribute("receive_user", user_id);
		}

		return "matching/answer_letter";
	}
	//쪽지답장하기
	@PostMapping("myPage/answer_letter")
	public String sendletter_result(HttpServletRequest request, HttpSession session, 
			Model model, @Valid LetterVO letterVO, BindingResult result, int sender, String receiverId) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user==null) {
			model.addAttribute("message", "회원만 이용 가능합니다.");
			model.addAttribute("url", request.getContextPath() + "/member/login");
		}else {
			
			if(result.hasErrors()) {
				log.debug("<<result.getFieldValue(\"receiver\");>> : " +result.getFieldValue("receiver"));
				
				for (FieldError error : result.getFieldErrors()) {
		            log.error("Field: " + error.getField() + ", Error: " + error.getDefaultMessage());
		        }
				
				return answer_letter(request, session, receiverId, model);
			}
			
			log.debug("<<여기까지?>>");
			int receiverMem_num = matchingService.findMemnumById(receiverId);
			
			letterVO.setSender(sender);
			letterVO.setReceiver(receiverMem_num);
			letterVO.setLetter_ip(request.getRemoteAddr());
			matchingService.insertLetter(letterVO);

			model.addAttribute("message", "메세지가 성공적으로 전송되었습니다.");
			model.addAttribute("url", request.getContextPath() + "myLetter");
		}
		
		return "matching/resultAlert";
	}
	
	//첨삭 시작
	@RequestMapping("/myPage/myAdvice")
	public ModelAndView receivedAdvice(@RequestParam(value="pageNum",defaultValue="1") int currentPage, HttpSession session,
									String keyfield, String keyword) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		int mem_num = user.getMem_num();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		map.put("receiver", mem_num);
		
		int count = matchingService.receivedAdviceCount(mem_num);
		log.debug("<<Advice Count >> : " + count);
		
		PageUtil page = new PageUtil(keyfield, keyword, currentPage, count, 20, 10, "MyAdviceAction");
		
		List<AdviceVO> list = null;
		if(count>0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = matchingService.selectReceivedAdvice(map);
			log.debug("<<LetterVO list >> : " + list);
			
			if (list != null && !list.isEmpty()) {
			    for (AdviceVO adviceVO : list) {
			        adviceVO.setAdvice_content(StringUtil.useNoHtml(adviceVO.getAdvice_content()));
			    }
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("count",count);
		mav.addObject("page",page.getPage());
		mav.setViewName("MyAdviceAction");
		
		return mav;
	}
}
