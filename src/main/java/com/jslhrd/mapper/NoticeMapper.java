package com.jslhrd.mapper;

import java.util.List;

import com.jslhrd.domain.NoticeBoardVO;
import com.jslhrd.domain.PageVO;


public interface NoticeMapper {
	
	public NoticeBoardVO noticeSelect(int idx);

	public int noticeWrite(NoticeBoardVO vo);
	
	public int noticeModify(NoticeBoardVO vo);
	
	public int noticeDelete(NoticeBoardVO vo);
	
	public List<NoticeBoardVO> noticeList();
	
	public List<NoticeBoardVO> noticeListSearch(PageVO vo);
	
	public int noticeCount();
	
	public List<NoticeBoardVO> noticeListPage(PageVO vo);
	
	public int noticeCountSearch(PageVO vo);
	
	public List<NoticeBoardVO> noticeListPageSearch(PageVO vo);
	
}
