package kr.co.model;

import java.util.Date;
import lombok.Data;

@Data
public class QsVO {
	
	// 게시판 번호
	private int QS_BNO;
		
	// 게시판 제목
	private String QS_TITLE;
		
	// 게시판 내용
	private String QS_CONTENT;
		
	// 게시판 작성일자
	private Date QS_REGDATE;
		
	// 게시판 작성자
	private String QS_WRITER;
		
	// 게시판 조회수
	private int QS_VIEWS;

}
