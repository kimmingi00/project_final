package com.jslhrd.service;

import java.util.List;

import com.jslhrd.domain.MessageVO;

public interface MessageService {
	public List<MessageVO> myReceiveMsgList(String receive_id);
	
	public int selectId(String id);
	
	public int selectB_id(String id);
	
	public int msgSend(MessageVO mvo);
	
	public List<MessageVO> mySendMsgList(String send_id);
	
	public int msgReadcnt(int m_idx);
	
	public MessageVO msgView(int m_idx);
}
