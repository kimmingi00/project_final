package com.jslhrd.domain;

public class UnRegitVO {
   private String ur_email;
   private String ur_name;
   private String ur_tel;
   private String ur_pass;
   private String regdate;
   private int reserv_cnt;
   public int getReserv_cnt() {
	return reserv_cnt;
}
public void setReserv_cnt(int reserv_cnt) {
	this.reserv_cnt = reserv_cnt;
}
public String getRegdate() {
      return regdate;
   }
   public void setRegdate(String regdate) {
      this.regdate = regdate;
   }
   public String getUr_email() {
      return ur_email;
   }
   public void setUr_email(String ur_email) {
      this.ur_email = ur_email;
   }
   public String getUr_name() {
      return ur_name;
   }
   public void setUr_name(String ur_name) {
      this.ur_name = ur_name;
   }
   public String getUr_tel() {
      return ur_tel;
   }
   public void setUr_tel(String ur_tel) {
      this.ur_tel = ur_tel;
   }
   public String getUr_pass() {
      return ur_pass;
   }
   public void setUr_pass(String ur_pass) {
      this.ur_pass = ur_pass;
   }
}