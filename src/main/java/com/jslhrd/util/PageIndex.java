package com.jslhrd.util;

import java.net.URLEncoder;

public class PageIndex {
	public static String pageList(int page,int totpage,String url,String addtag) {
		int idx_pre, idx_start;
		  	
		String s_pre = "";    
		String s_idx = "";    
		String s_next = "";  

		idx_start = ((page-1) / 10) * 10 + 1 ;  
		idx_pre = ((page-1) / 10);             

	  	
	  	if(idx_pre > 0) {
	  		s_pre = "<a href='"+url+"?page="+(idx_pre*10)+addtag+"'><img src=Board/img/i_prev.gif width=30 height=7></a>";
	  	} else {
	  		s_pre = "<img src=Board/img/i_prev.gif width=30 height=7> ";
	  	}

	  	for(int i=0;i<10;i++,idx_start++) {
	  		if(idx_start>totpage) break;
	  		if(idx_start == page)
	  			s_idx = s_idx + " "+idx_start+" ";
	  		else {
	  			s_idx = s_idx + " <a href='" + url + "?page=" + idx_start;
	  			s_idx = s_idx + addtag + "'> " + idx_start + " </a> ";
	  		}
	  	}
	  	if(idx_start <= totpage ) {
	  		s_next = "<a href='"+url+"?page="+idx_start+addtag+"'><img src=Board/img/i_next.gif width=30 height=7></a>";
	  	} else {
	  		s_next = " <img src=Board/img/i_next.gif width=30 height=7>";
	  	}

	  	String outHtml = s_pre + s_idx + s_next; 
	  	return outHtml;
	}
	
	public static String pageListHan(int page,int totpage,String url,String search,String key) {
		int idx_pre, idx_start;
		  	
		String s_pre = "";    
		String s_idx = "";    
		String s_next = "";   

		idx_start = ((page-1) / 10) * 10 + 1 ; 
		idx_pre = ((page-1) / 10);              

	  
	  	if(idx_pre > 0) {
	  		s_pre = "<a href='"+url+"?page="+(idx_pre*10)+"&search="+search + "&key="+URLEncoder.encode(key)+"'><img src=/img/i_prev.gif width=30 height=7></a>";
	  	} else {
	  		s_pre = "<img src=/img/i_prev.gif width=30 height=7> ";
	  	}

	
	  	for(int i=0;i<10;i++,idx_start++) {
	  		if(idx_start>totpage) break;
	  		if(idx_start == page)
	  			s_idx = s_idx + " "+idx_start+" ";
	  		else {
	  			s_idx = s_idx + " <a href='" + url + "?page=" + idx_start;
	  			s_idx = s_idx + "&search="+search + "&key="+URLEncoder.encode(key) + "'> " + idx_start + " </a> ";
	  		}
	  	}
	
	  	if(idx_start <= totpage ) {
	  		s_next = "<a href='"+url+"?page="+idx_start+"&search="+search + "&key="+URLEncoder.encode(key)+"'><img src=/img/i_next.gif width=30 height=7></a>";
	  	} else {
	  		s_next = " <img src=/img/i_next.gif width=30 height=7>";
	  	}

	  	String outHtml = s_pre + s_idx + s_next;  
	  	return outHtml;
	}
}
