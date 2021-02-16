package com.jslhrd.controller;


import java.util.List;

import javax.servlet.RequestDispatcher;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jslhrd.domain.MessageVO;
import com.jslhrd.service.MessageService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@RequestMapping("/Message/")
@AllArgsConstructor
public class MessageController {
	private static final Logger logger = 
			LoggerFactory.getLogger(MessageController.class);
	
	@Setter(onMethod_=@Autowired )
	private MessageService service;
	
	
	
	@GetMapping("MessageList")
	public String messageList(@RequestParam("id") String receive_id, Model model) {
		logger.info("MessageList......");
		
		
		
		
		
		
		
		
		model.addAttribute("mlist", service.myReceiveMsgList(receive_id));
		
		
		
		return "/Contents/Message/Message_main";
	}
	
	@GetMapping("MessageSend")
	public String messageSend() {
		logger.info("MessageSend......");
		
		return "/Contents/Message/Message_send";
	}
	
	@GetMapping("MsgIdSend")
	public String messageIdSend(@RequestParam("id") String id, Model model) {
		logger.info("MessageIdSend......");
		
		model.addAttribute("id", id);
		
		return "/Contents/Message/Message_send";
	}
	
	@PostMapping("MessageSend")
	public String messageSendPro(MessageVO mvo, Model model) {
		logger.info("MessageSendPro......");

		String send_id = mvo.getSend_id();
		String title = mvo.getTitle();
		String contents = mvo.getContents();
		String receive_id = mvo.getReceive_id();

		int row=0;
		System.out.println("send_id : "+send_id);
		System.out.println("title : "+title);
		System.out.println("contents : "+contents);
		System.out.println("receive_id : "+receive_id);
		int cnt = service.selectId(receive_id);
		System.out.println("cnt : "+cnt);
		if(cnt == 1 ) {
			
			mvo.setContents(contents); 
			mvo.setReceive_id(receive_id); mvo.setSend_id(send_id);
			mvo.setTitle(title); 
			
			
			
			row = service.msgSend(mvo);
			
			
			
		}else if(cnt == 0 ) {
			cnt = service.selectB_id(receive_id);
				
			if(cnt==1) {
				mvo.setContents(contents); 
				mvo.setReceive_id(receive_id); mvo.setSend_id(send_id);
				mvo.setTitle(title); 
				
				
				
				row = service.msgSend(mvo);
			}
				
				
				
			}
		
		
		System.out.println("row : "+row);
		
		
		model.addAttribute("row", row);
		
		
		
		
		
		return "/Contents/Message/send_ok";
	}
	
	@GetMapping("MsgSendList")
	public String msgSendList(@RequestParam("id") String id, Model model) {
		String send_id = id;
		
		List<MessageVO> mlist = service.mySendMsgList(send_id);
				
		
		
		model.addAttribute("mlist", mlist);
		
		return "/Contents/Message/My_Send_Message";
	}
	
	@GetMapping("MsgView")
	public String msgView(@RequestParam("m_idx") int m_idx, Model model) {
		
		
		
		service.msgReadcnt(m_idx);
		
		MessageVO mvo = service.msgView(m_idx);
		
		model.addAttribute("mvo", mvo);
		
		return "/Contents/Message/msg_view";
	}
}
