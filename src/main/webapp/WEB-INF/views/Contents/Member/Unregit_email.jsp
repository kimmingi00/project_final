<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jslhrd.util.EmailConfirm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
   function emailok(sendNO, authNum){
	   
      if(sendNO == authNum){
         alert("認証できました");
         
         if(semail.row.value==0) {
        	 opener.member.email.value=semail.email.value;
        	 opener.member.email_check.value=1;
        }else {
        	opener.business.b_email.value=semail.email.value;
        	opener.business.b_email_check.value=1;
        }         
        self.close();
         
      }else{
         alert("認証に失敗しました");
         self.close();
      }
   }
</script>




<form method="post" name="semail">
   인증번호를 입력하세요
   <input type="text" name="sendNO"><br><br>
   <input type="hidden" name="email" value="${email}">
   <input type="hidden" name="row" value="${ row }">
   <input type="button" value="확인" onclick="emailok(semail.sendNO.value,${ authNum })">
   
</form>