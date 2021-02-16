<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<HTML>
<HEAD>
<TITLE>사용자의 아이디를 찾습니다.</TITLE>
    <link rel="stylesheet" href="/resources/CSS/CSS_Member/signupstyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<STYLE TYPE="text/css">

body { font-family: 돋움, Verdana; font-size: 9pt; background: #ffffff;}
td   {  돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000; background: #ffffff;} 
  .btn {
   cursor: pointer; display: inline-block; text-align: center; font-size: 17px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}
    
</STYLE>

<script>
	function id_check(){
		
		if(frm.b_name.value==""){
			alert("名前 を 入力してください");
			frm.b_name.focus();
			return;
		}
		if(frm.b_tel.value==""){
			alert("電話番号 を 入力してください");
			frm.b_tel.focus();
			return;
		}
		//frm.action="/Member/id_search";
		frm.submit();
	}
	function win_close(){
		
		location.href="/Member/login";
	}
</script>



</HEAD>
<BODY bgcolor="#FFFFFF">


<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330 style="margin:0 auto;">
<TR BGCOLOR=#948DCF>
  <TD>
    <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
  	  <TR BGCOLOR="#FFFFFF">
        <TD ALIGN="center">
        	<form name="frm" method="post" action="b_id_search">
	 <div class="tab_container" style="margin-top:10px;width:477;height:80;">
         <div class="box" style="top:115px;border:none;width:400px;left:111.5;" >
                    <div class="inputBox" style="width:300px;marign-top:100px;left: 44px;">
                      <input type="text" name="b_name" maxlength=16 style="width:300px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ b_name }" >
                      <label><font size="4">名前</font></label>
                     
                    </div>
                    </div>
                    </div>
                     <div class="tab_container" style="margin-top:10px;width:477;height:80;">
         <div class="box" style="top:115px;border:none;width:400px;left:111.5;" >
         <div class="inputBox" style="width:300px;left: 44px;bottom: 27px;">
                    <input type="text" name="b_tel" maxlength=16 style="width:300px;" required onkeyup="this.setAttribute('value', this.value);"  value="" >
                      <label><font size="4">電話番号</font></label>
                      <input type="hidden" value="${ row }">
                      </div>
                      </div>
                      </div>
                    <input class="btn" type=button border=0 vspace=0 onclick="id_check()" style="position:relative;position:relative;left: -10px;bottom: -22px;" value="確認"/>
                    <input class="btn" type=button border=0 vspace=0 onclick="win_close()" style="position:relative;position:relative;left: 0px;right: 0px;border-right-width: 0px;margin-right: 20‒;margin-right: 70px;top: 21px;" value="クロース"/>
	</form>
        
        
        
       <div style="position:relative;bottom: 125px;width: 495px;height: 83px;">
	<c:if test="${ row==0 }">
         
         <script>
         alert("登録会員ではありません。");
         </script>
         
	</c:if>
	<c:if test="${ row==1 }">
	 <c:forEach var="list" items="${ list }">
	<script>
		alert("お客様のIDは\n ${list.b_id}です。");
		location.href="/Member/login";
	</script>

      </c:forEach>	
	</c:if>
</div>
	
        </TD>
      </TR>
    </TABLE>
 </TD>
</TR>
</TABLE>



<script>
$(document).ready(function() {

	//Default Action
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
		return false;
	});
});
</script>
</BODY>
</HTML>