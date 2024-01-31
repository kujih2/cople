package kr.spring.matching.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.spring.matching.service.MatchingService;
import kr.spring.matching.vo.EmpVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.FileUtil;
import kr.spring.util.PageUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MatchingController {

	@Autowired
	MatchingService matchingService;

	@RequestMapping("/matching/mmain")
	public String mmain(@RequestParam(defaultValue="1") int currentPage, Model model,
						@RequestParam(value="rowCount",defaultValue="10") int rowCount,
						HttpSession session) throws JsonProcessingException {

		Map<String,Object> map = new HashMap<String,Object>();
		List<Map<String,Double>> mapDataList = new ArrayList();
		List<EmpVO> empList;

		//리스트를 만들기 위한 페이지 처리
		int count = matchingService.selectEmpCount();
		PageUtil page = new PageUtil(currentPage,count,rowCount);
		map.put("start", page.getStartRow());
		map.put("end", page.getEndRow());
		//리스트 생성
		
		if(count>0) {
			empList = matchingService.listEmp(map);
			log.debug("<<listEmp >> : " + map);
			ObjectMapper objectMapper = new ObjectMapper();
			String empListJson = objectMapper.writeValueAsString(empList);
			model.addAttribute("empListJson", empListJson);
		}else {
			empList = Collections.emptyList();
		}
		log.debug("<<empList>> : " + empList);

		//주소 좌표 정보 JSON 처리

	  for(EmpVO empVO : empList) { 
		  if (empVO.getLocation_api_lat() != null && empVO.getLocation_api_lng() != null) {
			  
		  Map<String,Double> mapData = new LinkedHashMap<String,Double>();
		  mapData.put("lat",Double.valueOf(empVO.getLocation_api_lat())); 
		  mapData.put("lng",Double.valueOf(empVO.getLocation_api_lng()));
		  mapData.put("user_num",Double.valueOf(empVO.getMem_num()));
		 
		  mapDataList.add(mapData); 
		  }
	  }

		//JSON 데이터 생성
		ObjectMapper mapper = new ObjectMapper();
		String ajaxMapData = "{\"positions\": "; 
		ajaxMapData += mapper.writeValueAsString(mapDataList);
		ajaxMapData += "}";
		model.addAttribute("ajaxMapData", ajaxMapData);
		
		log.debug("<<mapDataList >> : " + ajaxMapData);
		

		return "matchingMain";
	}

	@RequestMapping("/matching/emp_register")
	public String main(
			HttpSession session, Model model, HttpServletRequest request) throws JsonProcessingException {

		MemberVO user = (MemberVO)session.getAttribute("user");


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



	@RequestMapping("/matching/my_emp_register")
	public String main2(HttpSession session, Model model, HttpServletRequest request) {

		MemberVO user = (MemberVO)session.getAttribute("user");


		if(user==null) {
			//View에 표시할 메시지
			model.addAttribute("message", "수강생 회원만 이용가능합니다.");
			model.addAttribute("url", request.getContextPath()+ "/member/login");

			return "matching/resultAlert";
		}else if(user.getAuth()!=2) {
			//View에 표시할 메시지
			model.addAttribute("message", "현직자만 이용가능합니다.");
			model.addAttribute("url", request.getContextPath()+ "/member/login");

			return "matching/resultAlert";
		}
		else {
			EmpVO empVO = matchingService.selectEmp(user.getMem_num());
			model.addAttribute("empVO",empVO);
		}

		return "matching/my_emp_register";
	}

	@PostMapping("/matching/empInsert")
	public String registerEmp(@Valid EmpVO empVO, BindingResult result, Model model, HttpSession session, 
			HttpServletRequest request) throws IllegalStateException, IOException {

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
