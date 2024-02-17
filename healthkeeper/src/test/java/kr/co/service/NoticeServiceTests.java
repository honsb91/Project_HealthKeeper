package kr.co.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeServiceTests {
	
	private static final Logger log = LoggerFactory.getLogger(NoticeServiceTests.class);
    
    @Autowired
    private NoticeService service;
    
    // 공지사항 등록 테스트
//    @Test
//    public void testEnroll() {
//        
//        NoticeVO vo = new NoticeVO();
//        
//        vo.setNOTICE_TITLE("공지사항 service 테스트");
//        vo.setNOTICE_CONTENT("공지사항 service 테스트중입니다.");
//        vo.setNOTICE_WRITER("공지사항 서비스관리자");
//        
//        service.notregistr(vo);
//    }
    
    // 공지사항 목록 테스트
    @Test
    public void testGetList() {
        
        service.getlist().forEach(board -> log.info("" + board));        
        
    }
}
