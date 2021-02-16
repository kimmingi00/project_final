package com.jslhrd.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jslhrd.domain.MemberVO;
import com.jslhrd.domain.ProductVO;
import com.jslhrd.domain.UnRegitVO;
import com.jslhrd.service.ReservationServiceImplement;
import com.jslhrd.util.EmailConfirm;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/Reservation/")
@AllArgsConstructor
public class ReservationController {
	private static final Logger logger = 
			LoggerFactory.getLogger(ReservationController.class);
	
	@Setter(onMethod_=@Autowired)
	private ReservationServiceImplement service;
	
	
	
	@GetMapping("reserv_main")
	public String reserv_main(@RequestParam("place") int place, @RequestParam("outplace") int outplace, @RequestParam("row") int row, Model model) {
		logger.info("reserv_main......");
		
		String table = "";
		
		ProductVO pvo = new ProductVO();
		
		if(place==0&&outplace==0) {
			model.addAttribute("mlist", service.productWholeList());
			model.addAttribute("mlist2", service.productWholeList());

		}else if(place!=0&&outplace!=0){
				
			table="(select * from product where place = "+place+")";
			
			pvo.setTable(table); pvo.setOutplace(outplace); pvo.setPlace(place);
			
			model.addAttribute("mlist", service.productSelectList1(pvo));
			model.addAttribute("mlist2", service.productSelectList1(pvo));
				
			}else {
				if(row==1) {				
					
					table = "product";
					
					
					pvo.setTable(table); pvo.setOutplace(outplace); pvo.setPlace(place);
					model.addAttribute("mlist", service.productSelectList2(pvo));
					model.addAttribute("mlist2", service.productSelectList2(pvo));

				}else if(row==-1){
					
					
					table = "product";
					
					
					
					pvo.setTable(table); pvo.setOutplace(outplace); pvo.setPlace(place);
					model.addAttribute("mlist", service.productSelectList1(pvo));
					model.addAttribute("mlist2", service.productSelectList1(pvo));

				}else {
					table = "product";
				}
			}
		
		String savePath = "/resources/img/product_img";
		
		String p_button = "";
		String op_button = "";
		
		switch(place) {
		case 1:
			p_button = "ソウル/京畿/仁川";
			break;
		case 2:
			p_button = "江原道";
			break;
		case 3:
			p_button = "大田/忠清南道/忠淸北道";
			break;
		case 4:
			p_button = "光州/全羅南道/全羅北道";
			break;
		case 5:
			p_button = "釜山/大邱/慶尙南道/慶尙北道";
			break;
			
		}
		
		switch(outplace) {
		case 1:
			op_button = "ソウル/京畿/仁川";
			break;
		case 2:
			op_button = "江原道";
			break;
		case 3:
			op_button = "大田/忠清南道/忠淸北道";
			break;
		case 4:
			op_button = "光州/全羅南道/全羅北道";
			break;
		case 5:
			op_button = "釜山/大邱/慶尙南道/慶尙北道";
			break;
			
		}
		
		
		model.addAttribute("savePath", savePath);
		model.addAttribute("place", place);
		model.addAttribute("outplace", outplace);
		model.addAttribute("p_button", p_button);
		model.addAttribute("op_button", op_button);

		return "/Contents/Reservation/Reserv_main";
	}
	
