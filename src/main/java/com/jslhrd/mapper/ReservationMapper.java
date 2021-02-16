package com.jslhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jslhrd.domain.MemberVO;
import com.jslhrd.domain.ProductVO;
import com.jslhrd.domain.UnRegitVO;

public interface ReservationMapper {
	//상품 전체 리스트
	public List<ProductVO> productWholeList();
	
	//상품 뷰 페이지
	public ProductVO productView(int p_idx);
	
	//상품 검색 리스트1
	public List<ProductVO> productSelectList1(ProductVO pvo);
	
	//상품 검색 리스트2
	public List<ProductVO> productSelectList2(ProductVO pvo);
	
	//상품 등록
	public int productUpload(ProductVO pvo);
	
	//조회수 증가
	public int plusReadcnt(int p_idx);
	
	//customer 찾기
	public Integer customerSearch(@Param("id") String id, @Param("p_idx") int idx);
	
	//회원 예약
	public int reservProduct(ProductVO pvo);
	
	//예약번호 회원정보 등록
	public int memReservNumAdd(MemberVO mvo);
	
	//내 상품 목록
	public List<ProductVO> myTourList(String b_id);
	
	//예약숫자 변경
	public int reservPeopleUpdate(ProductVO pvo);
	
	//고객 정보 변경
	public int customerUpdate(ProductVO pvo);
	
	//비회원 검색
	public int searchUnregit(UnRegitVO uvo);
	
	//비회원 등록
	public int insertUnRegit(UnRegitVO uvo);
	
	//비회원 예약
	public int reservUnregitProduct(ProductVO pvo);
	
	//비회원 삭제
	public int deleteUnRegit(UnRegitVO uvo);
	
	//비회원 로그인
	public int loginUnRegit(UnRegitVO uvo);
	
	//비회원 예약정보 수정
	public int unregitUpdate(ProductVO pvo);
}
