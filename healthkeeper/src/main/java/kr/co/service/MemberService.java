package kr.co.service;

import kr.co.model.MemberVO;

public interface MemberService {

	// 회원가입
	public void memberjoin(MemberVO member) throws Exception;
}
