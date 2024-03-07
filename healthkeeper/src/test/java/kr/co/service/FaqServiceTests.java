package kr.co.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mapper.NoticeMapperTests;
import kr.co.model.FaqVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class FaqServiceTests {
	
	 private static final Logger log = LoggerFactory.getLogger(NoticeMapperTests.class);
	 
	 @Autowired
	 private FaqService service;
	 
	 // faq 게시판 등록테스트
//	 @Test
//	 public void faqregistr() {
//		 
//		 FaqVO vo = new FaqVO();
//		 
//		 vo.setFAQ_TITLE("faq service test");
//		 vo.setFAQ_CONTENT("faq service test중");
//		 vo.setFAQ_WRITER("faq service 관리자");
//		 
//		 service.faqregistr(vo);
//	 }

}