	@GetMapping("product_view")
	public String productView(ProductVO pvo, Model model, @RequestParam("id") String id) {
		logger.info("product_view......");
		
		if(id.equals("")) id="^%&^%*^&*^&(^";
		
		int idx = pvo.getP_idx();
		service.plusReadcnt(idx);
		ProductVO vo = service.productView(idx);
		String place[] = vo.getP_in().split(","); 
		String time[] = vo.getP_intime().split(",");
		String plus[] = new String[place.length + time.length]; 
		System.arraycopy(place, 0, plus, 0, place.length);
		System.arraycopy(time, 0, plus, place.length, time.length);
		
		String idd[] = null;
		
		if(vo.getP_customer() != null) {
			idd = vo.getP_customer().split("[\\(]");
		}
		
		int cnt = 0;
		
		Integer row = 0;
		
		row = service.customerSearch(id, idx);
		
		if(row==null) row = 0; else row=1;
		
		if(id.equals("")) {
			cnt = 1;
			model.addAttribute("cnt", cnt);
		}
		
			String contents = vo.getP_contents();
			
			StringBuffer buf = new StringBuffer();
			
			for(int i=0; i<contents.length(); i++) {
				if(contents.charAt(i)=='\n') {
					buf.append("<br>");
				}else {
					buf.append(contents.charAt(i));
				}
			}
			
		if(vo.getP_filename()!=null) {
			String[] filename = vo.getP_filename().split(",");
			model.addAttribute("filename", filename);
		}else {
			String filename = vo.getP_filename();
			model.addAttribute("filename", filename);
		}
		
			
		
		
			
		contents = buf.toString();
		
		model.addAttribute("contents", contents);
		model.addAttribute("row", row);
		model.addAttribute("pvo", vo);
		model.addAttribute("time", time);
		model.addAttribute("place", place);
		model.addAttribute("idd", idd);
		model.addAttribute("plus", plus);
		
		model.addAttribute("pvo", service.productView(pvo.getP_idx()));
		String savePath = "/resources/img/product_img";
		
		model.addAttribute("savePath", savePath);
		return "/Contents/Reservation/Reserv_view";
	}
	
	
	
	
	@GetMapping("Product_upload_main")
	public String productUploadMain(Model model) {
		logger.info("productUploadMain......");
		
		
		
		return "/Contents/Reservation/R_Business/upload_main";
	}
	
	@GetMapping("upload_service")
	public String uploadService() {
		logger.info("uploadService......");
		
		return "/Contents/Reservation/R_Business/UploadService/Product_Upload";
	}
	
	
	@PostMapping("upload_service")
	public String uploadServicePro(@RequestParam("b_id") String b_id, Model model, HttpServletRequest request){
		logger.info("uploadServicePro......");
		
		String path = "C:\\Users\\alsrl\\eclipse-workspace\\Spring_Project\\Project_final\\src\\main\\webapp\\resources\\img\\product_img";
	//	C:\Users\alsrl\eclipse-workspace\Spring_Project\Project_final\src\main\webapp\resources\img\product_img
		
		String encType = "utf-8";
		
		int sizeLimit = 4*1024*1024; //�ִ� 4MB
		int row = 0;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, 
					encType, new DefaultFileRenamePolicy());
			
			int cnt = Integer.parseInt(multi.getParameter("cnt"));
			
			String p_title = multi.getParameter("p_title"); // ��ǰ �̸�
			
			String p_contents = multi.getParameter("p_contents"); // ��ǰ ����
			String p_indate = multi.getParameter("p_indate"); // �����
			String p_outdate = multi.getParameter("p_outdate"); // ������
			String p_in = multi.getParameter("p_in"); //�����
			String p_intime = multi.getParameter("p_intime");
			String p_outtime = multi.getParameter("p_outtime");
			String p_spot = multi.getParameter("p_spot");
			String p_spottime = multi.getParameter("p_spottime");
			String p_stopover = multi.getParameter("p_stopover");
			String p_stoptime = multi.getParameter("p_stoptime");
			int place = Integer.parseInt(multi.getParameter("place"));
			int outplace = Integer.parseInt(multi.getParameter("outplace"));
			
			
			if(cnt>2) {
				String[] in_array = new String[cnt-2];
				String[] time_array = new String[cnt-2];
				for(int i=0; i<cnt-2; i++) {
					in_array[i] = multi.getParameter("p_in"+(i+2));
					time_array[i] = multi.getParameter("p_intime"+(i+2));
					
				}
				for(int i=0; i<in_array.length; i++) {
					p_in = p_in+", "+in_array[i];
					p_intime = p_intime+", "+time_array[i];
				}
			}
			
			
			String p_out = multi.getParameter("p_out"); //������
			int p_maxpeople = Integer.parseInt(multi.getParameter("p_maxpeople")); //�ִ� �ο�
			int p_price = Integer.parseInt(multi.getParameter("p_price")); //����
			String[] tema = multi.getParameterValues("thema"); //�׸�
			String p_filename = multi.getFilesystemName("p_filename"); //���� �̸�
			int fcnt = Integer.parseInt(multi.getParameter("fcnt"));
			
			if(fcnt!=0) {
				String[] file_array = new String[fcnt];
				
				for(int i=0; i<fcnt; i++) {
					file_array[i]=multi.getFilesystemName("p_filename"+(i+1));
				}
				
				for(int i=0; i<file_array.length; i++) {
					p_filename = p_filename+","+file_array[i];
				}
			}
			
			
			String theme="";
			if(tema!=null) {
				for(int i=0; i<tema.length; i++) {
					if(i==tema.length-1) {
						theme=theme+tema[i];
					}else theme=theme+tema[i]+",";
				}
			}
			
			
			ProductVO pvo = new ProductVO();
			
