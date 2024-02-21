package kr.co.util;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.model.NoticeVO;

@Component("fileUtils")
public class FileUtils {
	private static final String FILE_PATH = "C:\\save\\file"; // 파일이 저장될 위치
	
	public List<Map<String, Object>> parseInsertFileInfo(NoticeVO notice, 
	        MultipartHttpServletRequest notRequest) throws Exception {
	    Iterator<String> iterator = notRequest.getFileNames();
	    
	    MultipartFile multipartFile = null;
	    String FILE_NAME = null;
	    
	    List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	    Map<String, Object> listMap = null;
	    
	    // NoticeVO에서 NOTICE_BNO 가져오기
	    int NOTICE_BNO = notice.getNOTICE_BNO();
	    
	    File file = new File(FILE_PATH);
	    if(!file.exists()) {
	        file.mkdirs();
	    }
	    
	    while(iterator.hasNext()) {
	        multipartFile = notRequest.getFile(iterator.next());
	        if(!multipartFile.isEmpty()) {
	            FILE_NAME = multipartFile.getOriginalFilename(); // 파일명 가져오기
	            
	            String savedFileName = getRandomString() + "_" + FILE_NAME; // 저장될 파일명 생성
	            
	            File saveFile = new File(FILE_PATH, savedFileName); // 저장될 파일 객체 생성
	            multipartFile.transferTo(saveFile); // 파일 저장
	            
	            listMap = new HashMap<String, Object>();
	            listMap.put("FILE_NAME", FILE_NAME);
	            listMap.put("FILE_PATH", FILE_PATH);
	            listMap.put("FILE_SIZE", multipartFile.getSize());
	            listMap.put("NOTICE_BNO", NOTICE_BNO); // NOTICE_BNO 추가
	            list.add(listMap);
	        }
	    }
	    return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}