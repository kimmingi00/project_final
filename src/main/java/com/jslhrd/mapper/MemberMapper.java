package com.jslhrd.mapper;

import java.util.List;

import com.jslhrd.domain.BusinessVO;
import com.jslhrd.domain.MemberVO;
import com.jslhrd.domain.ProductVO;
import com.jslhrd.domain.UnRegitVO;


public interface MemberMapper {
	
		public List<MemberVO>memberList();
		
		public List<MemberVO>newMemberList();
		
		public List<MemberVO>adminList();
		
		public int modifytheme(MemberVO vo);
		
		public int userSearch(String id);
		
		public int memberLogin(MemberVO vo);
		
		public MemberVO getMember( String id);
		
		public int memberIdCheck( String id);
		
		public int memberWrite(MemberVO vo);
		
		public String memberLoginCheck(MemberVO vo);
		
		public String memberFindpass(MemberVO vo);
		
		public List<MemberVO> memberIdSearch(MemberVO vo);

		public int memberPassModify(MemberVO vo); 
		
		public int setAdmin(MemberVO vo);
		
		public int deleteAdmin(MemberVO vo);

		public int memberModify(MemberVO vo);

		public int memberDelete(MemberVO vo);
		
		public int DeleteAdmin();
		
		public int businessWrite(BusinessVO vo);
		
		public int businessIdCheck( String b_id);
		
		public String businessLoginCheck(BusinessVO vo);
		
		public BusinessVO getBusiness( String b_id);
		
		public int businessModify(BusinessVO vo);
		
		public List<BusinessVO> businessIdSearch(BusinessVO vo);
		
		public String businessFindpass(BusinessVO vo);
		
		public int businessPassModify(BusinessVO vo);
		
		public int businessDelete(BusinessVO vo);
		
		public List<BusinessVO>businessList();
		
		public List<ProductVO>productList();
		
		public List<UnRegitVO>unregitList();
		
		public List<ProductVO>sList(MemberVO user);

		
		
	
	
}
