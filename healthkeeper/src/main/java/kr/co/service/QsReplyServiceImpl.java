package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mapper.QsReplyMapper;
import kr.co.model.QsReplyVO;

@Service
public class QsReplyServiceImpl implements QsReplyService{

	@Autowired
	private QsReplyMapper mapper;
	
	// 질문게시판 댓글조회
	@Override
	public List<QsReplyVO> readReply(int QS_BNO) {
		return mapper.readReply(QS_BNO);
	}
	
	// 질문게시판 댓글작성
	@Override
	public void registrReply(QsReplyVO qsreplyvo) {
		mapper.registrReply(qsreplyvo);
	}

	// 질문게시판 댓글수정
	@Override
	public void updateReply(QsReplyVO replyvo) {
		mapper.updateReply(replyvo);
	}

	// 질문게시판 댓글삭제
	@Override
	public void deleteReply(QsReplyVO replyvo) {
		mapper.deleteReply(replyvo);
	}

	// 질문게시판 선택된 댓글조회
	@Override
	public QsReplyVO selectReply(int QRNO) {
		return mapper.selectReply(QRNO);
	}

}
