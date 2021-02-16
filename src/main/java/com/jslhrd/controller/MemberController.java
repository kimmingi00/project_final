package com.jslhrd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jslhrd.domain.BusinessVO;
import com.jslhrd.domain.MemberVO;
import com.jslhrd.domain.ProductVO;
import com.jslhrd.domain.UnRegitVO;
import com.jslhrd.service.MemberService;
import com.jslhrd.util.EmailConfirm;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/Member/")
@AllArgsConstructor
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private MemberService service;

	@GetMapping("index")
	public String index() {
		logger.info("index......");
		return "/Contents/index";
	}

	@GetMapping("login")
	public String MemberLogin() {
		logger.info("memberLogin....");
		return "/Contents/Member/login";
	}

	@GetMapping("confirm")
	public String MemberConfrim() {
		logger.info("memberConfirm..");
		return "/Contents/Member/confirm";
	}

	@GetMapping("member_id_check")
	public String memberIdCheck(@RequestParam("id") String id, Model model) {
		int row = 0;
		if (!id.equals("")) {
			row = service.memberIdCheck(id);
			model.addAttribute("id", id);
			model.addAttribute("row", row);

		}
		return "/Contents/Member/Member_id_check";
	}

	@PostMapping("member_id_check")
	public String memberIdCheck2(@RequestParam("id") String id, Model model,BusinessVO vo) {
		int row = service.memberIdCheck(id);
		if (row == 0) {
			row = service.businessIdCheck(id);	
			
		

		}
		model.addAttribute("id", id);
		model.addAttribute("b_id", id);
		model.addAttribute("row", row);

		return "/Contents/Member/Member_id_check";
	}

	@GetMapping("member_write")
	public String MemberWrite() {
		logger.info("member_write");
		return "/Contents/Member/signup";
	}

	@PostMapping("member_write")
	public String MemberwritePro(MemberVO vo, Model model) {
		logger.info("WritePro...");

		int row = service.memberWrite(vo);
		if (row == 1) {
			return "/Contents/Member/complete";
		} else {
			model.addAttribute("row", row);
			return "redirect:/Contents/Member/login";
		}

	}

	@GetMapping("member_email")
	public String memberEmail(@RequestParam("email") String email, Model model) {
		EmailConfirm emailconf = new EmailConfirm();
		String authNum = emailconf.connectEmail(email);
		int row = 0;
		model.addAttribute("row", row);
		model.addAttribute("authNum", authNum);
		model.addAttribute("email", email);

		return "/Contents/Member/Member_email";
	}

	@PostMapping("loginPro")
	public String MemberLoginPro(MemberVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {

		String pass = service.memberLoginCheck(vo);

		if (pass == null) {

			return "Contents/Member/login";
		} else if (pass.equals(vo.getPass())) {
			String id = vo.getId();
			MemberVO user = service.getMember(id);

			request.getSession().setAttribute("user", user);

			request.getSession().setMaxInactiveInterval(1800);
			return "redirect:/index";
		} else {
			return "Contents/Member/login";
		}
	}

	@GetMapping("logout")
	public String MemberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:/index";

	}

	@GetMapping("id_search")
	public String IdSearch() {
		logger.info("memberIdsearch....");

		return "/Contents/Member/Member_id_search";
	}

	@PostMapping("id_search")
	public String memberIdSearch(MemberVO vo, @RequestParam("name") String name, Model model) {
		int row = 0;
		String tel = "";
		String id = "";
		List<MemberVO> list = new ArrayList<MemberVO>();
		if (!name.equals("")) {
			list = service.memberIdSearch(vo);
			for (int i = 0; i < list.size(); i++) {
				if (name.equals(list.get(i).getName())) {
					tel = list.get(i).getTel();
					id = list.get(i).getId();
				}
			}
			if (list.size() == 0) {
				row = 0;
			} else {
				row = 1;
			}

			model.addAttribute("list", list);
			model.addAttribute("id", id);
			model.addAttribute("row", row);
		}
		return "/Contents/Member/Member_id_search";
	}

	@GetMapping("pass_search")
	public String passSearch() {
		logger.info("memberpasssearch....");

		return "/Contents/Member/Member_pass_search";
	}

	@PostMapping("pass_search")
	public String memberpassSearch(MemberVO vo, @RequestParam("id") String id, @RequestParam("email") String email,
			Model model) {
		int row = 0;
		if (!id.equals("")) {
			String pass = service.memberFindpass(vo);
			if (pass == null) {
				row = 0;
			} else {
				vo.setPass("123456789a");
				row = service.memberPassModify(vo);
			}

			model.addAttribute("row", row);

		}
		return "/Contents/Member/Member_pass_search";
	}
