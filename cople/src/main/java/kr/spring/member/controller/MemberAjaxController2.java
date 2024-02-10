package kr.spring.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.matching.service.MatchingService;
import kr.spring.matching.vo.EmpVO;
import kr.spring.member.service.MemberService2;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.FileUtil;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberAjaxController2 {
	@Autowired
	private MemberService2 memberService;
	@Autowired
	private MatchingService matchingService;
	
	@RequestMapping("/member/registerUser1")
	@ResponseBody
	public Map<String,Object> memberRegister(@RequestParam(required = false) Integer auth_index,@Valid MemberVO memberVO, HttpSession session,Model model,HttpServletRequest request) throws IllegalStateException, IOException{
		System.out.println("<<memberVO>> : "+memberVO);
		System.out.println("<<auth_index>> : "+auth_index);

		Map<String,Object> mapJson = new HashMap<String,Object>();
		memberVO.setCertify_photo_name(FileUtil.createFile(request, memberVO.getUploaded_certify_photo()));
		MemberVO reg_memberVO = memberService.insertMember(memberVO);
		if(auth_index != null) {
			if(auth_index==1 || auth_index==3) {
				mapJson.put("result", "success1");
			}else if(auth_index==2) {
				mapJson.put("result", "success2");
				mapJson.put("mem_num", reg_memberVO.getMem_num());
			}
		}else {
			mapJson.put("result", "failed");
		}
		
		
		return mapJson;
	}
	@RequestMapping("/member/registerUser2")
	@ResponseBody
	public Map<String,Object> empRegister(@Valid EmpVO empVO,Model model,HttpServletRequest request) throws IllegalStateException, IOException{
		empVO.setFilename(FileUtil.createFile(request, empVO.getUpload()));
		Map<String,Object> mapJson = new HashMap<String,Object>();
		System.out.println("<<empVO>> : "+empVO);
		matchingService.insertEmp(empVO);

		
		mapJson.put("result", "success");
		

		
		return mapJson;
	}
}
