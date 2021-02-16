package com.jslhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jslhrd.domain.MessageVO;
import com.jslhrd.mapper.MessageMapper;

import lombok.Setter;

@Service
public class MessageServiceImplement implements MessageService {
	
	@Setter(onMethod_= @Autowired)
	private MessageMapper mapper;
	
	@Override
	public List<MessageVO> myReceiveMsgList(String receive_id) {
		// TODO Auto-generated method stub
		return mapper.myReceiveMsgList(receive_id);
	}
	
	@Override
	public int selectId(String id) {
		// TODO Auto-generated method stub
		return mapper.selectId(id);
	}
	
	@Override
	public int msgSend(MessageVO mvo) {
		// TODO Auto-generated method stub
		return mapper.msgSend(mvo);
	}
	
	@Override
	public int selectB_id(String id) {
		// TODO Auto-generated method stub
		return mapper.selectB_id(id);
	}
	
	@Override
	public List<MessageVO> mySendMsgList(String send_id) {
		// TODO Auto-generated method stub
		return mapper.mySendMsgList(send_id);
	}
	
	@Override
	public int msgReadcnt(int m_idx) {
		// TODO Auto-generated method stub
		return mapper.msgReadcnt(m_idx);
	}
	
	@Override
	public MessageVO msgView(int m_idx) {
		// TODO Auto-generated method stub
		return mapper.msgView(m_idx);
	}
}
