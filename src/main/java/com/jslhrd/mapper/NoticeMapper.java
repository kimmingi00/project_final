package com.jslhrd.mapper;

import java.util.List;

import com.jslhrd.domain.NoticeBoardVO;
import com.jslhrd.domain.PageVO;


public interface NoticeMapper {
	
	//뷰
	public NoticeBoardVO noticeSelect(int idx);

	//등록
	public int noticeWrite(NoticeBoardVO vo);
	
	//수정
	public int noticeModify(NoticeBoardVO vo);
	
	//삭제
	public int noticeDelete(NoticeBoardVO vo);
	
	//전체 리스트
	public List<NoticeBoardVO> noticeList();
	
	//검색 기능 추가
	public List<NoticeBoardVO> noticeListSearch(PageVO vo);
	
	//페이지 처리를 위한 전체 카운트
	public int noticeCount();
	
	//각 페이지별 목록(pagestart,endpage)
	public List<NoticeBoardVO> noticeListPage(PageVO vo);
	
	//검색 + 페이지 처리 카운트
	public int noticeCountSearch(PageVO vo);
	
	//검색 + 페이지 처리 목록
	public List<NoticeBoardVO> noticeListPageSearch(PageVO vo);
	
}
