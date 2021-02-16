package com.jslhrd.mapper;

import java.util.List;

import com.jslhrd.domain.PageVO;
import com.jslhrd.domain.QnaBoardVO;



public interface QNAMapper {
	// 게시판 전체 카운트
		public int boardCount();
		
		// 게시판 전체 카운트(검색 기능 추가)
		public int boardCountSearch(PageVO vo);
		
		// 페이지별 목록 리스트(검색 없음,검색 있음 공용)
		public List<QnaBoardVO> boardList(PageVO vo);
		
		// 페이지별 목록 리스트(검색 있음)
		public List<QnaBoardVO> boardListSearch(PageVO vo);
		
		// 게시판 전체 목록 리스트
		public List<QnaBoardVO> boardList();
		
		//글 보기 시 조회수 증가
		public void boardHits(int q_idx);
		
		//특정 글 선택/수정폼
		public QnaBoardVO boardSelect(int q_idx);
		
		// idx 값 추출
		public int boardIdx();
		
		// 답변글 등록시 글 깊이 업데이트
		public void replyDepth(QnaBoardVO vo);
		
		// 등록
		public int boardWrite(QnaBoardVO vo);
		
		//답변글 여부 검색
		public int realparentSearch(int idx);
		
		//modify
		public int qnaModify(QnaBoardVO vo);
		
		
		//삭제처리 
		public int qnaDelete(QnaBoardVO vo);
}
