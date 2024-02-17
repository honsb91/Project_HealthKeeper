package kr.co.service;

import java.util.List;

import kr.co.model.NoticeVO;

public interface NoticeService {
	
	// 공지사항 등록
	public void notregistr(NoticeVO notice);

	// 공지사항 목록
	public List<NoticeVO> getlist();
}
