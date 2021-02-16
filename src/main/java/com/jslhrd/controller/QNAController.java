package com.jslhrd.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.jslhrd.domain.QnaBoardVO;
import com.jslhrd.service.QNAService;
import com.jslhrd.util.PageIndex;
import com.jslhrd.util.SqlMark;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/Q&A/")
@AllArgsConstructor
public class QNAController {
	private static final Logger log = 
			LoggerFactory.getLogger(QNAController.class);
	
	private QNAService service;
	
	/*
	@GetMapping("board_qna")
	public String board_qna() {
		logger.info("board_qna......");
		return "/Contents/Board/Q&A/board_qna";
	}*/
	
	//페이지별 목록
	@GetMapping("board_qna")
	public String boardList(@RequestParam("page") int page,Model model,PageVO vo) {
		
		String url="board_qna",addtag="";
		
		int nowpage = 1;
		int maxlist = 10;
		int totpage = 1;
		int totcount = 0;
		
		// 총 글 수 카운트
		totcount = service.boardCount();
		
		// 총 페이지 계산
		if(totcount % maxlist == 0) {
			totpage = totcount/maxlist;
		}else {
			totpage = totcount/maxlist+1;
		}
		
		if(page != 0) {
			nowpage = page;
		}
		if(nowpage > totpage) {
			nowpage = totpage;
		}
		
		//현재 페이지 시작번호
		int pagestart = (nowpage-1)*maxlist+1;
		int endpage = nowpage * maxlist;
		
		//list.jsp에서 사용할 번호
		int listcount = totcount-((nowpage-1)*maxlist);
		
		vo.setPagestart(pagestart);
		vo.setEndpage(endpage);
		
		model.addAttribute("page",nowpage);
		model.addAttribute("totcount",totcount);
		model.addAttribute("totpage",totpage);
		model.addAttribute("listcount",listcount);
		model.addAttribute("list",service.boardList(vo));
		model.addAttribute("listPage",PageIndex.pageList(nowpage, totpage, url, addtag));
		return "/Contents/Board/Q&A/board_qna";
	}
	
	@PostMapping("board_qna")
	public String boardListSearch(@RequestParam("page") int page,Model model,PageVO vo) {
		
		String url="board_qna",addtag="";
		
		int nowpage = 1;
		int maxlist = 10;
		int totpage = 1;
		int totcount = 0;
		
		// 총 글 수 카운트
		
		totcount = service.boardCountSearch(vo);
		
		// 총 페이지 계산
		if(totcount % maxlist == 0) {
			totpage = totcount/maxlist;
		}else {
			totpage = totcount/maxlist+1;
		}
		
		if(page != 0) {
			nowpage = page;
		}
		if(nowpage > totpage) {
			nowpage = totpage;
		}
		
		//현재 페이지 시작번호
		int pagestart = (nowpage-1)*maxlist+1;
		int endpage = nowpage * maxlist;
		
		//list.jsp에서 사용할 번호
		int listcount = totcount-((nowpage-1)*maxlist);
		
		vo.setPagestart(pagestart);
		vo.setEndpage(endpage);
		
		model.addAttribute("page",nowpage);
		model.addAttribute("totcount",totcount);
		model.addAttribute("totpage",totpage);
		model.addAttribute("listcount",listcount);
		model.addAttribute("list",service.boardListSearch(vo));
		//model.addAttribute("listPage",PageIndex.pageList(nowpage, totpage, url, addtag));
		model.addAttribute("listPage",PageIndex.pageListHan(nowpage, totpage, url, vo.getSearch(),vo.getKey()));
		return "/Contents/Board/Q&A/board_qna";
	}
	
	@GetMapping("board_view_cnt")
	public String boardReadCnt(@RequestParam("idx") int q_idx,HttpServletRequest request,HttpServletResponse response,@RequestParam("page") int page,Model model) {
		log.info("board");
		boolean bool = false;
		Cookie info = null;
		Cookie[] cookies = request.getCookies();
		model.addAttribute("page",page);
		for(int i=0;i<cookies.length;i++) {
			info = cookies[i];
			if(info.getName().equals("sboardcookie"+q_idx)) {
				bool = true;
				break;
			}
		}
		String str=""+System.currentTimeMillis();
		if(!bool) {
			info = new Cookie("sboardcookie"+q_idx, str);
			info.setMaxAge(30*60);
			response.addCookie(info);
			
			service.boardHits(q_idx);
		}
		return "redirect:board_qna_view?idx="+q_idx;
	}
	
