package com.jslhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jslhrd.domain.BusinessVO;
import com.jslhrd.domain.MemberVO;
import com.jslhrd.domain.ProductVO;
import com.jslhrd.domain.UnRegitVO;
import com.jslhrd.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Repository
@AllArgsConstructor
public class MemberServiceImplement implements MemberService {
	
	@Setter(onMethod_= @Autowired)
	private MemberMapper mapper;
	
	@Override
	public List<MemberVO> adminList() {
		
		return mapper.adminList();
	}
	@Override
	public List<MemberVO> memberList() {
		return mapper.memberList();
	}
	@Override
	public List<MemberVO> newMemberList() {
		return mapper.newMemberList();
	}
	@Override
	public int memberWrite(MemberVO vo) {
		return mapper.memberWrite(vo);
	}
	@Override
	public int memberModify(MemberVO vo) {
		return mapper.memberModify(vo);
	}
	@Override
	public int modifytheme(MemberVO vo) {
		return mapper.modifytheme(vo);
	}
	@Override
	public int deleteAdmin() {
		return mapper.DeleteAdmin();
	}
	@Override
	public MemberVO getMember(String id) {
		return mapper.getMember(id);
	}
	@Override
	public int memberDelete(MemberVO vo) {
		return mapper.memberDelete(vo);
	}
	@Override
	public int memberIdCheck(String id) {
		return mapper.memberIdCheck(id);
	}
	@Override
	public List<MemberVO> memberIdSearch(MemberVO vo) {
		return mapper.memberIdSearch(vo);
	}
	@Override
	public int memberLogin(MemberVO vo) {
		return mapper.memberLogin(vo);
	}
	@Override
	public int memberPassModify(MemberVO vo) {
		return mapper.memberPassModify(vo);
	}
	@Override
	public int setAdmin(MemberVO vo) {
		return mapper.setAdmin(vo);
	}
	@Override
	public int userSearch(String id) {
		return mapper.userSearch(id);
	}
	@Override
	public int deleteAdmin(MemberVO vo) {
		return mapper.DeleteAdmin();
	}
	@Override
	public String memberLoginCheck(MemberVO vo) {
		return mapper.memberLoginCheck(vo);
	}
	@Override
	public String memberFindpass(MemberVO vo) {
		return mapper.memberFindpass(vo);
	}
	@Override
	public int businessWrite(BusinessVO vo) {
		return mapper.businessWrite(vo);
	}
	@Override
	public int businessIdCheck(String b_id) {
		return mapper.businessIdCheck(b_id);
	}
	@Override
	public String businessLoginCheck(BusinessVO vo) {
		return mapper.businessLoginCheck(vo);	
	}
	@Override
	public BusinessVO getBusiness(String b_id) {
		return mapper.getBusiness(b_id);
	}
	@Override
	public int businessModify(BusinessVO vo) {
		return mapper.businessModify(vo);
	}
	@Override
	public List<BusinessVO> businessIdSearch(BusinessVO vo) {
		return mapper.businessIdSearch(vo);
	}
	@Override
	public String businessFindpass(BusinessVO vo) {
		return mapper.businessFindpass(vo);	
	}
@Override
	public int businessPassModify(BusinessVO vo) {
		return mapper.businessPassModify(vo);
	}	
@Override
public int businessDelete(BusinessVO vo) {
	return mapper.businessDelete(vo);
}
@Override
public List<BusinessVO> businessList() {
	return mapper.businessList();
}
@Override
public List<ProductVO> productList() {
	return mapper.productList();
}
@Override
public List<UnRegitVO> unregitList() {
	return mapper.unregitList();
}
@Override
public List<ProductVO> sList(MemberVO user) {
	return mapper.sList(user);
}
}
