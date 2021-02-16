<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="description" content="Mind freaker stuff (Mindfreakerstuff.com) is a blog for Design inspiration, tutorials and latest mobile/Gadgets review . Learn Design Theory, Typography, Website Design, MS office Tips and latest android mobiles/apps more.">
<title>마이페이지</title>
  

<style type="text/css">


  .box {
    position: relative;
    top: 350px;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 36rem;
    padding: 2.5rem;
    box-sizing: border-box;
    border: 1px solid #dadce0;
    -webkit-border-radius: 8px;
    border-radius: 8px;

  }



  .box h2 {
    margin: 0px 0 -0.125rem;
    padding: 0;
    color: #fff;
    text-align: center;
    color: #202124;
    font-family: 'Google Sans','Noto Sans Myanmar UI',arial,sans-serif;
    font-size: 24px;
    font-weight: 400;
  }

  .box p {
    font-size: 16px;
    font-weight: 400;
    letter-spacing: .1px;
    line-height: 1.5;
    margin-bottom: 25px;
    text-align: center;
  }

  .box .inputBox {
    position: relative;
    left:150px;
  }

  .box .inputBox input {
    width: 73%;
    padding: 0.625rem 10px;
    font-size: 1rem;
    letter-spacing: 0.062rem;
    margin-bottom: 1.875rem;
    border: 1px solid #ccc;
    background: transparent;
    border-radius: 4px;

  }

  .box .thema {
    width: 73%;
    padding: 0.625rem 10px;
    font-size: 1rem;
    letter-spacing: 0.062rem;
    margin-bottom: 1.875rem;
    border: 1px solid #ccc;
    background: transparent;
    border-radius: 4px;
    height: 50px;
    padding-bottom: 10px;
}

  .box .inputBox label {
    position: absolute;
    top: 0;
    left: 20px;
    padding: 0.625rem 0;
    font-size: 1rem;
    color: grey;
    pointer-events: none;
    transition: 0.5s;
  }

  .box .inputBox input:focus ~ label,
  .box .inputBox input:valid ~ label,
  .box .inputBox input:not([value=""]) ~ label {
    top: -1.125rem;
    left: 10px;
    color: #363636;
    font-size: 0.75rem;
    background-color: white;
    height: 10px;
    padding-left: 5px;
    padding-right: 5px;
  }


 

  .onelogin{position:fixed; top:64%; left:740px;}

