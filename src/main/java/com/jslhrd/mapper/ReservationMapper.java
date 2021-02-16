package com.jslhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jslhrd.domain.MemberVO;
import com.jslhrd.domain.ProductVO;
import com.jslhrd.domain.UnRegitVO;

public interface ReservationMapper {
	public List<ProductVO> productWholeList();
	
	public ProductVO productView(int p_idx);
	
	public List<ProductVO> productSelectList1(ProductVO pvo);
	
	public List<ProductVO> productSelectList2(ProductVO pvo);
	
	public int productUpload(ProductVO pvo);
	
	public int plusReadcnt(int p_idx);
	
	public Integer customerSearch(@Param("id") String id, @Param("p_idx") int idx);
	
	public int reservProduct(ProductVO pvo);
	
	public int memReservNumAdd(MemberVO mvo);
	
	public List<ProductVO> myTourList(String b_id);
	
	public int reservPeopleUpdate(ProductVO pvo);
	
	public int customerUpdate(ProductVO pvo);
	
	public int searchUnregit(UnRegitVO uvo);
	
	public int insertUnRegit(UnRegitVO uvo);
	
	public int reservUnregitProduct(ProductVO pvo);
	
	public int deleteUnRegit(UnRegitVO uvo);
	
	public int loginUnRegit(UnRegitVO uvo);
	
	public int unregitUpdate(ProductVO pvo);
}
