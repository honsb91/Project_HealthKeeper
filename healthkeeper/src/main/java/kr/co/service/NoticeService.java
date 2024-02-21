package kr.co.service;

import java.util.List;

import kr.co.model.NotCriteria;
import kr.co.model.NoticeVO;

public interface NoticeService {
	
	// 공지사항 등록
	public void notregistr(NoticeVO notice);

	// 공지사항 목록
	public List<NoticeVO> getlist();
	
	// 공지사항 목록(페이징 적용)
	public List<NoticeVO> getListPaging(NotCriteria ncri);
	
	// 공지사항 조회
	public NoticeVO getPage(int NOTICE_BNO);
	
	// 공지사항 수정
	public int notmodify(NoticeVO notice);
	
	// 공지사항 삭제
	public int notdelete(int NOTICE_BNO);
	
	// 공지사항 총 갯수
	public int getTotal(NotCriteria ncri);
	
	// 공지사항 조회수
	public int noticeViews(int NOTICE_BNO);
}
