package kr.co.service;

import java.util.List;

import kr.co.model.QsCriteria;
import kr.co.model.QsVO;

public interface QsService {
	
	// 게시판 등록
	public void qsregistr(QsVO qs);
	
	// 게시판 목록
	public List<QsVO> getlist();
	
	// 게시판 목록(페이징 처리)
	public List<QsVO> getlistPaging(QsCriteria qcri);
	
	// 게시판 총 갯수
	public int getTotal(QsCriteria qcri);
	
	// 게시판 조회
	public QsVO getpage(int QS_BNO);
	
	// 게시판 수정
	public int update(QsVO qs);
	
	// 게시판 삭제
	public int delete(int QS_BNO);
	
	// 게시판 조회수
	public int qsViews(int QS_BNO);

}
