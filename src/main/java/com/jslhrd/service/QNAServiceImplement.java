package com.jslhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jslhrd.domain.PageVO;
import com.jslhrd.domain.QnaBoardVO;
import com.jslhrd.mapper.QNAMapper;

import lombok.Setter;

@Service
public class QNAServiceImplement implements QNAService {
	
	@Setter(onMethod_= @Autowired)
	private QNAMapper mapper;
	
	
	@Override
	public int boardCount() {
		return mapper.boardCount();
	}
	
	@Override
	public int boardCountSearch(PageVO vo) {
		return mapper.boardCountSearch(vo);
	}
	
	@Override
	public List<QnaBoardVO> boardList(PageVO vo) {
		return mapper.boardList(vo);
	}
	
	@Override
	public List<QnaBoardVO> boardListSearch(PageVO vo) {
		
		return mapper.boardListSearch(vo);
	}
	
	@Override
	public List<QnaBoardVO> boardList() {
		return mapper.boardList();
	}
	
	@Override
	public void boardHits(int q_idx) {
		mapper.boardHits(q_idx);
	}
	
	@Override
	public QnaBoardVO boardSelect(int q_idx) {

		return mapper.boardSelect(q_idx);
	}
	
	@Override
	public int boardIdx() {
		return mapper.boardIdx();
	}
	
	@Override
	public int boardWrite(QnaBoardVO vo) {
		return mapper.boardWrite(vo);
	}

	@Override
	public void replyDepth(QnaBoardVO vo) {
		
		mapper.replyDepth(vo);
	}
	
	@Override
	public int realparentSearch(int idx) {
		return mapper.realparentSearch(idx);
	}
	
	@Override
	public int qnaModify(QnaBoardVO vo) {
		return mapper.qnaModify(vo);
	}
	
	@Override
	public int qnaDelete(QnaBoardVO vo) {
		return mapper.qnaDelete(vo);
	}
}