//사업자 

	

	@GetMapping("business_email")
	public String businessEmail(@RequestParam("b_email") String b_email, Model model) {
		EmailConfirm emailconf = new EmailConfirm();
		String authNum = emailconf.connectEmail(b_email);
		int row = 1;
		model.addAttribute("row", row);
		model.addAttribute("authNum", authNum);
		model.addAttribute("b_email", b_email);

		return "/Contents/Member/Member_email";
	}

	@GetMapping("business_write")
	public String businessWrite() {
		logger.info("business_write");
		return "/Contents/Member/signup";
	}

	@PostMapping("business_write")
	public String businesswritePro(@RequestParam("id") String id ,BusinessVO vo, Model model) {
		logger.info("WritePro...");
		String b_id=vo.getB_id();
		b_id=id;
         
         vo.setB_id(id);
		int row = service.businessWrite(vo);
		
		if (row == 1) {
			return "/Contents/Member/complete";
		} else {
			model.addAttribute("row", row);
			return "redirect:/Contents/Member/login";
		}

	}
	@PostMapping("businessloginPro")
	public String businessLoginPro(BusinessVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {

		String b_pass = service.businessLoginCheck(vo);

		if (b_pass == null) {

			return "Contents/Member/login";
		} else if (b_pass.equals(vo.getB_pass())) {
			String b_id = vo.getB_id();
			BusinessVO user = service.getBusiness(b_id);

			request.getSession().setAttribute("b_user", user);

			request.getSession().setMaxInactiveInterval(1800);
			return "redirect:/index";
		} else {
			return "Contents/Member/login";
		}
	}
	@GetMapping("memberBM")
	public String memberBM(BusinessVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		request.setAttribute("user", user);
		if(user == null) {
			BusinessVO b_user = (BusinessVO) request.getSession().getAttribute("b_user");
			
			request.setAttribute("b_user", b_user);
	}
	return "Contents/Member/memberBM";
}
	@PostMapping("memberBM")
	public String memberBMPro(MemberVO mvo,BusinessVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		BusinessVO b_user = (BusinessVO) request.getSession().getAttribute("b_user");
		request.setAttribute("user", user);
		request.setAttribute("b_user", b_user);
		String checkPW=request.getParameter("checkPW");
		
		 if(user == null){
	  			
	  			
	  		 if(b_user.getB_pass().equals(checkPW)) {
	  			
	  			 String b_id=b_user.getB_id();
				vo=service.getBusiness(b_id);
				request.setAttribute("vo", vo);
	  			
	  				return "redirect:/Member/memberView";
	  			}
	  			else {
	  				return "/Contents/Member/memberBM";
	  			}
			
		}	
         
		if(user.getPass().equals(checkPW)) {
			
			String id=user.getId();
			
			 mvo = service.getMember(id);
			request.setAttribute("mvo", mvo); 
			return "redirect:/Member/memberView";
		}
		else {
			return "/Contents/Member/memberBM";
		}
		
	}
	

	@GetMapping("memberView")
	public String memberView(MemberVO mvo,BusinessVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		request.setAttribute("user", user);
		BusinessVO b_user = (BusinessVO) request.getSession().getAttribute("b_user");
		request.setAttribute("b_user", b_user);
if(user == null) {
			
			String b_id=b_user.getB_id();
			vo=service.getBusiness(b_id);
			request.setAttribute("vo", vo);
	}else {
		String id=user.getId();
		 mvo = service.getMember(id);
		request.setAttribute("mvo", mvo);    
	}
	return "Contents/Member/memberView";
}
	@PostMapping("memberView")
	public String memberViewPro(MemberVO mvo,BusinessVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		request.setAttribute("user", user);
		BusinessVO b_user = (BusinessVO) request.getSession().getAttribute("b_user");
		request.setAttribute("b_user", b_user);
		 if(user == null) {
				
				String b_id=b_user.getB_id();
				vo=service.getBusiness(b_id);
				
		         vo.setB_pass((String)request.getParameter("pass"));
		         vo.setB_tel((String)request.getParameter("tel"));
				 vo.setB_email((String)request.getParameter("email"));
				 service.businessModify(vo);
				 HttpSession session = request.getSession();
					session.invalidate();
		}else {
		String id=user.getId();
		
		 mvo = service.getMember(id);
         mvo.setPass((String)request.getParameter("pass"));
         mvo.setTel((String)request.getParameter("tel"));
		 mvo.setEmail((String)request.getParameter("email"));
		 service.memberModify(mvo);
		 HttpSession session = request.getSession();
			session.invalidate();
		}
		
	return "redirect:/index";
}	
	@GetMapping("b_id_search")
	public String b_IdSearch() {
		logger.info("busiIdsearch....");

		return "/Contents/Member/business_id_search";
	}

	@PostMapping("b_id_search")
	public String businessIdSearch(BusinessVO vo, @RequestParam("b_name") String b_name, Model model) {
		int row = 0;
		String b_tel = "";
		String b_id = "";
		List<BusinessVO> list = new ArrayList<BusinessVO>();
		if (!b_name.equals("")) {
			list = service.businessIdSearch(vo);
			for (int i = 0; i < list.size(); i++) {
				if (b_name.equals(list.get(i).getB_name())) {
					b_tel = list.get(i).getB_tel();
					b_id = list.get(i).getB_id();
				}
			}
			if (list.size() == 0) {
				row = 0;
			} else {
				row = 1;
			}

			model.addAttribute("list", list);
			model.addAttribute("id", b_id);
			model.addAttribute("row", row);
		}
		return "/Contents/Member/business_id_search";
	}

	@GetMapping("b_pass_search")
	public String b_passSearch() {
		logger.info("memberpasssearch....");

		return "/Contents/Member/business_pass_search";
	}

	@PostMapping("b_pass_search")
	public String b_passSearch(BusinessVO vo, @RequestParam("b_id") String b_id, @RequestParam("b_email") String b_email,
			Model model) {
		int row = 0;
		if (!b_id.equals("")) {
			String b_pass = service.businessFindpass(vo);
			if (b_pass == null) {
				row = 0;
			} else {
				vo.setB_pass("123456789a");
				row = service.businessPassModify(vo);
			}

			model.addAttribute("row", row);

		}
		return "/Contents/Member/business_pass_search";
	}
	@GetMapping("admin")
	public String MemberAdmin(MemberVO vo,Model model) {
		logger.info("memberAdmin....");
		List<MemberVO>list=service.newMemberList();
		model.addAttribute("list",list);
		return "/Contents/Member/Member_admin";
	}
	@GetMapping("delete")
	public String MemberDelete() {
		logger.info("memberDelete....");
		
		return "/Contents/Member/member_delete";
	}
	@GetMapping("b_delete")
	public String businessDelete() {
		logger.info("memberDelete....");
		
		return "/Contents/Member/business_delete";
	}
	@PostMapping("delete")
	public String memberDeletePro(MemberVO mvo,BusinessVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		request.setAttribute("user", user);
		BusinessVO b_user = (BusinessVO) request.getSession().getAttribute("b_user");
		request.setAttribute("b_user", b_user);
		String checkPW=request.getParameter("checkPW");
		 if(user == null){
	  		 if(b_user.getB_pass().equals(checkPW)) {
	  			
	  			 String b_id=b_user.getB_id();
				vo=service.getBusiness(b_id);
				int row=service.businessDelete(vo);
				 HttpSession session = request.getSession();
					session.invalidate();
					return "redirect:/index";
		}else {
			return "/Contents/Member/business_delete";
		}
		 }		 
		if(user.getPass().equals(checkPW)) {
		   String id=user.getId();
		
		 mvo = service.getMember(id);
		int row =service.memberDelete(mvo);
        
		 HttpSession session = request.getSession();
			session.invalidate();
		}else {
			return "/Contents/Member/member_delete";
		}
			
	return "redirect:/index";
}	
	@GetMapping("member_list")
	public String MemberList(MemberVO vo,Model model) {
		logger.info("memberAdmin....");
		List<MemberVO>list=service.memberList();
		model.addAttribute("list",list);
		return "/Contents/Member/Member_list";
	}
	@GetMapping("business_list")
	public String businessList(BusinessVO vo,Model model) {
		logger.info("memberAdmin....");
		List<BusinessVO>list=service.businessList();
		model.addAttribute("list",list);
		return "/Contents/Member/Business_list";
	}
	@GetMapping("admin_list")
	public String adminList(MemberVO vo,Model model) {
		logger.info("memberAdmin....");
		List<MemberVO>list=service.adminList();
		model.addAttribute("list",list);
		return "/Contents/Member/Admin_list";
	}
	@GetMapping("product_list")
	public String productList(ProductVO vo,Model model) {
		logger.info("proAdmin....");
		List<ProductVO>list=service.productList();
		model.addAttribute("list",list);
		return "/Contents/Member/product_list";
	}
	@GetMapping("unregit_list")
	public String unregitList(UnRegitVO vo,Model model) {
		logger.info("unregit....");
		List<UnRegitVO>list=service.unregitList();
		model.addAttribute("list",list);
		return "/Contents/Member/unregit_list";
	}
	@GetMapping("slist")
	public String sList(ProductVO vo,Model model, HttpServletRequest request) {
		logger.info("shopping....");
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		request.setAttribute("user", user);
		String id=user.getId();
		System.out.println("Session ID : "+id);
		List<ProductVO>list=service.sList(user);
		model.addAttribute("list",list);
		return "/Contents/Member/Member_slist";
	}
}