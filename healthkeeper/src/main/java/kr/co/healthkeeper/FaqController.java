package kr.co.healthkeeper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.model.FaqVO;
import kr.co.service.FaqService;

@Controller
@RequestMapping("/faq/*")
public class FaqController {
	
	// log 메서드 사용
	private static final Logger log = LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private FaqService service;

	// FAQ 목록페이지 
	@GetMapping("/faqlist")
	public void faqListGET() {
		
		log.info("FAQ 목록페이지 진입");
	}
	
	// FAQ 등록페이지
	@GetMapping("/faqregistr")
	public void faqRegistrGET() {
		
		log.info("FAQ 등록페이지 진입");
	}
	
	// FAQ 등록
	@PostMapping("/faqregistr")
	public String faqRegistrPOST(FaqVO faqvo, RedirectAttributes rttr) {
		log.info("FaqVO: " + faqvo);
		service.faqregistr(faqvo);
		rttr.addFlashAttribute("result", "faqregistr success");
		return "redirect:/faq/faqlist";
	}
}
