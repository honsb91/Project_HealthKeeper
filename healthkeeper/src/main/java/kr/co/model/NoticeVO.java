package kr.co.model;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	// 공지사항 번호
	private int NOTICE_BNO;
	
	// 공지사항 제목
	private String NOTICE_TITLE;
	
	// 공지사항 내용
	private String NOTICE_CONTENT;
	
	// 공지사항 작성일자
	private Date NOTICE_REGDATE;
	
	// 공지사항 작성자
	private String NOTICE_WRITER;
	
	// 공지사항 조회수
	private int NOTICE_VIEWS;
}
