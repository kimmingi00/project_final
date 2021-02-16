<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입</title>
    <link rel="stylesheet" href="/Project/Contents/CSS/CSS_Member/signupstyle.css">

    <script>
  	function cansel() {
  		member.reset();
  		member.name.focus();
  	}

  	function id_check() {
  		
  		url = "MemberServlet?command=member_idCheck&userid=";
  		window.open(url,"ID_check", "width=350 height=250");

  	}

  	function post_win() {
  		url = "post_check.do";
  		window.open(url,"POST_check", "width=350 height=250 scrollbars==yes");
  	}

  	function send() {
  		var pass = member.passwd.value;

  		if(member.name.value=="") {
  			alert("名前入力は必修です");
  			member.name.focus();
  			return;
  		}

      if(member.userid.value=="") {
			alert("IDを入力してください");
			member.userid.focus();
			return;
		  }

  		else if(pass.length<6) {
  			alert("パスワードは6~12字以内です");
  			member.passwd.focus();
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
      }


     

  		member.submit();

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
  		url = "MemberServlet?command=member_email&email=" + email;
  		window.open(url, "email 認証", "width=450 height=350");
  	}
  </script>


</head>

<body>
	<div class="container">


    <ul class="tabs">
        <li><a href="#tab1"><font size="4" style="line-height: 50px; "><center><b>一般新規登録</center></font></a></li>
        <li><a href="#tab2"><font size="4" style="line-height: 50px;"><center><b>事業者新規登録</center></font></a></li>
    </ul>
	</div>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
        <div class="box">
                <center><font size="6">新規登録</font></center>
                <br>
                <form name="member" method="post" action="MemberServlet?command=member_write_pro">
                  <div class="inputBox">
                    <input type="text" name="name" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                    <label><font size="4">名前</font></label>名前は空白なしに入力してください
                  </div>


                <div class="inputBox" >
                  <input type="text" name="userid" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);"  value="">
                  <label><font size="4">ID</font></label>
                  <a href="javascript:id_check()"><input type="button" value="重複確認"></a>
                </div>
				
                  <div class="inputBox">
                        <input type="password" name="passwd"  style="width:180px;"required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">パスワード</font></label>6~12字以内の英文・数字
                  </div>

                  <div class="inputBox">
                        <input type="password" name="repasswd" style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">パスワード確認</font></label>パスワードをもう一回入力してください
                  </div>

                  <div class="inputBox">
                        <input type="text" name="tel"  style="width:180px;" required onkeyup="this.setAttribute('value', this.value);" value="">
                        <label><font size="4">電話番号</font></label>
                  </div>

                  <div class="inputBox">
                        <input type="text" name="str_email01" id="str_email01" style="width:150px;" required onkeyup="this.setAttribute('value', this.value);" value="">@
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

                  <a href="javascript:send()"><input type="button" value="登録完了"  style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" ></a>
                  <a href="javascript:cansel()"><input type="reset" value="取り消し" style="WIDTH: 95pt; HEIGHT: 30pt; font-size : 16px" ></a>

                </form>
              </div>
            </div>  
              <br>

        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//이메일 입력방식 선택
$('#selectEmail').change(function(){
   $("#selectEmail option:selected").each(function () {

		if($(this).val()== '1'){ //직접입력일 경우
			 $("#str_email02").val('');                        //값 초기화
			 $("#str_email02").attr("disabled",false); //활성화
		}else{ //직접입력이 아닐경우
			 $("#str_email02").val($(this).text());      //선택값 입력
			 $("#str_email02").attr("disabled",true); //비활성화
		}
   });
});
</script>
</body>
</html>