body {background-color:#f2f2f2;}


	 .btn {
   cursor: pointer; display: inline-block; text-align: center; font-size: 17px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}
	
h1 {font-size: 3em; margin: 20px 0; color: #FFF;}
.container {position: relative; left:80px; top:50px; width: 800px; margin: 10px auto; position:relative; border-top-left-radius: 36px;	border-top-right-radius: 36px;	border-bottom-left-radius: 36px; border-bottom-right-radius: 36px; }
ul.tabs {margin: 0;	padding: 0;	float: left;list-style: none;	height: 48px;	width: 100%;}
ul.tabs li {width:350px; min-height: 50px; float: left;	margin: 0; padding: 0; height: 31px; line-height: 31px; border: 1px solid #999; border-left: none; background: #F0F0F0; overflow: hidden;}
ul.tabs li a {text-decoration: none; color: #000; display: block;	font-size: 1.2em; padding: 0 20px; outline: none; }
html ul.tabs li.active, html ul.tabs li.active a:hover  {background: #fff; border-bottom: 1px solid #fff;}
.tab_container {border-top: none; clear: both;  position:raletive; width: 702px; top:680px; height:680px; background: #fff;}
.tab_content {padding: 20px;}
.tab_content h3 a{color: #254588;}
.tab_content img {float: left;	margin: 0 20px 20px 0; padding: 5px;}



</style>

<script>
function cansel(){
  
  alert("トップへ戻ります");
  location.href="/index";
  
}

function send() {
  var pass = member.pass.value;

  if(member.name.value=="") {
    alert("名前は入力必修です");
    member.name.focus();
    return;
  }


  else if(pass.length<6) {
    alert("パスワードは 6~12字以内です");
    member.pass.focus();
    return;
 
  }
    else if(member.tel.value=="") {
    alert("電話番号を入力してください ");
    member.tel.focus();
    return;
  }

 
  alert("修整できました");
  member.submit();

}
</script>



<div class="container">
    	<form name="member" method="post" action="/Member/memberView">
<br><br><br>
    <div class="tab_container">

          <div class="box">
                  <center><font size="6">アカウントページ</font></center>
                  <br>
                  
                  <c:if test="${ empty vo }">
                    <div class="inputBox">
                      <input type="text" name="name" style="width:210px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ mvo.name }" readonly>
                      
                      <label><font size="4">名前</font></label>
                    </div>
                  </c:if>
                  <c:if test="${ !empty vo }">
                  <div class="inputBox">
                      <input type="text" name="name" style="width:210px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ vo.b_name }" readonly>
                     
                      <label><font size="4">名前</font></label>
                      </div>
                      </c:if>
                  <c:if test="${ empty vo }">
                  <div class="inputBox" >
                    <input type="text" name="id" style="width:210px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ mvo.id }" readonly>
                    <label><font size="4">ID</font></label>
                   
                  </div>
                   </c:if>
                   <c:if test="${ !empty vo }">
                    <div class="inputBox" >
                    <input type="text" name="id" style="width:210px;" required onkeyup="this.setAttribute('value', this.value);"  value="${ vo.b_id }" readonly>
                    <label><font size="4">ID</font></label>
                  </div>
                  </c:if>
                    <div class="inputBox">
                          <input type="password" name="pass"  style="width:210px;"required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">パスワード</font></label>
                    </div>

                    
                     <c:if test="${ empty vo }">
                    <div class="inputBox">
                          <input type="text" name="tel"  style="width:210px;" required onkeyup="this.setAttribute('value', this.value);" value="${ mvo.tel }">
                          <label><font size="4">電話番号</font></label>
                    </div>
                    </c:if>
                    <c:if test="${ !empty vo }">
                    <div class="inputBox">
                          <input type="text" name="tel"  style="width:210px;" required onkeyup="this.setAttribute('value', this.value);" value="${ vo.b_tel }">
                          <label><font size="4">電話番号</font></label>
                    </div>
                    </c:if>
                    <c:if test="${ empty vo }">
                    <div class="inputBox"> 
                         <input type="text" name="email" id="str_email01" style="width:210px;" required onkeyup="this.setAttribute('value', this.value);" value="${ mvo.email }">
                          <input type="hidden" name="email"value=""></input> 
                          <label><font size="4">メール</font></label>
                          
                         
                    </div>
                    </c:if>
                    <c:if test="${ !empty vo }">
                     <div class="inputBox"> 
                         <input type="text" name="email" id="str_email01" style="width:210px;" required onkeyup="this.setAttribute('value', this.value);" value="${ vo.b_email }">
                          <input type="hidden" name="email"value=""></input> 
                          <label><font size="4">メール</font></label>
             
                    </div>
                    </c:if>
                    <div class="inputBox">
                    </div>
	
					<center>
                    <input type="submit" value="修整完了"   class="btn" onClick="javascript:send()"/>   
                    
                    <div class="btn">  
					<a href="/Member/slist"><input type="button" class="btn" value="注文履歴" ></a>
					</div>   
					 <c:if test="${ empty vo }">
					<div class="btn">
					<a href="/Member/delete"><input type="button" class="btn" value="IDの削除"></a>
                  	</div> 
                  	</c:if>
                  	 <c:if test="${ empty mvo }">
                  	 <div class="btn">
                  	 <a href="/Member/b_delete"><input type="button" class="btn" value="IDの削除"></a>
                  	</div>
                  	 </c:if>
                  	</center>
                
          </div>
      </div>
      </form>
      <br><br>
      

        

	
	
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

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

</body>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
</html>
