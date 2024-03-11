package kr.co.healthkeeper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.model.MemberVO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	// 회원가입 페이지 이동 코드
	@GetMapping("/join")
	public void memberjoinGET() {
		log.info("회원가입 페이지 진입");
	}
	
	// 회원가입
	@PostMapping("/join")
	public String memberjoinPOST(MemberVO member) throws Exception {
		log.info("회원가입 진입");
		// 회원가입 서비스 실행
		memberService.memberjoin(member);
		
		return "redirect:/main";
	}
	
//	// 아이디 중복검사
//	@PostMapping("/checkDuplicateEmail")
//    public String checkDuplicateEmail(@RequestBody String email) {
////        boolean isDuplicate = memberService.isEmailDuplicate(email);
//        return isDuplicate ? "duplicate" : "unique";
//    }
	
}
