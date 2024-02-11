package kr.spring.market.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.market.service.MarketService;
import kr.spring.market.vo.MarketChatRoomVO;
import kr.spring.market.vo.MarketChatVO;
import kr.spring.market.vo.MarketVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.util.FileUtil;
import kr.spring.util.PageUtil;
import kr.spring.util.StringUtil;
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
		log.debug("<<글 작성 MarketVO>> : " + marketVO);
		
		
		MemberVO vo = (MemberVO)session.getAttribute("user");
		log.debug("user:" + vo.getMem_num() );
		marketVO.setProduct_seller(vo.getMem_num());
		//파일 업로드
		int count = Integer.parseInt(request.getParameter("count"));
		
		if (count > 0) {
		    for (int i = 0; i < count; i++) {
		        switch (i) {
		            case 0:
		            	marketVO.setFilename0(FileUtil.createMultiFile(request, marketVO.getUpload(), i));
		                break;
		            case 1:
		            	marketVO.setFilename1(FileUtil.createMultiFile(request, marketVO.getUpload(), i));
		                break;
		            case 2:
		            	marketVO.setFilename2(FileUtil.createMultiFile(request, marketVO.getUpload(), i));
		            	break;
		            case 3:
		            	marketVO.setFilename3(FileUtil.createMultiFile(request, marketVO.getUpload(), i));
		            	break;
		            default:
		            		break;
		        }
		    }
		}
		
		log.debug("<<글 작성2 MarketVO>> : " + marketVO);
		
		marketVO.setProduct_place(request.getParameter("placeAddress"));
		marketVO.setProduct_placeDetail(request.getParameter("placeDetail"));
		
		//글쓰기
		marketService.insertMarket(marketVO);
		
		//View에 표시할 메시지
		model.addAttribute("message","글쓰기가 완료되었습니다.");
		model.addAttribute("url",request.getContextPath()+"/market/list?category=0");
		return "common/resultAlert";
	}
  
	/*=================================
	 * 장터 글 리스트 조회
	 *=================================*/
	@RequestMapping("/market/list")
	public ModelAndView process(
			       @RequestParam(value="pageNum",defaultValue="1") int currentPage,
			       @RequestParam(value="category") int category,
			       String market_keyword, HttpSession session) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", market_keyword);
		map.put("category", category);
		
		
		
		//전체/검색 레코드수
		int count = marketService.selectRowCount(map);
		log.debug("<<count>> : " + count);
		
		PageUtil page = new PageUtil(null,market_keyword,currentPage,
				                     count,12,10,"list");
		
		List<MarketVO> list = null;
		if(count > 0) {
			map.put("start",page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = marketService.selectList(map);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("marketList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		mav.addObject("category", category);
		return mav;
	}
	/*=================================
	 * 장터 글 상세
	 *=================================*/
	@RequestMapping("/market/detail")
	public ModelAndView process(@RequestParam int product_num) {
		
		//상품번호를 통한 상세 조회
		MarketVO vo = marketService.selectMarketDetail(product_num);
		//제목에 태그를 허용하지 않음
		vo.setProduct_title(StringUtil.useNoHtml(vo.getProduct_title()));
								//타일즈설정명,     속성명,  속성값
		return new ModelAndView("marketDetail","market",vo);
	}
	
	/*=================================
	 * 장터 글 수정
	 *=================================*/
	//수정 폼 호출
		@GetMapping("/market/modify")
		public String formUpdate(@RequestParam int product_num,Model model) {
			MarketVO marketVO = marketService.selectMarketDetail(product_num);
			
			model.addAttribute("market",marketVO);
			
			return "marketModify";
	}
	@PostMapping("/market/modify")
	public String submitModify(MarketVO marketVO,HttpServletRequest request,HttpSession session,
            Model model ) throws IllegalStateException, IOException  {
		log.debug("<<글 수정 MarketVO>> : " + marketVO);
	
		
		MemberVO vo = (MemberVO)session.getAttribute("user");
		log.debug("user:" + vo.getMem_num() );
		marketVO.setProduct_seller(vo.getMem_num());
		//파일 업로드
		int count = Integer.parseInt(request.getParameter("count"));
		
		if (count > 0) {
		    for (int i = 0; i < count; i++) {
		        switch (i) {
		            case 0:
		            	marketVO.setFilename0(FileUtil.createMultiFile(request, marketVO.getUpload(), i));
		                break;
		            case 1:
		            	marketVO.setFilename1(FileUtil.createMultiFile(request, marketVO.getUpload(), i));
		                break;
		            case 2:
		            	marketVO.setFilename2(FileUtil.createMultiFile(request, marketVO.getUpload(), i));
		            	break;
		            case 3:
		            	marketVO.setFilename3(FileUtil.createMultiFile(request, marketVO.getUpload(), i));
		            	break;
		            default:
		            		break;
		        }
		    }
		}
		
		log.debug("<<글 수정2 MarketVO>> : " + marketVO);
		
		marketVO.setProduct_place(request.getParameter("placeAddress"));
		marketVO.setProduct_placeDetail(request.getParameter("placeDetail"));
		int product_num = marketVO.getProduct_num();
		
		//글수정
		marketService.updateMarket(product_num);
		
		//View에 표시할 메시지
		model.addAttribute("message","글수정이 완료되었습니다.");
		model.addAttribute("url",request.getContextPath()+"/market/detail?product_num="+product_num);
		return "common/resultAlert";
	}
	/*=================================
	 * 장터 글 삭제
	 *=================================*/
	@RequestMapping("/market/delete")
	public void delete() {
		
	}
	/*=================================
	 * 장터 채팅방 조회 및 생성
	 *=================================*/
	@RequestMapping("/market/marketChatRoom")
	public String process(MarketChatRoomVO chatRoomVO,@RequestParam(required=false) Integer product_num,
						   @RequestParam(required=false) Integer product_seller,
						   HttpSession session,Model model) {
		MemberVO vo = (MemberVO)session.getAttribute("user");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("mem_num",vo.getMem_num());
		chatRoomVO.setProduct_num(product_num);
		chatRoomVO.setSeller_num(product_seller);
		chatRoomVO.setBuyer_num(vo.getMem_num());
		
		List<MarketChatRoomVO> list = null;
		if(product_num == null && product_seller == null) { //프로필에서 채팅방 조회 
			list = marketService.selectChatRoomList(vo.getMem_num());//사용자의 전체 채팅 리스트
	
			model.addAttribute("chatList", list);
			
			return "marketChatRoom";
		}else {//장터 글에서 채팅방 조회
			map.put("product_num", product_num);
			map.put("seller_num", product_seller);
			int check = marketService.selectChatRoomCheck(map);
			
			if(check == 0 ) {//채팅방이 없다면 채팅방 생성후 조회
				marketService.insertChatRoom(chatRoomVO);
				chatRoomVO = marketService.selectChatRoom(map);
				int chatRoomNum = chatRoomVO.getChatRoom_num();//해당 채팅방의 채팅내역을 같이 불러오기 위한 채팅방 번호
				list = marketService.selectChatRoomList(vo.getMem_num());//사용자의 전체 채팅 리스트
				
				model.addAttribute("chatRoomNum", chatRoomNum);
				model.addAttribute("chatList", list);
				return "marketChatRoom";
			}
			else {//채팅방이 있다면 채팅방 조회
				chatRoomVO = marketService.selectChatRoom(map);
				int chatRoomNum = chatRoomVO.getChatRoom_num();//해당 채팅방의 채팅내역을 같이 불러오기 위한 채팅방 번호
				list = marketService.selectChatRoomList(vo.getMem_num());//사용자의 전체 채팅 리스트
				
				model.addAttribute("chatRoomNum", chatRoomNum);
				model.addAttribute("chatList", list);
				return "marketChatRoom";
			}
		}
		

	}
	/*=================================
	 * 장터 채팅메시지 조회
	 *=================================*/
	//채팅 메시지 페이지 호출
		@RequestMapping("/market/marketChatDetailAjax")
		@ResponseBody
		public Map<String,Object> talkDetail(@RequestParam int chatRoom_num,
				                HttpSession session) {
			Map<String,Object> mapAjax = new HashMap<String,Object>();
			
			MemberVO user = (MemberVO)session.getAttribute("user");
			if(user==null) {//로그인이 되지 않은 경우
				mapAjax.put("result", "logout");
			}else {//로그인 된 경우
				Map<String,Integer> map = new HashMap<String,Integer>();
				map.put("chatRoom_num", chatRoom_num);
				map.put("mem_num", user.getMem_num());
				
				MarketChatRoomVO product_detail = marketService.selectChatRoomDetail(chatRoom_num);//해당 채팅방의 거래 상품 정보
				log.debug("<<product_detail>> :" + product_detail);
				List<MarketChatVO> list = marketService.selectChatDetail(map);
				
				mapAjax.put("result", "success");
				mapAjax.put("product_detail", product_detail);
				mapAjax.put("list", list);
				mapAjax.put("user_num", user.getMem_num());			
			}		
			
			
			return mapAjax;
		
		}
		
		//채팅 메시지 전송
		@RequestMapping("/market/writeChatAjax")
		@ResponseBody
		public Map<String,Object> writeChatAjax(MarketChatVO vo, HttpSession session){
			
			Map<String,Object> mapAjax = new HashMap<String,Object>();
			
			MemberVO user = (MemberVO)session.getAttribute("user");
			if(user==null) {//로그인이 되지 않은 경우
				mapAjax.put("result", "logout");
			}else {//로그인 된 경우
				vo.setMem_num(user.getMem_num());
				
				log.debug("<<채팅 메시지 등록 TalkVO>> : " + vo);
				marketService.insertChat(vo);
				
				mapAjax.put("result", "success");
			}
			return mapAjax;
		}
		//구매확정 요청 채팅 메시지 전송
		@RequestMapping("/market/saleCommitAjax")
		@ResponseBody
		public Map<String,Object> chatCommitAjax(MarketChatVO vo, HttpSession session,@RequestParam int chatRoom_num){
			
			Map<String,Object> mapAjax = new HashMap<String,Object>();
			
			MemberVO user = (MemberVO)session.getAttribute("user");
			if(user==null) {//로그인이 되지 않은 경우
				mapAjax.put("result", "logout");
			}else {//로그인 된 경우
				vo.setMem_num(user.getMem_num());
				vo.setChatRoom_num(chatRoom_num);
				vo.setChat_message("판매자가 구매확정을 요청합니다.버튼을 누르면 구매가 확정됩니다.");
				vo.setChat_saleCommit(1);		
				
				log.debug("<<구매확정 요청 채팅 메시지 등록 >> : " + vo);
				marketService.insertCommitChat(vo);
				
				mapAjax.put("result", "success");
			}
			return mapAjax;
		}
	
		//구매확정 요청 채팅 메시지 전송
				@RequestMapping("/market/saleCommit2Ajax")
				@ResponseBody
				public Map<String,Object> chatCommit2Ajax(MarketChatVO vo, HttpSession session,@RequestParam int chatRoom_num){
					
					Map<String,Object> mapAjax = new HashMap<String,Object>();
					
					MemberVO user = (MemberVO)session.getAttribute("user");
					if(user==null) {//로그인이 되지 않은 경우
						mapAjax.put("result", "logout");
					}else {//로그인 된 경우
						vo.setMem_num(user.getMem_num());
						vo.setChatRoom_num(chatRoom_num);
						vo.setChat_message("구매자가 구매를 확정했습니다.");	
						
						MarketChatRoomVO chatRoomVO = marketService.selectChatRoomDetail(chatRoom_num);
						int product_num = chatRoomVO.getProduct_num();
						
						log.debug("<<구매확정 채팅 메시지 등록 >> : " + vo);
						marketService.insertChat(vo);
						//판매상태 업데이트
						marketService.updateProductSale(product_num);
						mapAjax.put("result", "success");
					}
					return mapAjax;
				}
     /*=================================
      * 장터 채팅방 삭제 및 채팅 내역 삭제
      *=================================*/
	 @RequestMapping("/market/deleteChatRoom")
	 @ResponseBody
	 public Map<String,Object> deleteChatRoom(HttpSession session,@RequestParam int chatRoom_num) {
		 Map<String,Object> mapAjax = new HashMap<String,Object>();
			
			MemberVO user = (MemberVO)session.getAttribute("user");
			if(user==null) {//로그인이 되지 않은 경우
				mapAjax.put("result", "logout");
			}else {//로그인 된 경우
			     marketService.deleteChatRoom(chatRoom_num);//채팅방,채팅내역 삭제
				mapAjax.put("result", "success");
			}
			return mapAjax;
	 }
}
