package kr.co.healthkeeper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.model.NoticeVO;
import kr.co.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	// log 메서드 사용
	private static final Logger log = LoggerFactory.getLogger(NoticeController.class);
	
	// 공지사항 목록페이지
	@GetMapping("/notlist")
    public void noticeListGET(Model model) {
        
        log.info("공지사항 목록 페이지 진입");
        model.addAttribute("notlist", service.getlist());
    }
    
    @GetMapping("/notregistr")
    public void noticeRegistrGET() {
        
        log.info("공지사항 등록 페이지 진입");
    }
	
    // 공지사항 등록
    @PostMapping("/notregistr")
    public String noticeRegistrPOST(NoticeVO notice, RedirectAttributes rttr) {
    	
    	log.info("NoticeVO: " + notice);
    	service.notregistr(notice);
    	rttr.addFlashAttribute("result", "registr success");
    	return "redirect:/notice/notlist";
    }
    
    // 공지사항 조회
    @GetMapping("/notget")
    public void noticeGetPageGET(int NOTICE_BNO, Model model) {
        
        model.addAttribute("pageInfo", service.getPage(NOTICE_BNO));
        
    }
    
    // 공지사항 수정페이지 이동
    @GetMapping("/notmodify")
    public void noticeModifyGET(int NOTICE_BNO, Model model) {
        
        model.addAttribute("pageInfo", service.getPage(NOTICE_BNO));
        
    }
    
    // 공지사항 수정
    @PostMapping("/notmodify")
    public String noticeModifyPOST(NoticeVO notice, RedirectAttributes rttr) {
        
        int rows =service.notmodify(notice);
        System.out.println("공지글 수정" + rows);
        
        rttr.addFlashAttribute("result", "notmodify success");
        
        return "redirect:/notice/notlist";
        
    }
    
    // 공지사항 삭제
    @PostMapping("/notdelete")
    public String boardDeletePOST(int NOTICE_BNO, RedirectAttributes rttr) {
        
        service.notdelete(NOTICE_BNO);
        
        rttr.addFlashAttribute("result", "notdelete success");
        
        return "redirect:/notice/notlist";
    }

}