	@GetMapping("board_qna_view")
	public String boardView(@RequestParam("idx") int idx,Model model,@RequestParam("page") int page) {
		
		QnaBoardVO vo = service.boardSelect(idx);
		vo.setQ_contents(SqlMark.lineBreak(vo.getQ_contents()));
		model.addAttribute("board",vo);
		model.addAttribute("page",page);
		return "/Contents/Board/Q&A/board_qna_view";
		
	}
	
	// 등록폼
		@GetMapping("board_qna_write")
		public String board_qna_write(QnaBoardVO vo,@RequestParam("page") int page,Model model) {
			log.info("board_qna_write()....");
			model.addAttribute("page",page);
			return "/Contents/Board/Q&A/board_qna_write";
		}
		
		//등록처리
		@PostMapping("board_qna_write")
		public String board_qna_write(QnaBoardVO vo,HttpServletRequest request,@RequestParam("page") int page,RedirectAttributes rttr) {
			log.info("board_qna_write(QnaBoardVO vo)....");
			System.out.println("parent"+vo.getQ_parent());
			System.out.println("Q_re_lev"+vo.getQ_re_lev());
			System.out.println("Q_re_seq"+vo.getQ_re_seq());
			System.out.println("Q_re_ref"+vo.getQ_re_ref());
			System.out.println("Q_idx"+vo.getQ_idx());
		
			int parent = vo.getQ_parent();
			int realparent = vo.getQ_re_ref();
			int depth = vo.getQ_re_lev();
			int indent = vo.getQ_re_seq();
			int idx =0;
			idx = service.boardIdx();
			System.out.println("@@@@@@@id"+vo.getId());
			if(parent !=0) { //답변글
				service.replyDepth(vo);
				vo.setQ_re_lev(depth+1);
				vo.setQ_re_seq(indent+1);
				System.out.println("@@@@@@@id"+vo.getId());
				
			}else { //처음 작성된 글
				vo.setQ_parent(idx);
				vo.setQ_re_lev(0);
				vo.setQ_re_seq(0);
			}
			
			vo.setQ_idx(idx);
			int row = service.boardWrite(vo);
			rttr.addFlashAttribute("row",row);
			System.out.println("@@@@@@@id"+vo.getId());
			return "redirect:/Q&A/board_qna_write_pro?page="+page;
		}
		
		// 공지사항 등록 결과처리(메시지 출력용)
		@GetMapping("board_qna_write_pro")
		public String board_qna_write_pro(@RequestParam("page") int page,Model model) {
			log.info("boardWrite_pro()..............");
			model.addAttribute("page",page);
			return "/Contents/Board/Q&A/board_qna_write_pro";
		}
		
		//reply
		@GetMapping("board_qna_reply")
		public String board_qna_reply(@RequestParam("idx") int idx,@RequestParam("page") int page,Model model) {
			log.info("boardReply()....");
			
			QnaBoardVO vo = service.boardSelect(idx);
			System.out.println("id?"+vo.getId());
			model.addAttribute("board",vo);
			model.addAttribute("page",page);
			return "/Contents/Board/Q&A/board_qna_reply";
		}
		
		
		
		//수정폼
		@GetMapping("board_qna_modify")
		public String boardModify(@RequestParam("idx") int idx,Model model,@RequestParam("page") int page) {
			QnaBoardVO vo = service.boardSelect(idx);
			model.addAttribute("board",vo);
			model.addAttribute("page",page);
			return "/Contents/Board/Q&A/board_qna_modify";
		}
		
		
		//수정처리
				@PostMapping("board_qna_modify")
				public String boardModifyPro(QnaBoardVO vo,RedirectAttributes rttr,@RequestParam("page") int page,@RequestParam("idx") int idx) {
					log.info("Controller : boardModifyPro()....");
					vo.setQ_idx(idx);
					int row=service.qnaModify(vo);
					
					rttr.addFlashAttribute("row",row);
					return "redirect:/Q&A/board_qna_modify_pro?page="+page;

				}
		
		
				@GetMapping("board_qna_modify_pro")
				public String board_qna_modify_pro(@RequestParam("page") int page,Model model) {
					log.info("board_qna_modify_pro()..............");
					model.addAttribute("page",page);
					return "/Contents/Board/Q&A/board_qna_modify_pro";
				}
				
				//삭제 폼
				@GetMapping("board_qna_delete")
				public String board_qna_delete(@ModelAttribute("q_idx") int q_idx) {
					log.info("board_qna_delete()...");
					return "Contents/Board/Q&A/board_qna_delete";
				}
				//삭제 처리
				@PostMapping("board_qna_delete_pro")
				public String board_qna_delete_pro(QnaBoardVO vo, Model model) {
					log.info("board_qna_delete_pro()...");
					int row = service.qnaDelete(vo);
					
					model.addAttribute("row",row);
					return "Contents/Board/Q&A/board_qna_delete_pro";
				}	
				
}
