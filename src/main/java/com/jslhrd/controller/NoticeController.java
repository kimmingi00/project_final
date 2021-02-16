package com.jslhrd.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jslhrd.domain.NoticeBoardVO;
import com.jslhrd.domain.PageVO;

import com.jslhrd.service.NoticeService;
import com.jslhrd.util.PageIndex;
import com.jslhrd.util.SqlMark;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/Notice/")
@AllArgsConstructor
public class NoticeController {
	private static final Logger log = 
			LoggerFactory.getLogger(NoticeController.class);
	
	@Setter(onMethod_=@Autowired)
	private NoticeService service;
	
	
	
	@GetMapping("board_notice_view")
	public String noticeSelect(@RequestParam("idx") int idx,@RequestParam("page") int page,PageVO vo,Model model) {
		log.info("notice_view()..............");
		NoticeBoardVO board = service.noticeSelect(idx);
		model.addAttribute("board",board);
		model.addAttribute("contents",SqlMark.lineBreak(board.getContents()));
		model.addAttribute("page",page);
		return "/Contents/Board/Notice/board_notice_view";
	}
	
	
		@GetMapping("notice")
		public String notice(@RequestParam("page") int page,PageVO vo,Model model) {
			log.info("notice()..............");
			String url = "notice";
			int nowpage = 1; 
			int maxlist = 10; 
			int totpage = 1; 
			int totcount = 0; 
			
			
			if(vo.getKey() != null) { 
				totcount = service.noticeCountSearch(vo);
			}else {
				totcount = service.noticeCount();
			}
			
			if(totcount % maxlist == 0) {
				totpage = totcount / maxlist;
			}else {
				totpage = totcount / maxlist+ 1;
			}
			
			
			if(page != 0) {
				nowpage = page;
			}
			
			if(nowpage > totpage) {
				nowpage = totpage;
			}
			
			
			int pagestart = (nowpage-1) * maxlist + 1;
			int endpage = nowpage * maxlist;
			
			int listcount = totcount - ((nowpage-1)* maxlist);
			
			List list = null;
			vo.setPagestart(pagestart);
			vo.setEndpage(endpage);
			
			if(vo.getKey() != null) {
				list = service.noticeListPageSearch(vo);
			}else {
				list = service.noticeListPage(vo);
			}
			
			String addtag = "";
			model.addAttribute("addtag",addtag);
			model.addAttribute("url",url);
			model.addAttribute("page",nowpage);
			model.addAttribute("totpage",totpage);
			model.addAttribute("totcount",totcount);
			model.addAttribute("listcount",listcount);
			model.addAttribute("list",list);
			
			if(vo.getKey() != null) {
				model.addAttribute("listPage",PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(),vo.getKey()));
			}else {
				model.addAttribute("listPage",PageIndex.pageList(nowpage, totpage, url,addtag));
			}
			return "/Contents/Board/Notice/notice";
		}
		
			@PostMapping("notice")
			public String noticeListSearch(@RequestParam("page") int page, PageVO vo,Model model) {
				log.info("noticeListSearch()..............");
			String url = "notice";
				
				int nowpage=1;
				int maxlist=10;
				int totpage=1;
				int totcount=service.noticeCountSearch(vo);
				
				if(totcount % maxlist ==0) {
					totpage=totcount/maxlist;
				}else {
					totpage=totcount/maxlist + 1;
				}
				
				if(page != 0) {
					nowpage = page;
				}
				if(nowpage > totpage) {
					nowpage=totpage;
				}
				
				int pagestart = (nowpage-1)*maxlist + 1;
				int endpage = nowpage * maxlist;
				int listcount = totcount - ((nowpage-1)*maxlist);
				vo.setPagestart(pagestart);
				vo.setEndpage(endpage);
				List list = service.noticeListPageSearch(vo);
				
				String addtag ="";
				model.addAttribute("addtag",addtag);
				model.addAttribute("url",url);
				model.addAttribute("page",page);
				model.addAttribute("totpage",totpage);
				model.addAttribute("totcount",totcount);
				model.addAttribute("listcount",listcount);
				model.addAttribute("list",list);
				model.addAttribute("listPage",PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(),vo.getKey()));
				model.addAttribute("list",service.noticeListSearch(vo));
				
				return "/Contents/Board/Notice/notice";
			}
	
			@GetMapping("board_write")
			public String notice_Write(@RequestParam("page") int page,Model model) {
				log.info("board_write()..............");
				model.addAttribute("page",page);
				return "/Contents/Board/Notice/board_notice_write";
			}
			
				@PostMapping("board_write_pro")
				public String noticeWritePro(@RequestParam("page") int page,NoticeBoardVO vo, RedirectAttributes rttr) {
					log.info("noticeWritePro()..............");
					int row=service.noticeWrite(vo);
					rttr.addFlashAttribute("row",row);
					return "redirect:/Notice/board_notice_write_pro?page="+page;
				}
				
				@GetMapping("board_notice_write_pro")
				public String board_Write_pro(@RequestParam("page") int page,Model model) {
					log.info("boardWrite_pro()..............");
					model.addAttribute("page",page);
					return "/Contents/Board/Notice/board_notice_write_pro";
				}
				
				@GetMapping("board_modify")
				public String boardModify(@RequestParam("idx") int idx,@RequestParam("page") int page,Model model) {
					log.info("boardModify()");
					model.addAttribute("board",service.noticeSelect(idx));
					model.addAttribute("page",page);
					return "/Contents/Board/Notice/board_notice_modify";
				}

				@PostMapping("board_modify_pro")
				public String boardModifyPro(@RequestParam("page") int page,NoticeBoardVO vo, RedirectAttributes rttr) {
					
					log.info("board_modify_pro()......");
					System.out.println("MMMMMMMMMMMMMM" + vo);
				
					int row = service.noticeModify(vo);
					
					rttr.addFlashAttribute("row",row);
					
					return "redirect:/Notice/board_notice_modify_pro?page="+page;
				}
				
			
				@GetMapping("board_notice_modify_pro")
				public String board_notice_modify_pro(@RequestParam("page") int page,Model model) {
					log.info("board_notice_modify_pro()..............");
					model.addAttribute("page",page);
					return "/Contents/Board/Notice/board_notice_modify_pro";
				}
				
				@GetMapping("board_notice_delete")
				public String boardDelete(@ModelAttribute("idx") int idx) {
					log.info("boardDelete()...");
					return "Contents/Board/Notice/board_notice_delete";
				}
				@PostMapping("board_notice_delete_pro")
				public String boardDeletePro(NoticeBoardVO vo, Model model) {
					log.info("boardDelete()...");
					int row = service.noticeDelete(vo);
					
					model.addAttribute("row",row);
					return "Contents/Board/Notice/board_notice_delete_pro";
				}
				
}
