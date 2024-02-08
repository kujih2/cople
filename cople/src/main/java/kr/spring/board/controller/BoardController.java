package kr.spring.board.controller;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.board.service.BoardService;
import kr.spring.board.vo.BoardVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PageUtil;
import kr.spring.util.StringUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	/*===========================
	 * 커뮤니티 메인페이지 호출
	 *==========================*/
	@RequestMapping("/community/commuMain")
	public String commuMain() {
		return "commuMain";
	}
	
	/*===========================
	 * 게시판 글 등록 
	 *==========================*/
	//자바빈(VO) 초기화
	@ModelAttribute
	public BoardVO initCommand() {
		return new BoardVO();
	}
	
	//등록 홈 호출
	@GetMapping("/community/boardWrite")
	public String form() {
		return "boardWrite";
	}
	
	//전송된 데이터 처리
	@PostMapping("/community/boardWrite")
	public String submit(@Valid BoardVO boardVO, BindingResult result, HttpServletRequest request, 
								HttpSession session, Model model,@RequestParam(name="notice", required = false)String notice ) throws IllegalStateException, IOException {
		log.debug("<<게시판 글 저장>> : " + boardVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return form();
		}
		
	
		//회원 번호 셋팅
		MemberVO vo = (MemberVO)session.getAttribute("user");
		boardVO.setMem_num(vo.getMem_num());
		//ip셋팅
		boardVO.setIp(request.getRemoteAddr());
		//auth값 설정
		if("9".equals(notice)) {
			boardVO.setAuth(9);
		}
		
		//글쓰기
		boardService.insertBoard(boardVO);
		
		//View에 표시할 메시지
		model.addAttribute("message", "작성 완료");
		model.addAttribute("url",request.getContextPath()+"/community/boardList");
		
		return "common/resultAlert";
	}
	/*===========================
	 * 게시판 글 목록 
	 *==========================*/
	@RequestMapping("/community/boardList")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
			@RequestParam(value="order",defaultValue="1") int order, 
			String keyfield,String keyword)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//전체/검색 레코드수
		int count = boardService.selectRowCount(map);
		log.debug("<<board count>> : " + count);
		
		PageUtil page = new PageUtil(keyfield, keyword, currentPage, count,20,5, "boardList", "&order="+order);
		
		List<BoardVO> list = null;
		if(count > 0) {
			map.put("order", order);
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = boardService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("boardList");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("page",page.getPage());
		
		return mav;
	}
	
	/*===========================
	 * 게시판 글 상세
	 *==========================*/
	@RequestMapping("/community/boardDetail")
	public ModelAndView process(@RequestParam int board_num) {
		log.debug("<<게시판 글 상세 board_num>> : " + board_num);
		
		//해당 글의 조회수 증가
		boardService.updateHit(board_num);
		
		BoardVO board = boardService.detailBoard(board_num);
		//제목에 태그를 허용하지 않음
		board.setTitle(StringUtil.useNoHtml(board.getTitle()));
								//타일스설정명,  속성명, 속성값
		return new ModelAndView("boardDetail","board",board);
	}
	
	/*===========================
	 * 게시판 글 수정
	 *==========================*/
	//수정 폼 호출
	@GetMapping("/community/boardUpdate")
	public String formUpdate(@RequestParam int board_num,Model model) {
		BoardVO boardVO = boardService.detailBoard(board_num);
		
		model.addAttribute("boardVO",boardVO);
		
		return "boardUpdate";
	}
	//수정 폼에서 전송된 데이터 처리
	@PostMapping("/community/boardUpdate")
	public String submitUpdate(@Valid BoardVO boardVO, BindingResult result,
								HttpServletRequest request, Model model) throws IOException {
		log.debug("<<글 수정>> : " + boardVO);
		
		//유효성 체크 결과 오류가 있으면 폼 호출
		if(result.hasErrors()) {
			return "boardUpdate";
		}
		//ip 셋팅
		boardVO.setIp(request.getRemoteAddr());
		
		//글 수정
		boardService.updateBoard(boardVO);
		
		//View에 표시할 메세지
		model.addAttribute("message","글 수정 완료");
		model.addAttribute("url", request.getContextPath()+"/community/boardDetail?board_num="+boardVO.getBoard_num());
		
		return "common/resultAlert";
	}
	
	/*===========================
	 * 게시판 글 삭제
	 *==========================*/
	@RequestMapping("/community/boardDelete")
	public String submitDelete(@RequestParam int board_num, HttpServletRequest request) {
		log.debug("<<게시판 글 삭제>> : " + board_num);
		
		//글 삭제
		boardService.deleteBoard(board_num);
		
		return "redirect:/community/boardList";
	}
}