			pvo.setB_id(b_id); pvo.setP_title(p_title); pvo.setP_contents(p_contents);
			pvo.setP_indate(p_indate); pvo.setP_outdate(p_outdate); pvo.setP_in(p_in);
			pvo.setP_out(p_out); pvo.setP_maxpeople(p_maxpeople); pvo.setP_price(p_price);
			pvo.setTheme(theme); pvo.setP_filename(p_filename); 
			
			pvo.setP_intime(p_intime); pvo.setP_outtime(p_outtime); pvo.setP_spot(p_spot);
			pvo.setP_spottime(p_spottime); pvo.setP_stopover(p_stopover); pvo.setP_stoptime(p_stoptime);
			pvo.setPlace(place); pvo.setOutplace(outplace);
			
			
			
			
			row = service.productUpload(pvo);
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		model.addAttribute("row", row);
		
		return "/Contents/Reservation/R_Business/upload_ok";

	}
	
	@PostMapping("Reserv_regit")
	public String reservRegit(@RequestParam("p_idx") int p_idx, @RequestParam("reserv_cnt") int reserv_cnt, Model model, ProductVO pvo) {
		logger.info("Reserv_regit......");

		String id = pvo.getId();
	
		pvo.setP_idx(p_idx);
		
		
		String p_customer = id+"("+reserv_cnt+")";
			
		pvo.setP_customer(p_customer);
		pvo.setReserv_cnt(reserv_cnt);
		
		int row = service.reservProduct(pvo);
		if(row==1) {
			
			MemberVO mvo = new MemberVO();
			mvo.setReserv_num(", "+p_idx);
			mvo.setId(id);
			
			service.memReservNumAdd(mvo);
		}
		
		model.addAttribute("row", row);
		
		return "/Contents/Reservation/reserv_complete";
	}
	
	@GetMapping("my_upload_product")
	public String myUploadProduct(@RequestParam("b_id") String b_id, Model model) {
		
		logger.info("myUploadProduct......");
		
		
		
		int place=0, outplace=0;
		int row=0;
		String table = "";
		
		ProductVO pvo = new ProductVO();
		
		if(place==0&&outplace==0) {
			model.addAttribute("mlist", service.productWholeList());
		}else if(place!=0&&outplace!=0){
				
			table="(select * from product where place = "+place+")";
			
			pvo.setTable(table); pvo.setOutplace(outplace); pvo.setPlace(place);
			
			model.addAttribute("mlist", service.productSelectList1(pvo));
			model.addAttribute("mlist2", service.productSelectList1(pvo));	

				
			}else {
				if(row==1) {				
					
					table = "product";
					
					
					pvo.setTable(table); pvo.setOutplace(outplace); pvo.setPlace(place);
					model.addAttribute("mlist", service.productSelectList2(pvo));
					model.addAttribute("mlist2", service.productSelectList2(pvo));

					
				}else if(row==-1){
					
					
					table = "product";
					
					
					
					pvo.setTable(table); pvo.setOutplace(outplace); pvo.setPlace(place);
					model.addAttribute("mlist", service.productSelectList1(pvo));
					model.addAttribute("mlist2", service.productSelectList1(pvo));

				}else {
					table = "product";
				}
			}
		
		String savePath = "/resources/img/product_img";
		
		String p_button = "";
		String op_button = "";
		
		switch(place) {
		case 1:
			p_button = "ソウル/京畿/仁川";
			break;
		case 2:
			p_button = "江原道";
			break;
		case 3:
			p_button = "大田/忠清南道/忠淸北道";
			break;
		case 4:
			p_button = "光州/全羅南道/全羅北道";
			break;
		case 5:
			p_button = "釜山/大邱/慶尙南道/慶尙北道";
			break;
			
		}
		
		switch(outplace) {
		case 1:
			op_button = "ソウル/京畿/仁川";
			break;
		case 2:
			op_button = "江原道";
			break;
		case 3:
			op_button = "大田/忠清南道/忠淸北道";
			break;
		case 4:
			op_button = "光州/全羅南道/全羅北道";
			break;
		case 5:
			op_button = "釜山/大邱/慶尙南道/慶尙北道";
			break;
			
		}
		
		model.addAttribute("mlist", service.myTourList(b_id));
		model.addAttribute("mlist2", service.myTourList(b_id));

		model.addAttribute("savePath", savePath);
		model.addAttribute("place", place);
		model.addAttribute("outplace", outplace);
		model.addAttribute("p_button", p_button);
		model.addAttribute("op_button", op_button);
		
		return "/Contents/Reservation/Reserv_main";
	}
	
	@GetMapping("Reserv_modify")
	public String reservModify(@RequestParam("p_idx") int p_idx, @RequestParam("id") String id, Model model) {
		
		logger.info("reserv_modify......");
		
		String path = "/resources/img/product_img";
		ProductVO pvo = service.productView(p_idx);
		String fn = pvo.getP_filename();
		
		if(fn.contains(",")) fn = fn.split(",")[0];
		
		String p_customer = pvo.getP_customer();
		String[] customer_arr = p_customer.split("[\\)]");
		
		for(int i=0; i<customer_arr.length; i++) {
			if(id.contains(customer_arr[i])) {
				p_customer = customer_arr[i];
			}
		}
		
		String[] temp = p_customer.split("");
		int cnt=0;
		for(int i=0; i<temp.length; i++) {
			if(temp[i].equals("(")) {
				int tc = temp.length-i-2;
				if(tc==2) {
				cnt = Integer.parseInt(temp[i+1]+temp[i+2]);
				}else if(tc==1) {
					cnt = Integer.parseInt(temp[i+1]);
				}
			}
				
		}
		model.addAttribute("reserv_cnt", cnt);
		model.addAttribute("savePath", path);
		model.addAttribute("filename", fn);
		model.addAttribute("pvo", pvo);
		model.addAttribute("p_idx", p_idx);
		model.addAttribute("id", id);
		
		return "/Contents/Reservation/Reserv_modify";
	}
	
	@PostMapping("Reserv_modify")
	public String reservModifyPro(@RequestParam("p_idx") int p_idx, @RequestParam("reserv_cnt") int reserv_cnt, @RequestParam("id") String id, ProductVO pvo, Model model) {
		
		logger.info("reserv_modify_pro......");
		
		if(id.contains(",")) {
			String temp[] = id.split(",");
			id=temp[0];
		}
		
		System.out.println("id : "+id);	
		System.out.println("reserv_cnt : "+reserv_cnt);
		pvo = service.productView(p_idx);
		String p_customer = pvo.getP_customer();
		String cust[] = p_customer.split("[\\)]");
		int cnt=0;
		
		for(int i=0; i<cust.length; i++) {
			if(cust[i].contains(id)) {
				cnt=i;
				
			}
		}
		
		System.out.println("cust[cnt] : "+cust[cnt]);
		
		String[] cust2 = cust[cnt].split("");
		
		cust2[cust2.length-1]=Integer.toString(reserv_cnt);
		
	
		
		
		String mer = p_customer.substring(p_customer.length()-2, p_customer.length()-1);
		String result = mer.replaceAll("[^0-9]","");
		
		int p_reservpeople = pvo.getP_reservpeople();
		p_reservpeople = p_reservpeople - Integer.parseInt(result)+reserv_cnt;
		
		result="";
		for(int i=0; i<cust2.length; i++) {
			result+=cust2[i];
		}
		
		
		
		System.out.println("result : "+result);
		
		System.out.println("id : "+id);
		for(int i = 0; i < cust.length; i++) {
			if(cust[i].contains(id)) {
				System.out.println("i : "+i);
				cust[i]=result;
				
			}
		}
		
		for(int i = 0; i < cust.length; i++) {
			System.out.println("cust[i] : "+cust[i]);
			cust[i]=cust[i]+")";
			
		}
		
		
		for(int i = 0; i < cust.length; i++) {
			if(!cust[i].equals(")")) {
				p_customer = cust[i];	
				
			}
		}
		System.out.println("p_customer : "+p_customer);
		System.out.println("p_reservpeople : "+p_reservpeople);
		pvo.setP_reservpeople(p_reservpeople); ; pvo.setP_idx(p_idx);
		pvo.setP_customer(p_customer); 
		
		service.reservPeopleUpdate(pvo);
		service.customerUpdate(pvo);
		model.addAttribute("pvo", pvo);
		model.addAttribute("p_idx", p_idx);
		model.addAttribute("id", id);
		model.addAttribute("reserv_cnt", reserv_cnt);
		
		return "redirect:/index";
	}
	
	@PostMapping("Reserv_ok")
	public String reservOk(@RequestParam("p_idx") int p_idx, @RequestParam("reserv_cnt") int reserv_cnt, Model model) {
		
		logger.info("reserv_ok......");

		
		
		
		
		
		model.addAttribute("p_idx", p_idx);
		model.addAttribute("reserv_cnt", reserv_cnt);
		
		
	
		
		return "/Contents/Reservation/Reserv_ok";
	}
	
	@GetMapping("Reserv_unregit")
	public String reservUnregit(@RequestParam("p_idx") int p_idx, @RequestParam("reserv_cnt") int reserv_cnt, Model model) {
		logger.info("reserv_unregit......");

		
		ProductVO pvo = service.productView(p_idx);
		String savePath = "/resources/img/product_img";
		
		model.addAttribute("savePath", savePath);
		model.addAttribute("p_idx", p_idx);
		model.addAttribute("reserv_cnt", reserv_cnt);
		model.addAttribute("pvo", pvo);
		
		
		return "/Contents/Reservation/Reserv_unregit";
	}
	
	
	@PostMapping("Reserv_unregit")
	public String reservUnregitPro(@RequestParam("p_idx") int p_idx,@RequestParam("email") String email, @RequestParam("reserv_cnt") int reserv_cnt, UnRegitVO uvo, Model model) {
		
		logger.info("reserv_unregit_pro......");

		
		int row = 0;
		
		if(email.contains(",")) {
			String[] temp = email.split(",");
			email=temp[0];
		}
		
		System.out.println("예약 메일 : "+email);
		System.out.println("예약인원 : "+reserv_cnt);
		
		String ur_email = email;
		uvo.setUr_email(ur_email);
		System.out.println("ur_email : "+uvo.getUr_email());
		if(service.searchUnregit(uvo)==0) {
			String ur_name = uvo.getUr_name();
			String ur_tel = uvo.getUr_tel();
			String ur_pass = uvo.getUr_pass();
			
			
			
			
			ProductVO pvo = service.productView(p_idx);
			uvo.setRegdate(pvo.getP_indate().substring(0,10));
			
			
			row = service.insertUnRegit(uvo);

			if(row==1) {
				
				
				
				String p_unregit = ur_email+"("+reserv_cnt+")";
					
				
				pvo.setP_idx(p_idx); pvo.setP_unregit(p_unregit); pvo.setReserv_cnt(reserv_cnt);
				
				row = service.reservUnregitProduct(pvo);
				
				
				if(row!=0) {
					row=  4;  
				}else {
					row = 3;
					service.deleteUnRegit(uvo);
				}
				
			}
		}

		
		model.addAttribute("row", row);
		
		return "/Contents/Reservation/Reserv_unregit_ok";
	}
	
	@GetMapping("Unregit_EmailCheck")
	public String unregitEmailCheck(@RequestParam("email") String email, Model model) {
		
		logger.info("unregit_emailcheck......");

		
		EmailConfirm emailconf = new EmailConfirm();
		String authNum = emailconf.connectEmail(email);
		int row=2;
		model.addAttribute("row", row);
		model.addAttribute("authNum", authNum);
		model.addAttribute("email", email);
		
		return "/Contents/Member/Member_email";
	}
	
	@PostMapping("Unregit_login")
	public String unregitLogin(Model model, @RequestParam("p_idx") int p_idx) {
		logger.info("unregit_login......");

		
		
		
		model.addAttribute("p_idx", p_idx);
		
		
	
		
		return "/Contents/Reservation/Reserv_unregitlogin";
	}
	
	@PostMapping("Unregit_login_pro")
	public String unregitLoginPro(@RequestParam("p_idx") int p_idx, @RequestParam("email") String email, Model model, UnRegitVO uvo) {
		
		logger.info("unregit_login_pro......");
		
		if(email.contains(",")) {
			String[] temp = email.split(",");
			email=temp[0];
		}
		
		String ur_email = email;
		
		System.out.println("이메일 : "+ur_email);
		System.out.println("비밀번호 : "+uvo.getUr_pass());
		
		uvo.setUr_email(email);
		
		int row = service.loginUnRegit(uvo);
		System.out.println("row : "+row);

		if(row == 1) {
			ProductVO vo = service.productView(p_idx);
			String p_unregit = vo.getP_unregit();
			if(p_unregit!=null) {
				if(ur_email.contains(p_unregit)) {
					row =1; 
				}
			}else {
				row =0;
			}
			
		}
		
		
		if(row == 1) {
			
			
			String path = "/resources/img/product_img";
			ProductVO pvo = service.productView(p_idx);
			
			String fn = pvo.getP_filename();
			
			if(fn.contains(",")) fn = fn.split(",")[0];
			
			String p_customer = pvo.getP_unregit();
			String[] customer_arr = p_customer.split("[\\)]");
			
			for(int i=0; i<customer_arr.length; i++) {
				if(ur_email.contains(customer_arr[i])) {
					p_customer = customer_arr[i];
				}
			}
			
			String[] temp = p_customer.split("");
			int cnt=0;
			for(int i=0; i<temp.length; i++) {
				if(temp[i].equals("(")) {
					int tc = temp.length-i-2;
					if(tc==2) {
					cnt = Integer.parseInt(temp[i+1]+temp[i+2]);
					}else if(tc==1) {
						cnt = Integer.parseInt(temp[i+1]);
					}
				}
					
			}
			model.addAttribute("ur_email", ur_email);
			model.addAttribute("savePath", path);
			model.addAttribute("filename", fn);
			model.addAttribute("pvo", pvo);
			model.addAttribute("p_idx", p_idx);
			model.addAttribute("reserv_cnt", cnt);
			
			
		
			
			return "/Contents/Reservation/Reserv_unregitmodify";
		}else {
			
			
			
			
			model.addAttribute("p_idx", p_idx);
			model.addAttribute("row", row);
			
			
			return "/Contents/Reservation/Reserv_unregitlogin";
		}
	}
	
	
	
	@PostMapping("Unregit_modify")
	public String unregitModify(Model model, @RequestParam("p_idx") int p_idx, @RequestParam("reserv_cnt") int reserv_cnt, @RequestParam("email") String email) {
		
		logger.info("unregit_modify......");
		System.out.println("예약 인원 : "+reserv_cnt);
		System.out.println("이메일 : "+email);
		
		ProductVO pvo = service.productView(p_idx);
		String p_customer = pvo.getP_unregit();
		String cust[] = p_customer.split("[\\)]");
		int cnt=0;
		
		for(int i=0; i<cust.length; i++) {
			if(cust[i].contains(email)) {
				cnt=i;
				
			}
		}
		
		System.out.println("cust[cnt] : "+cust[cnt]);
		String[] temp = cust[cnt].split("");
		
		for(int i=0; i<temp.length; i++) {
			System.out.println("temp["+i+"] : "+temp[i]);
		}
		
		temp[temp.length-1]=Integer.toString(reserv_cnt);
		String key="";
		for(int i=0; i<temp.length; i++) {
			key=key+temp[i];
		}
		System.out.println("key : "+key);
		cust[cnt]=key;
		
		
		for(int i=0; i<cust.length; i++) {
			System.out.println("cust["+i+"] : "+cust[i]);
		}
		
		String mer = p_customer.substring(p_customer.length()-2, p_customer.length()-1);
		String result = mer.replaceAll("[^0-9]","");
		System.out.println("result : "+result);
		int p_reservpeople = pvo.getP_reservpeople();
		p_reservpeople = p_reservpeople - Integer.parseInt(result)+reserv_cnt;
		
		for(int i = 0; i < cust.length; i++) {
			if(cust[i].contains(email)) {
				cust[i]=Integer.toString(reserv_cnt);
				System.out.println("cust[i] : "+cust[i]);
			}
		}
		
		for(int i = 0; i < cust.length; i++) {
			cust[i]=cust[i]+")";
		}
		
		
		for(int i = 0; i < cust.length; i++) {
			if(!cust[i].equals(")")) {
				p_customer =email+"("+cust[i];	
			}
		}
		System.out.println("p_customer : "+p_customer);
		
		pvo.setP_reservpeople(p_reservpeople); pvo.setP_idx(p_idx);
		pvo.setP_unregit(p_customer); 
		
		 service.reservPeopleUpdate(pvo);
		 
		 
		 service.unregitUpdate(pvo);
		model.addAttribute("pvo", pvo);
		model.addAttribute("p_idx", p_idx);
		model.addAttribute("reserv_cnt", reserv_cnt);

		return "/Contents/Reservation/Reserv_unregit_modify_ok";
	}
	
	
}
