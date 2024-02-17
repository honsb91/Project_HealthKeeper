package kr.co.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.model.NoticeVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeMapperTests {
 
     private static final Logger log = LoggerFactory.getLogger(NoticeMapperTests.class);
     
     @Autowired
     private NoticeMapper mapper;
 
     // 공지사항 등록 테스트
//     @Test
//     public void testEnroll() {
//         
//         NoticeVO vo = new NoticeVO();
//         
//         vo.setNOTICE_TITLE("공지사항 Mapper 테스트.");
//         vo.setNOTICE_CONTENT("공지사항 Mapper 테스트중입니다.");
//         vo.setNOTICE_WRITER("공지사항 관리자");
//         
//         mapper.notregistr(vo);
//     }
     
     // 공지사항 목록 테스트
     @Test
     public void testGetList() {
         
         List list = mapper.getlist();
        /* 일반적 for문 */
         for(int i = 0; i < list.size();i++) {
             log.info("" + list.get(i));
         }
     }
 
}
