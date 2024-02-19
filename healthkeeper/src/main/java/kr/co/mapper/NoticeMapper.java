package kr.co.mapper;

import java.util.List;

import kr.co.model.NoticeVO;

public interface NoticeMapper {
	
	// 공지사항 등록
	public void notregistr(NoticeVO notice);
	
	// 공지사항 목록
	public List<NoticeVO> getlist();
	
	// 공지사항 조회
	public NoticeVO getPage(int NOTICE_BNO);
	
	// 공지사항 수정
	public int notmodify(NoticeVO notice);

}
