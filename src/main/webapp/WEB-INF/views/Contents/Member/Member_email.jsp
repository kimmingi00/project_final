<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jslhrd.util.EmailConfirm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <link rel="stylesheet" href="/resources/CSS/CSS_Member/signupstyle.css">
<script>
   function emailok(sendNO, authNum){
	   
      if(sendNO == authNum){
         alert("認証できました");
         
         if(semail.row.value==0){
             opener.member.email.value=semail.email.value;
             opener.member.email_check.value=1;
         }else if(semail.row.value==1){
            opener.business.b_email.value=semail.b_email.value;
            opener.business.b_email_check.value=1;
         }else{
            opener.fm.email.value=semail.email.value;
            opener.fm.email_check.value=1;
         }         
         self.close();
   }else{
	   alert("認証番号が 正しくありません");
	   self.close();
	   }
   }
</script>
<style>
.btn {
   cursor: pointer; display: inline-block; text-align: center; font-size: 17px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}

</style>

<body style="background-color:#ffffff">
<form method="post" name="semail">


   <c:if test="${ email}">
      
    <div class="tab_container" style="width:477;height:182;">
         <div class="box" style="top:115px;border:none;width:400px;left:111.5;" >
                    <div class="inputBox" style="left: 116px;bottom:27px;top: 54px;">
                      <input type="text" name="sendNO" maxlength=16 style="width: 262px;" required onkeyup="this.setAttribute('value', this.value);"  value="" >
                      <label><font size="4">認証番号</font></label>
                        
                      <input type="hidden" name="email" value="${ email }">
   						<input type="hidden" name="row" value="${ row }">
                </div>
               </div>
                </div>
   </c:if>
   
   
   <c:if test="${b_email }">
      <div class="tab_container" style="width:477;height:182;">
         <div class="box" style="top:115px;border:none;width:400px;left:111.5;" >
                    <div class="inputBox" style="left: 116px;bottom:27px;top: 54px;">
                      <input type="text" name="sendNO" maxlength=16 style="width: 262px;" required onkeyup="this.setAttribute('value', this.value);"  value="" >
                      <label><font size="4">認証番号</font></label>
                        
         
                      <input type="hidden" name="b_email" value="${ b_email }">
   						<input type="hidden" name="row" value="${ row }">
                </div>
               </div>
                </div>
   </c:if>
   
 
                
                
                
                    <div class="tab_container" style="width:477;height:182;">
         <div class="box" style="top:115px;border:none;width:400px;left:111.5;" >
                    <div class="inputBox" style="left: 116px;bottom:27px;top: 54px;">
                      <input type="text" name="sendNO" maxlength=16 style="width: 262px;" required onkeyup="this.setAttribute('value', this.value);"  value="" >
                      <label><font size="4">認証番号</font></label>
                        
                      <input type="hidden" name="email" value="${ email }">
                      <input type="hidden" name="b_email" value="${ b_email }">
   						<input type="hidden" name="row" value="${ row }">
                </div>
               </div>
                </div>
                    <input class="btn" type="button" value="確認" style="position:relative;left: 336px;bottom: 48px;" onclick="emailok(semail.sendNO.value,${ authNum })">
</form>

</body>