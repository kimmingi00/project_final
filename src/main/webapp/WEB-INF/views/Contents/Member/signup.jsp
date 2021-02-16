<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="description" content="Mind freaker stuff (Mindfreakerstuff.com) is a blog for Design inspiration, tutorials and latest mobile/Gadgets review . Learn Design Theory, Typography, Website Design, MS office Tips and latest android mobiles/apps more.">
<title>회원가입</title>
    <link rel="stylesheet" href="/resources/CSS/CSS_Member/signupstyle.css">
    

<style type="text/css">
body {
	background-color: #363636;

}
h1 {font-size: 3em; margin: 20px 0; color: #FFF;}
.container {position: relative; left:50px; top:20px; width: 800px; margin: 10px auto; position:relative; border-top-left-radius: 36px;	border-top-right-radius: 36px;	border-bottom-left-radius: 36px;	border-bottom-right-radius: 36px; }
ul.tabs {margin: 0;	padding: 0;	float: left;list-style: none;	height: 48px;	width: 100%;}
ul.tabs li {width:350px; min-height: 50px; float: left;	margin: 0; padding: 0; height: 31px; line-height: 31px; border: 1px solid #999; border-left: none; background: #F0F0F0; overflow: hidden;}
ul.tabs li a {text-decoration: none; color: #000; display: block;	font-size: 1.2em; padding: 0 20px; outline: none; }
html ul.tabs li.active, html ul.tabs li.active a:hover  {background: #fff; border-bottom: 1px solid #fff;}
.tab_container {border-top: none;	clear: both; float: left; width: 702px;	height: 810px; top:600px;	background: #fff; border-bottom-left-radius: 36px;	border-bottom-right-radius: 36px;}
.tab_content {padding: 20px;}
.tab_content h3 a{color: #254588;}
.tab_content img {float: left;	margin: 0 20px 20px 0; padding: 5px;}

.button {position:relative; left:100px;
	cursor: pointer; display: inline-block; text-align: center; font-size: 17px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}

.cansel {position:relative; left:130px;
	cursor: pointer; display: inline-block; text-align: center; font-size: 17px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}
</style>

<script>
 
function cansel() {
  member.reset();
  member.name.focus();
}

function id_check() {
  var id = member.id.value;	
  url = "/Member/member_id_check?id="+id;
  window.open(url,"member_id_check", "width=450 height=280");

}

function b_id_check() {
	var id = business.id.value;			
	  url = "/Member/member_id_check?id="+id;
	  window.open(url,"member_id_check", "width=450 height=280");

	}


function send() {
  var pass = member.pass.value;

  if(member.name.value=="") {
    alert("名前入力は必修です");
    member.name.focus();
    return;
  }

  if(member.id.value=="") {
  alert("IDを入力してください");
  member.id.focus();
  return;
  }else if(member.check.value==0) {
	    alert("ID重複検索をしてください");
	    return;
	  }else if(pass.length<6) {
    alert("パスワードは6~12字以内です");
    member.pass.focus();
    return;
  }else if(pass!=member.repasswd.value) {
    alert("パスワードを確認してください");
    member.repasswd.focus();
    return;
  }
    else if(member.tel.value=="") {
    alert("電話番号入力は必修です");
    member.tel.focus();
    return;
  }

  if(member.str_email01.value=="") {
  alert("メールを入力してください");
  member.str_email01.focus();
  return;
  }else if(member.email_check.value=="0") {
	  alert("メール認証をしてください");
	  return;
	  }


  member.submit();

}
function busi_send() {
	  var pass = business.b_pass.value;

	  if(business.b_name.value=="") {
	    alert("名前入力は必修です");
	    business.b_name.focus();
	    return;
	  }
	  if(business.id.value=="") {
	  alert("IDを入力してください");
	  business.b_id.focus();
	  return;
	  }else if(business.b_check.value==0) {
	  alert("ID重複検索をしてください");
	  return;
	  }else if(pass.length<6) {
	    alert("パスワードは6~12字以内です");
	    business.b_pass.focus();
	    return;
	  }else if(pass!=business.b_repasswd.value) {
	    alert("パスワードを確認してください");
	    business.b_pass.focus();
	    return;
	  }
	    else if(business.b_tel.value=="") {
	    alert("電話番号入力は必修です");
	    business.tel.focus();
	    return;
	  }

	  if(business.b_email01.value=="") {
	  alert("メールを入力してください");
	  business.b_email01.focus();
	  return;
	  }else if(business.b_email_check.value=="0") {
		  alert("メール認証をしてください");
		  return;
		  }

business.submit();

	}
function emailcheck(str_email01, str_email02, selectEmail){
  if(member.str_email01.value==""){
    alert("メールを入力してください");
    member.str_email01.focus();
    return;
  }
  var email="";
  var exptext= /^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
  if(member.selectEmail.value==1){
    if(exptext.test(str_email02)==false){
      alert("形式誤謬");
      return;
    }else{
      email=str_email01+"@"+str_email02;
    }
  }else{
    email=str_email01+"@"+selectEmail;
  }
  url = "/Member/member_email?email="+email;
  window.open(url, "email 認証", "width=450 height=350");
}
function emailcheck2(b_email01, b_email02, b_selectEmail){
	  if(business.b_email01.value==""){
	    alert("メールを入力してください");
	    business.b_email01.focus();
	    return;
	  }
	  var b_email="";
	  var exptext= /^[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	  if(business.b_selectEmail.value==1){
	    if(exptext.test(b_email02)==false){
	      alert("形式誤謬");
	      return;
	    }else{
	      b_email=b_email01+"@"+b_email02;
	    }
	  }else{
	    b_email=b_email01+"@"+b_selectEmail;
	  }
	  url = "/Member/business_email?b_email="+b_email;
	  window.open(url, "email 認証", "width=450 height=350");
	}
</script>



</head>

<body>
<a href="index"> <img src="/resources/img/icon/로고 수정.png" style="width: 200px; margin-top: 30px; margin-left:44%;"></a>
<div class="container">

	

    <ul class="tabs">
        <li><a href="#tab1"><font size="4" style="line-height: 50px; "><center><b>一般新規登録</center></font></a></li>
        <li><a href="#tab2"><font size="4" style="line-height: 50px;"><center><b>事業者新規登録</center></font></a></li>
    </ul>
    <div class="tab_container">
    	<form name="member" method="post" action="member_write">
        <div id="tab1" class="tab_content">
          <div class="box">
                  <center><font size="6">新規登録</font></center>
                  <br>
                  
                    <div class="inputBox">
                      <input type="text" name="name" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                      <label><font size="4">名前</font></label>名前は空白なしに入力
                    </div>


                  <div class="inputBox" >
                    <input type="text" name="id" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">ID</font></label>5~16字以内の英文、数字
                    <input type= "button" value="重複検査" onClick="javascript:id_check()" style="width:140px;"></input>
                  
                    <input type= "hidden" name="check" value="0"></input> 
                  </div>

                    <div class="inputBox">
                          <input type="password" name="pass"  style="width:180px;"required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">パスワード</font></label>6~12字以内の英文・数字
                    </div>

                    <div class="inputBox">
                          <input type="password" name="repasswd" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">パスワード確認</font></label>パスワードをもう一回入力
                    </div>

                    <div class="inputBox">
                          <input type="text" name="tel"  style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">電話番号</font></label>
                    </div>

                    <div class="inputBox"> 
                         <input type="text" name="str_email01" id="str_email01" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">@
                          <input type="hidden" name="email"value=""></input> 
                          <label><font size="4">メール</font></label>
                          <input type="text" name="str_email02" id="str_email02" style="width:140px;" disabled value="naver.com">
                          <select name="selectEmail" id="selectEmail">
  				                <option value="1">直接入力</option>
  				                <option value="naver.com" selected>naver.com</option>
  				                <option value="hanmail.net">hanmail.net</option>
  				                <option value="hotmail.com">daum.net</option>
  				                <option value="nate.com">nate.com</option>
  				                <option value="yahoo.co.kr">yahoo.co.kr</option>
  				                <option value="gmail.com">gmail.com</option>
                    </div>
					
                    <div class="inputBox">
                      <input type=button style="width:130px;" value="メール認証" onClick="emailcheck(member.str_email01.value, member.str_email02.value, member.selectEmail.value)">
                    </div>
					<input type="hidden" name="email_check" value="0">
                    <a href="javascript:send()"><input type="button" class="button" value="登録完了"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" ></a>
                    <a href="javascript:cansel()"><input type="button" class="cansel" value="取り消し" style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" ></a>

                  
          </div>
      </div>
      </form>

        <div id="tab2" class="tab_content">
          <br>
          <div class="box">
                  <center><font size="6">事業者新規登録</font></center>
                  <br>
                  <form name="business" method="post" action="business_write">
                    <div class="inputBox">
                      <input type="text" name="b_name" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                      <label><font size="4">名前</font></label>名前は空白なしに入力
                    </div>

                  <div class="inputBox" >
                    <input type="text" name="id" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">ID</font></label>5~16字以内の英文、数字
                    <input type= "button" value="重複検査" onClick="javascript:b_id_check()" style="width:140px;"></input>
                  	<input type= "hidden" name="b_check" value="0" ></input> 
                  </div>

                    <div class="inputBox">
                          <input type="password" name="b_pass"  style="width:180px;"required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">パスワード</font></label>6~12字以内の英文・数字
                    </div>

                    <div class="inputBox">
                          <input type="password" name="b_repasswd" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">パスワード確認</font></label>パスワードをもう一回入力
                    </div>

                    <div class="inputBox">
                          <input type="text" name="b_tel"  style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">電話番号</font></label>
                    </div>

                    <div class="inputBox">
                          <input type="text" name="b_email01" id="b_email01" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">@
                            <input type="hidden" name="b_email" value=""></input> 
                          <label><font size="4">メール</font></label>
                          <input type="text" name="b_email02" id="b_email02" style="width:140px;" disabled value="naver.com">
                          <select name="b_selectEmail" id="b_selectEmail">
  				                <option value="1">直接入力</option>
  				                <option value="naver.com" selected>naver.com</option>
  				                <option value="hanmail.net">hanmail.net</option>
  				                <option value="hotmail.com">daum.net</option>
  				                <option value="nate.com">nate.com</option>
  				                <option value="yahoo.co.kr">yahoo.co.kr</option>
  				                <option value="gmail.com">gmail.com</option>
  				          </select>      
                    </div>

                    <div class="inputBox">
                      <input type=button style="width:130px;" value="メール認証" onClick="emailcheck2(b_email01.value, b_email02.value, b_selectEmail.value)">
                      </div>
                      <input type="hidden" name="b_email_check" value="0"></input>
                      

                <a href="javascript:busi_send()"><input type="button" class="button" value="登録完了"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" ></a>
                <a href="javascript:cansel()"><input type="button" class="cansel" value="取り消し" style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" ></a>
	
				
                  </form>
                </div>

        </div>

	
	
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
</html>
