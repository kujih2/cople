package kr.spring.wiki.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.view.RedirectView;

import kr.spring.member.vo.MemberVO;
import kr.spring.util.PageUtil;
import kr.spring.util.StringUtil;
import kr.spring.wiki.service.WikiService;
import kr.spring.wiki.vo.WikiVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WikiController {
   @Autowired
   private WikiService wikiService; 
   
   //최근변경된 문서들 목록 불러오기
   public List<WikiVO> wikiLatest(Model model) {
        List<WikiVO> latest = wikiService.selectLatest();
        return latest;
    }
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
   public ModelAndView createDoc(@RequestParam String doc_name,Model model) {
      log.debug("<<Controller-생성폼호출/새로 생성될 위키 문서 이름 >>:"+doc_name);
      //위키문서 중복체크
      if(wikiService.findDoc(doc_name) != null) {
         
         model.addAttribute("wiki",wikiService.findDoc(doc_name));
         model.addAttribute("latest",wikiLatest(model));

         return new ModelAndView("wikiDetail",model.asMap());
      }
      
      
      WikiVO wiki = new WikiVO();
      
      wiki.setDoc_name(doc_name);
      int doc_num = wikiService.insertWiki(wiki);
      wiki.setDoc_num(doc_num);
      wiki.setUpdate_summary("문서 생성");
      log.debug("<<Controller-생성폼호출//위키 문서>> : "+wiki);
      
      wikiService.updateWiki(0,wiki);
      wiki = wikiService.selectWiki(doc_num);
      
      model.addAttribute("wiki",wiki);
      model.addAttribute("latest",wikiLatest(model));
      
      return new ModelAndView("wikiDetail",model.asMap());
   }

   /*=================
    * 위키 글 목록
    ==================*/
   @RequestMapping("/wiki/list")
   public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
                        @RequestParam(value="order",defaultValue="1") int order,
                        String keyfield, String keyword, Model model) {
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("keyfield", keyfield);
      map.put("keyword", keyword);
      
      //전체/검색 레코드 수
      int count = wikiService.selectRowCount(map);
      log.debug("<<count>> :"+count);
      PageUtil page = new PageUtil(keyfield,keyword,currentPage,count,20,10,"list","&order="+order);
      List<WikiVO> list = null;
      
      if(count > 0) {
         map.put("order", order);
         map.put("start", page.getStartRow());
         map.put("end", page.getEndRow());
         
         list = wikiService.selectList(map);
      }

      
      ModelAndView mav = new ModelAndView();
      mav.setViewName("wikiList");
      mav.addObject("count",count);
      mav.addObject("list",list);
      mav.addObject("page",page.getPage());
      mav.addObject("latest",wikiLatest(model));
      
      return mav;
   }
   
   /*=================
    * 위키 글 상세
    ==================*/
   @RequestMapping("/wiki/detail")
   public ModelAndView process(@RequestParam(required=false) Integer doc_num,
                        @RequestParam(required=false) Integer update_num,
                        @RequestParam(required=false) String doc_name,
                        Model model) throws UnsupportedEncodingException {
      WikiVO wiki = null;
      
      if(doc_name !=null) {
         wiki = wikiService.selectWiki2(doc_name);
         if(wiki==null) {
            String encodedDocName = URLEncoder.encode(doc_name, StandardCharsets.UTF_8.toString());
            return new ModelAndView(new RedirectView("/wiki/list?keyword="+encodedDocName));
         }
      }else {
         if(update_num == null) {
            wiki = wikiService.selectWiki(doc_num);   
         }else if(update_num !=null) {
            wiki = wikiService.selectOldWiki(update_num);
         }
      }
      
      log.debug("<<wiki>> :"+wiki);

      model.addAttribute("wiki",wiki);
      model.addAttribute("latest",wikiLatest(model));
      //wiki.setDoc_name(StringUtil.useNoHtml(wiki.getDoc_name()));
      
      return new ModelAndView("wikiDetail",model.asMap());
   }

   
   /*=================
    * 위키 글 편집
    ==================*/
   @GetMapping("/wiki/update")
   public String formUpdate(@RequestParam int doc_num,@RequestParam int update_num, Model model) {
      WikiVO wikiVO = wikiService.selectWiki(doc_num);
      model.addAttribute("wikiVO",wikiVO);
      model.addAttribute("latest",wikiLatest(model));
      
      return "wikiUpdate";
   }
   @PostMapping("/wiki/update")
   public String submitUpdate(int update_num,WikiVO wikiVO,BindingResult result,HttpServletRequest request, Model model,HttpSession session) {
      wikiVO.setUpdate_writer(((MemberVO)session.getAttribute("user")).getId());
      log.debug("<<위키 편집>> : "+wikiVO);
      wikiService.updateWiki(update_num,wikiVO);
      
      model.addAttribute("message","편집 완료");
      model.addAttribute("url",request.getContextPath()+"/wiki/detail?doc_num="+wikiVO.getDoc_num());
      
      return "common/resultAlert";
   }   
   /*=================
    * 위키 삭제
    ==================*/
   @GetMapping("wiki/delete")
   public String deleteWiki(@RequestParam int doc_num,@RequestParam int update_num, Model model,HttpSession session,HttpServletRequest request) {
      WikiVO wiki = new WikiVO();
      wiki.setUpdate_writer(((MemberVO)session.getAttribute("user")).getId());
      wiki.setDoc_num(doc_num);
      wiki.setUpdate_summary("문서 삭제");
      wikiService.deleteWiki(doc_num, update_num, wiki);
      
      model.addAttribute("message","삭제 완료");
      model.addAttribute("url",request.getContextPath()+"/wiki/detail?doc_num="+wiki.getDoc_num());
      
      return "common/resultAlert";
   }
   
   /*=================
    * 위키 되돌리기
    ==================*/ 
   @GetMapping("/wiki/undo")
   public String wikiUndo(@RequestParam int update_num,
                     @RequestParam int doc_num,
                     Model model,HttpServletRequest request,HttpSession session) {
      wikiService.undoWiki(doc_num, update_num,((MemberVO)session.getAttribute("user")).getId());
      
      model.addAttribute("message","되돌리기 완료");
      model.addAttribute("url",request.getContextPath()+"/wiki/detail?doc_num="+doc_num);
      
      return "common/resultAlert";
   }
   /*=================
    * 위키 역사
    ==================*/
   @GetMapping("/wiki/history")
   public ModelAndView history(@RequestParam int doc_num,
                        @RequestParam(value="pageNum",defaultValue="1") int currentPage,
                        @RequestParam(value="order",defaultValue="1") int order,
                        Model model) {
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("doc_num",doc_num);
      
      //전체 히스토리 개수
      int count = wikiService.selectRowCountOfHistory(doc_num);
      PageUtil page = new PageUtil(currentPage,count,20,10,"history","&order="+order);
      List<WikiVO> list = null;
      if(count>0) {
         map.put("order",order);
         map.put("start", page.getStartRow());
         map.put("end", page.getEndRow());

         list = wikiService.selectHistory(map);
      }
      ModelAndView mav = new ModelAndView();
      mav.setViewName("wikiHistory");
      mav.addObject("count",count);
      mav.addObject("list",list);
      mav.addObject("page",page.getPage());
      mav.addObject("latest",wikiLatest(model));
      mav.addObject("wiki",wikiService.selectWiki(doc_num));
      
      return mav;
   }

   @GetMapping("/wiki/map")
   public String getMap() {
      return "/google/map";
   }
   
}