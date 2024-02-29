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

import kr.co.model.QsVO;
import kr.co.service.QsService;

@Controller
@RequestMapping("/question/*")
public class QuestionController {
	
	@Autowired
	private QsService service;
	
	// log 메서드 사용 => consol창에 더 자세히 볼수있음
	private static final Logger log = LoggerFactory.getLogger(QuestionController.class);
	
	// 질문게시판 목록페이지 진입
	@GetMapping("/qslist")
	public void qsListGET(Model model) {
		log.info("질문게시판 페이지 진입");
		model.addAttribute("qslist", service.getlist());
	}
	

	// 질문게시판 등록페이지 진입
	@GetMapping("/qsregistr")
	public void qsRegistrGET() {
		log.info("질문게시판 등록 페이지 진입");
	}
	
	// 질문게시판 등록
	@PostMapping("/qsregistr")
	public String qsRegistrPOST(QsVO qs, RedirectAttributes rttr) {
		log.info("QsVO :" + qs);
		service.qsregistr(qs);
		rttr.addFlashAttribute("result", "registr success");
		return "redirect:/question/qslist";
	}
	
	// 질문게시판 조회
	@GetMapping("/qsget")
	public void qsGetPageGET(int QS_BNO, Model model) {
		model.addAttribute("pageInfo", service.getpage(QS_BNO));
	}
	
	// 질문게시판 수정페이지 진입
	@GetMapping("/qsupdate")
	public void qsUpdateGET(int QS_BNO, Model model) {
		
		model.addAttribute("pageInfo", service.getpage(QS_BNO));
	}
	
	// 질문게시판 수정
	@PostMapping("/qsupdate")
	public String qsUpdatePOST(QsVO qs, RedirectAttributes rttr) {
		
		service.update(qs);
		rttr.addFlashAttribute("result", "update success");
		
		return "redirect:/question/qslist"; 
		
	}
}
