package kr.co.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mapper.FaqMapper;
import kr.co.model.FaqVO;

@Service
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private FaqMapper mapper;

	// faq 게시판 등록
	@Override
	public void faqregistr(FaqVO faqvo) {
		mapper.faqregistr(faqvo);
	}

}
