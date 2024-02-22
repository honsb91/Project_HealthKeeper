package kr.co.healthkeeper;

import java.io.File;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.co.model.FilesVO;
import kr.co.model.NotCriteria;
import kr.co.model.NotPageMakeDTO;
import kr.co.model.NoticeVO;
import kr.co.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	// log 메서드 사용
	private static final Logger log = LoggerFactory.getLogger(NoticeController.class);
	
	// 공지사항 목록페이지(페이징 적용)
	@GetMapping("/notlist")
    public void noticeListGET(Model model, NotCriteria ncri) {
		
        model.addAttribute("notlist", service.getListPaging(ncri));
        
        int total = service.getTotal(ncri);
        NotPageMakeDTO npageMake = new NotPageMakeDTO(ncri, total);
        model.addAttribute("npageMake",npageMake);
    }
    
	// 공지사항 등록페이지 
    @GetMapping("/notregistr")
    public void noticeRegistrGET() {
        log.info("공지사항 등록 페이지 진입");
    }
	
    // 공지사항 등록
    @PostMapping("/notregistr")
    public String noticeRegistrPOST(NoticeVO notice, RedirectAttributes rttr, MultipartHttpServletRequest notRequest)throws Exception {
    	
    	service.notregistr(notice, notRequest);
    	rttr.addFlashAttribute("result", "registr success");
    	return "redirect:/notice/notlist";
    }
    
    // 공지사항 조회
    @GetMapping("/notget")
    public void noticeGetPageGET(int NOTICE_BNO, Model model, NotCriteria ncri)throws Exception {

    	// 공지사항 조회수
    	service.noticeViews(NOTICE_BNO);
    	
        model.addAttribute("pageInfo", service.getPage(NOTICE_BNO));
        model.addAttribute("ncri", ncri);
        
        // 공지사항 첨부파일 목록
    	List<FilesVO> fileList = service.selectFileList(NOTICE_BNO);
    	model.addAttribute("fileList", fileList);
    }
    
    // 공지사항 수정페이지 이동
    @GetMapping("/notmodify")
    public void noticeModifyGET(int NOTICE_BNO, Model model, NotCriteria ncri) {
        
        model.addAttribute("pageInfo", service.getPage(NOTICE_BNO));
        model.addAttribute("ncri", ncri);
    }
    
    // 공지사항 수정
    @PostMapping("/notmodify")
    public String noticeModifyPOST(NoticeVO notice, RedirectAttributes rttr) {
        
        service.notmodify(notice);
        rttr.addFlashAttribute("result", "notmodify success");
        return "redirect:/notice/notlist";
    }
    
    // 공지사항 삭제
    @PostMapping("/notdelete")
    public String boardDeletePOST(int NOTICE_BNO, RedirectAttributes rttr) {
        
        service.notdelete(NOTICE_BNO);
        rttr.addFlashAttribute("result", "notdelete success");
        return "redirect:/notice/notlist";
    }
    
    // 공지사항 파일 다운로드
    @RequestMapping(value="/fileDown")
    public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
        Map<String, Object> resultMap = service.selectFileInfo(map);
        String fileName = (String) resultMap.get("FILE_NAME");

        // 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
        byte[] fileBytes = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\save\\file\\" + fileName));

        // 파일명 인코딩
        String encodedFileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");

        // 파일 타입 지정
        String contentType = URLConnection.guessContentTypeFromName(fileName);
        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        // 파일 다운로드 설정
        response.setContentType(contentType);
        response.setContentLength(fileBytes.length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");

        // 파일 전송
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.write(fileBytes);
        outputStream.flush();
        outputStream.close();
    }

}
