package com.jslhrd.service;

import java.util.List;

import com.jslhrd.domain.MessageVO;

public interface MessageService {
	//받은 메세지함
	public List<MessageVO> myReceiveMsgList(String receive_id);
	
	//회원 찾기
	public int selectId(String id);
	
	//사업자 회원 찾기
	public int selectB_id(String id);
	
	//메세지 전송
	public int msgSend(MessageVO mvo);
	
	//보낸 메세지
	public List<MessageVO> mySendMsgList(String send_id);
	
	//메세지 조회
	public int msgReadcnt(int m_idx);
	
	//메세지 뷰
	public MessageVO msgView(int m_idx);
}
