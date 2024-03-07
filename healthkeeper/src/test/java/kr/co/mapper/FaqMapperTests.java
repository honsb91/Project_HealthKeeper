package kr.co.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.model.FaqVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class FaqMapperTests {
	
	private static final Logger log = LoggerFactory.getLogger(NoticeMapperTests.class);
	
	@Autowired
	private FaqMapper mapper;
	
	// faq 게시판 등록테스트
//	@Test
//	public void faqregistr() {
//		
//		FaqVO vo = new FaqVO();
//		
//		vo.setFAQ_TITLE("faq mapper test");
//		vo.setFAQ_CONTENT("faq mapper test 중");
//		vo.setFAQ_WRITER("faq 관리자");
//		
//		mapper.faqregistr(vo);
//	}

}
