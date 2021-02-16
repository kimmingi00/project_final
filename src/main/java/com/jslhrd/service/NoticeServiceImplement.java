package com.jslhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jslhrd.domain.NoticeBoardVO;
import com.jslhrd.domain.PageVO;
import com.jslhrd.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class NoticeServiceImplement implements NoticeService {
	
	@Setter(onMethod_=@Autowired)
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeBoardVO> noticeList() {
		
		return mapper.noticeList();
	}

	@Override
	public NoticeBoardVO noticeSelect(int idx) {
		return mapper.noticeSelect(idx);
	}

	
	@Override
	public int noticeWrite(NoticeBoardVO vo) {
		return mapper.noticeWrite(vo);
	}
	
	@Override
	public int noticeModify(NoticeBoardVO vo) {
		
		return mapper.noticeModify(vo);
	}
	@Override
	public int noticeDelete(NoticeBoardVO vo) {
		return mapper.noticeDelete(vo);
	}
	
	@Override
	public List<NoticeBoardVO> noticeListSearch(PageVO vo) {
		return mapper.noticeListSearch(vo);
	}
	
	@Override
	public int noticeCount() {
		return mapper.noticeCount();
	}
	
	@Override
	public List<NoticeBoardVO> noticeListPage(PageVO vo) {
		return mapper.noticeListPage(vo);
	}
	
	@Override
	public int noticeCountSearch(PageVO vo) {
			
		return mapper.noticeCountSearch(vo);
	}
	
	@Override
	public List<NoticeBoardVO> noticeListPageSearch(PageVO vo) {
		return mapper.noticeListPageSearch(vo);
	}
	
}
