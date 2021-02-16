<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/navigation_bar.jsp"%>

<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>

	<h1> IDの削除 </h1>
<title>본인확인 </title>
<script>
function send(){
	var pass=mfm.pass.value;
		if(mfm.checkPW.value==""){
			alert("パスワードを入力してください");
			return;
		}
		
		
		alert("認証できました");
		mfm.submit();
	}
function before(){
	alert("トップへ戻ります");
	location.href="/IndexServlet?command=index";
}
	

    </script>
    <style>
    	<style type="text/css">
        #d1{
          width:870px;
          margin:0 auto;
        }
        
     body{background-color:#f2f2f2;
	}
	
   .container {border-radius: 12px; -moz-border-radius: 12px; -khtml-border-radius: 12px; -webkit-border-radius: 12px;
      position: relative; top:180px; width:60%; height: 530px; border: 24px solid #ffffff;
      background-color: #FFFFFF; overflow: auto;margin-left: 20%;}

       .alert{ line-height: 1.0625; font-weight: 600; letter-spacing: -.009em;
    font-family: "SF Pro Display","SF Pro Icons","Helvetica Neue","Helvetica","Arial","sans-serif";

    }

            .btn {
   cursor: pointer; display: inline-block; text-align: center; font-size: 17px;
    line-height: 1.17648; font-weight: 400; letter-spacing: -.022em;
    font-family: "SF Pro Text","SF Pro Icons","Helvetica Neue","Helvetica","Arial",sans-serif;
    min-width: 28px; padding-left: 16px; padding-right: 16px; padding-top: 8px; padding-bottom: 8px;
    border-radius: 18px; background: #ffffff; color: #000000;}
      

    </style>


<div class="container" style="margin-bottom:300px;">
		<div class="alert">	
						<form name="mfm" method="post" action="IndexServlet?command=index" style="display:inline">
						 <br><br><br><br><br><br><br><br><br><br><br><br>
						 	<center>
       							<br>
								<font size="6">
									IDの削除成功
								</font>
      						</center>
						 <br><br>
							<center>
       							<br>
								<font size="4">
									IDを削除しました。
									여기관광の利用有難うございました。	
								</font>
      						</center>
							
							<center>
       							<br>
								<font size="4">
          							<input type="hidden" name="id" value="${ user.id }">
									<input type="hidden" name="pass" value="${ user.pass }">
       							</font>
      						</center>
					
					
					
					<br><br>
 <div align="center">
<input type="submit" value="HOME" title="돌아가기" class="btn" onClick="javascritpt:before()"/>
 </div>				
						
							
							</form>
						</div>
					</div><!-- UserBox01 End -->
					
		
				
</body>
<%@ include file="/WEB-INF/views/Contents/include_file(navi bar)/footer.jsp" %>
</html>
