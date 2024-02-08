package kr.spring.board.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.board.service.BoardService;
import kr.spring.board.vo.BoardFavVO;
import kr.spring.board.vo.BoardReplyVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.PageUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardAjaxController {
	@Autowired
	private BoardService boardService;
	/*=====================
	 * 부모글 좋아요 읽기
	 *=====================*/
	@RequestMapping("/community/getFav")
	@ResponseBody
	public Map<String, Object> getFav(BoardFavVO fav, HttpSession session){
		log.debug("<<게시판 좋아요 BoardFavVO>> : " + fav);
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			//로그인된 회원번호 세팅
			fav.setMem_num(user.getMem_num());
			
			BoardFavVO boardFav = boardService.selectFav(fav);
			
			if(boardFav != null) {//fav_status테이블에 데이터가 있는 경우
				if(boardFav.getFav_status()==1) {//이미 좋아요가 눌러져 있는 경우
					mapJson.put("status", "yesFav");
				}else {//이미 싫어요가 눌러져 있는 경우
					mapJson.put("status", "yesHate");
				}
			}else {//fav_status테이블에 데이터가 없는 경우
				mapJson.put("status", "emptyFav");
			}
		}
		//좋아요 수
		mapJson.put("favCount", boardService.selectFavCount(fav.getBoard_num()));
		//싫어요 수
		mapJson.put("hateCount", boardService.selectHateCount(fav.getBoard_num()));
		//합산
		mapJson.put("favHateSum", boardService.selectFavHateSum(fav.getBoard_num()));
		return mapJson;
	}
	
	/*===========================
	 * 부모글 좋아요 등록/삭제
	 *==========================*/
	@RequestMapping("/community/writeFav")
	@ResponseBody
	public Map<String, Object> writeFav(BoardFavVO fav, HttpSession session){
		log.debug("<<부모글 좋아요/싫어요 등록 및 삭제 BoardFavVO>> : " + fav);

		Map<String, Object> mapJson = new HashMap<String, Object>();

		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user==null) {
			mapJson.put("result", "logout");
		}else {
			//로그인된 회원번호 세팅
			fav.setMem_num(user.getMem_num());

			//이전에 좋아요를 등록했는지 여부 확인
			BoardFavVO boardFavVO = boardService.selectFav(fav);
			if(boardFavVO!=null) {//좋아요나 싫어요가 눌러져있는 경우
				//좋아요를 누른 경우
				if(boardFavVO.getFav_status()==1) {
					//좋아요 중복 클릭한 경우
					if(fav.getFav_status()==1) {
						boardService.deleteFav(fav);
						mapJson.put("status", "noFav");
					//좋아요 누른 상태에서 싫어요 클릭한경우	
					}else {
						boardService.switchFav(fav);
						mapJson.put("status", "yesHate");
					}
				//싫어요를 누른 경우	
				}else {
					//싫어요 중복 클릭한 경우
					if(fav.getFav_status()==2) {
						boardService.deleteFav(fav);
						mapJson.put("status", "noHate");
					//싫어요 누른 상태에서 좋아요 클릭한경우	
					}else {
						boardService.switchFav(fav);
						mapJson.put("status", "yesFav");
					}
				}
			}else {//좋아요나 싫어요가 눌러있지 않은 경우
				boardService.insertFav(fav);
				if(fav.getFav_status()==1) {
					boardService.updateFav(fav);
					mapJson.put("status", "yesFav");
				}else {
					boardService.updateFav(fav);
					mapJson.put("status", "yesHate");
				}
				
			}
			mapJson.put("result", "success");
			mapJson.put("board_num", fav.getBoard_num());
			mapJson.put("fav_status", fav.getFav_status());
			mapJson.put("fav_date", fav.getFav_date());
			mapJson.put("favCount", boardService.selectFavCount(fav.getBoard_num()));
			mapJson.put("hateCount", boardService.selectHateCount(fav.getBoard_num()));
			mapJson.put("favHateSum", boardService.selectFavHateSum(fav.getBoard_num()));
		}
		return mapJson;
	}
	
	/*===========================
	 * 댓글 작성
	 *==========================*/
	@RequestMapping("/community/writeReply")
	@ResponseBody
	 public Map<String, String> writeReply(BoardReplyVO boardReplyVO, 
			 							   HttpSession session, 
			 							   HttpServletRequest request){
		 log.debug("<<댓글 등록 BoardReplyVO>> : " + boardReplyVO);
		 
		 Map<String, String> mapJson = new HashMap<String, String>();
		 
		 MemberVO user = (MemberVO)session.getAttribute("user");
		 if(user == null) {
			 //로그인 안됨
			 mapJson.put("result", "logout");
		 }else {
			 //회원번호 등록
			 boardReplyVO.setMem_num(user.getMem_num());
			 //ip등록
			 boardReplyVO.setRe_ip(request.getRemoteAddr());
			 //댓글 등록
			 boardService.insertReply(boardReplyVO);
			 mapJson.put("result", "success");
		 }
		 return mapJson;
	 }
	/*===========================
	 * 대댓글 작성
	 *==========================*/
	@RequestMapping("/community/replies")
	@ResponseBody
	 public Map<String, String> replies(BoardReplyVO boardReplyVO, 
			 							   HttpSession session, 
			 							   HttpServletRequest request){
		 log.debug("<<대댓글 등록 BoardReplyVO>> : " + boardReplyVO);
		 
		 Map<String, String> mapJson = new HashMap<String, String>();
		 
		 MemberVO user = (MemberVO)session.getAttribute("user");
		 if(user == null) {
			 //로그인 안됨
			 mapJson.put("result", "logout");
		 }else {
			 //회원번호 등록
			 boardReplyVO.setMem_num(user.getMem_num());
			 //ip등록
			 boardReplyVO.setRe_ip(request.getRemoteAddr());
			 boardReplyVO.setRe_depth(1);
			 //댓글 등록
			 boardService.insertReplies(boardReplyVO);
			 mapJson.put("result", "success");
		 }
		 return mapJson;
	 }
	
	
	/*===========================
	 * 댓글 목록 조회
	 *==========================*/
	@RequestMapping("/community/listReply")
	@ResponseBody
	public Map<String,Object> getList(
			@RequestParam(value="pageNum",defaultValue="1") int currentPage,
			@RequestParam(value="rowCount",defaultValue="10") int rowCount,
			@RequestParam int board_num,HttpSession session){
			log.debug("<<댓글 목록 board_num>> : " + board_num);
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("board_num", board_num);
			
			//전체 레코드수
			int count = boardService.selectRowCountReply(map);
			//페이지 처리
			PageUtil page = new PageUtil(currentPage,count,rowCount);
			
			List<BoardReplyVO> list = null;
			if(count > 0) {
				map.put("start", page.getStartRow());
				map.put("end", page.getEndRow());
				list = boardService.selectListReply(map);
			}else {
				list = Collections.emptyList();
			}
			
			Map<String,Object> mapJson = new HashMap<String,Object>();
			mapJson.put("count", count);
			mapJson.put("list", list);
			
			//로그인한 회원정보 셋팅
			MemberVO user = (MemberVO)session.getAttribute("user");
			if(user!=null) {
				mapJson.put("user_num", user.getMem_num());
			}		
			return mapJson;
		}
		
}
