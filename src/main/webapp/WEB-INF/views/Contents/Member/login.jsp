<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="Mind freaker stuff (Mindfreakerstuff.com) is a blog for Design inspiration, tutorials and latest mobile/Gadgets review . Learn Design Theory, Typography, Website Design, MS office Tips and latest android mobiles/apps more.">
<title>로그인 페이지</title>

    <link rel="stylesheet" href="/resources/CSS/CSS_Member/loginstyle.css">

<style type="text/css">
body {
	background-color: #363636;

}
h1 {font-size: 3em; margin: 20px 0; color: #FFF;}
.container {position: relative; left:50px; top:60px; width: 800px; margin: 10px auto; position:relative; border-top-left-radius: 36px;	border-top-right-radius: 36px;	border-bottom-left-radius: 36px;	border-bottom-right-radius: 36px; }
ul.tabs {margin: 0;	padding: 0;	float: left;list-style: none;	height: 48px;	width: 100%;}
ul.tabs li {width:350px; min-height: 50px; float: left;	margin: 0; padding: 0; height: 31px; line-height: 31px; border: 1px solid #999; border-left: none; background: #F0F0F0; overflow: hidden;}
ul.tabs li a {text-decoration: none; color: #000; display: block;	font-size: 1.2em; padding: 0 20px; outline: none; }
html ul.tabs li.active, html ul.tabs li.active a:hover  {background: #fff; border-bottom: 1px solid #fff;}
.tab_container {border-top: none;	clear: both; float: left; width: 702px;	height: 500px; top:600px;	background: #fff; border-bottom-left-radius: 36px;	border-bottom-right-radius: 36px;}
.tab_content {padding: 20px;}
.tab_content h3 a{color: #254588;}
.tab_content img {float: left;	margin: 0 20px 20px 0; padding: 5px;}

.button {position:relative; left:50px;
	cursor: pointer; display: inline-block; text-align: center; font-size: 17px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}

</style>
</head>

<body>
<a href="index"> <img src="/resources/img/icon/로고 수정.png" style="width: 200px; margin-top: 30px; margin-left:44%;"></a>
<div class="container">


    <ul class="tabs">
        <li><a href="#tab1"><font size="4" style="line-height: 50px; "><center><b>一般 ログイン</center></font></a></li>
        <li><a href="#tab2"><font size="4" style="line-height: 50px;"><center><b>事業者 ログイン</center></font></a></li>
    </ul>

    <div class="tab_container">
        <div id="tab1" class="tab_content">


					<div class="box">
	                <center><font size="6">ログイン</font></center>
	                <br>
	                <form  name="login" method="post" action="/Member/loginPro">
	                  <div class="inputBox">
	                    <input type="text" name="id" required onkeyup="this.setAttribute('value', this.value);"  value="">
	                    <label><font size="4">ID</font></label>
	                  </div>
	                  <div class="inputBox">
	                        <input type="password" name="pass" required onkeyup="this.setAttribute('value', this.value);" value="">
	                        <label><font size="4">Password</font></label>
	                      </div>

	                    <div class="inp_chk">
	                      <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
	                      <label for="keepLogin" class="lab_g">
	                          <span class="img_top ico_check"></span>
	                          <span class="txt_lab"><font size="5">自動 ログイン</font></span>
	                      </label>
	                      &nbsp; &nbsp; &nbsp; &nbsp;
	                        <button class="button" style="vertical-align:middle"><span>ログイン </span></button>
	                </form>
	              </div>
	              <br>
	          <table>
	            <tr>
	              <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	              <td><a href="/Member/confirm"><font size="4">新規登録</font></a></td>
	              <td>&nbsp; | &nbsp; </td>
	              <td><a href="/Member/id_search"><font size="3">ID確認</a></td>
	              <td>&nbsp; | &nbsp;</td>
	              <td><a href="/Member/pass_search"><font size="3">パスワード確認</a></td>
	            </tr>
	          </table>
	        </div>


        </div>




        <div id="tab2" class="tab_content">
          <div class="box">
                  <center><font size="6">事業者 ログイン</font></center>
                  <br>
                  <form  name="b_login" method="post" action="/Member/businessloginPro">
                    <div class="inputBox">
                      <input type="text" name="b_id" required onkeyup="this.setAttribute('value', this.value);"  value="">
                      <label><font size="4">BUSINESS ID</font></label>
                    </div>
                    <div class="inputBox">
                          <input type="password" name="b_pass" required onkeyup="this.setAttribute('value', this.value);" value="">
                          <label><font size="4">Password</font></label>
                        </div>

                      <div class="inp_chk">
                        <input type="checkbox" id="keepLogin" class="inp_radio"  name="keepLogin">
                        <label for="keepLogin" class="lab_g">
                            <span class="img_top ico_check"></span>
                            <span class="txt_lab"><font size="5">自動 ログイン</font></span>
                        </label>
                        &nbsp; &nbsp; &nbsp; &nbsp;
                          <button class="button"><span>ログイン </span></button>
                  </form>
                </div>
                <br>
            <table>
              <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td><a href="/Member/confirm"><font size="4">新規登録</font></a></td>
                <td>&nbsp; | &nbsp; </td>
                <td><a href="/Member/b_id_search"><font size="3">ID確認</a></td>
                <td>&nbsp; | &nbsp;</td>
                <td><a href="/Member/b_pass_search"><font size="3">パスワード確認</a></td>
              </tr>
            </table>
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
<c:if  test="${row==0 }">
	<p style="text-align:center; color:red;">パスワードを確認してください</p>
</c:if>
<c:if  test="${row==-1 }">
	<p style="text-align:center; color:red;">IDを確認してください</p>
</c:if>
</body>

</html>
