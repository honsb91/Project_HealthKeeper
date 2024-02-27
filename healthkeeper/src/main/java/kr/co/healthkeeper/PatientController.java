package kr.co.healthkeeper;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/patient/*")
public class PatientController {
	
	//환자 로그인페이지
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginPageGET() {
				
	}
}
