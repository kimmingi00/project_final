package com.jslhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jslhrd.domain.MemberVO;
import com.jslhrd.domain.ProductVO;
import com.jslhrd.domain.UnRegitVO;
import com.jslhrd.mapper.ReservationMapper;

import lombok.Setter;

@Service
public class ReservationServiceImplement implements ReservationService {
	
	@Setter(onMethod_= @Autowired)
	private ReservationMapper mapper;
	
	
	@Override
	public List<ProductVO> productWholeList() {
		// TODO Auto-generated method stub
		
		return mapper.productWholeList();
	}
	
	@Override
	public ProductVO productView(int p_idx) {
		// TODO Auto-generated method stub
		return mapper.productView(p_idx);
	}
	
	@Override
	public List<ProductVO> productSelectList1(ProductVO pvo) {
		// TODO Auto-generated method stub
		return mapper.productSelectList1(pvo);
	}
	
	@Override
	public List<ProductVO> productSelectList2(ProductVO pvo) {
		// TODO Auto-generated method stub
		return mapper.productSelectList2(pvo);
	}
	
	@Override
	public int productUpload(ProductVO pvo) {
		// TODO Auto-generated method stub
		return mapper.productUpload(pvo);
	}
	
	@Override
	public int plusReadcnt(int p_idx) {
		// TODO Auto-generated method stub
		return mapper.plusReadcnt(p_idx);
	}
	
	@Override
	public Integer customerSearch(String id, int idx) {
		// TODO Auto-generated method stub
		return mapper.customerSearch(id, idx);
	}
	
	@Override
	public int reservProduct(ProductVO pvo) {
		// TODO Auto-generated method stub
		return mapper.reservProduct(pvo);
	}
	
	@Override
	public int memReservNumAdd(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mapper.memReservNumAdd(mvo);
	}
	
	@Override
	public List<ProductVO> myTourList(String b_id) {
		// TODO Auto-generated method stub
		return mapper.myTourList(b_id);
	}
	
	@Override
	public int reservPeopleUpdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		return mapper.reservPeopleUpdate(pvo);
	}
	
	@Override
	public int customerUpdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		return mapper.customerUpdate(pvo);
	}
	
	@Override
	public int searchUnregit(UnRegitVO uvo) {
		// TODO Auto-generated method stub
		return mapper.searchUnregit(uvo);
	}
	
	@Override
	public int insertUnRegit(UnRegitVO uvo) {
		// TODO Auto-generated method stub
		return mapper.insertUnRegit(uvo);
	}
	
	@Override
	public int reservUnregitProduct(ProductVO pvo) {
		// TODO Auto-generated method stub
		return mapper.reservUnregitProduct(pvo);
	}
	
	@Override
	public int deleteUnRegit(UnRegitVO uvo) {
		// TODO Auto-generated method stub
		return mapper.deleteUnRegit(uvo);
	}
	
	@Override
	public int loginUnRegit(UnRegitVO uvo) {
		// TODO Auto-generated method stub
		return mapper.loginUnRegit(uvo);
	}
	
	@Override
	public int unregitUpdate(ProductVO pvo) {
		// TODO Auto-generated method stub
		return mapper.unregitUpdate(pvo);
	}
}
