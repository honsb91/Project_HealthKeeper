package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mapper.NoticeMapper;
import kr.co.model.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper mapper;
	
	// 공지사항 등록
	@Override
	public void notregistr(NoticeVO notice) {
		mapper.notregistr(notice);
	}

	// 공지사항 목록
	@Override
	public List<NoticeVO> getlist() {
		return mapper.getlist();
	}

	// 공지사항 조회
	@Override
	public NoticeVO getPage(int NOTICE_BNO) {
		return mapper.getPage(NOTICE_BNO);
	}

	// 공지사항 수정
	@Override
	public int notmodify(NoticeVO notice) {
		return mapper.notmodify(notice);
	}

	// 공지사항 삭제
	@Override
	public int notdelete(int NOTICE_BNO) {
		return mapper.notdelete(NOTICE_BNO);
	}
}
