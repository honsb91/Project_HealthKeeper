package kr.co.mapper;

import java.util.List;

import kr.co.model.QsReplyVO;

public interface QsReplyMapper {
	
	// 질문게시판 댓글조회
	public List<QsReplyVO> readReply(int QS_BNO);
	
	// 질문게시판 댓글작성
	public void registrReply(QsReplyVO qsreplyvo);
	
	// 질문게시판 댓글수정
	public void updateReply(QsReplyVO replyvo);
	
	// 질문게시판 댓글삭제
	public void deleteReply(QsReplyVO replyvo);
	
	// 질문게시판 선택된 댓글조회
	public QsReplyVO selectReply(int QRNO);
}
