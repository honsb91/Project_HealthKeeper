package kr.co.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mapper.MemberMapper;
import kr.co.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mapper;
	
	// 회원가입
	@Override
	public void memberjoin(MemberVO member) throws Exception{
		mapper.memberjoin(member);
	}

}
