package com.jslhrd.mapper;

import java.util.List;

import com.jslhrd.domain.PageVO;
import com.jslhrd.domain.QnaBoardVO;



public interface QNAMapper {
		public int boardCount();
		
		public int boardCountSearch(PageVO vo);
		
		public List<QnaBoardVO> boardList(PageVO vo);

		public List<QnaBoardVO> boardListSearch(PageVO vo);
		
		public List<QnaBoardVO> boardList();
		
		public void boardHits(int q_idx);
		
		public QnaBoardVO boardSelect(int q_idx);
		
		public int boardIdx();
		
		public void replyDepth(QnaBoardVO vo);
		
		public int boardWrite(QnaBoardVO vo);
		
		public int realparentSearch(int idx);
		
		public int qnaModify(QnaBoardVO vo);
		
		
		public int qnaDelete(QnaBoardVO vo);
}
